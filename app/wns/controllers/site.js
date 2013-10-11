/**
 * Controller: Site
 *
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
			this.title='Home';
			this.render('index');
		},

		/**
		 * Action: Guide
		 */
		actionGuide: function () {
			this.title='Guide';
			this.render('guide');
		},

		/**
		 * Action: Examples
		 */
		actionExamples: function () {
			this.title='Examples';
			this.render('examples');
		},

		/**
		 * Action: Cases
		 */
		actionCases: function () {
			this.title='Cases';
			this.render('cases');
		},

		/**
		 * Action: Community
		 */
		actionCommunity: function () {
			this.title='Community';
			this.render('community');
		},

		/**
		 * Action: FAQ
		 */
		actionFaq: function () {
			this.title='FAQ';
			this.render('faq');
		},

		/**
		 * Action: Error
		 */
		actionError: function () {
			this.title='ERROR';
			this.render('error');
		}

	}

};
