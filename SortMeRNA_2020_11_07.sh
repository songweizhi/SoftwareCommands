
# load modules
module load gcc/8.4.0
module load sortmerna/3.0.3 

# indext db 
indexdb --ref db.fasta,db.idx

# get 16S reads 
sortmerna --ref db.fasta,db.idx --reads file.fa --aligned base_name_output


module load gcc/8.4.0
module load sortmerna/3.0.3 
cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26
sortmerna --reads MBARC26_R1_R2.fasta --aligned Test_output -d Test_output_kvdb --ref /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered.fasta,/srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered --sam --fastx --blast "1" --log --best 10 --min_lis 10 -e 1.00e-05 -a 12 -v
sortmerna --reads MBARC26_R1_R2.fasta --aligned Test_output -d Test_output_kvdb --ref /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered.fasta,/srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered --sam --fastx 


--blast "1" --log --best 10 --min_lis 10 -e 1.00e-05 -a 12 -v



/home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/opt/matam-v1.5.3/sortmerna/sortmerna --reads MBARC26_R1_R2.fasta --aligned Test_output -d Test_output_kvdb --ref /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered.fasta,/srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered --aligned test_aligned --sam --fastx --blast "1" --log --best 10 --min_lis 10 -e 1.00e-05 -a 12 -v


module load python/3.6.5
module load java/7u51
module unload gcc
module load gcc/8.4.0
module load sparsehash/2.0.3
module load samtools/1.9
module load sortmerna/3.0.3 
cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26
sortmerna --reads MBARC26_R1_R2.fasta --aligned Test_output -d Test_output_kvdb --sam --fastx 
--ref /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered.fasta,/srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered 


######################################## in MATAM ########################################

# Reads mapping against ref db
/home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/opt/matam-v1.5.3/sortmerna/sortmerna --ref /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered.fasta,/srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered --reads /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/combined_rep123_0.1.fasta --aligned /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/Matam_combined_rep123_0.1/workdir/combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10 --fastx --sam --blast "1" --log --best 10 --min_lis 10 -e 1.00e-05 -a 12 -v 

# Alignment filtering
cat /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/Matam_combined_rep123_0.1/workdir/combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.sam | grep -v "^@" | sort -T /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/Matam_combined_rep123_0.1/workdir -S 100000M --parallel 12 -k 1,1V -k 12,12nr | /home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/opt/matam-v1.5.3/scripts/filter_score_multialign.py -t 0.9 --geometric > /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/Matam_combined_rep123_0.1/workdir/combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.sam

# Overlap-graph building
/home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/opt/matam-v1.5.3/ovgraphbuild/bin/ovgraphbuild -i 1.0 -m 50 --csv --output_basename /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/Matam_combined_rep123_0.1/workdir/combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.ovgb_i100_o50 -r /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered.fasta -s /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/Matam_combined_rep123_0.1/workdir/combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.sam -v

module load python/3.6.5
module load java/7u51
module load gcc/8.4.0
module load sparsehash/2.0.3
module load matam/1.5.3
module load samtools/1.9
export PATH=/home/z5039045/anaconda3/bin:$PATH
cd /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/sortmerna_test
/home/z5039045/anaconda3/pkgs/matam-v1.5.3-0/opt/matam-v1.5.3/sortmerna/sortmerna --ref /srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered.fasta,/srv/scratch/z5039045/DB/Matam/SILVA_128_SSURef_NR95.clustered --reads /srv/scratch/z5039045/MarkerMAG_wd/simulation_diff_depth_InSilicoSeq/combined_rep123_0.1.fasta --aligned combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10 --fastx --sam --blast "1" --log --best 10 --min_lis 10 -e 1.00e-05 -a 12 -v 
cat combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.sam | grep -v "^@" | sort -T ./ -S 100000M --parallel 12 -k 1,1V -k 12,12nr | /srv/scratch/z5039045/MarkerMAG_wd/filter_score_multialign.py -t 0.9 --geometric > combined_rep123_0.1.sortmerna_vs_SILVA_128_SSURef_NR95_b10_m10.scr_filt_geo_90pct.sam

