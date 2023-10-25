
# to install
git clone https://github.com/lh3/gfatools
cd gfatools && make


# Extract a subgraph
gfatools view -l MTh4502 -r 1 MT.gfa > sub.gfa

# Convert GFA to segment FASTA
gfatools gfa2fa MT.gfa > MT-seg.fa

# Convert rGFA to stable FASTA or BED
gfatools gfa2fa -s MT.gfa > MT.fa
gfatools gfa2bed -m MT.gfa > MT.bed

