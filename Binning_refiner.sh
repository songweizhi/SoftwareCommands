##################################### upload to PyPI #####################################

# upload Binning_refiner to PyPI
alias twine='/Users/songweizhi/Library/Python/3.7/bin/twine'
cd /Users/songweizhi/PycharmProjects/Binning_refiner
rm -r build
rm -r dist
rm -r BioSAK.egg-info
python setup.py sdist bdist_wheel
twine upload dist/*
songweizhi

shan88

# install/upgrade Binning_refiner
pip install --upgrade Binning_refiner


################################## upload to PyPI (Test) #################################

# upload Binning_refiner to TestPyPI

alias twine='/Users/songweizhi/Library/Python/3.7/bin/twine'
cd /Users/songweizhi/PycharmProjects/Binning_refiner
rm -r build
rm -r dist
rm -r BioSAK.egg-info
python setup.py sdist bdist_wheel
twine upload --repository-url https://test.pypi.org/legacy/ dist/*
songweizhi


# install/upgrade Binning_refiner
pip install --upgrade -i https://test.pypi.org/simple/ Binning_refiner


