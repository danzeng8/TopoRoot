//UnbiasedParticleArea.txt
// G. Landini
// Requires Particles8_Plus version 1.8
// See Russ JC. The image processing handbook. 3rd Edition, (CRC Press), p 529, 1999.
// CountCorrect compensates for those particle touching the borde and is calculated

// CountCorrect:(X*Y)/((X-fx)*(Y-fy)))
// where X=image width, Y=image height
// fx and fy are the particle width and height (along the x and y axes)
// Small particles (unlikely to touch the border) have CountCorrect values approaching 1.

run("Blobs (25K)");
setThreshold(125, 255);
run("Threshold", "thresholded remaining");
run("Invert LUT"); //the LUT is inverted in this image
run("Invert"); // use white particles

run("Particles8 ", "white morphology exclude show=Particles minimum=0 maximum=999999 display overwrite");

totalcar=0; // total corrected area
totalar=0; // total area
totalcn=0; // total corrected count

for (i=0; i<nResults; i++) {    
    corrf = getResult('CountCorrect', i);
    totalar += getResult('Area', i);
    totalcar += getResult('Area', i)*corrf;
    totalcn += corrf;
}
print("Average area: "+totalar/nResults+",  particles: "+nResults);
print("Average corrected area: "+totalcar/totalcn+ ",  particles corrected: "+totalcn);
//---
