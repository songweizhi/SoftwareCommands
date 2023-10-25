
# test canu
module load perl/5.20.1
module load java/8u91
module load canu/1.6
canu -pacbio-raw reads_not_mapped_to_2.10_ctgs.fasta
canu -pacbio-raw reads_not_mapped_to_2.10_ctgs.fasta -p BS107 genomeSize=4.2m
canu -assemble -pacbio-corrected reads_not_mapped_to_2.10_ctgs.fasta -p BS107 genomeSize=4.2m -d BS107-pacbio


######################################### run SAMPhaser (210WT) #########################################

module unload smrtlink/5.0.1
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-05_SAMPhaser
blasr input.fofn 2.10_ref.fasta -sam -bestn 1 -nproc 16 -out 2.10_ref.sam -unaligned 2.10_ref_unaligned_reads.fasta
blasr input.fofn BS107_ref.fasta -sam -bestn 1 -nproc 16 -out BS107_ref.sam -unaligned BS107_ref_unaligned_reads.fasta

module load samtools/1.2
samtools view -bS 2.10_ref.sam -o 2.10_ref.bam
samtools sort 2.10_ref.bam 2.10_ref_sorted
samtools index 2.10_ref_sorted.bam

samtools view -bS BS107_ref.sam -o BS107_ref.bam
samtools sort BS107_ref.bam BS107_ref_sorted
samtools index BS107_ref_sorted.bam

samtools mpileup -BQ0 -d10000000 -f 2.10_ref.fasta 2.10_ref_sorted.bam > 2.10_ref.pileup
samtools mpileup -BQ0 -d10000000 -f BS107_ref.fasta BS107_ref_sorted.bam > BS107_ref.pileup

module load R/3.4.2
cd /srv/scratch/z5039045/PacBio/2018-03-05_SAMPhaser
python /home/z3452659/slimsuite/dev/samphaser.py seqin=2.10_ref.fasta pileup=2.10_ref.pileup basefile=2.10 dev
cd /srv/scratch/z5039045/PacBio/2018-03-05_SAMPhaser
python /home/z3452659/slimsuite/dev/samphaser.py seqin=BS107_ref.fasta pileup=BS107_ref.pileup basefile=BS107 dev


######################################### run SAMPhaser (DSM17395) #########################################
 
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-13_SAMPhaser_DSM17395
blasr input.fofn DSM17395_ref.fasta -sam -nproc 16 -out DSM17395_ref.sam -unaligned DSM17395_ref_unaligned_reads.fasta -placeRepeatsRandomly

module load samtools/1.2
samtools view -bS DSM17395_ref.sam -o DSM17395_ref.bam
samtools sort DSM17395_ref.bam DSM17395_ref_sorted
samtools index DSM17395_ref_sorted.bam
samtools mpileup -BQ0 -d10000000 -f DSM17395_ref.fasta DSM17395_ref_sorted.bam > DSM17395_ref.pileup

# run samphaser
module load R/3.4.2
python /home/z3452659/slimsuite/dev/samphaser.py seqin=DSM17395_ref.fasta pileup=DSM17395_ref.pileup basefile=DSM17395 dev


######################################### run SAMPhaser (210WT and DSM17395) #########################################
 
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-5_SAMPhaser_together
blasr input.fofn 210_DSM17395_combined_ref.fasta -sam -nproc 16 -out 210_DSM17395_combined_ref.sam -unaligned 210_DSM17395_combined_ref_unaligned_reads.fasta -placeRepeatsRandomly

module load samtools/1.2
samtools view -bS 210_DSM17395_combined_ref.sam -o 210_DSM17395_combined_ref.bam
samtools sort 210_DSM17395_combined_ref.bam 210_DSM17395_combined_ref_sorted
samtools index 210_DSM17395_combined_ref_sorted.bam
samtools mpileup -BQ0 -d10000000 -f 210_DSM17395_combined_ref.fasta 210_DSM17395_combined_ref_sorted.bam > 210_DSM17395_combined_ref.pileup

# run samphaser
module load R/3.4.2
cd /srv/scratch/z5039045/PacBio/2018-03-5_SAMPhaser_together
python /home/z3452659/slimsuite/dev/samphaser.py seqin=210_DSM17395_combined_ref.fasta pileup=210_DSM17395_combined_ref.pileup basefile=210_DSM17395_combined dev

# assess purity
cd /srv/scratch/z5039045/PacBio/2018-03-15_SAMPhaser_together
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref 210_DSM17395_combined.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75

# map subreads back to samphaser produced 210_DSM17395_combined.haplotigs.fas
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-15_separate_subreads
blasr input.fofn 210_DSM17395_combined.haplotigs.fas -sam -nproc 16 -out 210_DSM17395_combined.haplotigs.sam -unaligned 210_DSM17395_combined.haplotigs_unaligned_reads.fasta -placeRepeatsRandomly

