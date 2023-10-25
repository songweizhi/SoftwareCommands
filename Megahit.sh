
# install megahit for the group
cd /scratch/du5/apps/megahit
wget https://github.com/voutcn/megahit/releases/download/v1.2.9/MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz
tar zvxf MEGAHIT-1.2.9-Linux-x86_64-static.tar.gz
mv MEGAHIT-1.2.9-Linux-x86_64-static 1.2.9
# change the first line in "/scratch/du5/apps/megahit/1.2.9/bin/megahit" to "#!/usr/bin/env python3"


# run on a toy dataset
cd /scratch/du5/wzs561/megahit_test
/scratch/du5/apps/megahit/1.2.9/bin/megahit --test  


cd /srv/scratch/z5095298/Kelp_coassembly/test
/srv/scratch/z5095298/software/megahit/bin/megahit -1 CY_R1_P.fastq -2 CY_R2_P.fastq -r CY_R1_UP.fastq,CY_R2_UP.fastq -o megahit_1.2.9_test --k-min 57 --k-max 141 --k-step 28 --memory 52428800 -t 12


cd /srv/scratch/z5095298/Kelp_coassembly
/srv/scratch/z5095298/software/megahit/bin/megahit -1 BH_ER_pairedForward.fastq,BI_ER_pairedForward.fastq,CB_ER_pairedForward.fastq,SH_ER_pairedForward.fastq -2 BH_ER_pairedReverse.fastq,BI_ER_pairedReverse.fastq,CB_ER_pairedReverse.fastq,SH_ER_pairedReverse.fastq -r BH_ER_unpairedForward.fastq,BH_ER_unpairedReverse.fastq,BI_ER_unpairedForward.fastq,BI_ER_unpairedReverse.fastq,CB_ER_unpairedForward.fastq,CB_ER_unpairedReverse.fastq,SH_ER_unpairedForward.fastq,SH_ER_unpairedReverse.fastq -o Kelp_coassembly_megahit_1.2.9 --k-min 57 --k-max 141 --k-step 28 --memory 1048576000 -t 32


############################### Assemble the kelp dataset ################################

# copy file to Gadi with its data-mover node
cd /srv/scratch/z5095298/Kelp_coassembly
scp BH_ER_pairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp BH_ER_unpairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp BH_ER_unpairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp BI_ER_unpairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp CB_ER_unpairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp SH_ER_unpairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/

scp BH_ER_pairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp BI_ER_pairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp BI_ER_pairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp BI_ER_unpairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp CB_ER_pairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp CB_ER_pairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp CB_ER_unpairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp SH_ER_pairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp SH_ER_pairedReverse.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/
scp SH_ER_unpairedForward.fastq wzs561@gadi-dm.nci.org.au:/scratch/du5/wzs561/






