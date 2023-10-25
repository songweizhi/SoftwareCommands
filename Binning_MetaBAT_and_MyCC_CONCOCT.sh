
# Working directory
/srv/scratch/z5039045/Binning/2_binning

######################################### CONCOCT ########################################

module load python/2.7.15
module load gcc/7.3.0
module load gsl/2.5
module load R/3.5.3
/srv/scratch/z5039045/Softwares/CONCOCT/bin/concoct -h


# For MBARC26
cd /srv/scratch/z5039045/binning_refiner_wd/MBARC26/CONCOCT
/srv/scratch/z5039045/Softwares/CONCOCT/bin/concoct --coverage_file MBARC26_idba_5000_99_depth_CONCOCT.txt --composition_file MBARC26_idba_5000_99.fasta -b Concoct
/srv/scratch/z5039045/CONCOCT/scripts/extract_fasta_bins.py MBARC26_idba_5000_99.fasta Concoct_clustering_gt1000.csv --output_path output_bins


# For BBAY68_69_70
cd /srv/scratch/z5039045/binning_refiner_wd/Real_dataset/CONCOCT
concoct --coverage_file BBAY68_69_70_depth_CONCOCT.txt --composition_file BBAY68_69_70_scaffold_5000.fa -b Concoct
/srv/scratch/z5039045/CONCOCT/scripts/extract_fasta_bins.py BBAY68_69_70_scaffold_5000.fa Concoct_clustering_gt1000.csv --output_path output_bins


# Rscript /srv/scratch/z5039045/CONCOCT/scripts/ClusterPlot.R -c Concoct_clustering_gt1000.csv -p Concoct_PCA_transformed_data_gt1000.csv -m Concoct_pca_means_gt1000.csv -r Concoct_pca_variances_gt1000_dim -l -o evaluation-output/ClusterPlot.pdf
# /srv/scratch/z5039045/CONCOCT/scripts/Validate.pl
# CONCOCT/scripts/Validate.pl --cfile=concoct-output/clustering_gt1000.csv --sfile=evaluation-output/clustering_gt1000_s.csv --ofile=evaluation-output/clustering_gt1000_conf.csv --ffile=contigs/velvet_71_c10K.fa


python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs_MetaBAT-MyCC/Refined

python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 CONCOCT -r outputs_CONCOCT_MetaBAT/Refined

python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MyCC -2 CONCOCT -r outputs_CONCOCT_MyCC/Refined

python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT_MyCC -2 CONCOCT -r outputs_MetaBAT_MyCC_CONCOCT/Refined

######
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT_CONCOCT -2 MyCC -r outputs_MetaBAT_MyCC_CONCOCT/Refined

python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 MetaBAT_MyCC -2 CONCOCT

python3 /srv/scratch/z5039045/Binning_refiner/CheckM_qsuber.py -e 244289990@qq.com

MetaBAT_MyCC_CONCOCT



######################################### MetaBAT ########################################

# Load modules
module load metabat/0.32.4


# Workflow refers to the following website：
# https://bitbucket.org/berkeleylab/metabat/wiki/Benchmark_MetaHIT
# https://bitbucket.org/berkeleylab/metabat

# Generate depth file for MetaBAT
cd /srv/scratch/z5039045/Binning/2_binning/BBAY89_90_91
jgi_summarize_bam_contig_depths --outputDepth BBAY89_90_91_depth.txt --pairedContigs BBAY89_90_91_pairedContigs.txt BBAY89_sorted.bam BBAY90_sorted.bam BBAY91_sorted.bam &

jgi_summarize_bam_contig_depths --outputDepth BBAY89_90_91_depth_sep.txt --pairedContigs BBAY89_90_91_pairedContigs_sep.txt BBAY89_sorted.bam BBAY90_sorted.bam BBAY91_sorted.bam &
jgi_summarize_bam_contig_depths --outputDepth BBAY89_90_91_depth_re.txt --pairedContigs BBAY89_90_91_pairedContigs_re.txt *.bam &


# Prepare folders
mkdir -p bins

# Run MetaBAT
cd /srv/scratch/z5039045/Binning/2_binning/BBAY68_69_70
metabat -i BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -o ./bins/BBAY68_69_70_bin --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose

mkdir bins_verysensitive
metabat -i BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -o ./bins_verysensitive/BBAY68_69_70_bin --verysensitive --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose
mkdir bins_sensitive
metabat -i BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -o ./bins_sensitive/BBAY68_69_70_bin --sensitive --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose
mkdir bins_specific
metabat -i BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -o ./bins_specific/BBAY68_69_70_bin --specific --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose
mkdir bins_veryspecific
metabat -i BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -o ./bins_veryspecific/BBAY68_69_70_bin --veryspecific --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose
mkdir bins_superspecific
metabat -i BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -o ./bins_superspecific/BBAY68_69_70_bin --superspecific --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose


