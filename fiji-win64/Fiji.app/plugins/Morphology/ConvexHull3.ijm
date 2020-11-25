// ConvexHull3 by G.Landini
// a morphological strong convex hull 
// 1 Dec 2003
// uses BinaryThick2_.class avaliable from dentistry.bham.ac.uk/landinig
// assumes a white object on a black background

// if done with 'rotate 90' it gives a quasi-convex hull

run("BinaryThick2 ", "kernel_a='1 2 2 1 0 2 1 1 2' kernel_b='2 1 2 1 0 2 2 1 2' rotations='rotate 45'  iterations=-1 white");
