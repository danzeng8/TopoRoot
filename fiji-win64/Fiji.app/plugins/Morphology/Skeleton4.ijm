// Skeleton4
// Morphological skeleton, similar to Matlab's mmskelm
// G. Landini 10 May 2009

setBatchMode(true);
a=getTitle();
run("Duplicate...","title=f1"); 
run("Duplicate...","title=Result");
run("Set...", "value=0");

// radius 0.5 = cross SE, radius =1 box SE
radius=0.5;
max=-1;

while(max!=0){
  selectWindow("f1");
  run("Minimum...", "radius="+radius);
  getRawStatistics(nPixels, mean, min, max);
  run("Duplicate...","title=th"); 
  selectWindow("th");
  run("Minimum...", "radius="+radius);
  run("Maximum...", "radius="+radius);
  imageCalculator("Subtract create", "f1","th");
  imageCalculator("Add", "Result","Result of f1");
  selectWindow("Result of f1");
  close();
  selectWindow("th");
  close();
}
selectWindow("Result");
setBatchMode(false);
