65_66_67	UA	Ulva australis 
68_69_70	CF	Caulerpa filiformis 
71_72_73	DP	Delisea pulchra 
74_75		AA	Amphiroa anceps 
77_78_79	PC	Phylospora comosa 
80_81_82	ER	Ecklonia radiata 
83_84_85	HO	Halophila ovalis 
86_87		PA	Posidonia australis
90_91		RC	Rock
92_93_94	WT	Water

# copy raw reads to working cd directory
cp BBAY72.fastq.bz2 /srv/scratch/z5039045/1_assembly/BBAY71_72_73
cp BBAY77/Original-seqs/BB77-PE-IL50-01_CCCATG_L002_R1_filtered.fastq /srv/scratch/z5039045/1_assembly/BBAY77_78_79 &
cp BBAY77/Original-seqs/BB77-PE-IL50-01_CCCATG_L002_R2_filtered.fastq /srv/scratch/z5039045/1_assembly/BBAY77_78_79 &
cp BBAY78/Original-seqs/BB78-PE-IL51-01_TGGCGC_L002_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY77_78_79 &
cp BBAY78/Original-seqs/BB78-PE-IL51-01_TGGCGC_L002_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY77_78_79 &
cp BBAY79/Original-seqs/BB79-PE-IL52-01_CACTCA_L001_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY77_78_79 &
cp BBAY79/Original-seqs/BB79-PE-IL52-01_CACTCA_L001_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY77_78_79 &
cp BBAY80/Original-seqs/BB80-PE-IL92-02_CAGGCG_L007_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY80_81_82 &
cp BBAY80/Original-seqs/BB80-PE-IL92-02_CAGGCG_L007_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY80_81_82 &
cp BBAY81/Original-seqs/BB81-PE-IL53-01_GTGGCC_L001_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY80_81_82 &
cp BBAY81/Original-seqs/BB81-PE-IL53-01_GTGGCC_L001_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY80_81_82 &
cp BBAY82/Original-seqs/BB82-PE-IL54-01_AGTCAA_L008_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY80_81_82 &
cp BBAY82/Original-seqs/BB82-PE-IL54-01_AGTCAA_L008_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY80_81_82 &
cp BBAY83/Original-seqs/BB83-PE-IL93-01_CCAACA_L002_R1_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY83_84_85 &
cp BBAY83/Original-seqs/BB83-PE-IL93-01_CCAACA_L002_R2_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY83_84_85 &
cp BBAY84/Original-seqs/BB84-PE-IL95-01_CTAGCT_L002_R1_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY83_84_85 &
cp BBAY84/Original-seqs/BB84-PE-IL95-01_CTAGCT_L002_R2_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY83_84_85 &
cp BBAY85/Original-seqs/BB85-PE-IL98-01_GAGTGG_L002_R1_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY83_84_85 &
cp BBAY85/Original-seqs/BB85-PE-IL98-01_GAGTGG_L002_R2_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY83_84_85 &
cp BBAY86/Original-seqs/BB86-PE-IL55-01_ATAATT_L001_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY86_87 &
cp BBAY86/Original-seqs/BB86-PE-IL55-01_ATAATT_L001_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY86_87 &
cp BBAY87/Original-seqs/BB87-PE-IL99-01_GGTAGC_L007_R1_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY86_87 &
cp BBAY87/Original-seqs/BB87-PE-IL99-01_GGTAGC_L007_R2_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY86_87 &
cp BBAY90/Original-seqs/BB90-PE-IL73-01_CGGAAT_L007_R1_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY90_91 &
cp BBAY90/Original-seqs/BB90-PE-IL73-01_CGGAAT_L007_R2_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY90_91 &
cp BBAY91/Original-seqs/BB91-PE-IL77-01_ATGTCA_L008_R1_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY90_91 &
cp BBAY91/Original-seqs/BB91-PE-IL77-01_ATGTCA_L008_R2_filtered.fastq.tar.gz /srv/scratch/z5039045/1_assembly/BBAY90_91 &
cp BBAY92/Original-seqs/BB92-PE-IL46-01_TTCGAA_L003_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY92_93_94 &
cp BBAY92/Original-seqs/BB92-PE-IL46-01_TTCGAA_L003_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY92_93_94 &
cp BBAY93/Original-seqs/BB93-PE-IL47-01_AGTTCC_L003_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY92_93_94 &
cp BBAY93/Original-seqs/BB93-PE-IL47-01_AGTTCC_L003_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY92_93_94 &
cp BBAY94/Original-seqs/BB94-PE-IL48-01_GTGAAA_L007_R1_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY92_93_94 &
cp BBAY94/Original-seqs/BB94-PE-IL48-01_GTGAAA_L007_R2_filtered.fastq.gz /srv/scratch/z5039045/1_assembly/BBAY92_93_94 &


# decompress raw reads
# corrupted files: BB65_R2, BB66_R2, BB72(R1 and R2), BB94(R1 and R2)
tar xvzf BBAY65_Original-seqs.tar.bz2 &
tar xvzf  &
gunzip BB65-PE-IL78-01_ATTCCT_L007_R1_filtered.fastq.gz &
gunzip BB65-PE-IL78-01_ATTCCT_L007_R2_filtered.fastq.gz &
tar -xvf BBAY67_Original-seqs.tar.bz2 &
tar -xvf BB67-PE-IL59-01_GTAGAG_L008_R1_filtered.fastq.tar.gz &
tar -xvf BB67-PE-IL59-01_GTAGAG_L008_R2_filtered.fastq.tar.gz &
tar -xvf BBAY68_Original-seqs.tar.bz2 &
tar -xvf BB68-PE-IL60-01_TCCCGA_L008_R1_filtered.fastq.tar.gz &  
tar -xvf BB68-PE-IL60-01_TCCCGA_L008_R2_filtered.fastq.tar.gz & 
tar -xvf BBAY69_Original-seqs.tar.bz2 &
gunzip BB69-PE-IL49-01_AAACAT_L008_R1_filtered.fastq.gz &
tar -xvf BBAY70_Original-seqs.tar.bz2 &
tar -xvf BB70-PE-IL62-01_CAAAAG_L007_R1_filtered.fastq.tar.gz &
tar -xvf BB70-PE-IL62-01_CAAAAG_L007_R2_filtered.fastq.tar.gz &
gunzip BB71-PE-IL63-01_GTCCGC_L007_R1_filtered.fastq.gz &  
gunzip BB73-PE-IL84-02_CCGTCC_L002_R1_filtered.fastq.gz &
gunzip BB71-PE-IL63-01_GTCCGC_L007_R2_filtered.fastq.gz &  
gunzip BB73-PE-IL84-02_CCGTCC_L002_R2_filtered.fastq.gz &
gunzip BB74-PE-IL43-01_CCGCAA_L008_R1_filtered.fastq.gz &  
gunzip BB75-PE-IL44-01_GGCCTG_L004_R1_filtered.fastq.gz &
gunzip BB74-PE-IL43-01_CCGCAA_L008_R2_filtered.fastq.gz &  
gunzip BB75-PE-IL44-01_GGCCTG_L004_R2_filtered.fastq.gz &
gunzip BB78-PE-IL51-01_TGGCGC_L002_R1_filtered.fastq.gz &
gunzip BB78-PE-IL51-01_TGGCGC_L002_R2_filtered.fastq.gz &
gunzip BB79-PE-IL52-01_CACTCA_L001_R1_filtered.fastq.gz &
gunzip BB79-PE-IL52-01_CACTCA_L001_R2_filtered.fastq.gz &
gunzip BBAY80_81_82/BB80-PE-IL92-02_CAGGCG_L007_R1_filtered.fastq.gz &  
gunzip BBAY80_81_82/BB80-PE-IL92-02_CAGGCG_L007_R2_filtered.fastq.gz &  
gunzip BBAY80_81_82/BB81-PE-IL53-01_GTGGCC_L001_R1_filtered.fastq.gz &  
gunzip BBAY80_81_82/BB81-PE-IL53-01_GTGGCC_L001_R2_filtered.fastq.gz &  
gunzip BBAY80_81_82/BB82-PE-IL54-01_AGTCAA_L008_R1_filtered.fastq.gz &  
gunzip BBAY80_81_82/BB82-PE-IL54-01_AGTCAA_L008_R2_filtered.fastq.gz &  
gunzip BBAY86_87/BB86-PE-IL55-01_ATAATT_L001_R1_filtered.fastq.gz &  
gunzip BBAY86_87/BB86-PE-IL55-01_ATAATT_L001_R2_filtered.fastq.gz &  
gunzip BBAY92_93_94/BB92-PE-IL46-01_TTCGAA_L003_R1_filtered.fastq.gz &  
gunzip BBAY92_93_94/BB92-PE-IL46-01_TTCGAA_L003_R2_filtered.fastq.gz &  
gunzip BBAY92_93_94/BB93-PE-IL47-01_AGTTCC_L003_R1_filtered.fastq.gz &  
gunzip BBAY92_93_94/BB93-PE-IL47-01_AGTTCC_L003_R2_filtered.fastq.gz &  
gunzip BBAY92_93_94/BB94-PE-IL48-01_GTGAAA_L007_R1_filtered.fastq.gz &  
gunzip BBAY92_93_94/BB94-PE-IL48-01_GTGAAA_L007_R2_filtered.fastq.gz &  
tar -xvf BBAY83_84_85/BB83-PE-IL93-01_CCAACA_L002_R1_filtered.fastq.tar.gz &  
tar -xvf BBAY83_84_85/BB83-PE-IL93-01_CCAACA_L002_R2_filtered.fastq.tar.gz &  
tar -xvf BBAY83_84_85/BB84-PE-IL95-01_CTAGCT_L002_R1_filtered.fastq.tar.gz &  
tar -xvf BBAY83_84_85/BB84-PE-IL95-01_CTAGCT_L002_R2_filtered.fastq.tar.gz &  
tar -xvf BBAY83_84_85/BB85-PE-IL98-01_GAGTGG_L002_R1_filtered.fastq.tar.gz &  
tar -xvf BBAY83_84_85/BB85-PE-IL98-01_GAGTGG_L002_R2_filtered.fastq.tar.gz &  
tar -xvf BBAY86_87/BB87-PE-IL99-01_GGTAGC_L007_R1_filtered.fastq.tar.gz &  
tar -xvf BBAY86_87/BB87-PE-IL99-01_GGTAGC_L007_R2_filtered.fastq.tar.gz &  
tar -xvf BBAY90_91/BB90-PE-IL73-01_CGGAAT_L007_R1_filtered.fastq.tar.gz &  
tar -xvf BBAY90_91/BB90-PE-IL73-01_CGGAAT_L007_R2_filtered.fastq.tar.gz &  
tar -xvf BBAY90_91/BB91-PE-IL77-01_ATGTCA_L008_R1_filtered.fastq.tar.gz &  
tar -xvf BBAY90_91/BB91-PE-IL77-01_ATGTCA_L008_R2_filtered.fastq.tar.gz &  

