
######################## install GraphMB (Conda) (Mac and Katana) ########################

# https://github.com/MicrobialDarkMatter/GraphMB

conda deactivate
conda create -n graphmb -c conda-forge make cmake libgcc python=3.7 pip
conda activate graphmb
pip install tqdm
pip install torch
pip install https://github.com/AndreLamurias/GraphMB/releases/download/v0.1.5/graphmb-0.1.5-py3-none-any.whl


####################################### run GraphMB ######################################

# In summary, you need to have a directory with these files:
# edges.fasta
# assembly_graph.fasta
# edges_depth.txt (output of jgi_summarize_bam_contig_depths)
# marker_gene_stats.csv (optional)

# Example commands
# https://graphmb.readthedocs.io/en/latest/examples.html

# Typical workflow
# https://github.com/MicrobialDarkMatter/GraphMB

conda activate graphmb
graphmb -h


####################################### run GraphMB ######################################

conda activate graphmb
cd /srv/scratch/z5039045/GraphMB_wd
graphmb --assembly data/strong100/ --outdir results/strong100/

checkm lineage_wf -x fa --reduced_tree -t 4 --tab_table bins_dir/ outputdir/ -f outputdir/checkm.tsv


####################################### Nan Xiang ########################################

BioSAK RunGraphMB -gfa assembly_graph.gfa -o graphmb_input_dir

graphmb --assembly graphmb_input_dir --outdir graphmb_output_dir --numcores 12
