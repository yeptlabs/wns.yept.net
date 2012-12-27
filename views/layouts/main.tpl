<!doctype html>
<html lang="en"><head>

	<meta charset="utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<title>{view.title}</title>
	<meta name="description" content="{view.description}" />
	<meta name="keywords" content="{view.keywords}" />
	<meta name="Robots" CONTENT="INDEX, FOLLOW" />

	<link rel="stylesheet" type="text/css" href="/css/style.css" media="all">
	<script type='text/javascript' src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>

</head>
	<body>

		<a href="https://github.com/yeptlabs/wns"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_darkblue_121621.png" alt="Fork me on GitHub"></a>

		<div id="body">

			<div id="header">
				<h1>wns.framework</h1>
				<ul id='menu'>
					<li><a href='/site/index'>Home</a></li>
					<li><a href='/api/'>API Reference</a></li>
					<li><a href='/site/guide'>Guide</a></li>
					<li><a href='/site/cases'>Cases</a></li>
					<li><a href='/site/community'>Community</a></li>
					<li><a href='/site/faq'>FAQ</a></li>
				</ul>
			</div>
			
			<div id="main">
				<div id="content">
					<div id="{self.controllerName}-{view.name}">{content}</div>
				</div>
			</div>

			<div id="bottom">
				© {app.title} - All rights reserved
			</div>
	
		</div>
	</body>
</html>
