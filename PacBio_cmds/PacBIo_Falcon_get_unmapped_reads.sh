# Cmd_for_get_unmapped_reads

# 1. map all subreads to contigs in file SON1053.SP16554.hcq.qv20.fas
module load smrtlink/3.1.1
cd /srv/scratch/z5039045/PacBio/Falcon/get_unmapped_reads
blasr input.fofn SON1053.SP16554.hcq.qv20.fas -sam -bestn 1 -nproc 16 -out all_ctgs.sam -unaligned all_ctgs_unaligned_reads.fasta 

# 2. get reads not mapped to the 8 genomes
module load python/3.5.2
cd /srv/scratch/z5039045/PacBio/Falcon/get_unmapped_reads

# get subreads not mapped to the_8 genomes
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam all_ctgs.sam -ctg ctgs_for_the_8_genomes.txt -option 0 -out reads_not_mapped_to_the_8.fasta

# get subreads mapped to the 8 genomes
python3 /srv/scratch/z5039045/Scripts/get_reads_from_sam.py -sam all_ctgs.sam -ctg ctgs_for_the_8_genomes.txt -option 1 -out reads_mapped_to_the_8.fasta




# get crosslink
cd /Users/songweizhi/Desktop/Falcon/PacBio_googleVis/new_new_test2_a_ctg

python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q a_ctg.fa -r references -x fasta -i 99 -a 200
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q p_ctg.fa -r references -x fasta -i 99 -a 200




# 1
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/1_p_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q p_ctg.fa -r references -x fasta -i 98 -a 200
# 2
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/2_a_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q a_ctg.fa -r references -x fasta -i 98 -a 200
# 3
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/3_all_p_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q all_p_ctg.fa -r references -x fasta -i 98 -a 200
# 4
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/4_all_h_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q all_h_ctg.fa -r references -x fasta -i 98 -a 200
# 5
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/5_cns_p_ctg_98
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_p_ctg.fasta -r references -x fasta -i 98 -a 200

# 5
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/5_cns_p_ctg_99
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_p_ctg.fasta -r references -x fasta -i 99 -a 200

# 6
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/6_cns_h_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_h_ctg.fasta -r references -x fasta -i 99 -a 200

# 6
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/6_cns_h_ctg_99.5
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_h_ctg.fasta -r references -x fasta -i 99.5 -a 200

# 7
cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test2/7_h_against_p
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_h_ctg.fasta -r references -x fasta -i 99 -a 200



cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test3/cns_h_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_h_ctg.fasta -r references -x fasta -i 99 -a 200 &

cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test3/cns_p_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_p_ctg.fasta -r references -x fasta -i 99 -a 200 &

cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test4/cns_h_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_h_ctg.fasta -r references -x fasta -i 99 -a 200 &

cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test4/cns_p_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_p_ctg.fasta -r references -x fasta -i 99 -a 200 &

cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test5/cns_h_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_h_ctg.fasta -r references -x fasta -i 99 -a 200 &

cd /Users/songweizhi/Desktop/Falcon/wd_2_genomes_test5/cns_p_ctg
python3 ~/PycharmProjects/python_scripts/tools/get_crosslink.py -q cns_p_ctg.fasta -r references -x fasta -i 99 -a 200 &

