// DrawBoundingCircle.txt
// G. Landini  21/May/2005, 8/12/2011
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

setForegroundColor(127,127,127);

for (i=0; i<nResults; i++) {
    s =getResult('Slice', i);
    xc = getResult('MBCX', i);
    yc = getResult('MBCY', i);
    ra = getResult('MBCRadius', i);
 
    if (thisSlice!=s) {
      setSlice(s);
      thisSlice=getSliceNumber();
    }

    if (ra>0) {     
       makeOval(xc-ra, yc-ra, 1+ra*2, 1+ra*2);
       run("Draw", "slice");
    }
}

run("Select None");
setForegroundColor(255,255,255);
