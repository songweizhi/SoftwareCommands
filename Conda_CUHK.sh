
conda create -n mypy3env python=3.7
conda activate mypy3env
pip3 install --upgrade BioSAK
pip3 install --upgrade TreeSAK

conda activate mypy3env


# install ranger on server
conda create -n ranger
conda activate ranger
conda install -c conda-forge r-ranger


# install mamba (for metaWRAP)
conda deactivate
conda install -y mamba
mamba create -y --name metawrap-env --channel ursky metawrap-mg=1.3.2
conda activate metawrap-env
conda install -y blas=2.5=mkl








