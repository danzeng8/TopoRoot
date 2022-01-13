// Domes_stack.txt
// G. Landini 29/Nov/2005
// Processes domes in a whole stack

t=getTitle();
Dialog.create("Domes");
Dialog.addMessage("Domes (stack version)"); 
Dialog.addNumber("Height", 40);
Dialog.addCheckbox("Basins (dark) instead of domes", false);
Dialog.show();
dh=Dialog.getNumber();
basins=Dialog.getCheckbox();

for (i=1;i<=nSlices;i++){
	selectWindow(t);
	setSlice(i);
	run("Duplicate...", "title=temp");
	if (basins)
		run("Domes ", "height="+dh+" basins");
	else
		run("Domes ", "height="+dh);
	run("Select All");
	run("Copy");
	close();
	selectWindow(t);
	run("Paste");
	run("Select None");
}
setSlice(1);
