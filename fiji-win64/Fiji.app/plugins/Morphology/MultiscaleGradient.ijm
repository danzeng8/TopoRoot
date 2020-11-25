// Multiscale morphological gradient
// G. Landini at bham. ac. uk
// 8 Sept 2010
// See: P. Soille (2004) Morphological Image Analysis, p 127

ori=getTitle();
radius=12;

setBatchMode(true)
for (radius=2;radius<25;radius++) {
   showProgress(radius/25);
   selectWindow(ori);

   //Beucher thick gradient
   run("Duplicate...", "title=gradient");
   run("Duplicate...", "title=erosion");
   selectWindow("gradient");
   run("Maximum...", "radius="+radius);
   selectWindow("erosion");
   run("Minimum...", "radius="+radius);
   run("Image Calculator...", "image1=gradient operation=Subtract image2=erosion");
   selectWindow("erosion");
   run("Close");

   // White top hat
   selectWindow("gradient");
   run("Duplicate...", "title=TopHat");
   run("Duplicate...", "title=Open");
   run("Minimum...", "radius="+radius);
   run("Maximum...", "radius="+radius);
   run("Image Calculator...", "image1=TopHat operation=Subtract image2=Open");
   selectWindow("Open");
   run("Close");
   selectWindow("TopHat");

   //erosion of size n-1
   run("Minimum...", "radius="+(radius-1));

   //threshold
   setThreshold(1, 255);
   run("Convert to Mask");

   // restore the values of the thick gradient
   imageCalculator("AND", "TopHat","gradient");
   rename("grad_"+radius);
   selectWindow("gradient");
   close();
}
run("Images to Stack", "name=Stack title=grad_ use");
run("Z Project...", "start=1 stop=23 projection=[Max Intensity]");
rename("MultiscaleGradient");
setBatchMode("exit and display");
