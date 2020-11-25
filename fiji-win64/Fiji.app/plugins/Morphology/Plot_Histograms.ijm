// Plot_Histograms.txt
// G. Landini 
// 4/May/2008

run("Profile Plot Options...", "width=300 height=300 minimum=0 maximum=0");
setFont("SansSerif", 16, "bold antialiased");
run("Set Measurements...", "area mean min center slice display redirect=None decimal=6");

if (!isOpen("Results"))
 exit("No Results window found. Please run Particles8_ using redirection.");

// count valid parameters

selectWindow("Results");
text = getInfo();
lines = split(text, "\n");
columns = split(lines[0], "\t");
j=0;

for (i=0;i<columns.length;i++){
    if ((indexOf(columns[i],"X")==-1 && indexOf(columns[i],"Y")==-1) && (columns[i]!="EquivEllAr" && columns[i]!="ArEquivD" && columns[i]!="PerEquivD" && columns[i]!="Number" && columns[i]!="CountCorrect" && columns[i]!="Slice" && columns[i]!="Label" && columns[i]!=" ")) {
          j++;
         //print (i, columns[i]);
    }
}

param=newArray(j);

k=-1;
//load the names
for (i=0;i<columns.length;i++){
    if ((indexOf(columns[i],"X")==-1 && indexOf(columns[i],"Y")==-1) && (columns[i]!="EquivEllAr" && columns[i]!="ArEquivD" && columns[i]!="PerEquivD" && columns[i]!="Number" && columns[i]!="CountCorrect"  && columns[i]!="Slice" && columns[i]!="Label" && columns[i]!=" ")) {
         param[++k]= columns[i];
    }
}

//j=5; //for testing first 5 data columns
newImage("bivar", "8bit Black", 300, 240, 0);


for (k=0;k<j;k++){
       run("Distribution...", "parameter="+param[k]+" or=16 and=0-0");
       nam=param[k]+" Distribution";
       imageCalculator("Copy", "bivar", nam);
       selectImage("bivar");
       run("Add Slice");
       selectImage(param[k]+" Distribution");
       close();
}
run("Delete Slice");
run("Canvas Size...", "width=300 height=260 position=Bottom-Center");

for (k=0;k<j;k++){
  setSlice(k+1);
  drawString(param[k], 22, 20);
}

sqrj=floor(sqrt(j));
sqrjp1=sqrj;

while (sqrj*sqrjp1<j)
 sqrjp1++;

 
selectImage("bivar");

run("Make Montage...", "columns="+sqrj+" rows="+sqrjp1+" scale=1 first=1 last="+j+" increment=1 border=0");

