//MorphologicalSmoothing1.txt
// average of erosion & dilation
//by G. Landini at bham. ac. uk
//13/Nov/03

run("Duplicate...", "title=dilation");
run("Duplicate...", "title=smoothed");

a=getNumber("Radius",1);
selectWindow("dilation");
run("Maximum...", "radius="+a);
selectWindow("smoothed");
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=smoothed operation=Average image2=dilation");
selectWindow("dilation");
run("Close");
