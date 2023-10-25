
############################# create mypython3env for python3 ############################

# create mypython3env for python3
module load python/3.7.3
cd ~
mkdir mypython3env
python3 -m venv --system-site-packages mypython3env

# activate mypython3env
. mypython3env/bin/activate

# install python3 libraries with pip (e.g. drep and HgtSIM)
pip install drep
pip install HgtSIM

# upgrade python3 libraries with pip (e.g. drep)
pip install --upgrade drep
pip install --upgrade HgtSIM

# deactivate mypython3env
deactivate 


############################# create mypythonenv for python2 #############################

# create mypythonenv for python2
module load python/2.7.15
cd ~
mkdir mypythonenv
virtualenv --system-site-packages mypythonenv

# activate mypythonenv
. mypythonenv/bin/activate

# install python2 libraries with pip (e.g. MetaCHIP and gtdbtk)
pip install MetaCHIP
pip install gtdbtk

# upgrade python libraries with pip (e.g. MetaCHIP and gtdbtk)
pip install --upgrade MetaCHIP
pip install --upgrade gtdbtk

# deactivate mypythonenv
deactivate 
