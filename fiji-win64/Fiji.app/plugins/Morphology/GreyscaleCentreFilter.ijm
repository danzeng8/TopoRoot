// GreyscaleCenterFilter
// this is a iterative automedian filter until idempotence
// morphological filers based on f=MAX[MIN(f,COC(f)), OCO(f)]
// (O and C are the "way round" in ImageJ)
// by G. Landini at bham. ac. uk
// 4 May 2009

a = getNumber("Kernel radius:", 1);
setBatchMode(true);
run("Duplicate...", "title=Center");
run("Duplicate...", "title=proper_closed");
run("Duplicate...", "title=aux");

nBins = 256;
finished=false;

while(!finished) {
  imageCalculator("Copy", "proper_closed", "Center");
  imageCalculator("Copy", "aux","Center");

  selectWindow("proper_closed");
  //C
  run("Maximum...", "radius=" + a);
  run("Minimum...", "radius=" + a);
  //O
  run("Minimum...", "radius=" + a);
  run("Maximum...", "radius=" + a);
  //C
  run("Maximum...", "radius=" + a);
  run("Minimum...", "radius="+ a);

  imageCalculator("Min", "proper_closed", "Center");
  //O
  selectWindow("Center");
  run("Minimum...", "radius=" + a);
  run("Maximum...", "radius=" + a);
  //C
  run("Maximum...", "radius=" + a);
  run("Minimum...", "radius=" + a);
  //O
  run("Minimum...", "radius=" + a);
  run("Maximum...", "radius=" + a);
 
  imageCalculator("Max", "Center", "proper_closed");

  imageCalculator("Difference create", "aux","Center"); 
  selectWindow("Result of aux");
  getHistogram(values, counts, nBins);
  //finished=true;
  sum=0;
  for(i=1;i<256;i++)
     sum+=counts[i];

  if (sum==0)  finished = true;
  close();
 // print("Another go "+sum);
}
selectWindow("Center");
setBatchMode(false);