cd /srv/scratch/z5039045/Binning/2_binning/BBAY89_90_91
metabat -i BBAY89_90_91.fa -a BBAY89_90_91_depth.txt -o ./bins/BBAY89_90_91_bin --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose



# for mock dataset 100s
cd /srv/scratch/z5039045/binning_refiner_wd/mock_data/100s

# MetaBAT
cd /srv/scratch/z5039045/binning_refiner_wd/mock_data/100s/MetaBAT
/srv/scratch/z5039045/binning_refiner_wd/mock_data/100s/bam/100s_sorted.bam

jgi_summarize_bam_contig_depths --outputDepth BBAY89_90_91_depth.txt BBAY89_sorted.bam BBAY90_sorted.bam BBAY91_sorted.bam &
jgi_summarize_bam_contig_depths --outputDepth 100s.depth_metabat.txt /srv/scratch/z5039045/binning_refiner_wd/mock_data/100s/bam/100s_sorted.bam






metabat -i BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -o ./bins_verysensitive/BBAY68_69_70_bin --verysensitive --minContigByCorr 2500 --saveTNF saved.tnf --saveDistance saved.dist --verbose
metabat -i assembly.fa -a depth.txt -o MetaBAT_default

metabat -i /srv/scratch/z5039045/binning_refiner_wd/mock_data/MBARC26/MBARC26_2000.fa -a /srv/scratch/z5039045/binning_refiner_wd/mock_data/MBARC26/mapping/depth.txt -o /srv/scratch/z5039045/binning_refiner_wd/mock_data/MBARC26/222/MetaBAT


jgi_summarize_bam_contig_depths --outputDepth depth.txt ../bam/100s_sorted.bam

metabat -i ../100s.fasta -a ../100s.depth_MetaBAT.txt -o MetaBAT --minContigByCorr 1500

metabat -i ../100s.fasta -a ../100s.depth_MetaBAT.txt -o MetaBAT --superspecific --minContigByCorr 1000
metabat -i ../Contigs.fasta -a ../100s.depth_MetaBAT.txt -o MetaBAT --superspecific --minContigByCorr 1000 --pl 100


metabat -i contigs.fa -a depth.txt -o MetaBAT --minContigByCorr

metabat -i assembly_5000.fa -a depth_5000.txt -o MetaBAT_5000 --verysensitive --minContigByCorr 5000
metabat -i assembly_5000.fa -a depth_5000.txt -o MetaBAT_5000 --minContigByCorr 5000
metabat -i assembly_2500.fa -a depth_2500.txt -o MetaBAT_2500 --minContigByCorr 2500
metabat -i assembly_2500.fa -a depth_2500.txt -o MetaBAT_2500 --minContigByCorr 2500


# MyCC
cd /srv/scratch/z5039045/binning_refiner_wd/mock_data/100s/MyCC
MyCC.py ./../100s.fasta 56mer -a ./../100s.depth.txt 
MyCC.py ./../100s.fasta 56mer -a ./../100s.depth_MetaBAT.txt 

MyCC.py



MyCC.py /srv/scratch/z5039045/binning_refiner_wd/mock_data/MetaBAT/assembly_5000.fa 56mer -a /srv/scratch/z5039045/binning_refiner_wd/mock_data/MetaBAT/depth_5000.txt &
MyCC.py /srv/scratch/z5039045/binning_refiner_wd/mock_data/MetaBAT/assembly_2500.fa 56mer -a /srv/scratch/z5039045/binning_refiner_wd/mock_data/MetaBAT/depth_2500.txt &



 ./../100s.fasta 56mer -a ./../100s.depth.txt 




cd /srv/scratch/z5039045/binning_refiner_wd/mock_data/MetaBAT
MyCC.py /srv/scratch/z5039045/binning_refiner_wd/mock_data/MetaBAT/assembly.fa -a /srv/scratch/z5039045/binning_refiner_wd/mock_data/MetaBAT/depth.txt
MyCC.py assembly_5000.fa 56mer -a depth.txt &



########################################## MyCC ##########################################


# Load modules
module unload intel/11.1.080
module load intel/16.0.1.150
module load perl/5.20.1
module load python/2.7.10
module load cd-hit/4.6.4
module load prodigal/2.6.3
module load parallel/20160222
module load hmmer/3.1b2
module load barrnap/0.7
module load mycc/20150710

