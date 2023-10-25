

/srv/scratch/z3452659/ThomasPacBio-Nov15/data/2015-12-03.PacBioAssemblies/SON1053.SP16554.defaultsettings
SON1053_defaultassembly_metrics.xlsx
SON1053.SP16554.hcq.bam
SON1053.SP16554.hcq.bam.bai
SON1053.SP16554.hcq.fas
SON1053.SP16554.hcq.fas.index
SON1053.SP16554.hcq.fas.nhr
SON1053.SP16554.hcq.fas.nin
SON1053.SP16554.hcq.fas.nog
SON1053.SP16554.hcq.fas.nsd
SON1053.SP16554.hcq.fas.nsi
SON1053.SP16554.hcq.fas.nsq
SON1053.SP16554.hcq.fasta
SON1053.SP16554.hcq.fasta.gz
SON1053.SP16554.hcq.gz
SON1053.SP16554.hcq.preassembly.fasta
SON1053.SP16554.hcq.preassembly.fastq
SON1053.SP16554.hcq.qv20.fas
SON1053.SP16554.hcq.qv.csv




module load variantbam/1.2.0
/share/apps/variantbam/1.2.0/bin/variant
/share/apps/variantbam/1.2.0/bin/variant 
/share/apps/variantbam/1.2.0/bin/variant SON1053.SP16554.defaultsettings/SON1053.SP16554.hcq.bam




samtools view


/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_5 > /srv/scratch/z5039045/PacBio/unitig_5.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_4 > /srv/scratch/z5039045/PacBio/unitig_4.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_3 > /srv/scratch/z5039045/PacBio/unitig_3.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_0 > /srv/scratch/z5039045/PacBio/unitig_0.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_8 > /srv/scratch/z5039045/PacBio/unitig_8.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_2 > /srv/scratch/z5039045/PacBio/unitig_2.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_6 > /srv/scratch/z5039045/PacBio/unitig_6.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_34 > /srv/scratch/z5039045/PacBio/unitig_34.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_150 > /srv/scratch/z5039045/PacBio/unitig_150.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_46 > /srv/scratch/z5039045/PacBio/unitig_46.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_51 > /srv/scratch/z5039045/PacBio/unitig_51.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_48 > /srv/scratch/z5039045/PacBio/unitig_48.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_54 > /srv/scratch/z5039045/PacBio/unitig_54.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_9 > /srv/scratch/z5039045/PacBio/unitig_9.bam&
/share/apps/samtools/1.2/samtools/bin/samtools view -h /srv/scratch/z5039045/PacBio/SON1053.SP16554.hcq.bam unitig_32 > /srv/scratch/z5039045/PacBio/unitig_32.bam&





samtools index

/share/apps/samtools/1.1/samtools/bin/samtools index unitig_0.bam
/share/apps/samtools/1.1/samtools/bin/samtools index /srv/scratch/z5039045/PacBio/unitig_5.bam
/share/apps/samtools/1.1/samtools/bin/samtools faidx /srv/scratch/z5039045/PacBio/unitig_5.bam


/share/apps/samtools/1.1/samtools/bin/samtools index
/share/apps/samtools/1.1/samtools/bin/samtools indexing



/share/apps/samtools/1.2/samtools/bin/samtools bam2fq -n -O /srv/scratch/z5039045/samtools_working_directory/ulva_65_66_67/BBAY65_sorted.bam -s /srv/scratch/z5039045/samtools_working_directory/ulva_65_66_67/BBAY65.fastq&

/share/apps/samtools/1.2/samtools/bin/samtools bam2fq -n -O unitig_1.bam -s unitig_1.fastq


/share/apps/samtools/1.2/samtools/bin/samtools bam2fq unitig_0.bam -s unitig_0.fastq





HTSlib
/share/apps/samtools/1.2/htslib/bin/htsfile


samtools view -b reads.bam chr1:10420000-10421000 > subset.bam 


/share/apps/samtools/1.1/samtools/bin/samtools index /srv/scratch/z5039045/PacBio/bam_88_subsets/unitig_1.bam

/share/apps/samtools/1.2/samtools/bin/samtools view -b /srv/scratch/z5039045/PacBio/bam_88_subsets/unitig_1.bam unitig_1:2375-55027 > unitig_1_trimmed.bam
