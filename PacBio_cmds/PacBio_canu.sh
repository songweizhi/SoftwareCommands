# default
canu usegrid=false -p BS107_canu_placeRepeatsRandomly -d BS107_default genomeSize=4.2m -pacbio-raw SAMPhaser_haplotigs_BS107_subreads_placeRepeatsRandomly.fasta

# test 1
canu usegrid=false -p BS107_canu_placeRepeatsRandomly -d BS107_default genomeSize=4.2m -pacbio-raw SAMPhaser_haplotigs_BS107_subreads_placeRepeatsRandomly.fasta

# show options
canu -options

utgRepeatConfusedBP                     Repeats where the next best edge is at least this many bp shorter will not be split
utgRepeatDeviation                      Overlaps this much above mean unitig error rate will not be used for repeat splitting
