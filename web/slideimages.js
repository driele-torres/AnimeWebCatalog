var i = 0;
var path = new Array();
 
// LIST OF IMAGES
path[0] = "design/site-images/banner0.jpg"; // set image object src property to an image's src, preloading that image in the process
path[1] = "design/site-images/banner1.jpg";
path[2] = "design/site-images/banner2.jpg";
path[3] = "design/site-images/banner3.jpg";

function swapImage()
{
   document.getElementById('slide').src = path[i];
   if(i < path.length - 1) i++; else i = 0;
   setTimeout("swapImage()",4000);
}
window.onload=swapImage;