# Run MyCC
cd /srv/scratch/z5039045/Binning/2_binning/BBAY68_69_70
MyCC.py BBAY68_69_70.fa -a BBAY68_69_70_depth.txt -t 2500 &
MyCC.py BBAY68_69_70.fa 5mer -a BBAY68_69_70_depth.txt -t 2500 &
MyCC.py BBAY68_69_70.fa 56mer -a BBAY68_69_70_depth.txt -t 2500 &





######################################### CheckM #########################################

# Load modules
module load hmmer/3.1b2
module load pplacer/1.1.alpha16
module load prodigal/2.6.3
module load python/2.7.8

# Run CheckM
/srv/scratch/z5039045/Binning/2_binning/BBAY68_69_70/bins_MetaBAT
checkm tree -x fa /srv/scratch/z5039045/Binning/2_binning/BBAY68_69_70/bins_MetaBAT /srv/scratch/z5039045/Binning/2_binning/BBAY68_69_70/bins_MetaBAT/checkm_out &

checkm lineage_wf bin_qa_plot gc_plot coding_plot tetra_plot dist_plot -x fa 


checkm taxonomy_wf bin_qa_plot -x fa 

checkm tree -x fasta /srv/scratch/z5039045/Binning/2_binning/BBAY68_69_70/20160912_0945_4mer_0.7_cov /srv/scratch/z5039045/Binning/2_binning/BBAY68_69_70/20160912_0945_4mer_0.7_cov/checkm_out &
checkm lineage_wf bin_qa_plot -x fasta  
checkm taxonomy_wf bin_qa_plot -x fasta 



checkm lineage_wf -f /srv/scratch/z5039045/assembly/metabat_80/1.5kb/MetaBAT/SCG.txt -t 8 -x fa /srv/scratch/z5039045/assembly/metabat_80/1.5kb/MetaBAT /srv/scratch/z5039045/assembly/metabat_80/1.5kb/MetaBAT/SCG 


# Test
cd /srv/scratch/z5039045/Binning/test

checkm bin_qa_plot 
checkm bin_qa_plot -out_folder /srv/scratch/z5039045/Binning/2_binning -bin_folder /srv/scratch/z5039045/Binning/2_binning -plot_folder /srv/scratch/z5039045/Binning/2_binning --image_type png

checkm gc_plot 
checkm coding_plot 
checkm tetra_plot 
checkm dist_plot
checkm lineage_wf -x fa /srv/scratch/z5039045/Binning/test /srv/scratch/z5039045/Binning/test/out_lineage_wf

checkm lineage_wf -x fa /srv/scratch/z5039045/Binning/BBAY68_69_70/bins_MetaBAT /srv/scratch/z5039045/Binning/BBAY68_69_70/bins_MetaBAT/out_lineage_wf -f /srv/scratch/z5039045/Binning/BBAY68_69_70/bins_MetaBAT/out_lineage_wf/out_lineage_wf.txt

checkm taxonomy_wf -x fa /srv/scratch/z5039045/Binning/test /srv/scratch/z5039045/Binning/test/taxonomy_wf &

##########################################################################################

metabat -i /srv/scratch/z5039045/assembly/BBAY80_81_82_index/BBAY80_81_82_assembly_idba_k_70_80_90_scaffold_greater_2500.fa -a /srv/scratch/z5039045/assembly/metabat_80/depth.txt -o /srv/scratch/z5039045/assembly/metabat_80/1.5kb/MetaBAT/bin --minContigByCorr 2500 --saveTNF /srv/scratch/z5039045/assembly/metabat_80/saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_80/saved.dist --verbose
metabat -i /srv/scratch/z5039045/assembly/metabat_65_66_67/BBAY65_66_67_assembly_idba_k_70_80_90_scaffold_greater_2500.fa -a /srv/scratch/z5039045/assembly/metabat_65_66_67/depth.txt -o /srv/scratch/z5039045/assembly/metabat_65_66_67/1.5kb/MetaBAT/bin --minContigByCorr 2500 --saveTNF /srv/scratch/z5039045/assembly/metabat_65_66_67/saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_65_66_67/saved.dist --verbose --superspecific
metabat -i /srv/scratch/z5039045/assembly/metabat_83_84_85/BBAY83_84_85_assembly_idba_k_70_80_90_scaffold_greater_2500.fa -a /srv/scratch/z5039045/assembly/metabat_83_84_85/depth.txt -o /srv/scratch/z5039045/assembly/metabat_83_84_85/1.5kb/MetaBAT/bin --minContigByCorr 2500 --saveTNF /srv/scratch/z5039045/assembly/metabat_83_84_85/saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_83_84_85/saved.dist --verbose --superspecific
metabat -i /srv/scratch/z5039045/assembly/metabat_89_90_91/BBAY89_90_91_assembly_idba_k_70_80_90_scaffold_greater_2500.fa -a /srv/scratch/z5039045/assembly/metabat_89_90_91/depth.txt -o /srv/scratch/z5039045/assembly/metabat_89_90_91/1.5kb/MetaBAT/bin --minContigByCorr 2500 --saveTNF /srv/scratch/z5039045/assembly/metabat_89_90_91/saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_89_90_91/saved.dist --verbose --superspecific
 