# extract subreads from sam file 
module load python/3.5.2
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam 210_DSM17395_combined.haplotigs.sam -ctg 210_ctgs.txt -option 1 -out 210_subreads.fasta
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam 210_DSM17395_combined.haplotigs.sam -ctg BS107_ctgs.txt -option 1 -out BS107_subreads.fasta
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam 210_DSM17395_combined.haplotigs.sam -ctg 210_and_BS107_ctgs.txt -option 1 -out 210_and_BS107_subreads.fasta


######################################### run SAMPhaser (210WT and DSM17395 with overlap) #########################################
 
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-16_SAMPhaser_together_with_overlap
blasr input.fofn 210_DSM17395_combined_ref_with_overlap.fasta -sam -nproc 16 -out 210_DSM17395_combined_ref_with_overlap.sam -unaligned 210_DSM17395_combined_ref_with_overlap_unaligned_reads.fasta -placeRepeatsRandomly

cd /srv/scratch/z5039045/PacBio/2018-03-16_SAMPhaser_together_with_overlap
samtools view -bS 210_DSM17395_combined_ref_with_overlap.sam -o 210_DSM17395_combined_ref_with_overlap.bam
samtools sort 210_DSM17395_combined_ref_with_overlap.bam 210_DSM17395_combined_ref_with_overlap_sorted
samtools index 210_DSM17395_combined_ref_with_overlap_sorted.bam
samtools mpileup -BQ0 -d10000000 -f 210_DSM17395_combined_ref_with_overlap.fasta 210_DSM17395_combined_ref_with_overlap_sorted.bam > 210_DSM17395_combined_ref_with_overlap.pileup

# run samphaser
module load R/3.4.2
cd /srv/scratch/z5039045/PacBio/2018-03-16_SAMPhaser_together_with_overlap
python /home/z3452659/slimsuite/dev/samphaser.py seqin=210_DSM17395_combined_ref_with_overlap.fasta pileup=210_DSM17395_combined_ref_with_overlap.pileup basefile=210_DSM17395_combined_with_overlap dev

# assess purity
module load python/3.5.2
module load bbmap/35.82
cd /srv/scratch/z5039045/PacBio/2018-03-16_SAMPhaser_together_with_overlap
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref 210_DSM17395_combined_with_overlap.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75

# map subreads back to samphaser produced 210_DSM17395_combined.haplotigs.fas
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-16_SAMPhaser_together_with_overlap
blasr input.fofn 210_DSM17395_combined_with_overlap.haplotigs.fas -sam -nproc 16 -out 210_DSM17395_combined_with_overlap.haplotigs.sam -unaligned 210_DSM17395_combined_with_overlap.haplotigs_unaligned_reads.fasta -placeRepeatsRandomly

# extract subreads from sam file 
module load python/3.5.2
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam 210_DSM17395_combined_with_overlap.haplotigs.sam -ctg 210_ctgs.txt -option 1 -out 210_subreads.fasta
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam 210_DSM17395_combined_with_overlap.haplotigs.sam -ctg BS107_ctgs.txt -option 1 -out BS107_subreads.fasta

# run canu

###################### run Quiver (210WT and DSM17395 with overlap) ######################

module load python/2.7.9
module load smrt-analysis/2.3.0
module load samtools/1.2

# for 210
cd /srv/scratch/z5039045/PacBio/2018-03-16_quiver_with_overlap/210
samtools faidx 210_canu.contigs.fasta
pbalign --forQuiver --nproc 12 --pulseFile h5.fofn 210_subreads.fasta 210_canu.contigs.fasta 210_canu.contigs.cmp.h5
pbalign --forQuiver --nproc 12 --pulseFile h5.fofn subreads.fofn 210_canu.contigs.fasta 210_canu.contigs.cmp.h5

pbalign --forQuiver --nproc 16 --pulseFile <H5_FILES> <SUBREAD_FASTA> <ASSEMBLY_FASTA> <OUTPUT_H5>





modules=python/2.7.10,smrt-analysis/2.3.0,samtools

samtools faidx MBG256.RJE16509.ctidX.blocks.fasta
/share/apps/smrt-analysis/2.3.0/analysis/bin/pbalign --forQuiver --nproc 16 --pulseFile ../mbg256.h5.fofn ../../../data/2015-06-25.PacBioSubreads/MBG256.subreads.fasta MBG256.RJE16509.ctidX.blocks.fasta MBG256.RJE16509.ctidX.blocks.cmp.h5
/share/apps/smrt-analysis/2.3.0/analysis/bin/quiver MBG256.RJE16509.ctidX.blocks.cmp.h5 -p P6-C4 -r MBG256.RJE16509.ctidX.blocks.fasta -o MBG256.RJE16509.quiver1.gff -o MBG256.RJE16509.quiver1.fasta -o MBG256.RJE16509.quiver1.fastq
 
