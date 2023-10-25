
# required files:
Bradyrhizobium_sp_SZCCHNS3014.genome
SZCCHNS3014_L1_1_P.fq # quality filtered forward reads
SZCCHNS3014_L1_2_P.fq # quality filtered reverse reads

# map reads back to reference sequences
cd /home-user/wzsong/Brady/reassembly_16_LingSZ/SZCCHNS3014
bowtie2-build -f Bradyrhizobium_sp_SZCCHNS3014.genome Bradyrhizobium_sp_SZCCHNS3014
bowtie2 -x Bradyrhizobium_sp_SZCCHNS3014 -1 SZCCHNS3014_L1_1_P.fq -2 SZCCHNS3014_L1_2_P.fq -S Bradyrhizobium_sp_SZCCHNS3014.sam -p 6 -q

# convert sam to bam
samtools view -bS Bradyrhizobium_sp_SZCCHNS3014.sam -o Bradyrhizobium_sp_SZCCHNS3014.bam --threads 6
samtools sort Bradyrhizobium_sp_SZCCHNS3014.bam -o Bradyrhizobium_sp_SZCCHNS3014_sorted.bam --threads 6
samtools index Bradyrhizobium_sp_SZCCHNS3014_sorted.bam

# the sam file is in general very big in size, you're safe to delete the sam and the unsorted bam files now.

# open the sorted bam file with Tablet (https://ics.hutton.ac.uk/tablet/), you'll need to provide the reference sequences to Tablet.

