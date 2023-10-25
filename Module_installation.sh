
# Install ETE3
curl -L 'https://repo.continuum.io/miniconda/Miniconda2-latest-MacOSX-x86_64.sh' -o Miniconda-latest-MacOSX-x86_64.sh
bash Miniconda-latest-MacOSX-x86_64.sh -b -p ~/anaconda_ete/
export PATH=~/anaconda_ete/bin:$PATH;
conda install -c etetoolkit ete3 ete3_external_apps 
# Check installation
ete3 version
ete3 build check


# install PIL
pip install Pillow


# install matplotlib
conda install matplotlib


# install scipy
conda install scipy


# install ReportLab
conda install reportlab
