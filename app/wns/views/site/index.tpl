# It's time to build `Fast`, `Scalable` and `Powerful` web services

#### A **component-based**, **class-based** middleware framework built on [Node.JS](http://nodejs.org) machine for easily building **high-performance** web services. 
<code>
/* INTUITIVE - Built-in class system */
{
	/* Class dependencies */
	extend: ['wnComponent'],

	/* Private Variables */
	private: {},

	/* Public Variables */
	public: {},

	/* Methods */
	methods: {
		init: function ()
		{
			var app = this.getParent();
			app.e.log('Hello World');
		}
	}
};
</code>

<code>
/* INTERATIVE - Built-in interative console */
[*] Console active in wnServer: SERVER#1

$ this.getServer(1).getApplication('wns').getConfig('id')
[*] Executing: this.getServer(1).getApplication('wns').getConfig('id')
[*] 'app-wns'

$ this.instanceOf('wnModule')
[*] Executing: this.instanceOf('wnModule')
[*] true

$ this.setConfig({ debug: true })
[*] Executing: this.setConfig({ debug: true })
[*] true

$ this.getConfig('debug')
[*] this.getConfig('debug')
[*] true

$ this.doSomething(
</code>

<code>
/* MUTABLE - Overwrite any core class as you want */

// Create a file name wnModule.js inside classes/ directory

{
	public:
	{
		randomProp: true		
	},
	methods:
	{
		getInverseOfRandomProp: function ()
		{
			return !(randomProp);
		}
	}
};

// This will overwrite the getInverseOfRandomProp() from the source class wnModule,
// And add some other public properties to the class.
</code>

## Some of WNS features

 - **NODEJS** `Builded on top of Node.js`
 - **INSPIRED** `Ispired on Yii Framework`
 - **PERFORMANCE** `Build high performance applications`
 - **PRIVATE-CUSTOMIZATION** `Full classes, libraries, configurations, environment global and private customization`
 - **MVC** `Model-View-Controller (MVC) design pattern`
 - **1:N** `One HTTP server to multiple servers and multiple applications`
 - **DOMAIN** `Support multiple domains and subdomains`
 - **EVENT** `Fully event-driven. Total event manipulation`
 - **TEMPLATE** `Smart template engine and customization`
 - **CACHE** `Smart and powerful cache system`
 - **ERROR-LOG** `Complete error handling and logging`
 - **CONSOLE** `Private console to each application`
 - **SCALABLE** `Fully scalable`
 - **EXTENDABLE** `Fully extendable`
 - **ROUTABLE** `Fully routable`
 - **MUCH-MORE** `See yourself...`