// skeleton2 .txt by G.Landini
// a skeletonisation algorithm, different from the one in ImageJ
// makes too many lateral "bones" or branches
// 3 Dec 2003
// uses BinaryThin2_.class avaliable from www.dentistry.bham.ac.uk/landinig/
// assumes a white object on a black background

run("BinaryThin2 ", "kernel_a='1 1 2 1 1 0 1 1 2 ' kernel_b='1 2 0 1 1 2 1 1 1 ' rotations='rotate 45' iterations=-1 white");

// also possible with 90 degree rotations
//run("BinaryThin2 ", "kernel_a='1 1 2 1 1 0 1 1 2 ' kernel_b='1 2 0 1 1 2 1 1 1 ' rotations='rotate 90' iterations=-1 white");