samtools faidx <ASSEMBLY_FASTA>
/share/apps/smrt-analysis/2.3.0/analysis/bin/pbalign --forQuiver --nproc 16 --pulseFile <H5_FILES> <SUBREAD_FASTA> <ASSEMBLY_FASTA> <OUTPUT_H5>
/share/apps/smrt-analysis/2.3.0/analysis/bin/quiver <OUTPUT_H5> -p P6-C4 -r <ASSEMBLY> -o <GFF_OUT> -o <FASTA_OUT> -o <FASTQ_OUT>
 

# for BS107
cd /srv/scratch/z5039045/PacBio/2018-03-16_quiver_with_overlap/BS107




## test start ##
module load smrt-analysis/2.3.0u
pbalign 210_subreads.fasta 210_canu.contigs.fasta 210_canu_contigs.sam


### test end ###





samtools faidx MBG256.RJE16509.ctidX.blocks.fasta
/share/apps/smrt-analysis/2.3.0/analysis/bin/pbalign --forQuiver --nproc 16 --pulseFile ../mbg256.h5.fofn ../../../data/2015-06-25.PacBioSubreads/MBG256.subreads.fasta MBG256.RJE16509.ctidX.blocks.fasta MBG256.RJE16509.ctidX.blocks.cmp.h5
/share/apps/smrt-analysis/2.3.0/analysis/bin/quiver MBG256.RJE16509.ctidX.blocks.cmp.h5 -p P6-C4 -r MBG256.RJE16509.ctidX.blocks.fasta -o MBG256.RJE16509.quiver1.gff -o MBG256.RJE16509.quiver1.fasta -o MBG256.RJE16509.quiver1.fastq
 
samtools faidx <ASSEMBLY_FASTA>
/share/apps/smrt-analysis/2.3.0/analysis/bin/pbalign --forQuiver --nproc 16 --pulseFile <H5_FILES> <SUBREAD_FASTA> <ASSEMBLY_FASTA> <OUTPUT_H5>
/share/apps/smrt-analysis/2.3.0/analysis/bin/quiver <OUTPUT_H5> -p P6-C4 -r <ASSEMBLY> -o <GFF_OUT> -o <FASTA_OUT> -o <FASTQ_OUT>








##########################################################################################


























# run quiver (210)
module load smrt-analysis/2.3.0u

# index assemblies:
cd /srv/scratch/z5039045/PacBio/2018-03-16_quiver_with_overlap/210
mkdir temp
samtools faidx 210_canu.contigs.fasta
pbalign --forQuiver --nproc 6 --tmpDir temp --pulseFile h5.fofn 210_subreads.fasta 210_canu.contigs.fasta 210_canu_contigs.cmp.h5
quiver 210_canu_contigs.cmp.h5 -p P6-C4 -j 8 -r 210_canu.contigs.fasta -o 210_canu.contigs.variants.gff -o 210_canu.contigs.consensus.fasta -o 210_canu.contigs.consensus.fastq


# run quiver (BS107)
module load smrt-analysis/2.3.0u
# index assemblies:
cd /srv/scratch/z5039045/PacBio/2018-03-16_quiver_with_overlap/BS107
mkdir temp
samtools faidx BS107_canu.contigs.fasta
pbalign --forQuiver --nproc 16 --tmpDir temp --pulseFile h5.fofn BS107_subreads.fasta BS107_canu.contigs.fasta BS107_canu_contigs.cmp.h5
quiver BS107_canu_contigs.cmp.h5 -p P6-C4 -j 8 -r BS107_canu.contigs.fasta -o BS107_canu.contigs.variants.gff -o BS107_canu.contigs.consensus.fasta -o BS107_canu.contigs.consensus.fastq
module load smrtlink/5.0.1
samtools view -bS BS107_canu.contigs.sam -o BS107_canu.contigs.bam
samtools sort BS107_canu.contigs.bam BS107_canu.contigs_sorted
samtools index BS107_canu.contigs_sorted.bam
quiver -p P6-C4 -j 8 -r BS107_canu.contigs.fasta -o BS107_canu.contigs.fa,BS107_canu.contigs.fastq,BS107_canu.contigs.gff BS107_canu.contigs_sorted.bam
quiver -j 8 -r BS107_canu.contigs.fasta -o BS107_canu.contigs.fa,BS107_canu.contigs.fastq,BS107_canu.contigs.gff BS107_canu.contigs_sorted.bam
quiver -r BS107_canu.contigs.fasta -o BS107_canu.contigs.fa,BS107_canu.contigs.fastq,BS107_canu.contigs.gff BS107_canu.contigs_sorted.bam


######################################### assess purity #########################################

module load python/3.5.2
module load bbmap/35.82

