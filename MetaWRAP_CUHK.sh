
https://github.com/bxlab/metaWRAP

# install metaWRAP
conda deactivate
conda install -y mamba
mamba create -y --name metawrap-env --channel ursky metawrap-mg=1.3.2
conda activate metawrap-env
conda install -y blas=2.5=mkl

# run metaWRAP (thliao)
conda activate /home-user/thliao/anaconda3/envs/metawrap-env
metaWRAP binning --metabat2 --maxbin2 --concoct -a assembly.fa -o output_dir readsA_1.fa readsA_2.fa

# run metaWRAP (Weizhi)
conda activate metawrap-env
metaWRAP binning --metabat2 --maxbin2 --concoct -a assembly.fa -o output_dir readsA_1.fa readsA_2.fa


conda activate metawrap-env
cd /mnt/ivy/nxiang/practice/metagenome/comb_raw/binning_metaWrap/metaWrap_LN1P
metawrap bin_refinement -o bin_refinement_LN1P -t 12 -c 50 -x 5 -A concoct_bins -B maxbin2_bins -C metabat2_bins

