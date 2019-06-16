IIPZoom
-------

This is version 0.2 release of this IIPImage Flash client for IIPImage.
It is based on the OpenZoom SDK available from http://www.openzoom.org

Please read the LICENSE.txt files for information about licensing.


Installation
------------

IIPImage is a client-server system for high resolution scientific images. In
order to use this client, you will need to first install iipsrv, the IIPImage
server. Please see http://iipimage.sourceforge.net for more details.

The IIPZoom installation consists of the IIPZoom.swf flash binary and some HTML.
The enclosed example shows you how to use swfobject.js to easily and cleanly set
up the flash object within your web page.

IIPZoom can take 3 parameters:

image:  (required) the path to the TIFF (or JPEG2000 image)

server: (optional) the path to the iipsrv server.
	If this is not set, the default '/fcgi-bin/iipsrv.fcgi' is used

navigation: (optional) true or false. Sets whether to show or not a navigation window
	True by default.

credit: (optional) information or credit message to be added to the bottom right
	of the image



Building from Source Code
-------------------------

You will need a copy of the OpenZoom SDK (http://www.openzoom.org), which must be patched with the
included openzoom_patch file to add IIPImage compatibility.

Then use flex builder to build or simply the use the command line flex compiler to create a iipzoom.swf
flash object:

% mxmlc iipzoom/src/IIPZoom.as -output iipzoom.swf -compiler.library-path sdk/lib/ \
	-compiler.source-path sdk/src/


------------------------------------------------------------------
For more information, please visit http://iipimage.sourceforge.net
------------------------------------------------------------------
