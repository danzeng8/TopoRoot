// BinaryPrune.txt prunes endpoints of a skeleton
// requires BinaryErode_.class by G.Landini
// available at dentistry.bham.ac.uk/landinig/

requires("1.31p");
b=getBoolean("Binary Prune\n \nWhite foreground?");
if (b)
	run("BinaryErode ", "coefficient=6 iterations=-1 white");
else
	run("BinaryErode ", "coefficient=6 iterations=-1");