cd /srv/scratch/z5039045/PacBio/2018-03-05_SAMPhaser/2.10_samphaser
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref 2.10.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75
cd /srv/scratch/z5039045/PacBio/2018-03-05_SAMPhaser/BS107_samphaser
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref BS107.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75

cd /srv/scratch/z5039045/PacBio/2018-03-06_SAMPhaser_purity
cp /srv/scratch/z3452659/ThomasPacBio-Nov15/analysis/2018-03-05.2GenomeSAMPhaser/210WT.2genomes.samphaser.haplotigs.fas .
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref 210WT.2genomes.samphaser.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75

cd /srv/scratch/z3452659/ThomasPacBio-Nov15/analysis/2018-03-05.2GenomeSAMPhaser
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref 210WT.2genomes.samphaser.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75

cd /srv/scratch/z5039045/PacBio/2018-03-13_SAMPhaser_DSM17395
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref DSM17395.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75

cd /srv/scratch/z5039045/PacBio/2018-03-06_SAMPhaser_rich
python3 /srv/scratch/z5039045/Scripts/get_purity.py -ref 210WT.2genomes.samphaser.haplotigs.fas -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75


#########################################  #########################################

# 2018-03-07_separate_210_BS107_subreads
mkdir 2018-03-07_separate_210_BS107_subreads
cd /srv/scratch/z5039045/PacBio/2018-03-07_separate_210_BS107_subreads
module load smrtlink/3.1.1
blasr input.fofn SAMPhaser_haplotigs_manually_corrected.fasta -sam -bestn 1 -nproc 16 -out SAMPhaser_haplotigs_manually_corrected.sam -unaligned SAMPhaser_haplotigs_manually_corrected_unaligned_reads.fasta &

# extract subreads from sam file 
module load python/3.5.2
# get 210 reads (except p2)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected.sam -ctg 210_ctgs.txt -option 1 -out SAMPhaser_haplotigs_210_subreads.fasta
# get BS107 reads (except p2)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected.sam -ctg 210_p2_ctgs.txt -option 0 -out SAMPhaser_haplotigs_BS107_subreads.fasta
# get p2 reads (for diploid assembly)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected.sam -ctg p2_ctgs.txt -option 1 -out SAMPhaser_haplotigs_p2_subreads.fasta

# run canu
module load perl/5.20.1
module load java/8u151
module load canu/1.7
cd /srv/scratch/z5039045/PacBio/2018-03-07_canu/210
canu -pacbio-raw SAMPhaser_haplotigs_210_subreads.fasta -p 210 genomeSize=4.2m -d 210_default2
canu -pacbio-corrected SAMPhaser_haplotigs_210_subreads.fasta -p 210 genomeSize=4.2m -d 210_default
canu -pacbio-raw SAMPhaser_haplotigs_210_subreads.fasta -p 210 genomeSize=4.2m -d 210_default5 java=/share/apps/java/8u151/bin/java gridOptions="-V -S /bin/bash"
canu -pacbio-raw reads_not_mapped_to_2.10_ctgs.fasta
canu -pacbio-raw reads_not_mapped_to_2.10_ctgs.fasta -p BS107 genomeSize=4.2m
canu -assemble -pacbio-corrected reads_not_mapped_to_2.10_ctgs.fasta -p BS107 genomeSize=4.2m -d BS107-pacbio


canu usegrid=false -p 210 -d 210_default genomeSize=4.2m -pacbio-raw SAMPhaser_haplotigs_210_subreads.fasta
canu usegrid=false -p BS107 -d BS107_default genomeSize=4.2m -pacbio-raw SAMPhaser_haplotigs_BS107_subreads.fasta


# check quality with Tablet
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-08_canu_contigs
blasr /srv/scratch/z5039045/PacBio/2018-03-07_canu/210/SAMPhaser_haplotigs_210_subreads.fasta 210_canu.contigs.fasta -sam -bestn 1 -nproc 12 -out 210_canu.contigs.sam -unaligned 210_canu.contigs_unaligned_reads.fasta


module load samtools/1.2
samtools view -bS 210_canu.contigs.sam -o 210_canu.contigs.bam
samtools sort 210_canu.contigs.bam 210_canu.contigs_sorted
samtools index 210_canu.contigs_sorted.bam



# 2018-03-09_separate_210_BS107_subreads (no bestn)(not good)
cd /srv/scratch/z5039045/PacBio
mkdir 2018-03-09_separate_210_BS107_subreads_no_bestn
cp 2018-03-07_separate_210_BS107_subreads/input.fofn 2018-03-09_separate_210_BS107_subreads_no_bestn/
cp 2018-03-07_separate_210_BS107_subreads/SAMPhaser_haplotigs_manually_corrected.fasta 2018-03-09_separate_210_BS107_subreads_no_bestn/

