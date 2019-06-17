<!DOCTYPE html>
<html lang="en">


<head>
	<meta charset="utf-8" />
	<meta name="description" content="Open Sea Dragon Full Screen Viewer capable of taking an input image">
	<meta name="author" content="https://github.com/tjw1184/iipimageserver">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />

<?php
echo '<title>' . $_GET['image'] . ' - Open Seadragon Display</title>';
?>

</head>
<body>


  <!-- Basic example style for a 100% view -->
  <style>
    body{
      background-color: #000;
      height: 100%;
      padding: 0;
      margin: 0;
    }
    position: absolute;
      height: 100%;
      min-height: 100%;
      width: 100%;
      top: 0;
      div#openseadragon1{
      left: 0;
      margin: 0;
      padding: 0;
    }
  </style>



<div id="openseadragon1"></div>


<script src="/openseadragon/openseadragon.min.js"></script>
<script type="text/javascript">
    var viewer = OpenSeadragon({
        // div name
        id: "openseadragon1",
        // allow scroll wheel to zoom in faster
        minScrollDeltaTime: 10,
        // tile source
      	// Use php arguments to set image path
       	// Since iipsrv base path set to /pics/ the incoming image name is RELATIVE to this path	    
<?php
echo        '   tileSources: "/iipsrv/iipsrv.fcgi?DeepZoom=' . $_GET['image'] . '.dzi",';
?>

        // path to navigator images
        prefixUrl: "/openseadragon/images/",
        // show rotation buttons
        showRotationControl: true,
        // show mini picture
        showNavigator: true,
        preload: true,
        // Enable touch rotation - disable, too sensitive on phone
        gestureSettingsTouch: {
            //pinchRotate: true
        }

    });
</script>


</body>

</html>
