
module load spades/3.12.0

################################## non-Metagenome mode ################################## 

cd /srv/scratch/z5039045/Flow_cell_biofilm/high_depth_region/spades_assembly
spades.py --only-assembler -s combined_reads_for_assembly.fasta -o high_depth_region_assembly -t 6




#################################### Metagenome mode #################################### 

# reads files
/srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/combined.fasta
/srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/combined.fasta
/srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/combined.fasta
/srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/combined.fasta
/srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/combined.fasta
/srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined.fasta
/srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_R1.fastq
/srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_R2.fastq
/srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/combined.fasta

cd /srv/scratch/z5039045/HgtSIM/metaspades
spades.py --meta --only-assembler -1 /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_R1.fastq -2 /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/combined_R2.fastq -o metaspade_95 





# get recovered genes
cd /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k90-124
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffold.fasta -t input_sequence_mutant_nc.fasta -minf 1

cp /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_70
cp /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_75
cp /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_80
cp /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_85
cp /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_90
cp /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_95
cp /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_100

cp /srv/scratch/z5039045/HgtSIM/identities_2/70/2_IDBA_UD/iden70_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_70_k21-125
cp /srv/scratch/z5039045/HgtSIM/identities_2/75/2_IDBA_UD/iden75_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_75_k21-125
cp /srv/scratch/z5039045/HgtSIM/identities_2/80/2_IDBA_UD/iden80_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_80_k21-125
cp /srv/scratch/z5039045/HgtSIM/identities_2/85/2_IDBA_UD/iden85_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_85_k21-125
cp /srv/scratch/z5039045/HgtSIM/identities_2/90/2_IDBA_UD/iden90_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_90_k21-125
cp /srv/scratch/z5039045/HgtSIM/identities_2/95/2_IDBA_UD/iden95_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_95_k21-125
cp /srv/scratch/z5039045/HgtSIM/identities_2/100/2_IDBA_UD/iden100_k20-124/input_sequence_mutant_nc.fasta /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_100_k21-125



module load python/3.5.2
module load blast+/2.2.31
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_70
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_75
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_80
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_85
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_90
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_95
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_100
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers_iden100.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000

python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers_iden100.py -a scaffold.fa -t input_sequence_mutant_nc.fasta -minf 1000

Assembler_recovered_transfers_iden100




cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_70_k21-125
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_75_k21-125
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_80_k21-125
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_85_k21-125
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_90_k21-125
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_95_k21-125
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000
cd /srv/scratch/z5039045/HgtSIM/metaspades/metaspade_100_k21-125
python3 /srv/scratch/z5039045/HgtSIM/Assembler_recovered_transfers_iden100.py -a scaffolds.fasta -t input_sequence_mutant_nc.fasta -minf 1000