# For BBAY65
bzip2 -d BBAY65.fastq.bz2 &
tar -xvf split.tar.bz2 &
gunzip BB65-PE-IL78-01_ATTCCT_L007_R1_filtered.fastq.gz
gunzip BB65-PE-IL78-01_ATTCCT_L007_R2_filtered.fastq.gz
fq2fa BBAY65_BothP_qualControl_Kerensa_Q30-1.fastq BBAY65_BothP_qualControl_Kerensa_Q30-1.fa &
fq2fa BBAY65_BothP_qualControl_Kerensa_Q30-2.fastq BBAY65_BothP_qualControl_Kerensa_Q30-2.fa &
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY65_BothP_qualControl_Kerensa_Q30-1.fa BBAY65_BothP_qualControl_Kerensa_Q30-1_lt50.fa &
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY65_BothP_qualControl_Kerensa_Q30-2.fa BBAY65_BothP_qualControl_Kerensa_Q30-2_lt50.fa &
# remove unpaired reads
python3 /srv/scratch/z5039045/Scripts/remove_unpaired_reads.py BBAY65_R1.fasta BBAY65_R2.fasta
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY65_R1_only_paired.fasta BBAY65_R1_only_paired_in_1_line.fasta &
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY65_R2_only_paired.fasta BBAY65_R2_only_paired_in_1_line.fasta &
filterfa --merge BBAY65_R1_only_paired_in_1_line.fasta BBAY65_R2_only_paired_in_1_line.fasta BBAY65.fa



# For BBAY66
cp BBAY66/quality_trimmer/BBAY66.fastq.tar.bz2 /srv/scratch/z5039045/1_assembly/BBAY65_66_67 &
tar -xvf BBAY66.fastq.tar.bz2 &
python3 fq_spliter.py
#report: ValueError: Lengths of sequence and quality values differs  for SOLEXA4:34:C13W1ACXX:7:1307:17432:87274 1:N:0:CAACTA (101 and 114803).
grep -n SOLEXA4:34:C13W1ACXX:7:1307:17432:87274 BBAY66_BothP_qualControl_Kerensa_Q25.fastq
201023129:@SOLEXA4:34:C13W1ACXX:7:1307:17432:87274 1:N:0:CAACTA
sed '201023129,201023132d' BBAY66_BothP_qualControl_Kerensa_Q25.fastq > BBAY66_BothP_qualControl_Kerensa_Q25_d201023129-201023132.fastq
wc -l BBAY66_BothP_qualControl_Kerensa_Q25.fastq
510070277
wc -l BBAY66_BothP_qualControl_Kerensa_Q25_d201023129-201023132.fastq
510070273
grep -n ATAACACAAACAAACAACATGAACCTTCAGAGTTGGAGGAAGGACAGGACGAGACATACACAAAGAAAAACGCATAAAGCTTTCTGGTCGTATTCGGTCAA BBAY66_R2.fastq
123313835
# delete 123313833 123313834 123313835 123313836 123313837
sed '123313833,123313837d' BBAY66_R2.fastq > BBAY66_R2_d123313833-123313837.fastq


# For BBAY72
bzip2 -d BBAY72.fastq.bz2
bash unmerge-paired-reads.sh BBAY72.fastq BBAY72_R1.fastq BBAY72_R2.fastq &
fq2fa BBAY72_BothP_qualControl_Kerensa_Q30-1_pair1.fastq BBAY72_BothP_qualControl_Kerensa_Q30-1_pair1.fa &
fq2fa BBAY72_BothP_qualControl_Kerensa_Q30-2_pair2.fastq BBAY72_BothP_qualControl_Kerensa_Q30-2_pair2.fa &
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY72_BothP_qualControl_Kerensa_Q30-1_pair1.fa BBAY72_BothP_qualControl_Kerensa_Q30-1_pair1_lt50.fa &
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY72_BothP_qualControl_Kerensa_Q30-2_pair2.fa BBAY72_BothP_qualControl_Kerensa_Q30-2_pair2_lt50.fa &
sed 's/\// /g' BBAY72_R1.fasta  > BBAY72_R1_replaced.fasta &
sed 's/\// /g' BBAY72_R2.fasta  > BBAY72_R2_replaced.fasta &
# remove unpaired reads
python3 /srv/scratch/z5039045/Scripts/remove_unpaired_reads.py BBAY72_R1_replaced.fasta BBAY72_R2_replaced.fasta
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY72_R1_replaced_only_paired.fasta BBAY72_R1_replaced_only_paired_in_1_line.fasta &
perl /srv/scratch/z5039045/Scripts/select_contig.pl -p -l 10000 -m 50 BBAY72_R2_replaced_only_paired.fasta BBAY72_R2_replaced_only_paired_in_1_line.fasta &
filterfa --merge BBAY72_R1_replaced_only_paired_in_1_line.fasta BBAY72_R2_replaced_only_paired_in_1_line.fasta BBAY72.fa



