// DrawConvexHulls.txt
// G. Landini  3/May/2008, 8/12/2011
// Requires Particles8_Plus plugin by G. Landini
//


requires("1.30e");
w=getBoolean("White particles?");

if(w){
  //setThreshold(127,255);
run("Particles8 ", "white show=Particles display overwrite");
  }
 else{
  //setThreshold(0,127);
run("Particles8 ", " show=Particles display overwrite");

}
thisSlice=getSliceNumber();
setForegroundColor(127,127,127);

for (i=0; i<nResults; i++) {
    s =getResult('Slice', i);
    x = getResult('XStart', i);
    y = getResult('YStart', i);
    if (thisSlice!=s) {
      setSlice(s);
      thisSlice=getSliceNumber();
    }
    doWand(x, y, 0.0, "8-connected");
    run("Convex Hull");
    run("Add to Manager");
    //run("Draw", "slice");
}

for (i=0; i<nResults; i++) {
  roiManager("Select", 0); // or use "i" and do not delet below to keep the ROIs
  run("Draw", "slice");
  roiManager("Delete");
}


run("Select None");
setForegroundColor(255,255,255);
