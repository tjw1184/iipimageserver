<!DOCTYPE html>
<html lang="en">

 <head>
  <meta charset="utf-8" />
  <meta name="description" content="IIPMooViewer Full Screen Viewer capable of taking an input image">
  <meta name="author" content="https://github.com/tjw1184/iipimageserver">	 
	 

  <!--Preserve original ownership information from example page that was modified-->
  <meta name="DC.creator" content="Ruven Pillay &lt;ruven@users.sourceforge.netm&gt;"/>
  <meta name="DC.title" content="IIPMooViewer 2.0: HTML5 High Resolution Image Viewer"/>
  <meta name="DC.subject" content="IIPMooViewer; IIPImage; Visualization; HTML5; Ajax; High Resolution; Internet Imaging Protocol; IIP"/>
  <meta name="DC.description" content="IIPMooViewer is an advanced javascript HTML5 image viewer for streaming high resolution scientific images"/>
  <meta name="DC.rights" content="Copyright &copy; 2003-2016 Ruven Pillay"/>
  <meta name="DC.source" content="http://iipimage.sourceforge.net"/>

  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
  <meta name="apple-mobile-web-app-capable" content="yes" />
  <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
  <meta http-equiv="X-UA-Compatible" content="IE=9" />

  <link rel="stylesheet" type="text/css" media="all" href="css/iip.min.css" />
<!--[if lt IE 10]>
  <meta http-equiv="X-UA-Compatible" content="IE=9" >
  <link rel="stylesheet" type="text/css" media="all" href="css/ie.min.css" />
<![endif]-->

  <!-- Basic example style for a 100% view -->
  <style>
    body{
      height: 100%;
      padding: 0;
      margin: 0;
    }
    div#viewer{
      height: 100%;
      min-height: 100%;
      width: 100%;
      position: absolute;
      top: 0;
      left: 0;
      margin: 0;
      padding: 0;
    }	
  </style>

  <link rel="shortcut icon" href="images/iip-favicon.png" />
  <link rel="apple-touch-icon" href="images/iip.png" />

<?php
echo '<title>' . $_GET['image'] . ' - IIPMooViewer Display</title>';
?>

	 
  <script src="js/mootools-core-1.6.0-compressed.js"></script>
  <script src="js/iipmooviewer-2.0-min.js"></script>

<!--[if lt IE 7]>
  <script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE7.js">IE7_PNG_SUFFIX = ".png";</script>
<![endif]-->

  <script>
    // IIPMooViewer options: See documentation at http://iipimage.sourceforge.net for more details
    
    // Updated iipsrv path
    var server = '/iipsrv/iipsrv.fcgi';
    
    // Use php arguments to set image path
    // Since iipsrv base path set to /pics/ the incoming image name is RELATIVE to this path
<?php
echo    '    var image = \''  . $_GET['image'] . '\';';
?>

    // Copyright or information message - None here
    var credit =''; // '&copy; copyright or information message';
    
    // Create our iipmooviewer object
    // add preload to try and optimze viewing experience at cost of bandwidth
    new IIPMooViewer( "viewer", {
	server: server,
	image: image,
	credit: credit,
  preload: true
    });
  </script>

 </head>

 <body>
   <div id="viewer"></div>
 </body>

</html>
