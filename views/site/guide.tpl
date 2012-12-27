# Guide

This guide will help you to join and understand this awesome world that is `WNS` framework.

## Gettin' WNS

### Requirement

 * NodeJS ([how to install](https://github.com/joyent/node))

### NPM mode

 Just type the following command:

     $ npm install wnserver

 Then move the `wnserver` folder from inside of the `node_modules` folder to where you want.

### Git mode

 This mode requires the installation of `git`

     $ git clone https://github.com/yeptlabs/wns.git

 Then to install all dependencies, just typing inside the wns folder:
 
     $ npm install -d

### Manual mode

 Just download the zip file and unzip somewhere.
 
## Your first application

Your first step in WNS is to create your new application. Don't worry it's not that hard.

### Copy from default

Inside the WNS folder have to files that are essential to run the server. (**default-config.json** and **default-index.js**)

Copy those files and rename it removing the `default-` from the name.

- Copy `default-config.json` to `config.json`;
- Copy `default-index.js` to `index.js`;

Now you have the default configuration of WNS.

### Apply some sauce

To complete your first application creation, let's tell WNS how you want that application.

Edit `config.json` file and change this **{properties}**.

<code>
// THIS IS THE DEFAULT SERVER CONFIGURATION
{
	"app": {
		"{APPLICATION NAME}": {
			"appPath": "{APPLICATION DIRECTORY PATH}",
			"domain": "127.0.0.1",
			"dbEngine": "{DATABASE ENGINE | CAN BE mysql or mongodb | NULL if no database engine}"
			// YOU CAN EDIT THE REST OF THE DATABASE CONFIGURATION EDITING THE FILE
			// config.json FROM INSIDE THE APPLICATION DIRECTORY THAT WILL BE CREATED.
		}
	},
	"components": {
		"http": {
			"listen":[{SERVER PORT},"127.0.0.1"]
		}
	}
}
// {Those} are the important things that you need to edit.
</code>

### Fire!

Now the most difficult step. To run it, just type:

	$ node index

Uff! So hard this part. But it's ready. Now you can see your new application running at:

	http://127.0.0.1:{PORT THAT YOU CHOSE}/


# Knowing other features

Other stuff here, later.