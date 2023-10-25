
##################################### upload to PyPI (HgtSIM) #####################################

# upload MetaCHIP to PyPI
cd /Users/songweizhi/PycharmProjects/HgtSIM
rm -r build
rm -r dist
rm -r MetaCHIP.egg-info
python setup.py sdist bdist_wheel
twine upload dist/*


# install/upgrade MetaCHIP
pip install HgtSIM
pip install --upgrade HgtSIM



