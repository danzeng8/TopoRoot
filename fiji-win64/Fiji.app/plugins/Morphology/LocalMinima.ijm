//LocalMinima by G. Landini at bham. ac. uk 
// Returns the local minima as black [0] pixels a on a white background [255]

setBatchMode(true);
if (is("Inverting LUT")) 
 exit("The image has an inverted LUT.");
a=getNumber("Local radius",3);
run("Duplicate...", "title=Original");
run("Duplicate...", "title=Eroded");
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=Original operation=Subtract image2=Eroded create");
setThreshold(0, 0);
run("Threshold", "thresholded remaining black");
selectWindow("Eroded");
run("Close");
selectWindow("Original");
run("Close");
selectWindow("Result of Original");
rename("LocalMinima");
setBatchMode(false);
