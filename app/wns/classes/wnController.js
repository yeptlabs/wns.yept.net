/*
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

		afterInit: function ()
		{
			self.prependListener('renderView',function (e) {

				if (self.viewTpl !== '' && self.markdown)
				{
					var Prettify = self.app.prettify;
					var view = self.viewTpl+'';

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
						md = self.app.markdown.markdown.toHTML;

					view = '<div class="md">'+md(view)+'</div>';
					self.viewTpl = new self.app.c.wnTemplate(view).match(replacements);

					self.app.cache.set('markdown-'+self.uid,self.viewTpl);

					self.viewTpl = '';
				}

				if (self.app.cache.get('markdown-'+self.uid))
				{
					self.prependListener('renderLayout',function () {
						self.templateObj.content = function (chunk) {
							return chunk.write(this.content);
						}.bind({ content: this.content });
					}.bind({ content: self.app.cache.get('markdown-'+self.uid) }));
				}

			});
		}

	}

};
