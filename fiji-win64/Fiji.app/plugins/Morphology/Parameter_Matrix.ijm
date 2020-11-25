// Parameter_Matrix.txt
// G. Landini @ bham. ac. uk
// 16/Sep/2006
// 26/Jun/2007 works with any number of parameters
//------------

if (!isOpen("Results"))
 exit("No Results window found. Please run Particles8_ using redirection.");

// count valid parameters

selectWindow("Results");
text = getInfo();
lines = split(text, "\n");
columns = split(lines[0], "\t");
j=0;

for (i=0;i<columns.length;i++){
    if ((indexOf(columns[i],"X")==-1 && indexOf(columns[i],"Y")==-1) && (columns[i]!="Number" && columns[i]!="Slice" && columns[i]!="Label" && columns[i]!=" ")) {
          j++;
         //print (i, columns[i]);
    }
}

//j++;
param=newArray(j);

k=-1;
//load the names
for (i=0;i<columns.length;i++){
    if ((indexOf(columns[i],"X")==-1 && indexOf(columns[i],"Y")==-1) && (columns[i]!="Number" && columns[i]!="Slice" && columns[i]!="Label" && columns[i]!=" ")) {
         param[++k]= columns[i];
    }
}

// Make sure that you redirect the analysis to the appropriate image. This macro expects the grey stats recorded

//column=newArray(38);
siz=16;

iw=j*siz;

ih=nResults*siz;

//newImage("Parameter", "8-bit White", iw, ih, 1);

setBatchMode(true);
// rescale
newImage("Parameter", "8-bit Black", iw, ih, 1);
for (l=0;l<j;l++){

   dmax=-10000000000;
   dmin =  10000000000;
   for (i=0; i<nResults; i++) {
      data=getResult(param[l],i);
      if (data>dmax) dmax=data;
       if (data<dmin) dmin=data;
   }

  range = dmax - dmin;

  for (i=0; i<nResults; i++) {
    data=getResult(param[l],i);

    //setBatchMode(true);
    //xs=  getResult("XStart",i);
    //ys=  getResult("YStart",i);

   // if (data>0)
       result = 1+round((253.0/range) *data - 253.0 * (dmin/range));
   // else
    //   result=0;

    setColor(result);
    fillRect(l*siz, i*siz, siz-1, siz-1);
    //fillOval(l*siz, i*siz, siz-1, siz-1);
  }
}
run("Canvas Size...", "width="+iw+" height="+ih+85+" position=Bottom-Center ");
run("Rotate 90 Degrees Right");
setColor(255,255,255);

for (l=0;l<j;l++){
drawString(""+param[l], ih+5, siz+l*siz);
}
run("Rotate 90 Degrees Left");
run("Canvas Size...", "width="+iw+40+" position=Top-Right zero");

for (i=0; i<nResults; i++) {
 drawString(""+i+1, 1, 85+((i+1)*siz));
}
setBatchMode(false);
lutdir=getDirectory("startup")+"luts"+File.separator;
open(lutdir+"gyr.lut");
