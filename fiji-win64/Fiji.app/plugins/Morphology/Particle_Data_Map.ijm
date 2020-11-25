// Particle_Data_Map.txt
// G. Landini @ bham. ac. uk
// 26/July/2006
// 7/Mar/2007 individual stretching
//------------

title=getTitle();
run("Select None");

if (!isOpen("Results"))
 exit("No Results window found. Please run Analyze Particles or Particles8.");

// To generate the results table:
// run("Set Measurements...", "area perimeter bounding circularity integrated limit redirect=None decimal=3");
// run("Analyze Particles...", "size=0-Infinity circularity=0.00-1.00 show=Nothing display clear record");
// or
// run("Particles8 ", "white morphology show=Particles display redirect=None overwrite");
//
// Make sure that you redirect the analysis to the appropriate image, if required.

selectWindow("Results");
text = getInfo();
lines = split(text, "\n");
columns = split(lines[0], "\t");

if (columns[0]==" ")
 columns[0]= "Number";

index=newArray(nResults);
param=newArray(nResults);
imagen=newArray(nImages);
par=newArray(3);
range=newArray(3);
dmax=newArray(3);
dmin=newArray(3);
stretch=newArray(3);


imagen[0]=title;
j=0;
setBatchMode(true);
for (i=1;i<=nImages();i++) {
  selectImage(i);
  temp=getTitle();
  if (temp!=title)
      imagen[++j]=temp;
}
setBatchMode(false);
selectWindow(title);


Dialog.create("Data Map");
Dialog.addMessage("Particle Data Map");
Dialog.addChoice("Method", newArray("RGB","HSB","HS"));
Dialog.addChoice("Redirect",imagen);

Dialog.addMessage("Parameters");
Dialog.addChoice("[1]", columns);
Dialog.addCheckbox("Stretch data 1..255 range", true);
Dialog.addChoice("[2]", columns);
Dialog.addCheckbox("Stretch data to 1..255 range", true);
Dialog.addChoice("[3]", columns);
Dialog.addCheckbox("Stretch data to 1..255 range", true);

Dialog.show();
method=Dialog.getChoice();
redir=Dialog.getChoice();

par[0]=Dialog.getChoice();
stretch[0]=Dialog.getCheckbox();
par[1]=Dialog.getChoice();
stretch[1]=Dialog.getCheckbox();
par[2]=Dialog.getChoice();
stretch[2]=Dialog.getCheckbox();


// rescale
dmax[0]=-10000000;
dmin[0]= 10000000;
dmax[1]=-10000000;
dmin[1]= 10000000;
dmax[2]=-10000000;
dmin[2]= 10000000;


for (i=0; i<nResults; i++) {
     data1=getResult(par[0],i);
      if (data1>dmax[0]) dmax[0]=data1;
      if (data1<dmin[0]) dmin[0]=data1;

     data2=getResult(par[1],i);
     if (data2>dmax[1]) dmax[1]=data2;
     if (data2<dmin[1]) dmin[1]=data2;

     data3=getResult(par[2],i);
     if (data3>dmax[2]) dmax[2]=data3;
     if (data3<dmin[2]) dmin[2]=data3;
}

k=3;
if (method=="RGB"){
  run("RGB Color");
  run("RGB Stack");
}
else {
  run("RGB Color");
  run("HSB Stack");
  setPasteMode("Copy");
  setSlice(3);
  run("Copy");
  setSlice(1);
  run("Paste");
  setSlice(2);
  run("Paste");
  if (method=="HS" && imagen!=title){
     k=2;
     selectWindow(redir);
     run("Copy");
     selectWindow(title);
     setSlice(3);
     run("Paste");
  }
  run("Select None");
}

 range[0] = dmax[0] - dmin[0];
 range[1] = dmax[1] - dmin[1];
 range[2] = dmax[2] - dmin[2];

setBatchMode(true);

for (j=0;j<k;j++){
  setSlice((j+1));
  for (i=0; i<nResults; i++) {
    data = getResult(par[j],i);
    xs=  getResult("XStart",i);
    ys=  getResult("YStart",i);

    if (data>=0){
      if (stretch[j])
        result = 1+floor((254.0/range[j]) * parseFloat(data) - 254 * (dmin[j]/range[j])); // stretch 1-255
     else
        result=data;  
    }
    else
      result=0;

    //print(result);
    setColor(result);
    floodFill(xs, ys, 8);
  }
}
setBatchMode(false);
run("RGB Color");
run("Colors...", "foreground=white background=black selection=yellow");
