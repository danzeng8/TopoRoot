// Morphological_contrast_Thr
// G. Landini 24/Jun/2013
// Sets the pixel value to either Max or Min, depending on which one is 
// the closest if above a set threshold of contrast (Max - Min)
// Similar to Toggle Contrast in Soille, Morphological Image Analysis (2004), 
// p. 259
// It can use operators other than Min and Max (ie Open and Close, etc) 
// 24/10/2015 Rewritten to compute one row at a time and avoid running out of memory.

setBatchMode(true);
if (bitDepth()!=24){
 a=getTitle();
 Dialog.create("Morphological Contrast Thr");
 Dialog.addNumber("Radius", 2);
 Dialog.addNumber("Threshold", 25);
 Dialog.show();
 r=Dialog.getNumber();
 t=Dialog.getNumber();

 run("Duplicate...", "title=min");
 run("Minimum...", "radius="+r);
 selectWindow(a);
 run("Duplicate...", "title=max");
 run("Maximum...", "radius="+r);

 selectWindow("max");
 w=getWidth();
 h=getHeight();
 
 max=newArray(w);
 min=newArray(w);

 for (y=0;y<h;y++) {
  showProgress(y/h);
   selectWindow("max");
   for (x=0;x<w;x++) max[x]=getPixel(x,y);

   selectWindow("min");
   for (x=0;x<w;x++) min[x]=getPixel(x,y);

   selectWindow(a);
   for (x=0;x<w;x++) {
     c=getPixel(x,y);
     if (max[x]-min[x]>t) {
       if((max[x]-c)<=(c-min[x])) {
          putPixel(x,y, max[x]);
       }  
       else if ((max[x]-c)>(c-min[x])) {
          putPixel(x,y, min[x]);
       }
     }
   }
 }
 updateDisplay();
 selectWindow("min");
 close();
 selectWindow("max");
 close();
}
else
 showMessage("Error","Greyscale images only!\nConvert RGB to HSB and process\nthe Brightness channel only.");

setBatchMode(false);