# run trimmomatic
cd /srv/scratch/z5039045/1_assembly/BBAY65_66_67
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY65_R1.fastq BBAY65_R2.fastq BBAY65_R1_Q20_P.fastq BBAY65_R1_Q20_UP.fastq BBAY65_R2_Q20_P.fastq BBAY65_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50	
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY66_R1.fastq BBAY66_R2.fastq BBAY66_R1_Q20_P.fastq BBAY66_R1_Q20_UP.fastq BBAY66_R2_Q20_P.fastq BBAY66_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY67_R1.fastq BBAY67_R2.fastq BBAY67_R1_Q20_P.fastq BBAY67_R1_Q20_UP.fastq BBAY67_R2_Q20_P.fastq BBAY67_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY68_69_70
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY68_R1.fastq BBAY68_R2.fastq BBAY68_R1_Q20_P.fastq BBAY68_R1_Q20_UP.fastq BBAY68_R2_Q20_P.fastq BBAY68_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY69_R1.fastq BBAY69_R2.fastq BBAY69_R1_Q20_P.fastq BBAY69_R1_Q20_UP.fastq BBAY69_R2_Q20_P.fastq BBAY69_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY70_R1.fastq BBAY70_R2.fastq BBAY70_R1_Q20_P.fastq BBAY70_R1_Q20_UP.fastq BBAY70_R2_Q20_P.fastq BBAY70_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY71_72_73
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY71_R1.fastq BBAY71_R2.fastq BBAY71_R1_Q20_P.fastq BBAY71_R1_Q20_UP.fastq BBAY71_R2_Q20_P.fastq BBAY71_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY72_R1.fastq BBAY72_R2.fastq BBAY72_R1_Q20_P.fastq BBAY72_R1_Q20_UP.fastq BBAY72_R2_Q20_P.fastq BBAY72_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY73_R1.fastq BBAY73_R2.fastq BBAY73_R1_Q20_P.fastq BBAY73_R1_Q20_UP.fastq BBAY73_R2_Q20_P.fastq BBAY73_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY74_75
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY74_R1.fastq BBAY74_R2.fastq BBAY74_R1_Q20_P.fastq BBAY74_R1_Q20_UP.fastq BBAY74_R2_Q20_P.fastq BBAY74_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY75_R1.fastq BBAY75_R2.fastq BBAY75_R1_Q20_P.fastq BBAY75_R1_Q20_UP.fastq BBAY75_R2_Q20_P.fastq BBAY75_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY77_78_79
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY77_R1.fastq BBAY77_R2.fastq BBAY77_R1_Q20_P.fastq BBAY77_R1_Q20_UP.fastq BBAY77_R2_Q20_P.fastq BBAY77_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY78_R1.fastq BBAY78_R2.fastq BBAY78_R1_Q20_P.fastq BBAY78_R1_Q20_UP.fastq BBAY78_R2_Q20_P.fastq BBAY78_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY79_R1.fastq BBAY79_R2.fastq BBAY79_R1_Q20_P.fastq BBAY79_R1_Q20_UP.fastq BBAY79_R2_Q20_P.fastq BBAY79_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY80_81_82
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY80_R1.fastq BBAY80_R2.fastq BBAY80_R1_Q20_P.fastq BBAY80_R1_Q20_UP.fastq BBAY80_R2_Q20_P.fastq BBAY80_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY81_R1.fastq BBAY81_R2.fastq BBAY81_R1_Q20_P.fastq BBAY81_R1_Q20_UP.fastq BBAY81_R2_Q20_P.fastq BBAY81_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY82_R1.fastq BBAY82_R2.fastq BBAY82_R1_Q20_P.fastq BBAY82_R1_Q20_UP.fastq BBAY82_R2_Q20_P.fastq BBAY82_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY83_84_85
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY83_R1.fastq BBAY83_R2.fastq BBAY83_R1_Q20_P.fastq BBAY83_R1_Q20_UP.fastq BBAY83_R2_Q20_P.fastq BBAY83_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY84_R1.fastq BBAY84_R2.fastq BBAY84_R1_Q20_P.fastq BBAY84_R1_Q20_UP.fastq BBAY84_R2_Q20_P.fastq BBAY84_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY85_R1.fastq BBAY85_R2.fastq BBAY85_R1_Q20_P.fastq BBAY85_R1_Q20_UP.fastq BBAY85_R2_Q20_P.fastq BBAY85_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY86_87
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY86_R1.fastq BBAY86_R2.fastq BBAY86_R1_Q20_P.fastq BBAY86_R1_Q20_UP.fastq BBAY86_R2_Q20_P.fastq BBAY86_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY87_R1.fastq BBAY87_R2.fastq BBAY87_R1_Q20_P.fastq BBAY87_R1_Q20_UP.fastq BBAY87_R2_Q20_P.fastq BBAY87_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY90_91
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY90_R1.fastq BBAY90_R2.fastq BBAY90_R1_Q20_P.fastq BBAY90_R1_Q20_UP.fastq BBAY90_R2_Q20_P.fastq BBAY90_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY91_R1.fastq BBAY91_R2.fastq BBAY91_R1_Q20_P.fastq BBAY91_R1_Q20_UP.fastq BBAY91_R2_Q20_P.fastq BBAY91_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50

cd /srv/scratch/z5039045/1_assembly/BBAY92_93_94
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY92_R1.fastq BBAY92_R2.fastq BBAY92_R1_Q20_P.fastq BBAY92_R1_Q20_UP.fastq BBAY92_R2_Q20_P.fastq BBAY92_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY93_R1.fastq BBAY93_R2.fastq BBAY93_R1_Q20_P.fastq BBAY93_R1_Q20_UP.fastq BBAY93_R2_Q20_P.fastq BBAY93_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50
java -jar /share/apps/trimmomatic/0.33/trimmomatic-0.33.jar PE BBAY94_R1.fastq BBAY94_R2.fastq BBAY94_R1_Q20_P.fastq BBAY94_R1_Q20_UP.fastq BBAY94_R2_Q20_P.fastq BBAY94_R2_Q20_UP.fastq ILLUMINACLIP:/share/apps/trimmomatic/0.33/adapters/TruSeq3-PE-2.fa:2:30:10:6:true LEADING:30 TRAILING:30 SLIDINGWINDOW:6:20 MINLEN:50




# run FastQC
cd /srv/scratch/z5039045/1_assembly
module load fastqc/0.10.1
fastqc BBAY65_66_67/BBAY65_R1_Q20_P.fastq BBAY65_66_67/BBAY65_R2_Q20_P.fastq
fastqc BBAY65_66_67/BBAY66_R1_Q20_P.fastq BBAY65_66_67/BBAY66_R2_Q20_P.fastq
fastqc BBAY65_66_67/BBAY67_R1_Q20_P.fastq BBAY65_66_67/BBAY67_R2_Q20_P.fastq
fastqc BBAY68_69_70/BBAY68_R1_Q20_P.fastq BBAY68_69_70/BBAY68_R2_Q20_P.fastq
fastqc BBAY68_69_70/BBAY69_R1_Q20_P.fastq BBAY68_69_70/BBAY69_R2_Q20_P.fastq
fastqc BBAY68_69_70/BBAY70_R1_Q20_P.fastq BBAY68_69_70/BBAY70_R2_Q20_P.fastq
fastqc BBAY71_72_73/BBAY71_R1_Q20_P.fastq BBAY71_72_73/BBAY71_R2_Q20_P.fastq
fastqc BBAY71_72_73/BBAY72_R1_Q20_P.fastq BBAY71_72_73/BBAY72_R2_Q20_P.fastq
fastqc BBAY71_72_73/BBAY73_R1_Q20_P.fastq BBAY71_72_73/BBAY73_R2_Q20_P.fastq
fastqc BBAY74_75/BBAY74_R1_Q20_P.fastq BBAY74_75/BBAY74_R2_Q20_P.fastq
fastqc BBAY74_75/BBAY75_R1_Q20_P.fastq BBAY74_75/BBAY75_R2_Q20_P.fastq
fastqc BBAY77_78_79/BBAY77_R1_Q20_P.fastq BBAY77_78_79/BBAY77_R2_Q20_P.fastq
fastqc BBAY77_78_79/BBAY78_R1_Q20_P.fastq BBAY77_78_79/BBAY78_R2_Q20_P.fastq
fastqc BBAY77_78_79/BBAY79_R1_Q20_P.fastq BBAY77_78_79/BBAY79_R2_Q20_P.fastq
fastqc BBAY80_81_82/BBAY80_R1_Q20_P.fastq BBAY80_81_82/BBAY80_R2_Q20_P.fastq
fastqc BBAY80_81_82/BBAY81_R1_Q20_P.fastq BBAY80_81_82/BBAY81_R2_Q20_P.fastq
fastqc BBAY80_81_82/BBAY82_R1_Q20_P.fastq BBAY80_81_82/BBAY82_R2_Q20_P.fastq
fastqc BBAY83_84_85/BBAY83_R1_Q20_P.fastq BBAY83_84_85/BBAY83_R2_Q20_P.fastq
fastqc BBAY83_84_85/BBAY84_R1_Q20_P.fastq BBAY83_84_85/BBAY84_R2_Q20_P.fastq
fastqc BBAY83_84_85/BBAY85_R1_Q20_P.fastq BBAY83_84_85/BBAY85_R2_Q20_P.fastq
fastqc BBAY86_87/BBAY86_R1_Q20_P.fastq BBAY86_87/BBAY86_R2_Q20_P.fastq
fastqc BBAY86_87/BBAY87_R1_Q20_P.fastq BBAY86_87/BBAY87_R2_Q20_P.fastq
fastqc BBAY90_91/BBAY90_R1_Q20_P.fastq BBAY90_91/BBAY90_R2_Q20_P.fastq
fastqc BBAY90_91/BBAY91_R1_Q20_P.fastq BBAY90_91/BBAY91_R2_Q20_P.fastq
fastqc BBAY92_93_94/BBAY92_R1_Q20_P.fastq BBAY92_93_94/BBAY92_R2_Q20_P.fastq
fastqc BBAY92_93_94/BBAY93_R1_Q20_P.fastq BBAY92_93_94/BBAY93_R2_Q20_P.fastq
fastqc BBAY92_93_94/BBAY94_R1.fastq BBAY92_93_94/BBAY94_R2.fastq
fastqc BBAY92_93_94/BBAY94_R1_Q20_P.fastq BBAY92_93_94/BBAY94_R2_Q20_P.fastq


BBAY65_66_67
fq2fa --merge BBAY66_R1_Q20_P.fastq BBAY66_R2_Q20_P.fastq BBAY66.fa
fq2fa --merge BBAY67_R1_Q20_P.fastq BBAY67_R2_Q20_P.fastq BBAY67.fa
fq2fa BBAY66_R1_Q20_P.fastq BBAY66_R1_Q20_P.fa
fq2fa BBAY66_R2_Q20_P.fastq BBAY66_R2_Q20_P.fa
fq2fa BBAY67_R1_Q20_P.fastq BBAY67_R1_Q20_P.fa
fq2fa BBAY67_R2_Q20_P.fastq BBAY67_R2_Q20_P.fa
cat BBAY65.fa BBAY66.fa BBAY67.fa > BBAY65_66_67.fa
cat BBAY65_R1_only_paired_in_1_line.fasta BBAY66_R1_Q20_P.fa BBAY67_R1_Q20_P.fa > BBAY65_66_67_R1.fa &
cat BBAY65_R2_only_paired_in_1_line.fasta BBAY66_R2_Q20_P.fa BBAY67_R2_Q20_P.fa > BBAY65_66_67_R2.fa &

