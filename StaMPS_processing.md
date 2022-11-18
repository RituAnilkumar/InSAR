# StaMPS Processing Workflow
The data for StaMPS is located in INSAR_yyyymmdd where the date corresponds to the date of the primary image. This file lists the steps to be used for the StaMPS processing workflow including setting up of StaMPS.

## Things to do each time you start
1. cd into the StaMPS directory ```cd /path_to_stamps/StaMPS-master/src```
2. Set up StaMPS using the commands ```make``` and ```make install```
3. source the StaMPS config file specifying the path starting from/home/username/path_to_config_file_for_stamps/filename.bash
4. cd into the INSAR_yyyymmdd directory
5. We need to generate some additional files for processing with StaMPS. This splits the data into patches. It is implemented by typing ```mt_prep_snap yyyymmdd /home/path_to_folder/INSAR_yyyymmdd 0.4 2 3 50 200``` Here 0.4 is the amplitude dispersion,  2 and 3 are the number of patches created in the range and azimuth direction. Make sure each patch contains less than 5 million pixels. 50 and 200 are the number of pixels considered in the overlapbetween patches in the range and azimuth direction.
6. Open matlab within the directory. If typing matlab doesn't work, add matlab to the path using export PATH=$PATH:/path_to_matlab/MATLAB/R2022b/bin

## Processing chain
StaMPS will be loaded with matlab if the aboe steps are followed. Help can be seen using ```help stamps```. This yieds information on the various steps to be applied on the patches. The flag PATCHES_FLAG can be set to 'n' if all the patchesare to be worked on together. Typically, we can apply the different steps by using stamps(start_step,end_step). The help yields the following:

```
    STEP 1 = Initial load of data
    STEP 2 = Estimate gamma 
    STEP 3 = Select PS pixels
    STEP 4 = Weed out adjacent pixels
    STEP 5 = Correct wrapped phase for spatially-uncorrelated look angle error and merge patches
    STEP 6 = Unwrap phase
    STEP 7 = Calculate spatially correlated look angle (DEM) error 
    STEP 8 = Filter spatially correlated noise 
    STEP 0 = Continue from the last known stage till the end-stage selected
```
