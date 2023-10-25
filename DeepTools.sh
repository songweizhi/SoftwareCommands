
#################################### install deeptools ###################################

# fasta file can be converted to 2bit using the UCSC programm called faToTwoBit
# http://hgdownload.soe.ucsc.edu/admin/exe/linux.x86_64/faToTwoBit

module load python/3.7.3
source ~/mypython3env/bin/activate
pip install deeptools

export PATH=/srv/scratch/z5039045/Softwares/faToTwoBit:$PATH

computeGCBias -b file.bam --effectiveGenomeSize 2150570000 -g mm9.2bit -l 200 --GCbiasFrequenciesFile freq.txt


###################################### run deeptools #####################################

perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T FP.fna
# Number of Contigs=1, Total bp=2166381, Shortest=2166381, Longest=2166381, Average length=2166381.0, Average GC%=38.9%, Non-ACGT bases=0


module load python/3.7.3
source ~/mypython3env/bin/activate
export PATH=/srv/scratch/z5039045/Softwares/faToTwoBit:$PATH

cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/map_to_ref_gnm_sep
faToTwoBit FP.fna FP.2bit
computeGCBias -b FP_report_best_mis0_sorted.bam --effectiveGenomeSize 2166381 -g FP.2bit -l 200 -p 12 --GCbiasFrequenciesFile FP_GC_bias_freq.txt
computeGCBias -b FP_report_best_mis0_sorted.bam --effectiveGenomeSize 2166381 -g FP.2bit -l 200 -p 12 --GCbiasFrequenciesFile FP_GC_bias_freq.txt --biasPlot FP_GC_bias_freq.pdf --plotFileFormat pdf

correctGCBias -b FP_report_best_mis0_sorted.bam --effectiveGenomeSize 2166381 -g FP.2bit --GCbiasFrequenciesFile FP_GC_bias_freq.txt -o gc_corrected.bam


######################################## Illumina ########################################

# GC Bias Report
# https://support.illumina.com/content/dam/illumina-support/help/Illumina_DRAGEN_Bio_IT_Platform_v3_7_1000000141465/Content/SW/Informatics/Dragen/GCBiasReport_fDG.htm

# GC Bias Correction
# https://support.illumina.com/content/dam/illumina-support/help/Illumina_DRAGEN_Bio_IT_Platform_v3_7_1000000141465/Content/SW/Informatics/Dragen/BiasCorrections_fDG_dtSW.htm


dragen -b FP_report_best_mis0_sorted.bam -r FP.fna --gc-metrics-enable=true


