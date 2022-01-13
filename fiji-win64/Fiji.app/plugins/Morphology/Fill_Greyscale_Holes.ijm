// Fill_Greyscale_Holes.txt
// G. Landini at bham ac uk
// 4 May 2009
// 26 Jul 2013
// Fills greyscale holes in an image via the reconstruction 
// from borders of the negative of the image
// Uses reconstruction of 4 connected components (as the 
// holes of an 8 connected object are 4 connected)
// Thanks to Karsten Rodenacker for the 'batch mode' test.

batch_old=is("Batch Mode");
if (!batch_old) setBatchMode(true);
a=getTitle();
slices=nSlices;
bits=bitDepth;

if (nSlices>1){ 
   if(bits==24){
      for(i=1;i<=slices;i++){
         selectWindow(a);
         setSlice(i);
         run("Duplicate...", "title=_gfilled");  
         fillRGBHoles("_gfilled");
         imageCalculator("Copy", a, "_gfilled");
         selectWindow("_gfilled");
         close();
      }
   }
   else if (bits==8){
      for(i=1;i<=slices;i++){
         selectWindow(a);
         setSlice(i);
         run("Duplicate...", "title=_gfilled");  
         fillGreyHoles("_gfilled");
         imageCalculator("Copy", a, "_gfilled");
         selectWindow("_gfilled");
         close();
      }
   }
   else
      exit("Only 8 or 24 bit images supported.");
   setSlice(1);
}
else { 
    if (bits==8) 
      fillGreyHoles(a);
    else if (bits==24) 
      fillRGBHoles(a);
    else
      exit("Only 8 or 24 bit images supported.");
}
if (!batch_old) setBatchMode(false);


function fillRGBHoles(a){
   selectWindow(a);
   run("RGB Stack");
   for(i=1;i<4;i++){
       selectWindow(a);
       setSlice(i);
       run("Duplicate...", "title=_temp");
       fillGreyHoles("_temp");
       imageCalculator("Copy", a, "_temp");
       selectWindow("_temp");
       close();
   }
   selectWindow(a);
   run("RGB Color");
}

function fillGreyHoles(a){
   selectWindow(a);
   run("Invert");
   run("Duplicate...", "title=_filled");
   run("Select All");
   run("Enlarge...", "enlarge=-1 pixel");
   run("Set...", "value=0");
   run("Select None");
   run("GreyscaleReconstruct ", "mask=["+a+"] seed=_filled 4");
   run("Invert");
   imageCalculator("Copy", a, "_filled");
   selectWindow("_filled");
   close();
}
