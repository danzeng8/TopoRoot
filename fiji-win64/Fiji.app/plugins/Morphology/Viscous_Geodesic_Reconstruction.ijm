// Viscous_Geodesic_Reconstruction
// G. Landini
// 19/Mar/2007
// reconstructs areas of objects larger than a disc of radius R
// This consists of reconstruction followed by an opening at every step
// Mask and Seed must be binary [0..255]
// Foreground must be white and Background black
// Kammerer P, Zolda E, Sablatnig R. Computer Aided Analysis of Underdrawings in Infrared Reﬂectograms
// 4th Intl Symposium on Virtual Reality, Archaeology and Intelligent Cultural Heritage
// (2003), pp. 1–9. D. Arnold, A. Chalmers, F. Niccolucci (Editors)
// http://www.prip.tuwien.ac.at/people/sab/papers/vast03.pdf

nBins = 256;
title=getTitle();
if (nImages<2)
  exit("Two images are needed");

imagen=newArray(nImages);

imagen[0]=title;
j=0;
setBatchMode(true);
for (i=1;i<=nImages();i++) {
  selectImage(i);
  temp=getTitle();
  if (temp!=title)
      imagen[++j]=temp;
}

selectWindow(title);
setBatchMode(false);

Dialog.create("Geodesic Dilation")
Dialog.addChoice("Mask",imagen, imagen[0]);
Dialog.addChoice("Seed",imagen, imagen[1]);
Dialog.addNumber("Radius", 3);
Dialog.addCheckbox("Create New Window", false)
Dialog.show();

mask=Dialog.getChoice();
seed=Dialog.getChoice();
radius = Dialog.getNumber();
create = Dialog.getCheckbox();

setBatchMode(true);
if (create){
  selectWindow(seed);
  run("Duplicate...", "title=VReconstruct");
  seed="VReconstruct";
}

selectWindow(seed);
w=getWidth();
h=getHeight();

getHistogram(values, counts, nBins);

white=counts[255];
whitebefore=0;

while (white!=whitebefore){
  // dilate
  run("Maximum...", "radius="+radius);
  // restrict to mask
  imageCalculator("AND", seed, mask);
  // open
  run("Minimum...", "radius="+radius);
  run("Maximum...", "radius="+radius);

  getHistogram(values, counts, nBins);
  whitebefore=white;
  white=counts[255];
}
setBatchMode(false);
