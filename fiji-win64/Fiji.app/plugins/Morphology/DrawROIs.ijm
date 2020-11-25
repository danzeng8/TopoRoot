// DrawROIs.txt
// G. Landini  28/Dec/2004, 8/12/2011
// Requires Particles8_ plugin by G. Landini
//


requires("1.30e");
w=getBoolean("White particles?");

if(w){
  //setThreshold(127,255);
run("Particles8 ", "white morphology show=Particles minimum=0 maximum=999999 display overwrite");
  }
 else{
  //setThreshold(0,127);
run("Particles8 ", " morphology show=Particles minimum=0 maximum=999999 display overwrite");

}

thisSlice=getSliceNumber();

for (i=0; i<nResults; i++) {
    s =getResult('Slice', i);
    x1 = getResult('ROIX1', i);
    y1 = getResult('ROIY1', i);
    x2 = getResult('ROIX2', i);
    y2 = getResult('ROIY2', i);

    setColor(127);
    if (thisSlice!=s) {
      setSlice(s);
      thisSlice=getSliceNumber();
    }

   drawRect(x1,y1,1+x2-x1,1+y2-y1); // ROI
}

