// MorphologicalExternalGradient.txt
// difference between dilation & original
// by G. Landini at bham. ac. uk
//4/Sep/10

b=getTitle();
run("Duplicate...", "title=ExternalGradient");

a=getNumber("Radius",1);
selectWindow("ExternalGradient");
run("Maximum...", "radius="+a);
run("Image Calculator...", "image1=ExternalGradient operation=Subtract image2="+b);
