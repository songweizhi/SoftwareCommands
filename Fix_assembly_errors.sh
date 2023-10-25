# Fix_assembly_errors
python3 /home/z5039045/fix_assembly_errors/bin/ra2.py 
python3 /home/z5039045/fix_assembly_errors/bin/mapped.py
python3 /home/z5039045/fix_assembly_errors/bin/re_assemble_errors.py
python3 /srv/scratch/z5039045/Softwares/fix_assembly_errors/bin/ra2.py -h

# copy raw reads to BBAY89 working directory
cp /home/z5039045/torsten/Alexandra_Roth/Microbial_Metagenomes/BBAY65/Original-seqs/BB65-PE-IL78-01_ATTCCT_L007_R1_filtered.fastq.gz /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY65
cp /home/z5039045/torsten/Alexandra_Roth/Microbial_Metagenomes/BBAY89/Original-seqs/BB89-PE-IL57-01_CCTTAG_L004_R1_filtered.fastq.gz /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY89
cp /home/z5039045/torsten/Alexandra_Roth/Microbial_Metagenomes/BBAY89/Original-seqs/BB89-PE-IL57-01_CCTTAG_L004_R2_filtered.fastq.gz /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY89
cp BBAY77/quality_trimmer/Kerensa_qual/Q30/split/BBAY77_BothP_qualControl_Kerensa_Q30-1.fastq /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/raw_reads &
cp BBAY77/quality_trimmer/Kerensa_qual/Q30/split/BBAY77_BothP_qualControl_Kerensa_Q30-2.fastq /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/raw_reads &
cp BBAY78/quality_trimmer/Kerensa_qual/Q30/split/BBAY78_BothP_qualControl_Kerensa_Q30-1.fastq /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/raw_reads &
cp BBAY78/quality_trimmer/Kerensa_qual/Q30/split/BBAY78_BothP_qualControl_Kerensa_Q30-2.fastq /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/raw_reads &
cp BBAY79/quality_trimmer/Kerensa_qual/Q30/split/BBAY79_BothP_qualControl_Kerensa_Q30-1.fastq /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/raw_reads &
cp BBAY79/quality_trimmer/Kerensa_qual/Q30/split/BBAY79_BothP_qualControl_Kerensa_Q30-2.fastq /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/raw_reads &

# remove unpaired reads
qsub_remove_unpaired_reads_77.sh
qsub_remove_unpaired_reads_78.sh
qsub_remove_unpaired_reads_79.sh

# combine 6 paired fastq file into 3 fasta file
module load idba/1.1.1_512
fq2fa --merge --filter BBAY77_BothP_qualControl_Kerensa_Q30-1_only_paired.fastq BBAY77_BothP_qualControl_Kerensa_Q30-2_only_paired.fastq BBAY77.fasta & 
fq2fa --merge --filter BBAY78_BothP_qualControl_Kerensa_Q30-1_only_paired.fastq BBAY78_BothP_qualControl_Kerensa_Q30-2_only_paired.fastq BBAY78.fasta &
fq2fa --merge --filter BBAY79_BothP_qualControl_Kerensa_Q30-1_only_paired.fastq BBAY79_BothP_qualControl_Kerensa_Q30-2_only_paired.fastq BBAY79.fasta &

# combine 3 fasta files
cat BBAY77.fasta BBAY78.fasta BBAY79.fasta > BBAY77_78_79.fasta

# assembly
qsub_idba_ud_BBAY77_78_79.sh
idba_ud --pre_correction --num_threads 12  --mink 70 --maxk 90 --step 10 -r /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/raw_reads/BBAY77_78_79.fasta -o /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/BBAY77_78_79_assembly_k70_80_90


# load modules for fix_assembly_errors
module load python/3.4.3
module load shrinksam/0.9.0
module load velvet/1.2.10
module load bowtie/2.2.9 


# run ra2.py
python3 /home/z5039045/fix_assembly_errors/bin/ra2.py -i /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY89/BBAY89_scaffold_10.fa -1 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY89/BB89-PE-IL57-01_CCTTAG_L004_R1_filtered.fastq.gz -2 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY89/BB89-PE-IL57-01_CCTTAG_L004_R2_filtered.fastq.gz
python3 /home/z5039045/fix_assembly_errors/bin/ra2.py -i /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BBAY77_scaffold_lt2000_1_10MB_break.fasta -1 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R1_filtered_d1_common.fastq -2 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R2_filtered_d1_common.fastq -t 12 --mapping --break


