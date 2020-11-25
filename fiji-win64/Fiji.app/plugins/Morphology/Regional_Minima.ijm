// Regional minima, by G. Landini at bham. ac. uk
// Requires the Domes_.class plugin available from
// http://www.dentistry.bham.ac.uk/landinig/
// 1/Oct/2010
//
// Algorithm from :
// Vincent L. Morphological greyscale reconstuction in Image Analysis:
// Applications and efficient algorithms. IEEE Trans Image Proc 2(2)
// 176-201, 1993.
//
// Returns the regional minima as black pixels on a white background
// Regional minima are connected sets of pixels with a given value h
// (plateau at altitude h) such that every pixel in the neighbourhood 
// of the regional minima has a strictly higher value.
// 
// All regional minima pixels are local minima but not all local minima
// pixels are regional minima.

run("Domes ", "height=1 basins");
setThreshold(1, 255);
run("Convert to Mask");
