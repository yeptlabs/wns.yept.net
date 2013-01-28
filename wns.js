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
				compress = self.getComponent('compress');
			this.addListener('readyRequest',function (e,req) {
				if (compress)
					compress.compressRequest(req);
				req.once('error',function (e,code,msg) {
					self.e.log(msg+' - '+req.info.url+' ('+req.info.connection.remoteAddress+')','access');
				});
			});
		}

	}

};