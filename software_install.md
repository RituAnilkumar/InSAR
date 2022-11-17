This file is organized as follows:
1. Installation of Miniconda
2. Installation of ISCE
3. Instalaltion of MATLAB
4. Installation of SNAP and Snappy
5. Installation of StaMPS Software
6. Installation of StaMPS Visualizer

## 1. Miniconda Installation
1. Install miniconda or anaconda sh file from the website: https://docs.conda.io/en/latest/miniconda.html
2. Move to the Downloads directory ```cd Downloads/```
3. Change permissions to permit execution of the file using ```chmod +x Miniconda3-latest-Linux-x86_64.sh```
4. Execute the file using ```./Miniconda3-latest-Linux-x86_64.sh```
5. Follow the steps that pop up.

## 2. ISCE Software Installation
1. Install miniconda or anaconda using the steps described in the website.
2. Create a new environment for installing isce software. Use the conda command
```-conda create- ---name isce2_env```
3. Activate the ```icse2_env``` using ```conda activate isce2_env```
4. Install isce2 package using ``` conda install -c conda-forge isce2```
5. Add isce2 to path variable using ```export PATH=$PATH:/path_to_isce2```

## 3. MATLAB Installation
1. Test
2. test

## 4. SNAP Software Installation
1. Get the installation files from ESA SNAP Download page: https://step.esa.int/main/download/snap-download/
2. Make the .sh file into an executable by using ```chmod +x downloaded_filename.sh```
3. Run the file using ```sudo ./downloaded_filename.sh```
4. Follow the instructions on the installation window.
5. For using with Python, create an environment with Python installated using ```conda create --name snappy_env python=3```
6. Activate the environment using ```conda activate snappy_env``` and type ```which python``` to get the path to Python installed in that environemnt.
7. Copy and paste the Python path in the concerned slot during SNAP installation.
8. Continue installation

## 5. StaMPS Software Installation
This requires MATLAB to be installed. Prior to its installation, Snaphu, Triangle and TRAIN need to be installed. Steps for the same are as follows:

### 5.1 Snaphu
1. Install using ```sudo apt-get install snaphu```
2. Check the installation path using ```whereis snaphu```


### 5.2 Triangle
1. Install using ```sudo apt-get install triangle-bin```
2. Check the installation path using ```whereis triangle```

### 5.3 TRAIN (Toolbox for Reducing Atmospheric InSAR Noise)
1. Download from http://github.com/dbekaert/TRAIN
2. Open the folder and edit the APS_CONFIG.sh file using the paths you require.
3. In the Terminal type ```source APS_CONFIG.sh```
4. Open matlab and type aps_linear to check

### 5.4 Set up StaMPS
1. For StaMPS, download the package from https://github.com/dbekaert/StaMPS. Unzip.
2. Open the StaMPS_CONFIG.bash file and edit the paths to match your system paths. The snaphu and triangle paths obtained using the ```whereis``` should be used.
3. Once the config file ismodified, ```cd``` into the StaMPS/src directory and execute the following commands:
4. ```make```
5. ```make install```

NOTE: If make is not installed, use ```sudo apt install make```. If g++ is not installed use ```sudo apt install g++```. 

6. Use ```source /home/ritu/path_to_StaMPS/StaMPS_CONFIG.bash``` before use.
7. Check the installation using matlab. Type stamps in the matlab prompt.

## 6. StaMPS Visualizer Installation
This requires R and RStudio to be installed before hand. The steps for this can be followed from the website or as follows:

### 6.1 R and RStudio set up
1. sudo apt install r-base gdebi-core
2. Download the RStudio file for your respective OS from https://www.rstudio.com/products/rstudio/download/#download
3. Install the deb file using gdebi:```sudo gdebi filename.deb```
4. RStudio can be started by executing ```rstudio``` on the Terminal.

### 6.2 StaMPS Visualizer
1. Install leaflet, lubridate, shiny, shinycssloaders, shinyalert, shinydashboard, colorRamps, rgdal, data.table and renv packages using install.packages("package_name"). Eg install.packages("leaflet")
2. In case of an error of gdal-config, install libgdal using ```sudo apt install libgdal-dev```
3. In some cases, R version might not be compatible. For that, add the associated CRAN site to sources.list and reinstall R
4. Once all packages are succesfuly installed, run the ui.R app for loading the StaMPS Visualizer.

