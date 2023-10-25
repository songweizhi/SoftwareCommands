
module load kaiju/1.7.2
kaiju -t /data/bio/kaiju/nodes.dmp -f /data/bio/kaiju/refseq/kaiju_db_refseq.fmi -i ctg.fa -o ctg_taxon.txt -z 12
kaiju-addTaxonNames -t /data/bio/kaiju/nodes.dmp -n /data/bio/kaiju/names.dmp -i ctg_taxon.txt -o ctg_taxon_with_name.txt


module load kaiju/1.7.2
kaiju -t /data/bio/kaiju/nodes.dmp -f /data/bio/kaiju/refseq/kaiju_db_refseq.fmi -i APA_bin_7.fna -o APA_bin_7_ctg_taxon.txt -z 12
kaiju-addTaxonNames -t /data/bio/kaiju/nodes.dmp -n /data/bio/kaiju/names.dmp -i APA_bin_7_ctg_taxon.txt -o APA_bin_7_ctg_taxon_with_name.txt
