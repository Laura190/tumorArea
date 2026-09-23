#@ File (label = "Processed Image") input

roiManager("reset");
open(input);
open(replace(input, "_Processed.tif", "_Results.csv"));
roiManager("Open", replace(input, "_Processed.tif", "_RoiSet.zip"));