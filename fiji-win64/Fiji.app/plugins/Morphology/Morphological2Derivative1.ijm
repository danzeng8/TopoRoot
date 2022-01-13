// Morphological2Derivative1.txt
// original-(average of erosion & dilation)
// by G. Landini at bham. ac. uk
// 13/Nov/03

a=getNumber("Radius",1);
run("Duplicate...", "title=original");
run("Duplicate...", "title=dilation");
run("Duplicate...", "title=smoothed");

selectWindow("dilation");
run("Maximum...", "radius="+a);
selectWindow("smoothed");
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=smoothed operation=Average image2=dilation");
selectWindow("dilation");
run("Close");

selectWindow("original");
run("Divide...", "value=2");
run("Add...", "value=127");
selectWindow("smoothed");
run("Divide...", "value=2");
run("Image Calculator...", "image1=original operation=Subtract image2=smoothed");
selectWindow("smoothed");
run("Close");