cd 2018-03-09_separate_210_BS107_subreads_no_bestn
blasr input.fofn SAMPhaser_haplotigs_manually_corrected.fasta -sam -nproc 12 -out SAMPhaser_haplotigs_manually_corrected_no_bestn.sam -unaligned SAMPhaser_haplotigs_manually_corrected_no_bestn_unaligned_reads.fasta

# Rich's blasr command
/share/apps/smrt-analysis/2.3.0/analysis/bin/blasr ../../data/2017-06-19.2GenomeData/reads_not_mapped_to_the_8.fasta ../../data/2017-06-19.2GenomeData/210WT.fasta -sam -out 210WT.2genomes.sam -nproc 16 -placeRepeatsRandomly

# extract subreads from sam file (no bestn)(not good)
module load python/3.5.2
# get 210 reads (except p2)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected_no_bestn.sam -ctg 210_ctgs.txt -option 1 -out SAMPhaser_haplotigs_210_subreads_no_bestn.fasta
# get BS107 reads (except p2)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected_no_bestn.sam -ctg 210_p2_ctgs.txt -option 0 -out SAMPhaser_haplotigs_BS107_subreads_no_bestn.fasta
# get p2 reads (for diploid assembly)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected_no_bestn.sam -ctg p2_ctgs.txt -option 1 -out SAMPhaser_haplotigs_p2_subreads_no_bestn.fasta


# extract subreads from sam file (placeRepeatsRandomly)
module load python/3.5.2
# get 210 reads (except p2)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected_placeRepeatsRandomly.sam -ctg 210_ctgs.txt -option 1 -out SAMPhaser_haplotigs_210_subreads_placeRepeatsRandomly.fasta
# get BS107 reads (except p2)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected_placeRepeatsRandomly.sam -ctg 210_p2_ctgs.txt -option 0 -out SAMPhaser_haplotigs_BS107_subreads_placeRepeatsRandomly.fasta
# get p2 reads (for diploid assembly)
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam SAMPhaser_haplotigs_manually_corrected_placeRepeatsRandomly.sam -ctg p2_ctgs.txt -option 1 -out SAMPhaser_haplotigs_p2_subreads_placeRepeatsRandomly.fasta


# run canu (no bestn)(not good)
# run canu (no placeRepeatsRandomly)






######################################### Prokka GFF parser #########################################

cd /srv/scratch/z5039045/PacBio/2018-03-26_gff

# run Prokka
module load perl/5.20.1
module load infernal/1.1.1
module load blast+/2.2.31
module load hmmer/3.1b2
module load prodigal/2.6.3
module load tbl2asn/25.6
module load parallel/20160222
module load prokka/1.12
prokka --force --cpus 6 --prefix 210 --locustag 210 --strain 210 --outdir 210 210_PacBio.fasta
prokka --force --cpus 6 --prefix BS107 --locustag BS107 --strain BS107 --outdir BS107 BS107_PacBio.fasta





# run Prokka gff parser
module load python/2.7.12
cd /srv/scratch/z5039045/PacBio/2018-03-26_gff/210
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin 210.gff -joinseq -gffcomment -basefile 210

cd /srv/scratch/z5039045/PacBio/2018-03-26_gff/BS107
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin BS107.gff -joinseq -gffcomment -basefile BS107


 
 
Outputs: 
*.comments.txt = parsed GFF comments [txt]
*.features.tdt = parsed GFF features [tdt] – this has join warnings added to it
*.loci.tdt = parsed GFF reference sequence loci [tdt]
*.joined.tdt = table of joined CDS ORF features [tdt]
*.joined.aa.fas = protein sequence of joined CDS ORF features [fas]
*.joined.nt.fas = nucleotide sequence of joined CDS ORF features [fas]
 
Not all of the potential CDS joins will be real but it will give you a list of the ones to look at. Can discuss further later.
 
Best wishes,
 
Rich































# run Falcon (# how to get input bam file)
screen -S Falcon_BS107
cd /srv/scratch/z5039045/PacBio/2018-03-09_canu_placeRepeatsRandomly/BS107_plus_unaligned

# Load modules
module add python/2.7.12-gcc6 
module add falcon/1.8.6
export FALCON_WORKSPACE=$(pwd)

# Running Falcon
fc_run.py fc_run.cfg
# get average coverage for canu BS107 assemblies
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/2018-03-09_canu_placeRepeatsRandomly/BS107/BS107_default
blasr ../SAMPhaser_haplotigs_BS107_subreads_placeRepeatsRandomly.fasta BS107_canu_placeRepeatsRandomly.contigs.fasta -sam -nproc 12 -out BS107_canu_placeRepeatsRandomly.contigs.sam -unaligned BS107_canu_placeRepeatsRandomly.contigs_unaligned_reads.fasta -placeRepeatsRandomly

