// Morphological_PCA.txt
// Uses PCA to extract principal components
// morphological and greyscale properties.
// requires:
//  1.  PCA plugin by M. D. Abràmoff, from http://bij.isi.uu.nl/pca.htm
//  2. the Glasbey look up table (renamed as "006-glasbey.lut")
//
// G. Landini at bham. ac. uk
// 31/Jul/2008
// 23/Dec/2009 fixed opening of Resutls Table
// 4/Feb/2014 fixed reloading Results Table again!
// IMPORTANT!:
// If you do not know what z-scores and k-means clustering means, please find
// out, so you know what you are doing. 

requires("1.41k");
a=getTitle();
if (!isOpen("Results")){
  if(getBoolean("Run Particles8 ?"))
     run("Particles8 ", "white morphology show=Particles display overwrite redirect=None");
}

//run("Particles8 ", "white morphology show=Particles display overwrite redirect=None");

// save the current Results Table in the IJ folder

myResults="TempResults.txt";
ijdir = getDirectory("imagej");
saveAs("Results", ijdir + myResults);

//if (labels[0]==" ")
//    k=1; // it is an ImageJ Results table, skip first column
//else
//    k=0; // it is not a Results table, load all columns

// The list of parameters (any order will do)
//----------------------------------------
//all possible for Particles8/4 you should add some more for Lines8
//myParams=newArray("Label","Slice","Number","XStart","YStart","Perim","Area","Pixels","XM","YM","ROIX1","ROIY1","ROIX2","ROIY2","MinR","MaxR","Feret","FeretX1","FeretY1","FeretX2","FeretY2","FAngle","Breadth","BrdthX1","BrdthY1","BrdthX2","BrdthY2","CHull","CArea","MBCX","MBCY","MBCRadius","CountCorrect","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","GrIntDen","GrMin","GrMax","GrMode","GrMedian","GrAverage","GrAvDev","GrStDev","GrSkew","GrKurt","GrEntr","RedIntDen","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedVar","RedSkew","RedKurt","RedEntr","GreenIntDen","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenVar","GreenSkew","GreenKurt","GreenEntr","BlueIntDen","BlueMin","BlueMax","BlueMode","BlueMedian","BlueAverage","BlueAvDev","BlueStDev","BlueVar","BlueSkew","BlueKurt","BlueEntr");
//
//just a test
//myParams=newArray("Label","Area", "ArBBox","Rectang","RedMin");

//only morphological (no *Var (correlated with *StDev), no *IntDen (correlated with Area and *Average)
myParams=newArray("Label","Slice", "Number","XStart","YStart","Perim","Area","Pixels","MinR","MaxR","Feret","Breadth","CHull","CArea","MBCRadius","AspRatio","Circ","Roundness","ArEquivD","PerEquivD","EquivEllAr","Compactness","Solidity","Concavity","Convexity","Shape","RFactor","ModRatio","Sphericity","ArBBox","Rectang","GrMin","GrMax","GrMode","GrMedian","GrAverage","GrAvDev","GrStDev","GrSkew","GrKurt","GrEntr","RedMin","RedMax","RedMode","RedMedian","RedAverage","RedAvDev","RedStDev","RedSkew","RedKurt","RedEntr","GreenMin","GreenMax","GreenMode","GreenMedian","GreenAverage","GreenAvDev","GreenStDev","GreenSkew","GreenKurt","GreenEntr","BlueMin","BlueMax","BlueMode","BlueMedian","BlueAverage","BlueAvDev","BlueStDev","BlueSkew","BlueKurt","BlueEntr","PLength", "SkelLength");

nParams=myParams.length;
defParams=newArray(nParams);

// ignore the following
defParams[0]=false; //Label
defParams[1]=false; //Slice
defParams[2]=false; // Number
defParams[3]=false; // XStart
defParams[4]=false; // YStart
 
