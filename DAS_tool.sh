
#################################### For installation ####################################

# load modules
module load R/3.4.2
module load pullseq/1.0.2
module load ruby/2.3.7
module load prodigal/2.6.3
module load blast+/2.6.0


# go to https://github.com/cmks/DAS_Tool, click the green button "Clone or download" 
# on right top and select "Download ZIP" in the poped-up window.

# upload the downloaded DAS_Tool-master.zip to your Katana home directory

# cd to home directory
cd ~

# Download and extract DASTool.zip archive:
unzip DAS_Tool-master.zip
cd DAS_Tool-master

# Install R-packages (the version part (1.1.0) may need to be changed):
R CMD INSTALL ./package/DASTool_1.1.0.tar.gz

# Download latest SCG database:
wget http://banfieldlab.berkeley.edu/~csieber/db.zip
unzip db.zip -d db

# you may need to change the permission of DAS_tool execuatable files
chmod 777 /home/z5039045/DAS_Tool-master/*

# Run DAS Tool:
./DAS_Tool -h