BBAY68_69_70
cat BBAY68_R1_Q20_P.fastq BBAY69_R1_Q20_P.fastq BBAY70_R1_Q20_P.fastq > BBAY68_69_70_R1.fastq
cat BBAY68_R2_Q20_P.fastq BBAY69_R2_Q20_P.fastq BBAY70_R2_Q20_P.fastq > BBAY68_69_70_R2.fastq
fq2fa BBAY68_69_70_R1.fastq BBAY68_69_70_R1.fa
fq2fa BBAY68_69_70_R2.fastq BBAY68_69_70_R2.fa
fq2fa --merge BBAY68_69_70_R1.fastq BBAY68_69_70_R2.fastq BBAY68_69_70.fa

BBAY71_72_73
fq2fa --merge BBAY71_R1_Q20_P.fastq BBAY71_R2_Q20_P.fastq BBAY71.fa
fq2fa --merge BBAY73_R1_Q20_P.fastq BBAY73_R2_Q20_P.fastq BBAY73.fa
fq2fa BBAY71_R1_Q20_P.fastq BBAY71_R1_Q20_P.fa
fq2fa BBAY71_R2_Q20_P.fastq BBAY71_R2_Q20_P.fa
fq2fa BBAY73_R1_Q20_P.fastq BBAY73_R1_Q20_P.fa
fq2fa BBAY73_R2_Q20_P.fastq BBAY73_R2_Q20_P.fa
cat BBAY71.fa BBAY72.fa BBAY73.fa > BBAY71_72_73.fa &
cat BBAY71_R1_Q20_P.fa BBAY72_R1_replaced_only_paired_in_1_line.fasta BBAY73_R1_Q20_P.fa > BBAY71_72_73_R1.fa &
cat BBAY71_R2_Q20_P.fa BBAY72_R2_replaced_only_paired_in_1_line.fasta BBAY73_R2_Q20_P.fa > BBAY71_72_73_R2.fa &

BBAY74_75
cat BBAY74_R1_Q20_P.fastq BBAY75_R1_Q20_P.fastq > BBAY74_75_R1.fastq
cat BBAY74_R2_Q20_P.fastq BBAY75_R2_Q20_P.fastq > BBAY74_75_R2.fastq
fq2fa BBAY74_75_R1.fastq BBAY74_75_R1.fa
fq2fa BBAY74_75_R2.fastq BBAY74_75_R2.fa
fq2fa --merge BBAY74_75_R1.fastq BBAY74_75_R2.fastq BBAY74_75.fa

BBAY77_78_79 
cat BBAY77_R1_Q20_P.fastq BBAY78_R1_Q20_P.fastq BBAY79_R1_Q20_P.fastq > BBAY77_78_79_R1.fastq
cat BBAY77_R2_Q20_P.fastq BBAY78_R2_Q20_P.fastq BBAY79_R2_Q20_P.fastq > BBAY77_78_79_R2.fastq
fq2fa BBAY77_78_79_R1.fastq BBAY77_78_79_R1.fa
fq2fa BBAY77_78_79_R2.fastq BBAY77_78_79_R2.fa
fq2fa --merge BBAY77_78_79_R1.fastq BBAY77_78_79_R2.fastq BBAY77_78_79.fa

BBAY80_81_82
cat BBAY80_R1_Q20_P.fastq BBAY81_R1_Q20_P.fastq BBAY82_R1_Q20_P.fastq > BBAY80_81_82_R1.fastq
cat BBAY80_R2_Q20_P.fastq BBAY81_R2_Q20_P.fastq BBAY82_R2_Q20_P.fastq > BBAY80_81_82_R2.fastq
fq2fa BBAY80_81_82_R1.fastq BBAY80_81_82_R1.fa
fq2fa BBAY80_81_82_R2.fastq BBAY80_81_82_R2.fa
fq2fa --merge BBAY80_81_82_R1.fastq BBAY80_81_82_R2.fastq BBAY80_81_82.fa

BBAY83_84_85 
cat BBAY83_R1_Q20_P.fastq BBAY84_R1_Q20_P.fastq BBAY85_R1_Q20_P.fastq > BBAY83_84_85_R1.fastq
cat BBAY83_R2_Q20_P.fastq BBAY84_R2_Q20_P.fastq BBAY85_R2_Q20_P.fastq > BBAY83_84_85_R2.fastq
fq2fa BBAY83_84_85_R1.fastq BBAY83_84_85_R1.fa
fq2fa BBAY83_84_85_R2.fastq BBAY83_84_85_R2.fa
fq2fa --merge BBAY83_84_85_R1.fastq BBAY83_84_85_R2.fastq BBAY83_84_85.fa

BBAY86_87
cat BBAY86_R1_Q20_P.fastq BBAY87_R1_Q20_P.fastq > BBAY86_87_R1.fastq
cat BBAY86_R2_Q20_P.fastq BBAY87_R2_Q20_P.fastq > BBAY86_87_R2.fastq
fq2fa BBAY86_87_R1.fastq BBAY86_87_R1.fa
fq2fa BBAY86_87_R2.fastq BBAY86_87_R2.fa
fq2fa --merge BBAY86_87_R1.fastq BBAY86_87_R2.fastq BBAY86_87.fa

BBAY90_91 
cat BBAY90_R1_Q20_P.fastq BBAY91_R1_Q20_P.fastq > BBAY90_91_R1.fastq
cat BBAY90_R2_Q20_P.fastq BBAY91_R2_Q20_P.fastq > BBAY90_91_R2.fastq
fq2fa BBAY90_91_R1.fastq BBAY90_91_R1.fa
fq2fa BBAY90_91_R2.fastq BBAY90_91_R2.fa
fq2fa --merge BBAY90_91_R1.fastq BBAY90_91_R2.fastq BBAY90_91.fa

BBAY92_93_94
cat BBAY92_R1_Q20_P.fastq BBAY93_R1_Q20_P.fastq BBAY94_R1_Q20_P.fastq > BBAY92_93_94_R1.fastq
cat BBAY92_R2_Q20_P.fastq BBAY93_R2_Q20_P.fastq BBAY94_R2_Q20_P.fastq > BBAY92_93_94_R2.fastq
fq2fa BBAY92_93_94_R1.fastq BBAY92_93_94_R1.fa
fq2fa BBAY92_93_94_R2.fastq BBAY92_93_94_R2.fa
fq2fa --merge BBAY92_93_94_R1.fastq BBAY92_93_94_R2.fastq BBAY92_93_94.fa


# copy to Orange
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY65_66_67/BBAY65_66_67.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY68_69_70/BBAY68_69_70.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY71_72_73/BBAY71_72_73.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY74_75/BBAY74_75.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY77_78_79/BBAY77_78_79.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY80_81_82/BBAY80_81_82.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY83_84_85/BBAY83_84_85.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY86_87/BBAY86_87.fa.gz /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY90_91/BBAY90_91.fa /projects/du5/willis/assembly
scp z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY92_93_94/BBAY92_93_94.fa.gz /projects/du5/willis/assembly


# copy file to Raijin
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY68_69_70/BBAY68_69_70.fa.gz /short/du5/wzs561
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY71_72_73/BBAY71_72_73.fa.gz /short/du5/wzs561
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY74_75/BBAY74_75.fa.gz /short/du5/wzs561
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY77_78_79/BBAY77_78_79.fa.gz /short/du5/wzs561
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY83_84_85/BBAY83_84_85.fa.gz /short/du5/wzs561
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY86_87/BBAY86_87.fa.gz /short/du5/wzs561
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY90_91/BBAY90_91.fa /short/du5/wzs561
rsync -avPS z5039045@kdm.science.unsw.edu.au:/srv/scratch/z5039045/1_assembly/BBAY92_93_94/BBAY92_93_94.fa.gz /short/du5/wzs561


# idba_ud


# get_fasta_stats
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY65_66_67_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY65_66_67_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY68_69_70_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY68_69_70_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY71_72_73_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY71_72_73_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY74_75_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY74_75_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY77_78_79_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY77_78_79_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY80_81_82_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY80_81_82_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY83_84_85_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY83_84_85_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY86_87_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY86_87_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY90_91_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY90_91_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/select_contig.pl -m 2500 /short/du5/wzs561/scaffolds/BBAY92_93_94_K20-100_scaffold.fa /short/du5/wzs561/scaffolds/BBAY92_93_94_K20-100_scaffold_lt2500.fa
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 5000 BBAY83_84_85_K20-100_scaffold_lt2500.fa BBAY83_84_85_K20-100_scaffold_lt5000.fa 
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 3000 BBAY83_84_85_K20-100_scaffold_lt2500.fa BBAY83_84_85_K20-100_scaffold_lt3000.fa 
perl /srv/scratch/z5039045/Scripts/select_contig.pl -m 3500 BBAY83_84_85_K20-100_scaffold_lt2500.fa BBAY83_84_85_K20-100_scaffold_lt3500.fa 

