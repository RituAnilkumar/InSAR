# Processing with ISCE
This filecontains the steps to be performed for preprocessing Sentinel 1 data for interferometric SAR (specfically PS InSAR). 

## Run every time
1. Open a folder and create 3 directories within it: SLC for keeping the data, DEM for storing the DEM and Outputs for saving the outputs. Inside Outputs, create a directory named orbits to save the precise orbit files
2. cd to the directory containing the 3 directories created. Activate isce_env
3. Export the isce folders to the path variable as follows: ```export PATH=$PATH:/home/ritu/miniconda3/envs/isce_env/share/isce2/topsStack/:/home/ritu/miniconda3/envs/isce_env/share/isce2/prepStackToStaMPS/bin/:/home/ritu/miniconda3/envs/isce_env/lib/python3.9/site-packages/isce/applications:/home/ritu/miniconda3/envs/isce_env/lib/python3.9/site-packages/isce/
```
4. dem.py -a stitch -b 32.2074 32.2756 77.5030 77.5464 -k -r -l -c -s 1 -n RituAnil-w Pewpewpew@95 https://aria-alt-dav.jpl.nasa.gov/repository/products/SRTM1_v3/
