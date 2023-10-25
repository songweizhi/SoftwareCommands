python /home/z5039045/slimsuite/tools/seqsuite.py --help

cd /srv/scratch/z5039045/pilon_wd
python /home/z5039045/slimsuite/tools/seqsuite.py -seqin test_in.fasta -seqout test_out.fasta -edit changes.txt -log test.log


Locus	Pos	Edit	Details
seq_1	2	INS	C	# add C after the 2th nt, that means c is the third nt.
seq_2	5	SUB	G
seq_3	4	DEL	T	# delete the 4th nt T