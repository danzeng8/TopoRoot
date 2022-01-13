// MorphologicalGradient1.txt
// Beucher's gradient
// difference between dilation & erosion
// by G. Landini at bham. ac. uk
// 13/Nov/03

run("Duplicate...", "title=gradient");
run("Duplicate...", "title=erosion");

a=getNumber("Radius",1);
selectWindow("gradient");
run("Maximum...", "radius="+a);
selectWindow("erosion");
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=gradient operation=Subtract image2=erosion");
selectWindow("erosion");
run("Close");
