
################################### install on Katana ####################################

#module load R/4.0.2
module load R/3.6.3
mkdir ~/src
cd ~/src
# copy Tax4Fun2_1.1.5.tar.gz to ~/src
# wget https://github.com/bwemheu/Tax4Fun2/releases/download/1.1.5/Tax4Fun2_1.1.5.tar.gz # removed now
R
library('devtools')
getwd()
install.packages(pkgs = "Tax4Fun2_1.1.5.tar.gz", repos = NULL, source = TRUE)

# setup blast+, in the default db folder 
cd /srv/scratch/z5039045/DB/Tax4Fun2_ReferenceData_v2/blast_bin/bin
mkdir 000
mv blastn 000/
mv makeblastdb 000/
ln -s /apps/blast+/2.11.0/bin/blastn blastn
ln -s /apps/blast+/2.11.0/bin/makeblastdb makeblastdb


##################################### install on Mac #####################################

cd /Users/songweizhi/Softwares
wget https://github.com/bwemheu/Tax4Fun2/releases/download/1.1.5/Tax4Fun2_1.1.5.tar.gz
R
install.packages(pkgs = "Tax4Fun2_1.1.5.tar.gz", repos = NULL, source = TRUE)

# refers to: https://github.com/bwemheu/Tax4Fun2
library(Tax4Fun2)


##################################### run on Katana ######################################

#module load R/4.0.2
module load R/3.6.3
module load blast+/2.11.0
cd /srv/scratch/z5039045/Tax4Fun2_test
Rscript /srv/scratch/z5039045/Tax4Fun2_test/RunTax4Fun2.R --ncn --np --thread 6 --seq AllSamples_unoise_nc.fasta --table AllSamples_unoise_otu_table_BLCA_filtered2_df.txt --out AllSamples_unoise_nc_Tax4Fun2_op_sponge --rd /srv/scratch/z5039045/DB/Tax4Fun2_ReferenceData_v2 --ud /srv/scratch/z5039045/DB --nud Sponge_associated_MAGs_Tax4Fun2_db

Rscript RunTax4Fun2.R --ncn --np --thread 6 --seq OTUs.fasta --table OTU_table.txt --out output_folder --rd /srv/scratch/z5039045/DB/Tax4Fun2_ReferenceData_v2 --ud /srv/scratch/z5039045/DB --nud Sponge_associated_MAGs_Tax4Fun2_db

/srv/scratch/z5039045/DB/Tax4Fun2_ReferenceData_v2/blast_bin/bin/blastn


################################ Update database on Katana ###############################

module load R/5.6.3
module load blast+/2.11.0
module load vsearch/2.13.3
module load diamond/0.9.31
module load prodigal/2.6.3

cd /srv/scratch/z5039045/All_NCBI_complete_genomes
Rscript generate_ref_db.R


####################################### run on Mac #######################################

# parameters
--rd 		/Users/songweizhi/Desktop/Tax4Fun2/Tax4Fun2_ReferenceData_v2 
--ud 		/Users/songweizhi/Desktop/Tax4Fun2/0_Sponge_qualified_MAGs_with_added_16s 
--nud 		Sponge_associated_MAGs_Tax4Fun2_db 
--ncn		specify to turn on normalize_by_copy_number
--np 		specify to turn on normalize_pathways
--thread 	8	

# batch_2_test (default db)
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_2_test
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq core_OTUs.fa --table combined.tab --out TEST_default --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2

# batch_2_test (sponge db)
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_2_test
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq core_OTUs.fa --table combined.tab --out TEST_sponge --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2 --ud /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/0_Sponge_qualified_MAGs_with_added_16s --nud Sponge_associated_MAGs_Tax4Fun2_db

# batch_3
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_3
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq AllSamples_unoise_nc_no.fasta --table sponge_asv_table.csv --out AllSamples_unoise_nc_no_Tax4Fun2_op --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2 --ud /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/0_Sponge_qualified_MAGs_with_added_16s --nud Sponge_associated_MAGs_Tax4Fun2_db

# batch_3_test (default db)
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_3_test
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq AllSamples_unoise_nc_no.fasta --table sponge_asv_table.csv --out TEST_default --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2

# batch_3_test (sponge db)
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_3_test
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq AllSamples_unoise_nc_no.fasta --table sponge_asv_table.csv --out TEST_sponge --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2 --ud /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/0_Sponge_qualified_MAGs_with_added_16s --nud Sponge_associated_MAGs_Tax4Fun2_db

# batch_4 (default db)
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_4
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq AllSamples_unoise_nc.fasta --table AllSamples_unoise_otu_table_BLCA_filtered2_df.txt --out AllSamples_unoise_nc_Tax4Fun2_op_default --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2

# batch_4 (sponge db)
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_4
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq AllSamples_unoise_nc.fasta --table AllSamples_unoise_otu_table_BLCA_filtered2_df.txt --out AllSamples_unoise_nc_Tax4Fun2_op_sponge --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2 --ud /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/0_Sponge_qualified_MAGs_with_added_16s --nud Sponge_associated_MAGs_Tax4Fun2_db

# Shark microbiome (Sian)
cd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_5
Rscript /Users/songweizhi/PycharmProjects/Tax4Fun2_scripts/RunTax4Fun2.R --ncn --np --thread 8 --seq AllSamples_unoise_nc.fasta --table deseq_clean_otu_table.csv --out AllSamples_unoise_nc_Tax4Fun2_op --rd /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/Tax4Fun2_ReferenceData_v2

--ud /Users/songweizhi/Desktop/Tax4Fun2_wd/batch_0/0_Sponge_qualified_MAGs_with_added_16s --nud Sponge_associated_MAGs_Tax4Fun2_db







