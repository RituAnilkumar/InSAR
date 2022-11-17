# StaMPS Processing Workflow
The data for StaMPS is located in INSAR_yyyymmdd where the date corresponds to the date of the primary image. This file lists the steps to be used for the StaMPS processing workflow including setting up of StaMPS.

## Things to do each time you start
1. cd into the StaMPS directory ```cd /path_to_stamps/StaMPS-master/src```
2. Set up StmPS using the commands ```make``` and ```make install```
3. source the StaMPS config file specifying the path starting from/home/username/path_to_config_file_for_stamps/filename.bash
4. cd into the INSAR_yyyymmdd directory
5. Open matlab. If typing matlab doesn't work, add matlab to the path using export PATH=$PATH:/path_to_matlab/MATLAB/R2022b/bin
