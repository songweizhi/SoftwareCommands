
##########################################################################################

module load perl/5.28.0
module load edirect/10.9.20190304

# Genbank id --> taxon id (for one ID)
esummary -db nuccore -id BA000012.4 | xtract -pattern DocumentSummary -element Caption,TaxId
esummary -db protein -id CAB1096347.1 | xtract -pattern DocumentSummary -element Caption,TaxId

# Genbank id --> taxon id (for multiple IDs)
cat assembly_blastn_best_hits_ref_id.tab | epost -db nuccore | esummary | xtract -pattern DocumentSummary -element Caption,TaxId > assembly_blastn_best_hits_ref_id_to_taxon_id.txt
cat assembly_blastn_best_hits_ref_id_sorted_uniq.tab | epost -db protein | esummary | xtract -pattern DocumentSummary -element Caption,TaxId > assembly_blastn_best_hits_ref_id_to_taxon_id.txt
cat rd2_Cluster.24_vs_nt_BestHit_uniq.txt | epost -db nuccore | esummary | xtract -pattern DocumentSummary -element Caption,TaxId > rd2_Cluster.24_vs_nt_BestHit_ref_id_to_taxon_id.txt


##########################################################################################

esearch -db biosample -query SAMN04858325 | esummary


esearch -db biosample -query SAMN04858325 | esummary | xtract -pattern DocumentSummary -first Title -element Accession -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	SAMN04858325	encrusting sponge

esearch -db biosample -query SAMN04858325 | esummary | xtract -pattern DocumentSummary -element Accession -first Title -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# SAMN04858325	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge

esearch -db biosample -query SAMN04858325 | esummary | xtract -pattern DocumentSummary -element Date -first Title -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# 2016/08/01	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge

esearch -db biosample -query SAMN04858325 | esummary | xtract -pattern DocumentSummary -element Accession -element Date -first Title -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# SAMN04858325	2016/08/01	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge

esearch -db biosample -query SAMN04858325 | esummary | xtract -pattern DocumentSummary -element Accession,Date -first Title -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# SAMN04858325	2016/08/01	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge

esearch -db biosample -query SAMN04858325 | esummary | xtract -pattern DocumentSummary -element Accession -element Date -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# SAMN04858325	2016/08/01	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge	Poecilosclerida sp.

epost -db biosample -id SAMN04858325 | esummary | xtract -pattern DocumentSummary -element Accession -element Date -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# SAMN04858325	2016/08/01	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge	Poecilosclerida sp.


esearch -db biosample -query SAMN04858325 | esummary | xtract -pattern DocumentSummary -element Accession -element Date -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
esearch -db biosample -query SAMD00000001 -api_key fcbcd87b5c19888293ae07ca6c8da36d5108 | esummary | xtract -pattern DocumentSummary -element Accession -element Date -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute


-api_key fcbcd87b5c19888293ae07ca6c8da36d5108


cat few.tsv | epost -db biosample | esummary | xtract -pattern DocumentSummary -element Accession -first Title -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# SAMD00000006	Flavobacteriaceae bacterium strain JBKA-6 from diseased yellowtail
# SAMD00000007	MIGS Cultured Bacterial/Archaeal sample from Aeromonas taiwanensis	wounds of a heavily burned 40-years-old man
# SAMD00000001	MIGS Cultured Bacterial/Archaeal sample from Bradyrhizobium sp. DOA9
# SAMN04858325	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge

cat few.tsv | epost -db biosample | esummary | xtract -pattern DocumentSummary -element Accession -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute
# SAMD00000006	Flavobacteriaceae bacterium strain JBKA-6 from diseased yellowtail	Seriola quinqueradiata
# SAMD00000007	MIGS Cultured Bacterial/Archaeal sample from Aeromonas taiwanensis	Homo sapiens
# SAMD00000001	MIGS Cultured Bacterial/Archaeal sample from Bradyrhizobium sp. DOA9	Aeschynomene americana
# AMN04858325	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	Poecilosclerida sp.

cat few.tsv | epost -db biosample | esummary | xtract -pattern DocumentSummary -element Accession -first Title -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute
# SAMD00000006	Flavobacteriaceae bacterium strain JBKA-6 from diseased yellowtail	Seriola quinqueradiata
# SAMD00000007	MIGS Cultured Bacterial/Archaeal sample from Aeromonas taiwanensis	wounds of a heavily burned 40-years-old man	Homo sapiens
# SAMD00000001	MIGS Cultured Bacterial/Archaeal sample from Bradyrhizobium sp. DOA9	Aeschynomene americana
# SAMN04858325	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	encrusting sponge	Poecilosclerida sp.

cat few.tsv | epost -db biosample | esummary | xtract -pattern DocumentSummary -element Accession -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute
# SAMD00000006	Flavobacteriaceae bacterium strain JBKA-6 from diseased yellowtail	Seriola quinqueradiata
# SAMD00000007	MIGS Cultured Bacterial/Archaeal sample from Aeromonas taiwanensis	Homo sapiens	wounds of a heavily burned 40-years-old man
# SAMD00000001	MIGS Cultured Bacterial/Archaeal sample from Bradyrhizobium sp. DOA9	Aeschynomene americana
# SAMN04858325	Microbe sample from Cycloclasticus sp. symbiont of Poecilosclerida sp. N	Poecilosclerida sp.	encrusting sponge

cat combined_ar53_bac120_metadata_r207_col_biosample_uniq.tsv | epost -db biosample | esummary | xtract -pattern DocumentSummary -element Accession -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute > biosample_metadata.txt








esearch -db biosample -query SAMN04858325 -api_key fcbcd87b5c19888293ae07ca6c8da36d5108 | esummary -api_key fcbcd87b5c19888293ae07ca6c8da36d5108 | xtract -pattern DocumentSummary -element Accession -first Title -group Attribute -if Attribute@harmonized_name -equals "host" -element Attribute -group Attribute -if Attribute@harmonized_name -equals "isolation_source" -element Attribute






