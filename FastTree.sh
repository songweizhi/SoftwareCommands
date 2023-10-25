



gcc -O3 -finline-functions -funroll-loops -Wall -o FastTree /Users/songweizhi/Software/FastTree.c -lm
gcc -DNO_SSE -O3 -finline-functions -funroll-loops -Wall -o FastTree /Users/songweizhi/Software/FastTree.c -lm

gcc -DOPENMP -fopenmp -O3 -finline-functions -funroll-loops -Wall -o FastTreeMP /Users/songweizhi/Software/FastTree.c -lm




module load mafft/7.407
module load fasttree/2.1.11

# run mafft
mafft --quiet --maxiterate 1000 --thread 6 --globalpair combined_16s.fasta > combined_16s.aln 
mafft --quiet --maxiterate 1000 --thread 6 --globalpair combined_16s_uniq.fasta > combined_16s_uniq.aln 

# run fasttree
fasttree -nt -quiet 16s_sequence.aln > 16s_sequence.newick
fasttree -nt -quiet combined_16s_uniq.aln > combined_16s_uniq.newick





BioSAK select_seq -seq GI_128_16S_0.999.fasta -id linked_to_4.txt -out linked_to_4.fa -option 1 -oneline
mafft --quiet --maxiterate 1000 --thread 6 --globalpair linked_to_4.fa > linked_to_4.aln 
fasttree -nt -quiet linked_to_4.aln > linked_to_4.newick

BioSAK select_seq -seq GI_128_16S_0.999.fasta -id linked_to_4_highest_12.txt -out linked_to_4_highest_12.fa -option 1 -oneline
mafft --quiet --maxiterate 1000 --thread 6 --globalpair linked_to_4_highest_12.fa > linked_to_4_highest_12.aln 
fasttree -nt -quiet linked_to_4_highest_12.aln > linked_to_4_highest_12.newick



usearch -cluster_fast linked_to_4_highest_12.fa -id 0.985 -centroids linked_to_4_highest_12_0.985.fa -uc linked_to_4_highest_12_98.5.uc -sort length -quiet



module load mafft/7.407
module load fasttree/2.1.11
cd /srv/scratch/z5039045/MarkerMAG_wd/MBARC26/reference_genomes_renamed_tree
mafft --quiet --maxiterate 1000 --thread 6 --globalpair combined_ref_16S_and_PhyloFlash.ffn > combined_ref_16S_and_PhyloFlash.aln 
fasttree -nt -quiet combined_ref_16S_and_PhyloFlash.aln > combined_ref_16S_and_PhyloFlash.newick

mafft --quiet --maxiterate 1000 --thread 6 --globalpair combined_ref_16S_and_Matam.ffn > combined_ref_16S_and_Matam.aln 
fasttree -nt -quiet combined_ref_16S_and_Matam.aln > combined_ref_16S_and_Matam.newick