srv/scratch/z5039045/assembly/BBAY80_81_82_index/BBAY80_81_82_assembly_idba_k_70_80_90_scaffold_greater_2500.fa -a /srv/scratch/z5039045/assembly/metabat_80/superspecific/depth.txt -o /srv/scratch/z5039045/assembly/metabat_80/superspecific/1.5kb/MetaBAT/bin --minContigByCorr 2500 --saveTNF /srv/scratch/z5039045/assembly/metabat_80/superspecific/saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_80/superspecific/saved.dist --verbose --superspecific &
metabat -i /srv/scratch/z5039045/assembly/BBAY80_81_82_index/BBAY80_81_82_assembly_idba_k_70_80_90_scaffold_greater_2500.fa -a /srv/scratch/z5039045/assembly/metabat_80/specific/depth.txt -o /srv/scratch/z5039045/assembly/metabat_80/specific/1.5kb/MetaBAT/bin --minContigByCorr 2500 --saveTNF /srv/scratch/z5039045/assembly/metabat_80/specific/saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_80/specific/saved.dist --verbose --specific &
metabat -i /srv/scratch/z5039045/assembly/BBAY80_81_82_index/BBAY80_81_82_assembly_idba_k_70_80_90_scaffold_greater_2500.fa -a /srv/scratch/z5039045/assembly/metabat_80/verysensitive/depth.txt -o /srv/scratch/z5039045/assembly/metabat_80/verysensitive/1.5kb/MetaBAT/bin --minContigByCorr 2500 --saveTNF /srv/scratch/z5039045/assembly/metabat_80/verysensitive/saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_80/verysensitive/saved.dist --verbose --verysensitive &


runMetaBat.sh <options> assembly.fasta sample1.bam [sample2.bam ...]
runMetaBat.sh --minContigByCorr 2500 --verbose --unbinned /srv/scratch/z5039045/assembly/metabat_80/unbinned.fa --saveDistance /srv/scratch/z5039045/assembly/metabat_80/saved.dist /srv/scratch/z5039045/assembly/BBAY80_81_82_index/BBAY80_81_82_assembly_idba_k_70_80_90_scaffold_greater_2500.fa /srv/scratch/z5039045/assembly/metabat_80/BBAY80_sorted.bam /srv/scratch/z5039045/assembly/metabat_80/BBAY81_sorted.bam /srv/scratch/z5039045/assembly/metabat_80/BBAY82_sorted.bam
runMetaBat.sh --superspecific --minContigByCorr 2500 --verbose --unbinned /srv/scratch/z5039045/assembly/metabat_80/verysensitive_superspecific_unbinned.fa --saveTNF /srv/scratch/z5039045/assembly/metabat_80/verysensitive_superspecific_saved.tnf --saveDistance /srv/scratch/z5039045/assembly/metabat_80/verysensitive_superspecific_saved.dist /srv/scratch/z5039045/assembly/BBAY80_81_82_index/BBAY80_81_82_assembly_idba_k_70_80_90_scaffold_greater_2500.fa /srv/scratch/z5039045/assembly/metabat_80/BBAY80_sorted.bam /srv/scratch/z5039045/assembly/metabat_80/BBAY81_sorted.bam /srv/scratch/z5039045/assembly/metabat_80/BBAY82_sorted.bam
runMetaBat.sh --superspecific --minContigByCorr 2500 --verbose --unbinned /srv/scratch/z5039045/assembly/metabat_83_84_85/unbinned.fa BBAY83_84_85_assembly_idba_k_70_80_90_scaffold_greater_2500.fa BBAY83_sorted.bam BBAY84_sorted.bam BBAY85_sorted.bam


Personalized command：
checkm lineage_wf -f /srv/scratch/z5039045/assembly/metabat_80/1.5kb/MetaBAT/SCG.txt -t 8 -x fa /srv/scratch/z5039045/assembly/metabat_80/1.5kb/MetaBAT /srv/scratch/z5039045/assembly/metabat_80/1.5kb/MetaBAT/SCG 
