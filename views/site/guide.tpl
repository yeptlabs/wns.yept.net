# Guide

This guide will help you join and understand this awesome world that is `WNS` framework.

## Gettin' WNS

### Requirement

 * NodeJS ([how to install](https://github.com/joyent/node))

### Installing using NPM

 Inside the directory you want to install **WNS** type the NPM command:

     $ npm install wnserver

### Installing using GIT

 This mode requires the installation of [git](http://github.com)

 Inside the directory you want to install **WNS** type the GIT command:

     $ git clone https://github.com/yeptlabs/wns.git

 Then to install all dependencies, just typing inside the **WNS** folder:
 
     $ npm install -d

### Installing manually

 Just download the zip file and unzip somewhere.
 Then type inside **WNS** folder:

	 $ npm install -d
 
## Your first SERVER

Build your first **WNS Server** is very simple. Just follow the right instructions:

### If you installed WNS using NPM:

 Inside the folder that you installed using **NPM**, just type;

#### On Unix:

	 $ wns ./

#### On Windows:

	 $ node_modules/.bin/wns.bat ./

### Or if you installed using GIT or MANUALLY:

 Inside the folder where you placed **WNS**, type the command:

 	 $ node bin/wns ./

## Your first APPLICATION

 Now that your first server is ready, you need now an application.

 To build an application you just need to configure the file `config.json`.

 Edit `config.json`, that has been generated at the **previous step**, file and configure the **{required properties}**.

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

## Fire!

Now the most difficult step. To run it, just type:

	$ node index

Uff! So hard this part. But it's ready. Now you can see your new application running at:

	http://127.0.0.1:{PORT THAT YOU CHOSE}/