blasr ../2018-03-09_canu_placeRepeatsRandomly/BS107/SAMPhaser_haplotigs_BS107_subreads_placeRepeatsRandomly.fasta DSM17395_ref.fasta -sam -nproc 12 -out DSM17395_ref.sam -unaligned DSM17395_ref_unaligned_reads.fasta -placeRepeatsRandomly
module load samtools/1.2
samtools view -bS DSM17395_ref.sam -o DSM17395_ref.bam
samtools sort DSM17395_ref.bam DSM17395_ref_sorted
samtools index DSM17395_ref_sorted.bam
module load bedtools/2.26.0
bedtools coverage


















######################################### Falcon #########################################

# run padding_ctgs.py
cd 2-asm-falcon/
cp ../1-preads_ovl/db2falcon/preads4falcon.fasta .
python /srv/scratch/z5039045/Scripts/padding_ctgs.py > p_ctg_pad.fa​


# replace p_ctg.fa​with p_ctg_pad.fa​


# Running Falcon-Unzip
fc_unzip.py fc_unzip.cfg


# Running fc_quiver
fc_quiver.py fc_unzip.cfg


# get fasta stats
# cutoff
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/p_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_12000/2-asm-falcon/p_ctg.fa > 12000_p.txt

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/p_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/a_ctg.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl /srv/scratch/z5039045/PacBio/Falcon/wd_10_genomes_preassembly/0_fc_run_p_5000/2-asm-falcon/p_ctg.fa > 5000_p.txt


perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl cns_h_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T cns_h_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl cns_p_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T cns_p_ctg.fasta


# get read length cutoff corresponding to 30X coverage
module add python/2.7.12-gcc6 
module add falcon/1.8.6
export FALCON_WORKSPACE=$(pwd)
cd /srv/scratch/z5039045/PacBio/Falcon

python /srv/scratch/z5039045/Softwares/SLiMSuite/tools/smrtscape.py optimise=T coverage=T genomesize=8500000 basefile=reads_not_mapped_to_the_8 seqin=reads_not_mapped_to_the_8.fasta

python /srv/scratch/z5039045/Softwares/SLiMSuite/tools/smrtscape.py optimise=T genomesize=8500000 basefile=reads_not_mapped_to_the_8 seqin=reads_not_mapped_to_the_8.fasta


######################################## run BBMAP #######################################

module load bbmap/35.82
bbnorm.sh -h

# To index and map at the same time:
cd /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test
bbmap.sh in=combined_reads.fasta out=test7_p_ctg_bbmap_best.sam ref=test7_p_ctg.fasta ambiguous=best
bbmap.sh in=combined_reads.fasta out=test7_p_ctg_bbmap_toss.sam ref=test7_p_ctg.fasta ambiguous=toss
bbmap.sh in=combined_reads.fasta out=test7_h_ctg_bbmap_best.sam ref=test7_h_ctg.fasta ambiguous=best
bbmap.sh in=combined_reads.fasta out=test7_h_ctg_bbmap_toss.sam ref=test7_h_ctg.fasta ambiguous=toss

# calculate purity
module load python/3.5.2
module load bbmap/35.82
cd /srv/scratch/z5039045/PacBio/Falcon/wd_2_genomes_test25/4-quiver/cns_output
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref cns_p_ctg.fasta -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75
python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref cns_h_ctg.fasta -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75


######################################## run BLASR #######################################

module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/Falcon
blasr /srv/scratch/z5039045/PacBio/Falcon/input.fofn CC6-YY-74.fasta -bestn 1 -sam -nproc 12 -out CC6-YY-74.sam



#################################### Calculate purity ####################################

# simulate short reads from the two reference genomes
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/ref
python3 /srv/scratch/z5039045/PacBio/Falcon/Test_10.py -r 2.10.fasta -n 500000 -l 250 -c 1 -o 2.10_reads.fasta
python3 /srv/scratch/z5039045/PacBio/Falcon/Test_10.py -r BS107.fasta -n 500000 -l 250 -c 0 -o BS107_reads.fasta

# get summary of simulated short reads
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T 2.10_reads.fasta
Number of Contigs=500000, Total bp=125000000, Shortest=250, Longest=250, Average length=250.0, Average GC%=59.8%, Non-ACGT bases=0
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T BS107_reads.fasta
Number of Contigs=499849, Total bp=124903128, Shortest=50, Longest=250, Average length=249.9, Average GC%=59.8%, Non-ACGT bases=0

# mapping short reads to p_ctgs and h_ctgs
module load bowtie/2.2.9
module load samtools/1.3.1

cd /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test

# index reference
bowtie2-build -f test7_p_ctg.fasta test7_p_ctg
bowtie2-build -f test7_h_ctg.fasta test7_h_ctg

# mapping with bowtie2
bowtie2 -x test7_p_ctg combined_reads.fasta -S test7_p_ctg.sam -p 6 -f
bowtie2 -x test7_h_ctg combined_reads.fasta -S test7_h_ctg.sam -p 6 -f

