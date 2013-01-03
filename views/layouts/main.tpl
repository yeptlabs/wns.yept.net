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
				<a href="https://github.com/yeptlabs/wns"><div id="wnsnow">Download WNS, bro!</div></a>
				<h1>wns.framework</h1>
				<ul id='menu'>
					<li><a href='/site/index'>Home</a></li>
					<li><a href='/api/'>API Reference</a></li>
					<li><a href='/site/guide'>Guide</a></li>
					<li><a href='/site/examples'>Examples</a></li>
					<li><a href='/site/cases'>Cases</a></li>
					<li><a href='/site/community'>Community</a></li>
					<li><a href='/site/faq'>FAQ</a></li>
				</ul>
			</div>
			
			<div id="main">
				<div id="content">
					<div id="{self.controllerName}-{view.name}">{content}</div>
				</div>
				<script type='text/javascript'>
					var activeSlide = 0,
						goNext = -1,
						lockedSlide = false;
					function prevSlide() {
						if (lockedSlide)
							return false;
						clearTimeout(goNext);
						lockedSlide=true;
						$('.slideArrow').stop(1,1).fadeOut(200);
						$('#slide').scrollLeft(activeSlide*952);
						activeSlide--;
						$('#slide').stop(1,1).animate({ scrollLeft: activeSlide*952 }, 2000, function () {
							$('.slideArrow').fadeIn(1000);
							if (activeSlide<=0)
								activeSlide = $codes.length-1; 
							lockedSlide=false;
							goNext=setTimeout(nextSlide,8000);
						});
					}
					function nextSlide() {
						if (lockedSlide)
							return false;
						clearTimeout(goNext);
						lockedSlide=true;
						$('.slideArrow').stop(1,1).fadeOut(200);
						$('#slide').scrollLeft(activeSlide*952);
						activeSlide++;
						$('#slide').stop(1,1).animate({ scrollLeft: activeSlide*952 }, 2000, function () {
							$('.slideArrow').fadeIn(1000);
							if (activeSlide>=$codes.length-1)
								activeSlide = 0; 
							lockedSlide=false;
							goNext=setTimeout(nextSlide,8000);
						});
					}

					var $codes = $('#site-index pre');
					$codes.eq(0).before($('<div id="slide"><div id="slide-content"></div></div><span class="slideArrow slideArrowLeft"></span><span class="slideArrow slideArrowRight"></span>'));
					$codes.appendTo($('#site-index #slide-content'));
					$codes.eq(-1).clone().prependTo($('#site-index #slide-content'));
					$codes=$('#site-index #slide-content').children();
					$codes.find('code').each(function () {
					    var $code = $(this),
					        $title = $code.find('span:eq(0)');
					    $title.addClass('title').prependTo($title.parent().parent());
					    $title.html($title.html().replace(/[\/|*]/g,'').replace(/^\s/,'').replace(/\s$/,''));
					});
					$('span.slideArrowLeft').click(prevSlide);
					$('span.slideArrowRight').click(nextSlide);
					nextSlide();
				</script>
			</div>

			<div id="bottom">
				© {app.title} - All rights reserved
			</div>
	
		</div>

	</body>
</html>
