# This code assumes that you have 3 directories in your working directory.
# SLC directory where you have downloaded the SAR data and placed it (zipped files) inside
# DEM directory where the DEMs may or may not be saved. They can be downloaded from earth data. Earth Data username and password are to be saved beforehand
# Outputs directory where your outputs will be saved
# Variables to change

# Change the path to the stack processors to be used
export PATH=$PATH:/home/ritu/miniconda3/envs/isce_env/share/isce2/topsStack/:/home/ritu/miniconda3/envs/isce_env/share/isce2/prepStackToStaMPS/bin/:/home/ritu/miniconda3/envs/isce_env/lib/python3.9/site-packages/isce/applications:/home/ritu/miniconda3/envs/isce_env/lib/python3.9/site-packages/isce/

# Change to the path of the parent directory we will work in
WORKINGDIRPATH=/home/ritu/Desktop/SnowmeltTDP/IonosphericCorr

# File name of the master image. In the format YYYYMMDD
REFIMAGE=20220302
SECIMAGE=20220314

# Bounding box details.BBOX is with decimals. Others are the floored and ceiled bounding box to the whole number containing the BBOX
BBOX='28.2100 28.9000 93.5000 94.4900' # Also replace at line 46 and 72
LLAT=28
ULAT=29
LLON=93
ULON=95

# The DEM file generated will have names associated with the LLAT, ULA, LLON, ULON. Modify here
DEMFILE=$WORKINGDIRPATH/DEM/demLat_N28_N29_Lon_E093_E095.dem.wgs84

# Open in SNAP and see the subswath the AOI lies in. If multiple use 1 2 3 or 1 2 or 2 3 as is the case
SUBSWATH=1 # If multiple change in line 46

# Coregistration varaible. Choose NESD or geometry
COREG=NESD

# Coherance threshold
COHTHRESH=0.65


# MAIN CODE BELOW. DO NOT MODIFY
cd ~
cd $WORKINGDIRPATH/DEM

# Generates a single DEM file for the area of interest
dem.py -a stitch -b $LLAT $ULAT $LLON $ULON -r -s 1 -c -k --uname=RituAnil --password=Pewpewpew@95

# Prepares the data and generates the run files
cd ../Outputs
stackSentinel.py -s $WORKINGDIRPATH/SLC/ -o /$WORKINGDIRPATH/Outputs/orbits/ -d $DEMFILE -b '28.2100 28.9000 93.5000 94.4900' -n $SUBSWATH -a $WORKINGDIRPATH/Outputs/orbits/ -C $COREG -e $COHTHRESH -m $REFIMAGE


# Run the file generated
cd run_files
sh run_01_unpack_topo_reference
sh run_02_unpack_secondary_slc
sh run_03_average_baseline
sh run_04_extract_burst_overlaps
sh run_05_overlap_geo2rdr
sh run_06_overlap_resample
sh run_07_pairs_misreg
sh run_08_timeseries_misreg
sh run_09_fullBurst_geo2rdr
sh run_10_fullBurst_resample
sh run_11_extract_stack_valid_region
sh run_12_merge_reference_secondary_slc
sh run_13_generate_burst_igram
sh run_13_generate_burst_igram
sh run_14_merge_burst_igram
sh run_15_filter_coherence
sh run_16_unwrap

# END OF MAIN CODE

# Comment the below if running for more than 2 images and copy paste for each pair to georeference
geocodeGdal.py -t -f $WORKINGDIRPATH/Outputs/merged/interferograms/$REFIMAGE+"_"$SECIMAGE/filt_fine.int -l $WORKINGDIRPATH/Outputs/merged/geom_reference/lat.rdr -L $WORKINGDIRPATH/Outputs/merged/geom_reference/lon.rdr -b '28.2100 28.9000 93.5000 94.4900'
