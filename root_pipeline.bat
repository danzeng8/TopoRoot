SET /A k = %3+4
SET /A n = %3-4
SET /A d = 1

set argC=0
for %%x in (%*) do Set /A argC+=1

echo %argC%

IF "%argC%"=="4" (
    Set /A d = %4
)

del tmp\holefill\*.png
del tmp\downsampled\*.png
del tmp\topoOut\*.png
del tmp\*.ply
del tmp\*.mrc
del tmp\*.r

echo %d%
cd fiji-win64/Fiji.app
ImageJ-win64 --ij2 --headless --console --run "macros/downsampled.ijm" "input='%1', step=%d%"
cd ../../TopoSimplifier
TopoSimplifier.exe --in ../tmp/downsampled/ --out ../tmp/topoOut/ --S %3 --N %n% --K %k%
cd ..
cd fiji-win64/Fiji.app
ImageJ-win64 --ij2 --headless --console --run "macros/holeFill.ijm" "input='../../tmp/topoOut/', suffix='.png', threshold=%3"
cd ../../TopoSimplifier
TopoSimplifier.exe --in ../tmp/holefill/ --out ../tmp/topoOut.mrc --K %3 --S %3 --N %3
cd ../voxelcore
voxelcore -md=vol2ma ../tmp/topoOut.mrc ../tmp/topoOut.ply -fullOrPruned=1
cd ../et
EtDev --nogui -ma_file=../tmp/topoOut.ply -r_file=../tmp/topoOut.r -smooth_i=3 -theta_1=0.01 --export_skel
cd ..
python skeleton-mst.py tmp/topoOut_skel.ply %2