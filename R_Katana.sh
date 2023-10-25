
module load R/4.0.2
mkdir ~/src
cd ~/src
# copy Tax4Fun2_1.1.5.tar.gz to this folder
R
library('devtools')
getwd()
install.packages(pkgs = "Tax4Fun2_1.1.5.tar.gz", repos = NULL, source = TRUE)


