# [tjw1184/iipimageserver](https://github.com/tjw1184/iipimageserver)
Preconfigured IIPImage Server with Display Clients OpenSeaDragon, IIPZoom and IIPMooViewer.  This docker was built to learn these components, and provide an easy to use server for displaying gigapixel images with no configuration.

## Usage

Using this docker is extremely easy.  You need to put any images you want displayed in the folder mapped to /pics, and then just pass the filename to the correct webpage to display.  This filename is passed as a php argument in the web address.

### To display your image 'image1.tif', assuming that your image was stored in /pics/image1.tif you would use:
* OpenSeaDragon
  * http://server:port/openseadragon.php?image=image1.tif
* IIPZoom
  * http://server:port/iipzoom.php?image=image1.tif
* IIPMooViewer
  * http://server:port/iipmooviewer.php?image=image1.tif



## Parameters

Container images are configured using parameters passed at runtime. These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 80` | will map the container's port 80 to port 80 on the host |
| `-v /pics` | this will contain the high-resolution images you want displayed |


## Components

[IIPImage](https://iipimage.sourceforge.io/) is an advanced high-performance feature-rich image server system for web-based streamed viewing and zooming of ultra high-resolution images. It is designed to be fast and bandwidth-efficient with low processor and memory requirements. The system can comfortably handle gigapixel size images

[OpenSeaDragon](https://openseadragon.github.io/) is an open-source, web-based viewer for high-resolution zoomable images, implemented in pure JavaScript, for desktop and mobile.

[IIPZoom](https://sourceforge.net/projects/iipimage/) is a fast and lightweight Flash client for IIPImage which is fast and fluid with super-smooth zooming and panning.

[IIPMooViewer](https://github.com/ruven/iipmooviewer) is a high performance light-weight HTML5 Ajax-based javascript image streaming and zooming client designed for the IIPImage high resolution imaging system.

