// MinimaDynamic
// Computes the dynamic/depth of the minima (how deep they are).
// The minima with large dynamics  are good choices for non-supervised watershed markers
// (e.g. use the n minima with the largest dynamic)
// See P Soille (2004) Morphological Image Analysis p. 204
// G. Landini at bham. ac. uk
// 7 Oct 2010
//t=getTime();
a=getTitle();
run("Duplicate...", "title=_ai");
getRawStatistics(nPixels, mean, min, max);
print (min, max, max-min);
run("Invert");
run("Duplicate...", "title=dynmin");
run("Set...", "value=0");
  setBatchMode(true);

for (h=1;h<256;h++){
   showProgress(h/255);
   selectWindow(a);
   run("Duplicate...", "title=_s1");
   run("Add...", "value="+h);
   run("Invert");
   run("Duplicate...", "title=_s2");
   run("Subtract...", "value=1");
   run("GreyscaleReconstruct ", "mask=_ai seed=_s1");
   selectWindow("_s1");
    run("Invert");
   run("GreyscaleReconstruct ", "mask=_ai seed=_s2");
   selectWindow("_s2");
   run("Invert");
   imageCalculator("Subtract", "_s1", a);
   selectWindow("_s1");
   setThreshold(h, 255);
   run("Convert to Mask");
   imageCalculator("Subtract", "_s2", a);
   selectWindow("_s2");
   setThreshold(h+1, 255);
   run("Convert to Mask");
   imageCalculator("Subtract ", "_s1","_s2");
   selectWindow("_s1");
   changeValues(255,255,h);
   // the above seems to be faster that the following:
   //run("Divide...", "value=255");
   //run("Multiply...", "value="+h);
   imageCalculator("Add", "dynmin","_s1");
   selectWindow("_s1");
   close();
   selectWindow("_s2");
   close();
}
selectWindow("_ai");
close();

setBatchMode(false);
//print(getTime()-t);
