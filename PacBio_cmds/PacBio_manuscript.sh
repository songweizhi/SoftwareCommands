
################################# 2018-07-04_assess_depth ################################

# assemble with all subreads
cd /srv/scratch/z5039045/PacBio/2018-07-04_assess_depth
canu usegrid=false -p canu_all -d canu_all genomeSize=44.8m -pacbio-raw subreads_all/*.fasta

# combine all subreads together 
cat subreads_all/*.fasta > subreads_all.fasta

# subsample reads
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/2018-07-04_assess_depth
python3 /srv/scratch/z5039045/Scripts/subsample_unpaired_reads.py -i subreads_all.fasta -p 0.595 -o subreads_100x.fasta
python3 /srv/scratch/z5039045/Scripts/subsample_unpaired_reads.py -i subreads_all.fasta -p 0.298 -o subreads_50x.fasta
python3 /srv/scratch/z5039045/Scripts/subsample_unpaired_reads.py -i subreads_all.fasta -p 0.149 -o subreads_25x.fasta
python3 /srv/scratch/z5039045/Scripts/subsample_unpaired_reads.py -i subreads_all.fasta -p 0.0595 -o subreads_10x.fasta
 


canu usegrid=false -p canu_10x -d canu_10x genomeSize=44.8m -pacbio-raw subreads_10x/*.fasta


canu usegrid=false -p canu_10x -d canu_10x genomeSize=44.8m correctedErrorRate=0.075 -pacbio-raw subreads_10x/*.fasta


# for error 
# https://github.com/marbl/canu/issues/707
cd /srv/scratch/z5039045/PacBio/2018-07-04_assess_depth/canu_10x/correction/1-overlapper
for i in $(seq 1 2 3); do   ./precompute.sh $i; done

# then 
mhap_failed_jobs=(53 54 114 115 116 117 118 119)
for i in "$mhap_failed_ids[@]"; do
  ./mhap.sh $i
done


################################# assemble AD1 with Canu #################################

# get AD1 subreads
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/2018-07-04_get_AD1_subreads
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam /srv/scratch/z5039045/PacBio/Falcon/get_unmapped_reads/all_ctgs.sam -ctg all_contigs_except_AD1_3_32.txt -option 0 -out AD1_subreads_subset.fasta

# re-assemble with Canu
canu usegrid=false -p AD1_canu -d AD1_canu genomeSize=5.1m -pacbio-raw AD1_subreads_subset.fasta

# run quiver
module load python/2.7.9
module load smrt-analysis/2.3.0
module load samtools/1.2
cd /srv/scratch/z5039045/PacBio/2018-07-04_get_AD1_subreads
samtools faidx AD1_canu.contigs.circularized.fasta
pbalign --forQuiver --nproc 16 --pulseFile h5.fofn subreads.fofn AD1_canu.contigs.circularized.fasta AD1_canu.contigs.circularized.cmp.h5
quiver AD1_canu.contigs.circularized.cmp.h5 -p P6-C4 -r AD1_canu.contigs.circularized.fasta -o AD1_canu.contigs.circularized.quiver1.gff -o AD1_canu.contigs.circularized.quiver1.fasta -o AD1_canu.contigs.circularized.quiver1.fastq


############################## 2018-07-06_get_AD91A_subreads #############################

# get AD91A subreads
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/2018-07-06_get_AD91A_subreads
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam /srv/scratch/z5039045/PacBio/Falcon/get_unmapped_reads/all_ctgs.sam -ctg all_contigs_except_AD91A_7_43_44.txt -option 0 -out AD91A_subreads_subset.fasta


############################## get genome length #############################


cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/AD1_canu
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl AD1_canu.contigs.circularized.quiver1.recircularized.quiver1.fasta
# AD1_c	5461560	32.1%	0


cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/AD91A_canu
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl AD91A_canu.fasta
# AD91A_c	3662296	57.1%	0
# AD91A_p	743267	56.7%	0


# check end overlap
cd /Users/songweizhi/Desktop/test_recircularize
blastn -query hcq43.fasta -subject hcq7.fasta -outfmt 6 -out blast_results_hcq43_hcq7.txt
blastn -query hcq44.fasta -subject hcq7.fasta -outfmt 6 -out blast_results_hcq44_hcq7.txt


cd /Users/songweizhi/Desktop
blastn -query AD91A_canu.fasta -subject combined_10ref.fasta -outfmt 6 -out blast_results_AD91A_vs_refs.txt




