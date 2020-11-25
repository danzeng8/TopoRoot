// Draw_MinR&MaxR.txt
// G. Landini  22/Dec/2004, 8/12/2011
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
    x1 = getResult('XM', i);
    y1 = getResult('YM', i);
    r1=getResult('MinR', i);
    r2=getResult('MaxR', i);
 
    if (thisSlice!=s) {
      setSlice(s);
      thisSlice=getSliceNumber();
    }
    // the circles are not drawn in perfect size due to the way that IJ positions  
    // the ROIs, but this is within 1 px
    if (r1>0.5){
     setForegroundColor(127,127,127);
     makeOval(x1-r1,y1-r1,r1*2,r1*2);
     run("Draw", "slice");
    }
    
    if (r2>0.5){
      setForegroundColor(200,200,200);
      makeOval(x1-r2,y1-r2,r2*2,r2*2);
      run("Draw", "slice");
    }
}
setForegroundColor(255,255,255);
run("Select None");


