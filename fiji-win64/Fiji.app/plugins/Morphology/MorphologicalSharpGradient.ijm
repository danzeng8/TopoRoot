// MorphologicalSharpGradient1.txt
// minimum (dilation-original), (original-erosion)
// by G. Landini at bham. ac. uk
// 13/Nov/03
a=getNumber("Radius",1);
run("Duplicate...", "title=dilation");
run("Duplicate...", "title=erosion");
run("Duplicate...", "title=original");

selectWindow("dilation");
run("Maximum...", "radius="+a);

selectWindow("erosion");
run("Minimum...", "radius="+a);

run("Image Calculator...", "image1=dilation operation=Subtract image2=original");
run("Image Calculator...", "image1=original operation=Subtract image2=erosion");

run("Image Calculator...", "image1=original operation=Min image2=dilation");

selectWindow("erosion");
run("Close");
selectWindow("dilation");
run("Close");
