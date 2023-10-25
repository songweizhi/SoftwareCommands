
###################################### install Tome ######################################

# download from https://github.com/EngqvistLab/Tome/archive/refs/tags/v1.0.0.tar.gz
# change line 23 of Tome-1.0.0/tome/tome.py from "from sklearn.externals import joblib" to "import joblib"
cd /Users/songweizhi/Software/Tome-1.0.0
pip install -e .


######################################## run Tome ########################################

tome predOGT --indir faa_files_2483_fasta_ext -p 8 -o faa_files_2483_OGT.txt


