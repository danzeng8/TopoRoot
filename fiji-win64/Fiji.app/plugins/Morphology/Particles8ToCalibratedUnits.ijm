// Example to convert Particles8 or Particles4 to calibrated units set in the image
// G. Landini  19/Nov/2013
// Requires Particles8_ plugin by G. Landini

t=getTitle();
run("Particles8 ", "white show=Particles minimum=0 maximum=9999999 display overwrite redirect=None");

lcf=1; //---> add here the side size of 1 pixel in the new calibrated units (e.g. lcf=5, if 1 pixels is 5mm) <---

toScaled(lcf); // length conversion factor
acf=lcf*lcf; // area conversion factor
Stack.getUnits(X, Y, Z, Time, Value); // the units of the spatially calibrated image

if (lcf!=1) {
// convert Perim, Area and Pixels in the table
for (i=0; i<nResults; i++) {
    s =getResult('Perim', i);
    setResult('Perim', i, s*lcf);
 
    a =getResult('Area', i);
    setResult('Area', i, a*acf);

    p= getResult('Pixels', i);
    setResult('Pixels', i, p*acf);
}
// The conversion can be extended to other parameters like Feret, but some have no units (like Circularity).
 
print("Image: "+t);
print("Length calibration factor: "+ lcf+" "+X+" per pixel.");
print("Area calibration factor: "+ acf+" " +X+"^2 per pixel^2.");
print("Image is assumed to have square pixels!");
print("Only Perim, Area and Pixels have been converted to calibrated units");
}
else
print("Image: "+t);
print("Length calibration factor: "+ lcf+" "+X+" per pixel.");
print("No calibration applied.");
