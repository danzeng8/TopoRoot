//BinaryLabelMacro.txt
// Labels binary blobs into a 16 bit greyscale image
// Labels range from 1 to 65534, then they are recycled,
// background is 0
// G Landini at bham ac uk
// 12/Jul/2007

setBatchMode(true);
getHistogram(values, counts, 256);
for (i=1;i<255;i++) total+=counts[i];
if (total>0) exit("8-bit binary image (0 and 255) required.");

run("Duplicate...", "title=labelled");
run("16-bit");
run("Multiply...", "value=65536"); //so it clips
w=getWidth();
h=getHeight();

c=0;
for (y=0;y<h;y++){
  for (x=0;x<w;x++){
    p=getPixel(x,y);
    if (p==65535){
      setColor(1+(c++ % 65535));
      floodFill(x, y, "8-connected"); //label
    }
  }
}
resetMinAndMax();
setBatchMode(false);
