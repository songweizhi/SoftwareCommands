
export PATH=/srv/scratch/z5039045/Softwares/ghostx-1.3.7/src:$PATH
ghostx

ghostx db  -i db.fasta -o ghostx_db
ghostx aln -i exqry -d ghostx_db -o ghostx_out


cd /srv/scratch/z5039045/DB/KEGG_DB
ghostx db  -i prokaryotes.pep.fasta -o prokaryotes.pep.ghostx


cd /srv/scratch/z5039045
ghostx aln -i APA_bin_1.faa -d prokaryotes.pep.ghostx -o APA_bin_1.ghostx.tab
