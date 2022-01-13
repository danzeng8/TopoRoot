//LocalMinMax by G. Landini at bham. ac. uk
//Returns an RGB image with local maxima in red, 
//local minima in blue and pixels in a plateau in magenta.
// 19 May 2009 fixed RGB Merge to Merge Channels

if (is("Inverting LUT")) 
 exit("The image has an inverted LUT.");

a=getNumber("Local radius",3);
setBatchMode(true);
run("Duplicate...", "title=MinMax");
run("Duplicate...", "title=Maxima");
run("Maximum...", "radius="+a);
run("Image Calculator...", "image1=Maxima operation=Subtract image2=MinMax  create");
setThreshold(0, 0);
run("Threshold", "thresholded remaining ");
selectWindow("Maxima");
run("Close");
selectWindow("Result of Maxima");
rename("LocalMaxima");

selectWindow("MinMax");
run("Duplicate...", "title=Eroded");
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=MinMax operation=Subtract image2=Eroded create");
setThreshold(0, 0);
run("Threshold", "thresholded remaining black");
selectWindow("Eroded");
run("Close");
selectWindow("Result of MinMax");
rename("LocalMinima");

run("Invert");

run("Merge Channels...", "red=LocalMaxima green=*None* blue=LocalMinima gray=*None* keep");

selectWindow("MinMax");

imageCalculator("Subtract", "MinMax","LocalMinima");
imageCalculator("Subtract", "MinMax","LocalMaxima");
run("RGB Color");
imageCalculator("Add", "MinMax","RGB");
setBatchMode(false);
