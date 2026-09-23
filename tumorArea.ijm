#@ File (label = "Input directory", style = "directory") input
#@ int (label = "cell diameter for Cellpose", value=50) cellDiam
#@ int (label = "mininum size in pixels", value=900) minSize

run("CLIJ2 Macro Extensions", "cl_device=");
run("Set Measurements...", "area centroid shape redirect=None decimal=9");
run("ROI Manager...");
setBatchMode("hide");
for (i = 1; i <= 25; i++) {
	if(File.exists(input+File.separator+"B3_02_1_"+i+"Z0_Bright Field_001.tif")){
File.openSequence(input, " filter=B3_02_1_"+i+"Z");
image1=getTitle();
Ext.CLIJ2_push(image1);
image2 = "EOF_sobel";
sigma = 10.0;
Ext.CLIJ2_extendedDepthOfFocusSobelProjection(image1, image2, sigma);
Ext.CLIJ2_pull(image2);
//run("Gaussian Blur...", "sigma=2");
run("Cellpose...", "cp_model=yeast_BF_cp3 custom_model= cell_diameter="+cellDiam+" cyto_channel=1 nuclei_channel=None min_size="+minSize+" normalize=true resample=true return_rois=true cellprob_threshold=0.0 flow_threshold=0.4 tile_overlap=0.1 niter=0 compute_flows=false shuffle=true mode_3d=None stitch_threshold=0.0 flow3d_smooth=0 torchversion=cpu usegpu=false");
roiManager("Measure");
File.makeDirectory(input+File.separator+"Results");
saveAs("Tiff", input+File.separator+"Results"+File.separator+"B3_02_1_"+i+"_Processed.tif");
saveAs("Results", input+File.separator+"Results"+File.separator+"B3_02_1_"+i+"_Results.csv");
roiManager("Save", input+File.separator+"Results"+File.separator+"B3_02_1_"+i+"_RoiSet.zip");
//setBatchMode("show");
selectWindow("Results");
run("Close");
roiManager("reset");
	}
}
