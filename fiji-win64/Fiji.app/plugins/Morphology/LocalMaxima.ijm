//LocalMaxima by G. Landini at bham. ac. uk
// Returns the local maxima as white [255] pixels on a black background [0]

setBatchMode(true);
if (is("Inverting LUT")) 
 exit("The image has an inverted LUT.");
a=getNumber("Local radius",3);
run("Duplicate...", "title=Original");
run("Duplicate...", "title=Maxima");
run("Maximum...", "radius="+a);

run("Image Calculator...", "image1=Maxima operation=Subtract image2=Original  create");
setThreshold(0, 0);
run("Threshold", "thresholded remaining ");

selectWindow("Original");
run("Close");
selectWindow("Maxima");
run("Close");
selectWindow("Result of Maxima");
rename("LocalMaxima");
setBatchMode(false);
