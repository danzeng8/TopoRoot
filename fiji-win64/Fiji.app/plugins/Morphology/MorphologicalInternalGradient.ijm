// MorphologicalInternalGradient.txt
// difference between original & erosion
// by G. Landini at bham. ac. uk
//4/Sep/10

run("Duplicate...", "title=InternalGradient");
run("Duplicate...", "title=erosion");

a=getNumber("Radius",1);
selectWindow("erosion");
run("Minimum...", "radius="+a);
run("Image Calculator...", "image1=InternalGradient operation=Subtract image2=erosion");
selectWindow("erosion");
run("Close");
