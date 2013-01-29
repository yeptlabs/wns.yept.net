/**
 * Source of the wnController class.
 * 
 * @author: Pedro Nasser
 * @link: http://wns.yept.net/
 * @license: http://yept.net/projects/wns/#license
 * @copyright: Copyright &copy; 2012 WNS
 */

/**
 * Description coming soon.
 *
 * @author Pedro Nasser
 * @package system.core.web
 * @since 1.0.0
 */

// Exports
module.exports = {

	/**
	 * Methods
	 */
	methods: {

		/**
		 * Get view file and return it.
		 * @param $view string name of the view to be rendered.
		 */
		getView: function (view,data)
		{
			var view = this.app.getFile(this.request.getConfig('path').views+this.getControllerName()+'/'+view+'.tpl');
				view = (new this.app.c.wnTemplate(view,false)).match(data?data:{});
			if (this.markdown)
			{
				var Prettify = require(this.app.modulePath+'public/prettify.js');

				var replacements = {}, i = 0;
 				view = view.replace(/\r\n|\n|\r/g, '&newline;').replace(/<code>(.*?)<\/code>/g,
			      function applyHighlight(code) {
			        var code = code.replace(/&newline;/g,'\n').replace(/<code>\n/g,'<code>').replace(/\n<\/code>/g,'</code>').match(/<code>([\s\S]+)<\/code>/)[1],
			        	codeName = "code-"+i;
			        code = Prettify.prettyPrintOne(code);
			        replacements[codeName] = '<pre class="js"><code>'+code+'</code></pre>';
			        i++;
			        return "{"+codeName+"}";
			      }
			    ).replace(/&newline;/g,'\n');

				var lines = view.split('\n'),
					md = require("markdown").markdown.toHTML;

				view = '<div class="md">'+md(view)+'</div>';

				view = new this.app.c.wnTemplate(view).match(replacements);
			}
			return view;
		}

	}

};p
