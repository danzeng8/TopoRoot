// Regional maxima and minima, by G. Landini at bham. ac. uk 
// 2/11/2003
// Requires the Domes_.class plugin available from
// http://www.dentistry.bham.ac.uk/landinig/
//
// Algorithm from :
// Vincent L. Morphological greyscale reconstuction in Image Analysis:
// Applications and efficient algorithms. IEEE Trans Image Proc 2(2)
// 176-201, 1993.
//
// Returns the regional maxima as white [255] pixels and the regional minima
// as black pixels [0] on a grey background [127]
// Regional maxima (and minima) are connected sets of pixels with a given value h
// (plateau at altitude (depth) h) such that every pixel in the neighbourhood 
// of the regional maxima (minima) has a strictly lower (higher) value.
// 
// All regional maxima (minima) pixels are local maxima (minima), but not all local 
// maxima (minima) pixels are regional maxima (minima).

run("Duplicate...", "title=RegMin.tif");
run("Duplicate...", "title=RegMax.tif");
selectWindow("RegMax.tif");
run("Domes ", "height=1");
setThreshold(1, 255);
run("Convert to Mask");
selectWindow("RegMin.tif");
run("Domes ", "height=1 basins");
setThreshold(255, 255);
run("Convert to Mask");
run("Image Calculator...", "image1=RegMax.tif operation=Average image2=RegMin.tif  create");
selectWindow("RegMin.tif");
run("Close");
selectWindow("RegMax.tif");
run("Close");
