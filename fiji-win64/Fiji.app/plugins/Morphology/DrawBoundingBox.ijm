// DrawBoundingBox.txt
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
    f =getResult('Feret', i);
    x1 = getResult('FeretX1', i);
    y1 = getResult('FeretY1', i);
    x2 = getResult('FeretX2', i);
    y2 = getResult('FeretY2', i);
    bx1=getResult('BrdthX1', i);
    by1=getResult('BrdthY1', i);
    bx2=getResult('BrdthX2', i);
    by2=getResult('BrdthY2', i);

    setColor(127);
    if (thisSlice!=s) {
      setSlice(s);
      thisSlice=getSliceNumber();
    }

    if (f>0){
      drawLine(x1,y1,x2,y2); // Feret

      // Breadth
      setColor(200);
      r= ((bx1-x1)*(x2-x1)+(by1-y1)*(y2-y1))/(f*f);
      px1=x1+r*(x2-x1);
      py1=y1+r*(y2-y1);
      drawLine(bx1,by1,px1,py1);

      r= ((bx2-x1)*(x2-x1)+(by2-y1)*(y2-y1))/(f*f);
      px2=x1+r*(x2-x1);
      py2=y1+r*(y2-y1);
      drawLine(bx2,by2,px2,py2);

      // Bounding box along the feret
      // This (very rarely) can fail when the feret is on the outside of the object ("C" shaped
      //  objects) and both parts of the breadth are on the same side of the feret diameter
      bbx1=bx1-(px1-x1);
      bby1=by1-(py1-y1);
      bbx2=bx2-(px2-x1);
      bby2=by2-(py2-y1);
      bbx3=bx1-(px1-x2);
      bby3=by1-(py1-y2);
      bbx4=bx2-(px2-x2);
      bby4=by2-(py2-y2);
      setColor(220);
      drawLine(bbx1,bby1,bbx2,bby2);
      drawLine(bbx2,bby2,bbx4,bby4);
      drawLine(bbx3,bby3,bbx4,bby4);
      drawLine(bbx3,bby3,bbx1,bby1);
   }
}

