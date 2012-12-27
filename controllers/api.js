/**
 * Controller: API
 * @author Pedro Nasser
 */

// Exports
module.exports = {

	/**
	 * Class dependencies
	 */
	extend: ['wnController'],

	/**
	 * PRIVATE
	 */
	private: {},

	/**
	 * Public Variables
	 */
	public: {
		listTpl: '- Class: [{name}](/api/class/{name})\n',
		propTpl: '## {name}\n {desc} \n',
		markdown: true
	},

	/**
	 * Methods
	 */
	methods: {

		/**
		 * Action: Index
		 */
		actionIndex: function () {
			this.title='API';
			var classList = '';
			for (c in this.app.c)
			{
				classList += new this.app.c.wnTemplate(this.listTpl).match({ name: c });
			}
			this.render('index',{ classList: classList });
		},

		/**
		 * Action: Class
		 */
		actionClass: function () {
			var className = this.query.GET.name,
				classSource = this.app.c[className];
			if (this.query.GET.name==undefined || classSource == undefined)
			{
				this.actionIndex.apply(this,arguments);
				return false;
			}
			var propList = '';
			for (c in classSource.doc)
			{
				propList += new this.app.c.wnTemplate(this.propTpl).match({ name: c, desc: classSource.doc[c].replace(/\/\*\*\n?\r?|\n?\r?\*\/|\*/gim,'').replace(/\t+/gim,'').replace(/\n/gim,'\n\n') });
			}
			var extendList = '';
			if (classSource.build.extend.length == 0)
				extendList += 'Nothing';
			else
				extendList += '\n';
			for (c in classSource.build.extend)
			{
				extendList += new this.app.c.wnTemplate(this.listTpl).match({ name: classSource.build.extend[c] });
			}
			
			
			this.title=className;
			this.render('class',{
				"name": className,
				"extend": extendList,
				"doc": propList
			});
		}

	}

};