# clean up ra2.py output
python3 /home/z5039045/fix_assembly_errors/bin/fix_fasta.py
python3 /home/z5039045/fix_assembly_errors/bin/nr_fasta.py
/srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/BBAY77_78_79_scaffold_lt5000_1_1.curated/re_assembled.fa
python3 /home/z5039045/fix_assembly_errors/bin/fix_fasta.py /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/BBAY77_78_79_scaffold_lt5000_1_1.curated/re_assembled.fa | python3 /home/z5039045/fix_assembly_errors/bin/nr_fasta.py rename - > /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77_78_79/BBAY77_78_79_scaffold_lt5000_1_1.curated/BBAY77_78_79_scaffold_lt5000_1_1.curated.fa


cd /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY89
python3 /home/z5039045/fix_assembly_errors/bin/fix_fasta.py ./BBAY89_scaffold_10.curated/re_assembled.fa | python3 /home/z5039045/fix_assembly_errors/bin/nr_fasta.py rename - > BBAY89_scaffold_10.curated.fa

cd /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77
python3 /home/z5039045/fix_assembly_errors/bin/fix_fasta.py ./BBAY77_scaffold_lt2000_1_20MB.curated/re_assembled.fa | python3 /home/z5039045/fix_assembly_errors/bin/nr_fasta.py rename - > BBAY77_scaffold_lt2000_1_20MB.curated.fa


###
python3 /home/z5039045/fix_assembly_errors/bin/mapped.py -s mapping.sam -m 1 -p both -o <ﬁltered_mapping.mm1- both.sam>


# ﬁlter mapping with same criteria used by ra2.py————————————————————————————————————————！！！！！
mapped.py -s <mapping.sam> -m 1 -p both -o <ﬁltered_mapping.mm1- both.sam>
python3 /home/z5039045/fix_assembly_errors/bin/mapped.py -s <> -m 1 -p both -o <>


###### validation ######
cd /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/validation

# 1. index
module load bowtie/2.2.9
bowtie2-build -f BBAY77_scaffold_lt2000_1_20MB.fasta BBAY77_scaffold_lt2000_1_20MB &
bowtie2-build -f BBAY77_scaffold_lt2000_1_20MB.curated.fa BBAY77_scaffold_lt2000_1_20MB.curated &

# 2. align
bowtie2 --very-fast --reorder --quiet -a -p 6 -x BBAY77_scaffold_lt2000_1_20MB -1 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R1_filtered_d1_common.fastq -2 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R2_filtered_d1_common.fastq -S BBAY77_scaffold_lt2000_1_20MB.sam &
bowtie2 --very-fast --reorder --quiet -a -p 6 -x BBAY77_scaffold_lt2000_1_20MB.curated -1 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R1_filtered_d1_common.fastq -2 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R2_filtered_d1_common.fastq -S BBAY77_scaffold_lt2000_1_20MB.curated.sam &
bowtie2 --very-fast --reorder --quiet -a -p 6 -x BBAY77_scaffold_lt2000_1_20MB.curated -1 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R1_filtered_d1_common.fastq -2 /srv/scratch/z5039045/fix_assembly_errors_wd/BBAY77/BB77-PE-IL50-01_CCCATG_L002_R2_filtered_d1_common.fastq -S BBAY77_scaffold_lt2000_1_20MB.curated.sam &




# 3. sam2bam
module load samtools/1.2
samtools view -bS BBAY77_scaffold_lt2000_1_20MB.sam -o BBAY77_scaffold_lt2000_1_20MB.bam &
samtools view -bS BBAY77_scaffold_lt2000_1_20MB.curated.sam -o BBAY77_scaffold_lt2000_1_20MB.curated.bam &

# 4. sort bam file
samtools sort BBAY77_scaffold_lt2000_1_20MB.bam BBAY77_scaffold_lt2000_1_20MB_sorted &
samtools sort BBAY77_scaffold_lt2000_1_20MB.curated.bam BBAY77_scaffold_lt2000_1_20MB.curated_sorted &

# 5. get bai file
samtools index BBAY77_scaffold_lt2000_1_20MB_sorted.bam &
samtools index BBAY77_scaffold_lt2000_1_20MB.curated_sorted.bam &
