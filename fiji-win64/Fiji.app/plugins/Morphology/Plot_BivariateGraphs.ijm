//Plot_BivariateGraphs.txt
// G. Landini 
// 4/May/2008

requires("1.41b");
run("Profile Plot Options...", "width=150 height=150 minimum=0 maximum=0");
setFont("SansSerif", 26, " antialiased");
if (!isOpen("Results"))
  exit("No Results window found. Please run Particles8_ using redirection.");

// count valid parameters

selectWindow("Results");
text = getInfo();
lines = split(text, "\n");
columns = split(lines[0], "\t");
j=0;

for (i=0;i<columns.length;i++){
    // avoid some correlated and non-parametric variables
    if ((indexOf(columns[i],"X")==-1 && indexOf(columns[i],"Y")==-1) && (columns[i]!="EquivEllAr" && columns[i]!="ArEquivD" && columns[i]!="PerEquivD" && columns[i]!="Number" && columns[i]!="CountCorrect" && columns[i]!="Slice" && columns[i]!="Label" && columns[i]!=" ")) {
          j++;
          //print (i, columns[i]);
    }
}

//j++;
param=newArray(j);

k=-1;
//load the names
for (i=0;i<columns.length;i++){
    if ((indexOf(columns[i],"X")==-1 && indexOf(columns[i],"Y")==-1) && (columns[i]!="EquivEllAr" && columns[i]!="ArEquivD" && columns[i]!="PerEquivD" && columns[i]!="Number" && columns[i]!="CountCorrect"  && columns[i]!="Slice" && columns[i]!="Label" && columns[i]!=" ")) {
         param[++k]= columns[i];
    }
}


//j=5; //for testing first 5 data columns
newImage("bivar", "RGB White", 228, 205, 0);
for (k=0;k<j;k++){
  for (l=0;l<j;l++){
    if  (l==k){
       newImage("biv", "RGB Black", 228, 205, 1);
       drawString(param[k], 64, 107);
       run("Invert");
       imageCalculator("Copy", "bivar","biv");
       selectImage("bivar");
       run("Add Slice");
       selectImage("biv");
       close();
    }
    else {
       run("Correlate Results", "x="+param[k]+" y="+param[l]+" equation=[Straight Line] graph=Circles");
       imageCalculator("Copy", "bivar","Scatter Plot");
       selectImage("bivar");
       run("Add Slice");
       selectImage("Scatter Plot");
       close();
    }
  }
}

selectImage("bivar");
run("Delete Slice");
run("8-bit Color", "number=256");
run("Make Montage...", "columns="+j+" rows="+j+" scale=1 first=1 last="+(j*j)+" increment=1 border=0");
run("Profile Plot Options...", "width=400 height=400 minimum=0 maximum=0");
