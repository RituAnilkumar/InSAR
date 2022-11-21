# Processing with ISCE
This filecontains the steps to be performed for preprocessing Sentinel 1 data for interferometric SAR (specfically PS InSAR). 

## Run every time
1. Open a folder and create 3 directories within it: SLC for keeping the data, DEM for storing the DEM and Outputs for saving the outputs. Inside Outputs, create a directory named orbits to save the precise orbit files
2. cd to the directory containing the 3 directories created. Activate isce_env
3. Export the isce folders to the path variable as follows: ```export PATH=$PATH:/home/ritu/miniconda3/envs/isce_env/share/isce2/topsStack/:/home/ritu/miniconda3/envs/isce_env/share/isce2/prepStackToStaMPS/bin/:/home/ritu/miniconda3/envs/isce_env/lib/python3.9/site-packages/isce/applications:/home/ritu/miniconda3/envs/isce_env/lib/python3.9/site-packages/isce/```
4. Download the SRTM tile for the study area using wget or going to https://e4ftl01.cr.usgs.gov/MEASURES/SRTMGL1.003/2000.02.11/SRTMGL1_page_2.html and searching for the tile with the lat and long given by N32E077. Download all the files in the study area. PAste it in the DEM directory
5. Use dem.py to stitch the DEM into the format required: ```dem.py -a stitch -b 32 33 77 78 -r -s 1 -c -k --uname=your_username --password=Your_password```
6. Apply the stackSentinel program. -s indicates the path to the SLC folder, -o is the path to orbits, -d indicates the path to the DEM folder. -b is for the bounding box. ```stackSentinel.py -s /home/iirs/DInSAR/Ex6/SLCs/ -o /home/iirs/DInSAR/Ex6/Outputs/orbits/ -d /home/iirs/DInSAR/Ex6/DEM/demLat_N30_N31_Lon_E079_E080.dem.wgs84 -b '32.2074 32.2756 77.5030 77.5464' -W slc -n 1 -a /home/iirs/DInSAR/Ex6/Outputs/orbits/ -C geometry -e 0.65 -m 20211126```
7. The files generated under run_files need to be run consecutively. cd to the run_files directory and run each usingsh run_XX_XXXXXXXXXXXXX