# get fasta statistics
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY65_66_67_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY68_69_70_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY71_72_73_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY74_75_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY77_78_79_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY80_81_82_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY83_84_85_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY86_87_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY90_91_K20-100_scaffold_lt2500.fa
perl /short/du5/wzs561/Scripts/get_fasta_stats.pl -T /short/du5/wzs561/scaffolds/BBAY92_93_94_K20-100_scaffold_lt2500.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T BBAY83_84_85_K20-100_scaffold_lt5000.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T BBAY83_84_85_K20-100_scaffold_lt3000.fa
perl /srv/scratch/z5039045/Scripts/get_fasta_stats.pl -T BBAY83_84_85_K20-100_scaffold_lt3500.fa


# BBAY65_66_67_K20-100_scaffold_lt2500.fa
Number of Contigs=35747, Total bp=324548909, Shortest=2500, Longest=546104, Average length=9079.1, Average GC%=45.4%, Non-ACGT bases=3061
# BBAY68_69_70_K20-100_scaffold_lt2500.fa
Number of Contigs=80138, Total bp=612627648, Shortest=2500, Longest=576506, Average length=7644.7, Average GC%=43.7%, Non-ACGT bases=19052
# BBAY71_72_73_K20-100_scaffold_lt2500.fa
Number of Contigs=72335, Total bp=510424071, Shortest=2500, Longest=606799, Average length=7056.4, Average GC%=42.9%, Non-ACGT bases=6752
# BBAY74_75_K20-100_scaffold_lt2500.fa
Number of Contigs=65237, Total bp=440446680, Shortest=2500, Longest=353188, Average length=6751.5, Average GC%=41.5%, Non-ACGT bases=52061  	 
# BBAY77_78_79_K20-100_scaffold_lt2500.fa
Number of Contigs=85414, Total bp=551074632, Shortest=2500, Longest=1167332, Average length=6451.8, Average GC%=43.5%, Non-ACGT bases=55520
# BBAY80_81_82_K20-100_scaffold_lt2500.fa
Number of Contigs=46692, Total bp=288529080, Shortest=2500, Longest=605816, Average length=6179.4, Average GC%=46.8%, Non-ACGT bases=27701
# BBAY83_84_85_K20-100_scaffold_lt2500.fa
Number of Contigs=67469, Total bp=494739511, Shortest=2500, Longest=759897, Average length=7332.8, Average GC%=46.9%, Non-ACGT bases=20330
# BBAY83_84_85_K20-100_scaffold_lt3000.fa
Number of Contigs=53158, Total bp=455666647, Shortest=3000, Longest=759897, Average length=8571.9, Average GC%=46.9%, Non-ACGT bases=18682
# BBAY83_84_85_K20-100_scaffold_lt3500.fa
Number of Contigs=43681, Total bp=425021115, Shortest=3500, Longest=759897, Average length=9730.1, Average GC%=47.0%, Non-ACGT bases=17377
# BBAY83_84_85_K20-100_scaffold_lt5000.fa
Number of Contigs=28083, Total bp=360316791, Shortest=5000, Longest=759897, Average length=12830.4, Average GC%=47.1%, Non-ACGT bases=13449
# BBAY86_87_K20-100_scaffold_lt2500.fa
Number of Contigs=59718, Total bp=403751663, Shortest=2500, Longest=217167, Average length=6761.0, Average GC%=43.2%, Non-ACGT bases=3493
# BBAY90_91_K20-100_scaffold_lt2500.fa
Number of Contigs=10566, Total bp=56439395, Shortest=2500, Longest=194087, Average length=5341.6, Average GC%=45.5%, Non-ACGT bases=495
# BBAY92_93_94_K20-100_scaffold_lt2500.fa
Number of Contigs=50720, Total bp=332796883, Shortest=2500, Longest=324500, Average length=6561.5, Average GC%=41.1%, Non-ACGT bases=564


# copy assemblies to Katana
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY65_66_67_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY68_69_70_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY71_72_73_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY74_75_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY77_78_79_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY80_81_82_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY83_84_85_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY86_87_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY90_91_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning
scp wzs561@raijin.nci.org.au:/short/du5/wzs561/scaffolds/BBAY92_93_94_K20-100_scaffold_lt2500.fa /srv/scratch/z5039045/2_binning


# run mapping 
module load bowtie/2.2.9
module load samtools/1.2
module load metabat/0.32.4

# index
cd /srv/scratch/z5039045/2_binning/index
bowtie2-build -f ../BBAY65_66_67_K20-100_scaffold_lt2500.fa BBAY65_66_67_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY68_69_70_K20-100_scaffold_lt2500.fa BBAY68_69_70_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY71_72_73_K20-100_scaffold_lt2500.fa BBAY71_72_73_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY74_75_K20-100_scaffold_lt2500.fa BBAY74_75_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY77_78_79_K20-100_scaffold_lt2500.fa BBAY77_78_79_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY80_81_82_K20-100_scaffold_lt2500.fa BBAY80_81_82_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY83_84_85_K20-100_scaffold_lt2500.fa BBAY83_84_85_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY86_87_K20-100_scaffold_lt2500.fa BBAY86_87_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY90_91_K20-100_scaffold_lt2500.fa BBAY90_91_K20-100_scaffold_lt2500
bowtie2-build -f ../BBAY92_93_94_K20-100_scaffold_lt2500.fa BBAY92_93_94_K20-100_scaffold_lt2500
bowtie2-build -f BBAY83_84_85_K20-100_scaffold_lt5000.fa BBAY83_84_85_K20-100_scaffold_lt5000
bowtie2-build -f BBAY83_84_85_K20-100_scaffold_lt3000.fa BBAY83_84_85_K20-100_scaffold_lt3000

# mapping
cd /srv/scratch/z5039045/2_binning/mapping
bowtie2 -x ../index/BBAY65_66_67_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY65_R1_only_paired_in_1_line.fasta.gz -2 ../../1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY65_R2_only_paired_in_1_line.fasta.gz -S BBAY65.sam -p 6 -f
bowtie2 -x ../index/BBAY65_66_67_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY66_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY66_R2_Q20_P.fastq.gz -S BBAY66.sam -p 6 -q
bowtie2 -x ../index/BBAY65_66_67_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY67_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY67_R2_Q20_P.fastq.gz -S BBAY67.sam -p 6 -q 
bowtie2 -x ../index/BBAY68_69_70_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY68_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY68_R2_Q20_P.fastq.gz -S BBAY68.sam -p 6 -q
bowtie2 -x ../index/BBAY68_69_70_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY69_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY69_R2_Q20_P.fastq.gz -S BBAY69.sam -p 6 -q
bowtie2 -x ../index/BBAY68_69_70_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY70_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY70_R2_Q20_P.fastq.gz -S BBAY70.sam -p 6 -q
bowtie2 -x ../index/BBAY71_72_73_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY71_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY71_R2_Q20_P.fastq.gz -S BBAY71.sam -p 6 -q
bowtie2 -x ../index/BBAY71_72_73_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY72_R1_replaced_only_paired_in_1_line.fasta.gz -2 ../../1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY72_R2_replaced_only_paired_in_1_line.fasta.gz -S BBAY72.sam -p 6 -f
bowtie2 -x ../index/BBAY71_72_73_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY73_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY73_R2_Q20_P.fastq.gz -S BBAY73.sam -p 6 -q
bowtie2 -x ../index/BBAY74_75_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY74_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY74_R2_Q20_P.fastq.gz -S BBAY74.sam -p 6 -q
bowtie2 -x ../index/BBAY74_75_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY75_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY75_R2_Q20_P.fastq.gz -S BBAY75.sam -p 6 -q
bowtie2 -x ../index/BBAY77_78_79_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY77_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY77_R2_Q20_P.fastq.gz -S BBAY77.sam -p 6 -q
bowtie2 -x ../index/BBAY77_78_79_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY78_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY78_R2_Q20_P.fastq.gz -S BBAY78.sam -p 6 -q
bowtie2 -x ../index/BBAY77_78_79_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY79_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY79_R2_Q20_P.fastq.gz -S BBAY79.sam -p 6 -q
bowtie2 -x ../index/BBAY80_81_82_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY80_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY80_R2_Q20_P.fastq.gz -S BBAY80.sam -p 6 -q
bowtie2 -x ../index/BBAY80_81_82_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY81_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY81_R2_Q20_P.fastq.gz -S BBAY81.sam -p 6 -q
bowtie2 -x ../index/BBAY80_81_82_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY82_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY82_R2_Q20_P.fastq.gz -S BBAY82.sam -p 6 -q
bowtie2 -x ../index/BBAY83_84_85_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY83_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY83_R2_Q20_P.fastq.gz -S BBAY83.sam -p 6 -q
bowtie2 -x ../index/BBAY83_84_85_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY84_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY84_R2_Q20_P.fastq.gz -S BBAY84.sam -p 6 -q
bowtie2 -x ../index/BBAY83_84_85_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY85_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY85_R2_Q20_P.fastq.gz -S BBAY85.sam -p 6 -q
bowtie2 -x ../index/BBAY86_87_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY86_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY86_R2_Q20_P.fastq.gz -S BBAY86.sam -p 6 -q
bowtie2 -x ../index/BBAY86_87_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY87_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY87_R2_Q20_P.fastq.gz -S BBAY87.sam -p 6 -q
bowtie2 -x ../index/BBAY90_91_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY90_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY90_R2_Q20_P.fastq.gz -S BBAY90.sam -p 6 -q
bowtie2 -x ../index/BBAY90_91_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY91_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY91_R2_Q20_P.fastq.gz -S BBAY91.sam -p 6 -q
bowtie2 -x ../index/BBAY92_93_94_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY92_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY92_R2_Q20_P.fastq.gz -S BBAY92.sam -p 6 -q
bowtie2 -x ../index/BBAY92_93_94_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY93_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY93_R2_Q20_P.fastq.gz -S BBAY93.sam -p 6 -q
bowtie2 -x ../index/BBAY92_93_94_K20-100_scaffold_lt2500 -1 ../../1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY94_R1_Q20_P.fastq.gz -2 ../../1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY94_R2_Q20_P.fastq.gz -S BBAY94.sam -p 6 -q

