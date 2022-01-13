// Self complementary top hat
// difference between closing & opening
// by G. Landini at bham. ac. uk
//13/Nov/2003
// 8/Sep/2010
// See: P. Soille (2004) Morphological Image Analysis, p 122
// this is the same as White Top Hat + Black Top Hat

run("Duplicate...", "title=gradient");
run("Duplicate...", "title=erosion");

a=getNumber("Radius",1);
selectWindow("gradient");
run("Maximum...", "radius="+a);
run("Minimum...", "radius="+a);
selectWindow("erosion");
run("Minimum...", "radius="+a);
run("Maximum...", "radius="+a);
run("Image Calculator...", "image1=gradient operation=Subtract image2=erosion");
selectWindow("erosion");
run("Close");