# convert sam files to bam files with samtools
samtools view -bS test7_p_ctg.sam -o test7_p_ctg.bam
samtools view -bS test7_h_ctg.sam -o test7_h_ctg.bam

# sort bam files with samtools
samtools sort test7_p_ctg.bam -o test7_p_ctg_sorted.bam
samtools sort test7_h_ctg.bam -o test7_h_ctg_sorted.bam

# index sorted bam files with samtools
samtools index test7_p_ctg_sorted.bam
samtools index test7_h_ctg_sorted.bam

# parse sam file


########################################## Test ##########################################

# test1
input_type = raw
length_cutoff = 20000
length_cutoff_pr = 7000 


cd /srv/scratch/z5039045/PacBio/Falcon
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test25/4-quiver/cns_output/cns_p_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test25/4-quiver/cns_output/cns_h_ctg.fasta


perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test2_padded/4-quiver/cns_output/cns_p_ctg.fasta
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T wd_2_genomes_test2_padded/4-quiver/cns_output/cns_h_ctg.fasta



module load samtools/1.2

samtools view -bS 210_canu.contigs.circularized.trimmed.sam 210_canu.contigs.circularized.trimmed.bam
samtools view -bS 210_canu.contigs.circularized.trimmed.quiver1.sam 210_canu.contigs.circularized.trimmed.quiver1.bam
samtools view -bS BS107_canu.contigs.circularized.trimmed.sam BS107_canu.contigs.circularized.trimmed.bam
samtools view -bS BS107_canu.contigs.circularized.trimmed.quiver1.sam BS107_canu.contigs.circularized.trimmed.quiver1.bam

samtools sort 210_canu.contigs.circularized.trimmed.bam 210_canu.contigs.circularized.trimmed_sorted
samtools sort 210_canu.contigs.circularized.trimmed.quiver1.bam 210_canu.contigs.circularized.trimmed.quiver1_sorted
samtools sort BS107_canu.contigs.circularized.trimmed.bam BS107_canu.contigs.circularized.trimmed_sorted
samtools sort BS107_canu.contigs.circularized.trimmed.quiver1.bam BS107_canu.contigs.circularized.trimmed.quiver1_sorted

samtools index 210_canu.contigs.circularized.trimmed_sorted
samtools index 210_canu.contigs.circularized.trimmed.quiver1_sorted
samtools index BS107_canu.contigs.circularized.trimmed_sorted
samtools index BS107_canu.contigs.circularized.trimmed.quiver1_sorted



samtools view -bS 210_DSM17395_combined_ref.sam -o 210_DSM17395_combined_ref.bam
samtools sort 210_DSM17395_combined_ref.bam 210_DSM17395_combined_ref_sorted
samtools index 210_DSM17395_combined_ref_sorted.bam
samtools mpileup -BQ0 -d10000000 -f 210_DSM17395_combined_ref.fasta 210_DSM17395_combined_ref_sorted.bam > 210_DSM17395_combined_ref.pileup


blastn -query 210_canu.contigs.circularized.trimmed.quiver1.fasta -subject 2.10_reference.fasta -outfmt 6 -out blast_results_210.txt
blastn -query BS107_canu.contigs.circularized.trimmed.quiver1.fasta -subject DSM17395_reference.fasta -outfmt 6 -out blast_results_BS107.txt


python3 /srv/scratch/z5039045/Scripts/plot_falcon_assemblies_purity.py -ref combined_quiver2.fasta -reads /srv/scratch/z5039045/PacBio/Falcon/reference_2_genomes/test/combined_reads.fasta -c 75


########################################## for manuscript ##########################################

# Table 6: Summary of the subreads subset 
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/2018-03-05_SAMPhaser/reads_not_mapped_to_the_8.fasta 
# Number of Contigs=140425, Total bp=1251087365, Shortest=41, Longest=46594, Average length=8909.3, Average GC%=57.6%, Non-ACGT bases=0

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/2018-03-16_canu_with_overlap/210_subreads.fasta 
# Number of Contigs=59314, Total bp=567636185, Shortest=44, Longest=46594, Average length=9570.0, Average GC%=58.1%, Non-ACGT bases=0

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/2018-03-16_canu_with_overlap/BS107_subreads.fasta 
# Number of Contigs=54558, Total bp=513443192, Shortest=45, Longest=43211, Average length=9411.0, Average GC%=58.1%, Non-ACGT bases=0

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/PacBio_genomes_final/210.fasta
# Number of Contigs=4, Total bp=4160913, Shortest=70383, Longest=3758267, Average length=1040228.2, Average GC%=59.8%, Non-ACGT bases=0

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T /srv/scratch/z5039045/PacBio/PacBio_genomes_final/BS107.fasta
# Number of Contigs=4, Total bp=4188145, Shortest=65245, Longest=3782865, Average length=1047036.2, Average GC%=59.8%, Non-ACGT bases=0