bowtie2 -x BBAY83_84_85_K20-100_scaffold_lt5000 -1 BBAY83_R1_Q20_P.fastq.gz -2 BBAY83_R2_Q20_P.fastq.gz -S BBAY83.sam -p 6 -q &
bowtie2 -x BBAY83_84_85_K20-100_scaffold_lt5000 -1 BBAY84_R1_Q20_P.fastq.gz -2 BBAY84_R2_Q20_P.fastq.gz -S BBAY84.sam -p 6 -q &
bowtie2 -x BBAY83_84_85_K20-100_scaffold_lt5000 -1 BBAY85_R1_Q20_P.fastq.gz -2 BBAY85_R2_Q20_P.fastq.gz -S BBAY85.sam -p 6 -q &



# sam to bam
samtools view -bS BBAY65.sam -o BBAY65.bam
samtools view -bS BBAY66.sam -o BBAY66.bam
samtools view -bS BBAY67.sam -o BBAY67.bam
samtools view -bS BBAY68.sam -o BBAY68.bam
samtools view -bS BBAY69.sam -o BBAY69.bam
samtools view -bS BBAY70.sam -o BBAY70.bam
samtools view -bS BBAY71.sam -o BBAY71.bam
samtools view -bS BBAY72.sam -o BBAY72.bam
samtools view -bS BBAY73.sam -o BBAY73.bam
samtools view -bS BBAY74.sam -o BBAY74.bam
samtools view -bS BBAY75.sam -o BBAY75.bam
samtools view -bS BBAY77.sam -o BBAY77.bam
samtools view -bS BBAY78.sam -o BBAY78.bam
samtools view -bS BBAY79.sam -o BBAY79.bam
samtools view -bS BBAY80.sam -o BBAY80.bam
samtools view -bS BBAY81.sam -o BBAY81.bam
samtools view -bS BBAY82.sam -o BBAY82.bam
samtools view -bS BBAY83.sam -o BBAY83.bam
samtools view -bS BBAY84.sam -o BBAY84.bam
samtools view -bS BBAY85.sam -o BBAY85.bam
samtools view -bS BBAY86.sam -o BBAY86.bam
samtools view -bS BBAY87.sam -o BBAY87.bam
samtools view -bS BBAY90.sam -o BBAY90.bam
samtools view -bS BBAY91.sam -o BBAY91.bam
samtools view -bS BBAY92.sam -o BBAY92.bam
samtools view -bS BBAY93.sam -o BBAY93.bam
samtools view -bS BBAY94.sam -o BBAY94.bam

# sort
samtools sort BBAY65.bam BBAY65_sorted
samtools sort BBAY66.bam BBAY66_sorted
samtools sort BBAY67.bam BBAY67_sorted
samtools sort BBAY68.bam BBAY68_sorted
samtools sort BBAY69.bam BBAY69_sorted
samtools sort BBAY70.bam BBAY70_sorted
samtools sort BBAY71.bam BBAY71_sorted
samtools sort BBAY72.bam BBAY72_sorted
samtools sort BBAY73.bam BBAY73_sorted
samtools sort BBAY74.bam BBAY74_sorted
samtools sort BBAY75.bam BBAY75_sorted
samtools sort BBAY77.bam BBAY77_sorted
samtools sort BBAY78.bam BBAY78_sorted
samtools sort BBAY79.bam BBAY79_sorted
samtools sort BBAY80.bam BBAY80_sorted
samtools sort BBAY81.bam BBAY81_sorted
samtools sort BBAY82.bam BBAY82_sorted
samtools sort BBAY83.bam BBAY83_sorted
samtools sort BBAY84.bam BBAY84_sorted
samtools sort BBAY85.bam BBAY85_sorted
samtools sort BBAY86.bam BBAY86_sorted
samtools sort BBAY87.bam BBAY87_sorted
samtools sort BBAY90.bam BBAY90_sorted
samtools sort BBAY91.bam BBAY91_sorted
samtools sort BBAY92.bam BBAY92_sorted
samtools sort BBAY93.bam BBAY93_sorted
samtools sort BBAY94.bam BBAY94_sorted

# index sorted bam file
samtools index BBAY65_sorted.bam
samtools index BBAY66_sorted.bam
samtools index BBAY67_sorted.bam
samtools index BBAY68_sorted.bam
samtools index BBAY69_sorted.bam
samtools index BBAY70_sorted.bam
samtools index BBAY71_sorted.bam
samtools index BBAY72_sorted.bam
samtools index BBAY73_sorted.bam
samtools index BBAY74_sorted.bam
samtools index BBAY75_sorted.bam
samtools index BBAY77_sorted.bam
samtools index BBAY78_sorted.bam
samtools index BBAY79_sorted.bam
samtools index BBAY80_sorted.bam
samtools index BBAY81_sorted.bam
samtools index BBAY82_sorted.bam
samtools index BBAY83_sorted.bam
samtools index BBAY84_sorted.bam
samtools index BBAY85_sorted.bam
samtools index BBAY86_sorted.bam
samtools index BBAY87_sorted.bam
samtools index BBAY90_sorted.bam
samtools index BBAY91_sorted.bam
samtools index BBAY92_sorted.bam
samtools index BBAY93_sorted.bam
samtools index BBAY94_sorted.bam

# get depth file
module load metabat/0.32.4
jgi_summarize_bam_contig_depths --outputDepth BBAY65_66_67_depth.txt --pairedContigs BBAY65_66_67_paired.txt BBAY65_sorted.bam BBAY66_sorted.bam BBAY67_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY68_69_70_depth.txt --pairedContigs BBAY68_69_70_paired.txt BBAY68_sorted.bam BBAY69_sorted.bam BBAY70_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY71_72_73_depth.txt --pairedContigs BBAY71_72_73_paired.txt BBAY71_sorted.bam BBAY72_sorted.bam BBAY73_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY74_75_depth.txt --pairedContigs BBAY74_75_paired.txt BBAY74_sorted.bam BBAY75_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY77_78_79_depth.txt --pairedContigs BBAY77_78_79_paired.txt BBAY77_sorted.bam BBAY78_sorted.bam BBAY79_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY80_81_82_depth.txt --pairedContigs BBAY80_81_82_paired.txt BBAY80_sorted.bam BBAY81_sorted.bam BBAY82_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY83_84_85_depth.txt --pairedContigs BBAY83_84_85_paired.txt BBAY83_sorted.bam BBAY84_sorted.bam BBAY85_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY86_87_depth.txt --pairedContigs BBAY86_87_paired.txt BBAY86_sorted.bam BBAY87_sorted.bam 
jgi_summarize_bam_contig_depths --outputDepth BBAY90_91_depth.txt --pairedContigs BBAY90_91_paired.txt BBAY90_sorted.bam BBAY91_sorted.bam
jgi_summarize_bam_contig_depths --outputDepth BBAY92_93_94_depth.txt --pairedContigs BBAY92_93_94_paired.txt BBAY92_sorted.bam BBAY93_sorted.bam BBAY94_sorted.bam

jgi_summarize_bam_contig_depths --outputDepth BBAY83_84_85_depth.txt --pairedContigs BBAY83_84_85_paired.txt BBAY83_sorted.bam BBAY84_sorted.bam BBAY85_sorted.bam