// do not ignore the rest
for (i=5;i<nParams;i++){
   defParams[i]=true;
}

showStatus("Calculating Z-scores...");

for (i=0;i<nParams;i++){
    if(defParams[i] ){
       if (!isNaN(getResult(myParams[i], 0))) {

          // valid column,  get the mean 
          total=0;
          for(j=0;j<nResults;j++){
             data1=getResult(myParams[i], j);
             if (data1==-1)
                 defParams[i]=false; // has "-1", so do not use this column
             total+=data1;
          }
          mean=total/nResults;

          // get sd 
          vari=0;
          for(j=0;j<nResults;j++){
             total+=getResult(myParams[i], j);
             s = getResult(myParams[i], j) - mean;
             vari+= s * s;
          }
          vari/=(nResults-1);
          sdev=sqrt(vari);

          // rewrite the table with the Z-scores 
          for(j=0;j<nResults;j++){
             setResult( myParams[i], j, (getResult(myParams[i], j)-mean)/sdev ) ;
          }
      }
      else
         defParams[i]=false; // has a -1, so remove column from list
   }
    //print (i, myParams[i], defParams[i]); 
}

updateResults();

n=0;
for (i=0;i<nParams;i++){
  if(defParams[i])
    n++;
}


kswitches=newArray(n);
kParams=newArray(n);
s=-1;
for (i=0;i<nParams;i++){
  if(defParams[i]){
     kswitches[++s]=true;
     kParams[s]=myParams[i];
  }
}

showStatus("");

Dialog.create("PCA: choose parameters");

Dialog.addMessage("Morphological PCA");
Dialog.addNumber("Number of components", 3);
Dialog.addCheckbox("Limit components to a cumulative", false);
Dialog.addNumber("variance fraction of", 0.95);
Dialog.addCheckbox("Z-scores instead of raw data", true);
Dialog.addMessage("The following "+ n +" valid columns (without -1) were found:");
Dialog.addCheckboxGroup(8,8, kParams, kswitches);
Dialog.show();

nComponents=Dialog.getNumber();
limit=Dialog.getCheckbox();
fractionVar=Dialog.getNumber();

s=0;
zscores=Dialog.getCheckbox();
for (i=0;i<n;i++){
  kswitches[i]=Dialog.getCheckbox(); //update checkboxes
  if(kswitches[i])
     s++;
  //print (i, kParams[i], kswitches[i]); 
}

if (!zscores){  //reload table and use that
   run("Results... ", "open="+ ijdir + myResults); 
}
 
newImage("_data", "32-bit Black", nResults, 1, s);

j=0;
for (i=0;i<kswitches.length;i++){
 //print (i+1);
  if (kswitches[i]){
   setSlice(++j);
  // data
   for(k=0;k<nResults;k++){
         //print (i, param[i], getResult(param[i], k) );
          setPixel(k,0, getResult(kParams[i], k) );
   }
 }
}
run("PCA ");


if (limit){
  selectWindow("Eigenvalue spectrum of _data");
  Plot.getValues(co, vari);
  sumVar=0;  
  for(i=0;i<vari.length;i++){
     sumVar+=vari[i];
     //print( co[i],vari[i],sumVar );
     if (sumVar<=fractionVar) {
         nComponents=i;
         print (1+nComponents+" components accounting for " , sumVar +" of the variance");
    }
  }
  nComponents++; // started at 0
}

//print (nComponents+" components accounting for" , sumVar, fractionVar);


selectWindow("PCA of _data");

//if using the z scores, reload the table
if (zscores)
   run("Results... ", "open="+ ijdir + myResults); 

for (j=1;j<=nComponents;j++){
  setSlice(j);
 for (i=0;i<nResults;i++){
    setResult("PCA"+j, i,getPixel(i,0));  
 }
}

updateResults();

selectWindow("PCA of _data");
close();
selectWindow("_data");
close();
selectWindow("Eigenvalue spectrum of _data");
close();



