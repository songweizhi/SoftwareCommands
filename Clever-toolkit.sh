
##################################### clever-toolkit #####################################
 
module add cmake/3.12.1
module add boost/1.68.0-gcc7
module add gcc/7.3.0
 
curl -LOk https://bitbucket.org/tobiasmarschall/clever-toolkit/downloads/clever-toolkit-v2.4.tar.gz
tar xf clever-toolkit-v2.4.tar.gz
cd clever-toolkit-v2.4
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/srv/scratch/z9470105/software/clever-toolkit ..
make
make check
make install
 
rsync -avh LICENSE README.md scripts  /srv/scratch/z9470105/software/clever-toolkit
 
