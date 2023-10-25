
# download database files (https://sourceforge.net/p/provean/discussion/general/thread/dc1e8204/) (here under folder /srv/scratch/z5039045/DB/Provean_nr_Aug_2011)
/data/provean/nr_Aug_2011/nr.00.tar.gz
/data/provean/nr_Aug_2011/nr.00.tar.gz.md5
/data/provean/nr_Aug_2011/nr.01.tar.gz
/data/provean/nr_Aug_2011/nr.01.tar.gz.md5
/data/provean/nr_Aug_2011/nr.02.tar.gz
/data/provean/nr_Aug_2011/nr.02.tar.gz.md5
/data/provean/nr_Aug_2011/nr.03.tar.gz
/data/provean/nr_Aug_2011/nr.03.tar.gz.md5
/data/provean/nr_Aug_2011/nr.04.tar.gz
/data/provean/nr_Aug_2011/nr.04.tar.gz.md5
/data/provean/nr_Aug_2011/nr.05.tar.gz
/data/provean/nr_Aug_2011/nr.05.tar.gz.md5

# decompress database files
cd /srv/scratch/z5039045/DB/Provean_nr_Aug_2011
tar -xzvf nr.00.tar.gz
tar -xzvf nr.01.tar.gz
tar -xzvf nr.02.tar.gz
tar -xzvf nr.03.tar.gz
tar -xzvf nr.04.tar.gz
tar -xzvf nr.05.tar.gz

# download ncbi-blast-2.4.0+-x64-linux.tar.gz (here under folder /srv/scratch/z5039045/Softwares)
https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/2.4.0/ncbi-blast-2.4.0+-x64-linux.tar.gz
tar -xzvf ncbi-blast-2.4.0+-x64-linux.tar.gz
export PATH=/srv/scratch/z5039045/Softwares/ncbi-blast-2.4.0+/bin:$PATH

# install provean (here under folder /srv/scratch/z5039045/Softwares)
module load cdhit/4.8.1
export PATH=/srv/scratch/z5039045/Softwares/ncbi-blast-2.4.0+/bin:$PATH
cd /srv/scratch/z5039045/Softwares
tar zxvf provean-1.1.5.tar.gz
cd /srv/scratch/z5039045/Softwares/provean-1.1.5
./configure BLAST_DB="/srv/scratch/z5039045/DB/Provean/nr_Aug_2011/nr" --prefix=/srv/scratch/z5039045/Softwares/provean-1.1.5
make
make install


# 2. Run PROVEAN with test examples
module load cdhit/4.8.1
export PATH=/srv/scratch/z5039045/Softwares/ncbi-blast-2.4.0+/bin:$PATH
cd /srv/scratch/z5039045/Softwares/provean-1.1.5/examples
# /srv/scratch/z5039045/Softwares/provean-1.1.5/bin/provean.sh -q P04637.fasta -v P04637.var --save_supporting_set P04637.sss --num_threads 12
/srv/scratch/z5039045/Softwares/provean-1.1.5/bin/provean.sh -q P04637.fasta -v P04637.var --num_threads 12

# 3. Interpreting PROVEAN scores:
# We suggest using a cutoff of -2.5 for the PROVEAN score when using the
# NCBI nr protein database released in August 2011. That is, consider a score
# higher than -2.5 to be neutral (tolerated) and that lower than or equal to
# -2.5 to be deleterious (damaging). The PROVEAN scores and optimal cutoff
# may slightly vary with different versions of nr database because the scores
# are computed based on the homologs in the DB. More detailed information on
# PROVEAN scores can be found at http://provean.jcvi.org/about.php

# Note!!!
# consider a score higher than -2.5 to be neutral (tolerated) and that lower than or equal to -2.5 to be deleterious (damaging). 

