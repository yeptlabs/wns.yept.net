/**
 * Source of the application main run function.
 * 
 * @author: Pedro Nasser
 * @link: http://wns.yept.net/
 * @license: http://yept.net/projects/wns/#license
 * @copyright: Copyright &copy; 2012 WNS
 */

/**
 * This function runs in the application context after 
 * the complete initialization.
 *
 * @author Pedro Nasser
 * @package system.core
 * @since 1.0.0
 */

// Exports
module.exports = {

	dependencies: ['markdown'],

	// Extended methods
	methods: {

		/**
		 * Runtime function
		 */
		run: function ()
		{
			self.addListener('readyRequest',function (e,req) {
				req.redirect('http://github.com/yeptlabs/wns',true);
			})

			self.prettify = require(self.modulePath+'public/prettify.js')
			self.markdown = markdown;
			self.buildDoc();
		},

		/**
		 * Build documentation
		 */
		buildDoc: function ()
		{
			for (c in self.c)
			{
				var className = c;
				var builder = this.getComponent('classBuilder');

				if (builder.classes[className]==undefined)
					return false;

				var sources;
				if (builder.classesCode[className] instanceof Array)
					sources=builder.classesCode[className];
				else 
					sources = [builder.classesCode[className]];

				for (s in sources)
				{

					var docSource = sources[s];
					if (!docSource)
						continue;

					var comments = docSource.match(/\/\*[\s\S]+?\*\//gim),
						blackList = 'methods extend private public';

					for (c in comments)
						if (c < 2)
							docSource=docSource.replace(comments[c],'');

					var findIt = new RegExp('','gim'),
						matchDoc = new RegExp('','gim'),
						matches = docSource.match(/\/\*[\s\S]+?\*\/\s+\w+\:/gim);

					var props = builder.classes[className].doc || {}, type= 'undefined';
					for (m in matches)
					{
						var	def = matches[m],
							getDoc = def.match(/[\/\*\*](\W|\w)+[\*\/]/gim)[0],
							prop = def.replace(/[\/\*\*](\W|\w)+[\*\/]/gim,'').replace(/\W/gim,''),
							params = def.match(/@param \$[\w]+ [\w]+ .+/g),
							paramsList = [];
						if (blackList.indexOf(prop)!=-1)
						{
							type = prop;
							continue;
						}
						for (p in params)
						{
							var _param = {};
							var data = params[p].split(' ')
							_param.name = data[1];
							_param.accept = data[2];
							data=data.splice(3)
							_param.desc = data.join(' ');
							paramsList.push(_param);
						}
						props[prop] = {
							desc: getDoc,
							type: type
						};
						if (type == 'methods')
							props[prop].params = paramsList;
					}

					Object.defineProperty(this.c[className], 'doc', {
						value: props,
						writable: true,
						configurable: true,
						enumerable: false
					});

				}
			}
		}

	}

};