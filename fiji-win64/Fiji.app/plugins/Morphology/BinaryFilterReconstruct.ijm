// BinaryFilterReconstruct.txt
// by G. Landini at bham. ac. uk
// This macro assumes white foreground.
//
// The function of the macro is deleting particles which
// would disappear after n erosions. 
// The advantage of this over morphological opening 
// is that it preserves the original shape of particles that
// are not deleted (i.e. no particle smoothing takes place).
//
// The advantages of the plugin over this macro are:
// some speed increase,
// to be able to run it in a macro using a single line, 
// it can deal with stacks, and
// it can deal with white or black foreground.

Dialog.create("BinaryFilterRecostruct");
Dialog.addMessage("Binary Filter Recostruct"); 
Dialog.addCheckbox("White particles", true);
Dialog.addNumber("Erosions", 1)
Dialog.show();

w=Dialog.getCheckbox();
n=Dialog.getNumber();

setBatchMode(true);
if (!w)
 run("Invert");

seed=getTitle;
run("Duplicate...", "title=mask");
selectWindow(seed);

for (i=0;i<n;i++){
     run("Erode");
}
run("BinaryReconstruct ", "mask=mask seed="+seed +" white");

if (!w)
 run("Invert");

setBatchMode(false);
