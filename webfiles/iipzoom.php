<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
        <head>
                <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/swfobject/2.2/swfobject.js"></script>
                <script type="text/javascript">

                        var server = "/iipsrv/iipsrv.fcgi";
<?php
echo                        'var image = "' . $_GET['image'] . '"; ';
?>
                        var credit = "";
                        var flashvars = {
                                server: server,
                                image: image,
                                navigation: true,
                                credit: credit
                        }
                        var params = {
                                scale: "noscale",
                                bgcolor: "#000000",
                                allowfullscreen: "true",
                                allowscriptaccess: "always"
                        }
                        swfobject.embedSWF("IIPZoom.swf", "container", "100%", "100%", "9.0.0","expressInstall.swf", flashvars, params);
                </script>
                <style type="text/css">
                        html, body { background-color: #000; height: 100%; overflow: hidden; margin: 0; padding: 0; }
                        body { font-family: Helvetica, Arial, sans-serif; font-weight: bold; color: #ccc; }
                        #container { width: 100%; height: 100%; text-align: center; }
                </style>
        </head>
        <body>
                <div id="container"></div>

        </body>
</html>
