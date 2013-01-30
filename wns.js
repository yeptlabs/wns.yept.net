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

	// Extended methods
	methods: {

		/**
		 * Runtime function
		 */
		run: function ()
		{
			var self = this,
				compress = self.getComponent('compress'),
				cache = self.getComponent('cache');

			this.addListener('readyRequest',function (e,req) {
				req.once('run', function (eRun) {
					if (compress)
						compress.compressRequest(req);
					if (req.template == '<file>')
						req.cacheable = true;
					if (cache)
					{
						if (req.cacheable && !req.error)
						{
							var cacheKey = 'request-'+req.info.url,
								cached=cache.get(cacheKey);
							if (!cached) 
								req.once('send', function (e) {
									if (req.cacheable && !req.error)
										cache.set(cacheKey,req.data);
								});
							else
							{
								e.stopPropagation=true;
								eRun.stopPropagation=true;
								req.data = cached;
								req.send();
							}
						}
					}
				});
			});			
		}

	}

};