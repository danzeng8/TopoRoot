//Euler number
// G.Landini at bham.ac.uk
// calculated using the hit-or-miss transform and a method described by
// Pratt in Digital Image Processing. John Wiley & Sons., 1978.
//
//The most efficient and simplest algorithm, reported so far, for
// computing Euler number of an image works by looking into local 
// patterns. Consider the following set of 2 2-pixel patterns called
// bit quad: 
//
//   Q1 =  0 0   0 0   0 1   1 0
//         1 0   0 1   0 0   0 0
//
//   Q2 =  0 1   1 0   1 1   1 1
//         1 1   1 1   1 0   0 1
//
//   Q3 =  0 1   1 0
//         1 0   0 1
//
//  Let C1 , C2 and C3 be the number of patterns Q1 Q2 Q3 respectively
//  in the image S.  It has been shown that under the definition of
//  4-connectivity the Euler number can be computed as
//
//            E(S) = 1/4 * (C1 - C2 + 2 * C3 )
//
//  and for eight-connectivity
//
//            E(S) = 1/4 * (C1 - C2 - 2 * C3 )
//
// The objects should not touch the border of the image.

run("Select None");
setBatchMode(true);
a=getTitle();
nBins = 256;
q1=0;
q2=0;
q3=0;

//C1
run("Duplicate...", "title=0");
run("BinaryHitOrMiss ", "kernel_a=[1 0 2 0 0 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q1+=counts[255];

imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[0 1 2 0 0 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q1+=counts[255];

imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[0 0 2 1 0 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q1+=counts[255];

imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[0 0 2 0 1 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q1+=counts[255];

//C2
imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[0 1 2 1 1 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q2+=counts[255];

imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[1 0 2 1 1 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q2+=counts[255];

imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[1 1 2 1 0 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q2+=counts[255];

imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[1 1 2 0 1 2 2 2 2 ] rotations=none white");
getHistogram(values, counts, nBins); 
q2+=counts[255];

//C3
imageCalculator("Copy", "0",a);
run("BinaryHitOrMiss ", "kernel_a=[0 1 2 1 0 2 2 2 2 ] rotations=inverse white");
getHistogram(values, counts, nBins); 
q3+=counts[255];


//for 4-connected
//print ("Euler:"+ (q1-q2+2*q3)/4);


//for 8-connected
print ("Euler:"+ (q1-q2-2*q3)/4);

selectImage("0");
close();
setBatchMode(false);