# final purity
cd /srv/scratch/z5039045/PacBio/2018-05-01_final_purity
module load python/3.5.2
module load bbmap/35.82 
python3 /srv/scratch/z5039045/Softwares/get_purity.py -r ref_genome_IMG -x fasta -q combined_PacBio_genomes_210_BS107.fasta -n 1000000 
python3 /srv/scratch/z5039045/Softwares/get_purity.py -r ref_genome_IMG -x fasta -q 210_DSM17395_combined_with_overlap.haplotigs.fas -n 1000000 -p 80 -keep_temp -circle


cd /srv/scratch/z5039045/PacBio/test
python3 /srv/scratch/z5039045/Softwares/get_purity.py -r ref_genome_IMG -x fasta -q 210WT.2genomes.samphaser.haplotigs.fas -n 1000000 -p 80 &
python3 /srv/scratch/z5039045/Softwares/get_purity.py -r ref_genome_IMG -x fasta -q 210_DSM17395_combined_with_overlap.haplotigs.fas -n 1000000 -p 80 &



SON1053.SP16554.hcq.qv20.fas
/srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-12-03.PacBioAssemblies/SON1053.SP16554.defaultsettings/SON1053.SP16554.hcq.qv20.fas

# run Prokka
module load perl/5.20.1
module load infernal/1.1.1
module load blast+/2.2.31
module load hmmer/3.1b2
module load prodigal/2.6.3
module load tbl2asn/25.6
module load parallel/20160222
module load prokka/1.12
module load barrnap/0.7
prokka --force --cpus 6 --prefix 210 --locustag 210 --strain 210 --outdir 210 210.fasta &
prokka --force --cpus 6 --prefix AD1 --locustag AD1 --strain AD1 --outdir AD1 AD1.fasta &
prokka --force --cpus 6 --prefix AD10 --locustag AD10 --strain AD10 --outdir AD10 AD10.fasta &
prokka --force --cpus 6 --prefix AU392 --locustag AU392 --strain AU392 --outdir AU392 AU392.fasta &
prokka --force --cpus 6 --prefix BL110 --locustag BL110 --strain BL110 --outdir BL110 BL110.fasta &
prokka --force --cpus 6 --prefix BL5 --locustag BL5 --strain BL5 --outdir BL5 BL5.fasta &
prokka --force --cpus 6 --prefix BS107 --locustag BS107 --strain BS107 --outdir BS107 BS107.fasta &
prokka --force --cpus 6 --prefix D2 --locustag D2 --strain D2 --outdir D2 D2.fasta &
prokka --force --cpus 6 --prefix LSS9 --locustag LSS9 --strain LSS9 --outdir LSS9 LSS9.fasta &

 
########################################## get final correlation  ##########################################

# Canu produced assemblies 
cd /srv/scratch/z5039045/PacBio/2018-05-02_final_correlation
cp /srv/scratch/z5039045/PacBio/2018-03-16_canu_with_overlap/210_default/210_canu.contigs.fasta .
cp /srv/scratch/z5039045/PacBio/2018-03-16_canu_with_overlap/BS107_default/BS107_canu.contigs.fasta .

# reference sequences 
module load blast+/2.6.0 
blastn -query 210_canu.contigs.fasta -subject 2.10_ref.fasta -out 210_blast_results.txt -evalue 1e-5 -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qlen slen" -task blastn -max_target_seqs 1
blastn -query BS107_canu.contigs.fasta -subject BS107_ref.fasta -out BS107_blast_results.txt -evalue 1e-5 -outfmt "6 qseqid sseqid pident length mismatch gapopen qstart qend sstart send evalue bitscore qlen slen" -task blastn -max_target_seqs 1



########################################## run gff parser for final assemblies ##########################################

module load python/2.7.12

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/210
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin 210.gff -joinseq -gffcomment -basefile 210

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/AD1
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin AD1.gff -joinseq -gffcomment -basefile AD1

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/AD10
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin AD10.gff -joinseq -gffcomment -basefile AD10

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/AU392
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin AU392.gff -joinseq -gffcomment -basefile AU392

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/BL110
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin BL110.gff -joinseq -gffcomment -basefile BL110

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/BL5
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin BL5.gff -joinseq -gffcomment -basefile BL5

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/BS107
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin BS107.gff -joinseq -gffcomment -basefile BS107

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/D2
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin D2.gff -joinseq -gffcomment -basefile D2

cd /srv/scratch/z5039045/PacBio/2018-05-01_prokka/prokka_output/LSS9
python /home/z3452659/slimsuite/tools/seqsuite.py gff -gffin LSS9.gff -joinseq -gffcomment -basefile LSS9





















