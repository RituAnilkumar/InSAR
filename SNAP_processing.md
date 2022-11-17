# PSI Processing in SNAP
The steps associated with Sentinel processing are:
1. Performing a TOPS Split: Choose IW of choice, the polarization and the number of bursts in the processing parameters under RADAR>Sentinel-1 TOPS>S-1 TOPS Split
2. Applying the orbit file: RADAR>Apply Orbit File. Check the do not fail if new orbit  file is not found under processing parameters.
3. Choosing the primary and secondary images: RADAR>Interferometric>INSAR Stack. This button is the last option. Can select the line below the last entry in case it appears hidden. Add Opened files in the input stack. Click on Overview and the primary and secondaries suggested by SNAP appears. 
4. Update plugins under Tools>Plugins
5. Coregistration of the secondary data files to the primary: RADAR>Coregistration>S1 TOPS Coregistration>S1Back Geocoding. Add the orbit corrected files. Keep the primary identified in step 3 on top. Under Back-geocoding you can choose the DEM of choice. Click Run. 
6. Enhanced spectral diversity: This improves the coregistration. RADAR>Coregistration>S1 TOPS Coregistration>Enhanced spectral diversity
7. Interferogram generation and coherance estimation: Ensure that elevation and lat lon checkbox is also selected when running as its required in the export to stamps. RADAR>Interferometric>Products>Interferogram Formation.
8. Debursting: Required to be performed for the interfeormgram as well as the product after enhanced spectral diversity. RADAR>S1 TOPS> S1 Tops Deburst.
9. Exporting for applying to StaMPS: The image after the spectral diverrsity and the interferogram need to be specified. The final exported folder contains a number of sub folders each specifying the interferogram, image files, DEM data, lat, lon and elevation etc.
10. Rename the folder containing the STaMPS ready export to INSAR_yyyymmdd where the date corresponds to that of the master image.