# run MetaBAT
module load metabat/0.32.4
cd /srv/scratch/z5039045/2_binning/binning_MetaBAT
metabat -i ../BBAY65_66_67_K20-100_scaffold_lt2500.fa -a ../depth/BBAY65_66_67_depth.txt -p ../depth/BBAY65_66_67_paired.txt -o UA_MetaBAT/UA
metabat -i ../BBAY68_69_70_K20-100_scaffold_lt2500.fa -a ../depth/BBAY68_69_70_depth.txt -p ../depth/BBAY68_69_70_paired.txt -o CF_MetaBAT/CF
metabat -i ../BBAY71_72_73_K20-100_scaffold_lt2500.fa -a ../depth/BBAY71_72_73_depth.txt -p ../depth/BBAY71_72_73_paired.txt -o DP_MetaBAT/DP
metabat -i ../BBAY74_75_K20-100_scaffold_lt2500.fa -a ../depth/BBAY74_75_depth.txt -p ../depth/BBAY74_75_paired.txt -o AA_MetaBAT/AA
metabat -i ../BBAY77_78_79_K20-100_scaffold_lt2500.fa -a ../depth/BBAY77_78_79_depth.txt -p ../depth/BBAY77_78_79_paired.txt -o PC_MetaBAT/PC
metabat -i ../BBAY80_81_82_K20-100_scaffold_lt2500.fa -a ../depth/BBAY80_81_82_depth.txt -p ../depth/BBAY80_81_82_paired.txt -o ER_MetaBAT/ER
metabat -i ../BBAY83_84_85_K20-100_scaffold_lt2500.fa -a ../depth/BBAY83_84_85_depth.txt -p ../depth/BBAY83_84_85_paired.txt -o HO_MetaBAT/HO
metabat -i ../BBAY86_87_K20-100_scaffold_lt2500.fa -a ../depth/BBAY86_87_depth.txt -p ../depth/BBAY86_87_paired.txt -o PA_MetaBAT/PA
metabat -i ../BBAY90_91_K20-100_scaffold_lt2500.fa -a ../depth/BBAY90_91_depth.txt -p ../depth/BBAY90_91_paired.txt -o RC_MetaBAT/RC
metabat -i ../BBAY92_93_94_K20-100_scaffold_lt2500.fa -a ../depth/BBAY92_93_94_depth.txt -p ../depth/BBAY92_93_94_paired.txt -o WT_MetaBAT/WT

metabat -i ../BBAY86_87_K20-100_scaffold_lt2500.fa -a ../depth/BBAY86_87_depth.txt -p ../depth/BBAY86_87_paired.txt -o PA_MetaBAT/PA --superspecific &
metabat -i ../BBAY74_75_K20-100_scaffold_lt2500.fa -a ../depth/BBAY74_75_depth.txt -p ../depth/BBAY74_75_paired.txt -o AA_MetaBAT/AA --superspecific &



metabat -i ../BBAY65_66_67_K20-100_scaffold_lt2500.fa -a ../depth/BBAY65_66_67_depth.txt -p ../depth/BBAY65_66_67_paired.txt -o UA_MetaBAT/UA --superspecific
metabat -i ../BBAY68_69_70_K20-100_scaffold_lt2500.fa -a ../depth/BBAY68_69_70_depth.txt -p ../depth/BBAY68_69_70_paired.txt -o CF_MetaBAT/CF --superspecific
metabat -i ../BBAY71_72_73_K20-100_scaffold_lt2500.fa -a ../depth/BBAY71_72_73_depth.txt -p ../depth/BBAY71_72_73_paired.txt -o DP_MetaBAT/DP --superspecific
metabat -i ../BBAY77_78_79_K20-100_scaffold_lt2500.fa -a ../depth/BBAY77_78_79_depth.txt -p ../depth/BBAY77_78_79_paired.txt -o PC_MetaBAT/PC --superspecific
metabat -i ../BBAY80_81_82_K20-100_scaffold_lt2500.fa -a ../depth/BBAY80_81_82_depth.txt -p ../depth/BBAY80_81_82_paired.txt -o ER_MetaBAT/ER --superspecific
metabat -i ../BBAY83_84_85_K20-100_scaffold_lt2500.fa -a ../depth/BBAY83_84_85_depth.txt -p ../depth/BBAY83_84_85_paired.txt -o HO_MetaBAT/HO --superspecific
metabat -i ../BBAY90_91_K20-100_scaffold_lt2500.fa -a ../depth/BBAY90_91_depth.txt -p ../depth/BBAY90_91_paired.txt -o RC_MetaBAT/RC --superspecific
metabat -i ../BBAY92_93_94_K20-100_scaffold_lt2500.fa -a ../depth/BBAY92_93_94_depth.txt -p ../depth/BBAY92_93_94_paired.txt -o WT_MetaBAT/WT --superspecific

metabat -i BBAY83_84_85_K20-100_scaffold_lt5000.fa -a BBAY83_84_85_depth.txt -p BBAY83_84_85_paired.txt -o HO --superspecific



# run MyCC
module unload intel/11.1.080
module load intel/16.0.1.150
module load perl/5.20.1
module load python/2.7.10
module load cd-hit/4.6.4
module load prodigal/2.6.3
module load parallel/20160222
module load hmmer/3.1b2
module load barrnap/0.7
module load mycc/20150710
cd /srv/scratch/z5039045/2_binning/binning_MyCC/UA_MyCC
MyCC.py ../../BBAY65_66_67_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY65_66_67_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/CF_MyCC
MyCC.py ../../BBAY68_69_70_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY68_69_70_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/DP_MyCC
MyCC.py ../../BBAY71_72_73_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY71_72_73_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/AA_MyCC
MyCC.py ../../BBAY74_75_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY74_75_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/PC_MyCC
MyCC.py ../../BBAY77_78_79_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY77_78_79_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/ER_MyCC
MyCC.py ../../BBAY80_81_82_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY80_81_82_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/HO_MyCC
MyCC.py ../../BBAY83_84_85_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY83_84_85_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/PA_MyCC
MyCC.py ../../BBAY86_87_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY86_87_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/RC_MyCC
MyCC.py ../../BBAY90_91_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY90_91_depth.txt 56mer
cd /srv/scratch/z5039045/2_binning/binning_MyCC/WT_MyCC
MyCC.py ../../BBAY92_93_94_K20-100_scaffold_lt2500.fa -a ../../depth/BBAY92_93_94_depth.txt 56mer

MyCC.py BBAY83_84_85_K20-100_scaffold_lt5000.fa -a BBAY83_84_85_depth.txt 56mer



# run Binning_refiner
module load R/3.2.2
module load python/3.4.3
cd /srv/scratch/z5039045/2_binning/bins/UA
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 UA_MetaBAT -2 UA_MyCC
cd /srv/scratch/z5039045/2_binning/bins/RC
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 RC_MetaBAT -2 RC_MyCC
cd /srv/scratch/z5039045/2_binning/bins/ER
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 ER_MetaBAT -2 ER_MyCC
cd /srv/scratch/z5039045/2_binning/bins/WT
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 WT_MetaBAT -2 WT_MyCC
cd /srv/scratch/z5039045/2_binning/bins/AA
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 AA_MetaBAT -2 AA_MyCC
cd /srv/scratch/z5039045/2_binning/bins/AAss
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 MetaBAT -r outputs/Refined -pbs -qsub

cd /srv/scratch/z5039045/2_binning/bins/CF
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 CF_MetaBAT -2 CF_MyCC
cd /srv/scratch/z5039045/2_binning/bins/DP
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 DP_MetaBAT -2 DP_MyCC
cd /srv/scratch/z5039045/2_binning/bins/HO
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 HO_MetaBAT -2 HO_MyCC
cd /srv/scratch/z5039045/2_binning/bins/PA
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 PA_MetaBAT -2 PA_MyCC
cd /srv/scratch/z5039045/2_binning/bins/PAss
python3 /srv/scratch/z5039045/Binning_refiner/Binning_refiner.py -1 MetaBAT -2 MyCC
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 MetaBAT -r outputs/Refined -pbs -qsub
cd /srv/scratch/z5039045/2_binning/bins/PCss


# run CheckM_runner.py
module load R/3.2.2
module load python/3.4.3
# cd /srv/scratch/z5039045/2_binning/bins/AAss
# cd /srv/scratch/z5039045/2_binning/bins/UAss
# cd /srv/scratch/z5039045/2_binning/bins/RCss
# cd /srv/scratch/z5039045/2_binning/bins/ERss
# cd /srv/scratch/z5039045/2_binning/bins/WTss
# cd /srv/scratch/z5039045/2_binning/bins/CFss
# cd /srv/scratch/z5039045/2_binning/bins/DPss
# cd /srv/scratch/z5039045/2_binning/bins/PCss
# cd /srv/scratch/z5039045/2_binning/bins/PAss
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 MetaBAT -2 MyCC -pbs -qsub

python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -r outputs/Refined -pbs -qsub
python3 /srv/scratch/z5039045/Binning_refiner/CheckM_runner.py -1 MetaBAT -2 MyCC -r outputs/Refined -pbs -qsub


