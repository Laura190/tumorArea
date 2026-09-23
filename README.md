# tumorArea
Author: Laura Cooper, camdu@warwick.ac.uk
Version: v0.0
Fiji version: ImageJ
Java version: 21.0.7
Operating system: Ubuntu 24.04
Cellpose verion: Cellpose_Appose-0.1.18.jar
CLIJ version: clij_-1.9.0.1.jar
CLIJ2 version: clij2_-2.5.3.5.jar

A pair of ImageJ Macros to segment and measure the area of tumors and output the results.

tumorArea.ijm: Run the analysis
OpenResults.ijm: A helper function to view the results in Fiji

## Setup

1. Go to Help > Update... click `Manage Update Sites` and select the following plugins:
CLIJ
CLIJ2
Fiji-Cellpose
2. Click `Apply and Close`
3. Click `Apply Changes`
4. Restart Fiji
5. Open `tumorArea.ijm` in Fiji
6. `Run > Run` or use `Ctrl+R`

The first time the macro is run it will be slow as Fiji-Cellpose has to install a python environment. Subsequent runs should be faster.

## Input data

The macro expects the input directory to contain files matching the following naming pattern:

```text
B3_02_1_<i>Z0_Bright_Field_001.tif
```

Here, `<i>` is an integer from `0` through `24`.

For example:

```text
B3_02_1_1Z0_Bright Field_001.tif
B3_02_1_1Z1_Bright Field_001.tif
.
.
.
B3_02_1_2Z0_Bright Field_001.tif
B3_02_1_2Z1_Bright Field_001.tif
.
.
.
```

The macro checks for the existence of each expected file before processing it. Missing files are skipped.

## Output files

The macro creates the following directory inside the input directory:

```text
Results
```

For each processed image group, it saves:

### Processed TIFF

```text
B3_02_1_<i>_Processed.tif
```

This is the processed image after the extended depth-of-focus projection.

### Results CSV

```text
B3_02_1_<i>_Results.csv
```

This contains the measurements generated from the Cellpose ROIs.

### ROI set

```text
B3_02_1_<i>_RoiSet.zip
```

This contains the ROIs returned by Cellpose and saved through the ROI Manager.

### Output directory example

```text
[input directory]/
├── B3_02_1_1Z0_Bright Field_001.tif
├── B3_02_1_1Z1_Bright Field_001.tif
├── B3_02_1_2Z0_Bright Field_001.tif
├── ...
└── Results/
    ├── B3_02_1_1_Processed.tif
    ├── B3_02_1_1_Results.csv
    ├── B3_02_1_1_RoiSet.zip
    └── ...
```

## View Output
The macro uses batch mode to hide and speed up processing. To view the results

1. Open `OpenResults.ijm` in Fiji
2. `Run > Run`
3. Select the `..._Processed.tif` file of the results you want to see, e.g. `Results/B3_02_1_1_Processed.tif`

This will open the image, rois and results table.

Citations:
Robert Haase, Loic Alain Royer, Peter Steinbach, Deborah Schmidt, Alexandr Dibrov, Uwe Schmidt, Martin Weigert, Nicola Maghelli, Pavel Tomancak, Florian Jug, Eugene W Myers. CLIJ: GPU-accelerated image processing for everyone. Nat Methods 17, 5-6 (2020) doi:10.1038/s41592-019-0650-1

Daniela Vorkel, Robert Haase. GPU-accelerating ImageJ Macro image processing workflows using CLIJ. arXiv preprint

Robert Haase, Akanksha Jain, Stéphane Rigaud, Daniela Vorkel, Pradeep Rajasekhar, Theresa Suckert, Talley J. Lambert, Juan Nunez-Iglesias, Daniel P. Poole, Pavel Tomancak, Eugene W. Myers. Interactive design of GPU-accelerated Image Data Flow Graphs and cross-platform deployment using multi-lingual code generation. bioRxiv preprint

Stringer, C., Pachitariu, M. Cellpose3: one-click image restoration for improved cellular segmentation. Nat Methods 22, 592–599 (2025). https://doi.org/10.1038/s41592-025-02595-5

Schindelin, J., Arganda-Carreras, I., Frise, E., Kaynig, V., Longair, M., Pietzsch, T., … Cardona, A. (2012). Fiji: an open-source platform for biological-image analysis. Nature Methods, 9(7), 676–682. doi:10.1038/nmeth.2019

