# Processing steps for LICSBAS
1. Install using the yml file found at https://github.com/yumorishita/LiCSBAS/wiki/1_Installation and conda env create -f environ.yml
2. Activate the licsbas environment
3. git clone https://github.com/yumorishita/LiCSBAS.git
4. Run source /home/path_to LICSBAS/bashrc_LiCSBAS.sh
5. Identify frame of interest from https://comet.nerc.ac.uk/COMET-LiCS-portal/
6. Use ```LiCSBAS01_get_geotiff.py -f frame_number -s yyyymmdd -e yyyymmdd``` yyyymmdd are the start date and end date respectively.
7. Use ```LiCSBAS02_ml_prep.py -i GEOC -n 1``` to prepare the data and downscale to the requirement
8. Use ```LiCSBAS05op_clip_unw.py -i GEOCml1 -o GEOCml1clip -g LL/UL/LL2/RL``` where LL, UL, LL2 and RL are lower lat, upper lat, left lon and right lon ie the bounding box to clip to.