# run Get_statistics.py
module load R/3.2.2
module load python/3.4.3
cd /srv/scratch/z5039045/2_binning/bins/UAss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/RCss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/ERss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/WTss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/AAss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/CFss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/DPss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/PAss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/HOss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20
cd /srv/scratch/z5039045/2_binning/bins/PCss
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 10
python3 /srv/scratch/z5039045/Binning_refiner/Get_statistics.py -1 MetaBAT -2 MyCC -r outputs/Refined -contamination_free_bin_completeness_cutoff 20


# fix_assembly_errors
module load python/3.4.3
module load shrinksam/0.9.0
module load velvet/1.2.10
module load bowtie/2.2.9 

# copy reads files to working directory
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY66_R1_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY66_R1_Q20_P.fastq.gz

cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY66_R2_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY66_R2_Q20_P.fastq.gz

cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY67_R1_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY67_R1_Q20_P.fastq.gz

cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY67_R2_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY67_R2_Q20_P.fastq.gz

cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY71_R1_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY71_R1_Q20_P.fastq.gz

cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY71_R2_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY71_R2_Q20_P.fastq.gz

cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY73_R1_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY73_R1_Q20_P.fastq.gz

cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY73_R2_Q20_P.fastq.gz /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files
gunzip /srv/scratch/z5039045/3_fix_assemble_errors/Reads_files/BBAY73_R2_Q20_P.fastq.gz

cat BBAY66_R1_Q20_P.fastq BBAY67_R1_Q20_P.fastq > BBAY66_67_R1.fastq
gzip BBAY66_67_R1.fastq
cat BBAY66_R2_Q20_P.fastq BBAY67_R2_Q20_P.fastq > BBAY66_67_R2.fastq
gzip BBAY66_67_R2.fastq
cat BBAY71_R1_Q20_P.fastq BBAY73_R1_Q20_P.fastq > BBAY71_73_R1.fastq 
gzip BBAY71_73_R1.fastq 
cat BBAY71_R2_Q20_P.fastq BBAY73_R2_Q20_P.fastq > BBAY71_73_R2.fastq 
gzip BBAY71_73_R2.fastq
  

cp -r /srv/scratch/z5039045/2_binning/bins/AAss/outputs/AA_10/Refined_contamination_free_bins_AA /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/CFss/outputs/CF_10/Refined_contamination_free_bins_CF /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/DPss/outputs/DP_10/Refined_contamination_free_bins_DP /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/ERss/outputs/ER_10/Refined_contamination_free_bins_ER /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/PAss/outputs/PA_10/Refined_contamination_free_bins_PA /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/RCss/outputs/RC_10/Refined_contamination_free_bins_RC /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/UAss/outputs/UA_10/Refined_contamination_free_bins_UA /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/WTss/outputs/WT_10/Refined_contamination_free_bins_WT /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/PCss/outputs/PC_10/Refined_contamination_free_bins_PC /srv/scratch/z5039045/3_fix_assemble_errors
cp -r /srv/scratch/z5039045/2_binning/bins/HOss/outputs/HO_10/Refined_contamination_free_bins_HO /srv/scratch/z5039045/3_fix_assemble_errors

# run ra2.py (have wrote a script to do this)
cd /srv/scratch/z5039045/3_fix_assemble_errors 
python3 /srv/scratch/z5039045/Softwares/fix_assembly_errors/bin/ra2.py -i Refined_cf_bins_AA/AA_Refined_3.fasta -1 Reads_files/BBAY74_75_R1.fastq -2 Reads_files/BBAY74_75_R2.fastq -m 2 -c 2 --break -t 12
python3 /srv/scratch/z5039045/Softwares/fix_assembly_errors/bin/ra2.py -i Refined_cf_bins_ER/ER_Refined_15.fasta -1 Reads_files/BBAY80_81_82_R1.fastq.gz -2 Reads_files/BBAY80_81_82_R2.fastq.gz -m 2 -c 2 --break -t 12
# test with AA_Refined_3.fasta
# run ra2.py
python3 /srv/scratch/z5039045/Softwares/fix_assembly_errors/bin/ra2.py -i Refined_cf_bins_AA/AA_Refined_3.fasta -1 Reads_files/BBAY74_75_R1.fastq -2 Reads_files/BBAY74_75_R2.fastq -m 2 -c 2 --break -t 12
# clean up ra2.py output
python3 /srv/scratch/z5039045/Softwares/fix_assembly_errors/bin/fix_fasta.py re_assembled.fa | python3 /srv/scratch/z5039045/Softwares/fix_assembly_errors/bin/nr_fasta.py rename - > AA_Refined_3_curated.fasta


# run Phylosift
/srv/scratch/z5039045/Softwares/phylosift_v1.0.1/bin/phylosift 
/srv/scratch/z5039045/Softwares/phylosift_v1.0.1/bin/phylosift all --output=/srv/scratch/z5039045/4_phylosift/AA_Refined_3_curated_lt2500 /srv/scratch/z5039045/4_phylosift/curated_bins/AA_Refined_3_curated_lt2500.fasta
/srv/scratch/z5039045/Softwares/phylosift_v1.0.1/bin/phylosift all --output=/srv/scratch/z5039045/4_phylosift/AA_Refined_113_curated_lt2500 /srv/scratch/z5039045/4_phylosift/curated_bins/AA_Refined_113_curated_lt2500.fasta

# process Phylosift outputs (write a script to do this)


# backup files
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY65_R1_only_paired_in_1_line.fasta.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY65_R2_only_paired_in_1_line.fasta.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY66_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY66_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY67_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/Raw_reads_BBAY65_66_67/BBAY67_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY68_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY69_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY70_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY68_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY69_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/Raw_reads_BBAY68_69_70/BBAY70_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY72_R1_replaced_only_paired_in_1_line.fasta.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY72_R2_replaced_only_paired_in_1_line.fasta.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY71_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY73_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY71_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/Raw_reads_BBAY71_72_73/BBAY73_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY74_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY74_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY75_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY74_75/Raw_reads_BBAY74_75/BBAY75_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY77_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY78_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY79_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY77_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY78_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/Raw_reads_BBAY77_78_79/BBAY79_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY80_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY81_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY82_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY80_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY81_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/Raw_reads_BBAY80_81_82/BBAY82_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY83_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY84_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY85_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY83_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY84_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/Raw_reads_BBAY83_84_85/BBAY85_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY86_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY86_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY87_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY86_87/Raw_reads_BBAY86_87/BBAY87_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY90_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY90_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY91_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY90_91/Raw_reads_BBAY90_91/BBAY91_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY92_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY93_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY94_R1_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY92_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY93_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &  
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/Raw_reads_BBAY92_93_94/BBAY94_R2_Q20_P.fastq.gz /home/z5039045/torsten/Weizhi_Song/BBAY_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/BBAY65_66_67.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/BBAY65_66_67_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY65_66_67/BBAY65_66_67_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/BBAY68_69_70.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/BBAY68_69_70_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY68_69_70/BBAY68_69_70_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/BBAY71_72_73.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/BBAY71_72_73_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY71_72_73/BBAY71_72_73_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY74_75/BBAY74_75.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY74_75/BBAY74_75_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY74_75/BBAY74_75_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/BBAY77_78_79.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/BBAY77_78_79_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY77_78_79/BBAY77_78_79_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/BBAY80_81_82.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/BBAY80_81_82_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY80_81_82/BBAY80_81_82_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/BBAY83_84_85.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/BBAY83_84_85_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY83_84_85/BBAY83_84_85_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY86_87/BBAY86_87.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY86_87/BBAY86_87_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY86_87/BBAY86_87_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY90_91/BBAY90_91.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY90_91/BBAY90_91_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY90_91/BBAY90_91_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/BBAY92_93_94.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/BBAY92_93_94_R1.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp /srv/scratch/z5039045/1_assembly/BBAY92_93_94/BBAY92_93_94_R2.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp -r /srv/scratch/z5039045/1_assembly/qsub_files_trimmomatic /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp -r /srv/scratch/z5039045/1_assembly/qsub_files_fq2fa /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &
cp BBAY90_91.fa.gz /home/z5039045/torsten/Weizhi_Song/BBAY_datasets/1_raw_reads_filtered_Q20 &


# run COG annotation
cd /srv/scratch/z5039045/BBAYs/5_Prokka
cat prokka_output/*/*.ffn > combined.ffn
cat prokka_output/*/*.faa > combined.faa

# run rpsblast
cd /srv/scratch/z5039045/BBAYs/5_Prokka

# run rpsblast
module load blast+/2.6.0
rpsblast -query combined.ffn -db /srv/scratch/z5039045/blastdb/Cog_LE/Cog -out combined.tab -evalue 0.001 -outfmt 6 

# run cdd2cog.pl
module load perl/5.20.1
perl /srv/scratch/z5039045/Scripts/cdd2cog.pl -r combined.tab -c /srv/scratch/z5039045/blastdb/cddid.tbl -f /srv/scratch/z5039045/blastdb/COG/fun.txt -w /srv/scratch/z5039045/blastdb/COG/whog
















