// MorphologicalGradient3.txt
// difference between Beucher's Gradient & SelfComplementaryTopHat
// difference between MorphologicalGradient1 & MorphologicalGradient2 
// by G. Landini at bham. ac. uk
// 13/Nov/03
a=getNumber("Radius",1);
run("Duplicate...", "title=gradient");
run("Duplicate...", "title=original");
run("Duplicate...", "title=erosion");

selectWindow("gradient");
run("Maximum...", "radius="+a);
selectWindow("erosion");
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=gradient operation=Subtract image2=erosion");
selectWindow("erosion");
run("Close");

selectWindow("original");
run("Duplicate...", "title=gradient2");
run("Duplicate...", "title=erosion");
selectWindow("gradient");
run("Maximum...", "radius="+a);
run("Minimum...", "radius="+a);
selectWindow("erosion");
run("Minimum...", "radius="+a);
run("Maximum...", "radius="+a);
run("Image Calculator...", "image1=gradient2 operation=Subtract image2=erosion");
selectWindow("erosion");
run("Close");

run("Image Calculator...", "image1=gradient operation=Subtract image2=gradient2");

selectWindow("gradient2");
run("Close");
selectWindow("original");
run("Close");
