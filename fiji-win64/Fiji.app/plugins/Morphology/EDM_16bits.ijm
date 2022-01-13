// EDM_16bits.txt
// Euclidean distance map extended to support up to
// distances of 65535. Uses ImageJ EDM command
// G.Landini at bham. ac. uk
// 14/Nov/2004
// 1/Mar/2007 added stack merging so other images can be open too
// 19/06/2008 always returns a 16 bit image, also checks whether batch mode is set to avoid multiple calls

saveSettings();
name=getTitle();
flag=-1;
i=0;
nBins=256;
th=255;
bm=false;

if (!is("Batch Mode")){
    setBatchMode(true);
    bm=true;
}

selectWindow(name);
run("Duplicate...", "title=EDM_"+i);
selectWindow("EDM_"+i);
run("Distance Map");
getHistogram(values, counts, nBins);
if (counts[255]>0){
     while (flag<0){
          i++;
          if (i>255) showMessage("Warning!","Image is too large, EDM cannot be completed.");
          run("Duplicate...", "title=EDM_"+i);
          if (i>1) th=254;
          setThreshold(th, th);
          run("Threshold", "thresholded remaining");
          run("Distance Map");
          run("Subtract...", "value=1");
          getHistogram(values, counts, nBins);
          if (counts[254]==0)  flag=0;
      }
}

//Convert EDM_* Images to Stack
if (i>0){
   for (j=1;j<=i;j++){
      selectWindow("EDM_0");
      run("Add Slice");
      selectWindow("EDM_"+j);
      run("Copy");
      //close();
      selectWindow("EDM_0");
      run("Paste");
   }
  run("Z Project...", "start=1 stop="+i+1+" projection='Sum Slices'");
}
resetMinAndMax();
run("Conversions...", " ");
run("16-bit");

run("Rename...", "title=EDM");
//run("Fire");
restoreSettings();
if (bm)
 setBatchMode(false);
