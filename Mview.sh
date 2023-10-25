
### install on Katana ###

https://sourceforge.net/projects/bio-mview/files/latest/download

cd /srv/scratch/z5039045/Softwares
tar xvzf mview-1.67.tar.gz
cd mview-1.67
perl install.pl
/home/z5039045/bin/mview -help

##########################################################################################

/Users/songweizhi/bin/mview -help

/Users/songweizhi/bin/mview -in fasta -out plain combined_updated.aln

/Users/songweizhi/bin/mview -in fasta -html body combined_updated.aln > msa_body.html
/Users/songweizhi/bin/mview -in fasta -html full combined_updated.aln > msa_full.html
/Users/songweizhi/bin/mview -in fasta -html head combined_updated.aln > msa_head.html

/Users/songweizhi/bin/mview -in fasta -html data -coloring identity combined_updated.aln > msa_identity.html
/Users/songweizhi/bin/mview -in fasta -html data -coloring none combined_updated.aln > msa_none.html
/Users/songweizhi/bin/mview -in fasta -html data -coloring any combined_updated.aln > msa_data.html
/Users/songweizhi/bin/mview -in fasta -html data -coloring consensus combined_updated.aln > msa_consensus.html
/Users/songweizhi/bin/mview -in fasta -html data -coloring group combined_updated.aln > msa_group.html
/Users/songweizhi/bin/mview -in fasta -html data -coloring mismatch combined_updated.aln > msa_mismatch.html

# good
/Users/songweizhi/bin/mview -in fasta -moltype dna -colormap CLUSTAL_NUC -coloring any -css on -html head -ruler off -label4 -label5 -title Testing combined_updated.aln > msa_data.html

/Users/songweizhi/bin/mview -in fasta -moltype dna -colormap CLUSTAL_NUC -coloring any -css on -html head -ruler off -label4 -label5 -title Testing combined_updated.aln > msa_data.html


# -css on			add background color
# -label0			remove row number
# -label4			remove cov column
# -label5			remove pid column
# -hide 'r2.1_2'	hide sequence r2.1_2
