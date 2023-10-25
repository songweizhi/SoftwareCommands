# Load modules
module add python/2.7.12-gcc6 
module add falcon/1.8.6
export FALCON_WORKSPACE=$(pwd)


# Working_directory
cd /srv/scratch/z5039045/PacBio/Falcon/test_ecoli


# Running Falcon
fc_run.py fc_run_screen.cfg


# Assessing Run Progress

# 1. Counting Completed Jobs

grep '^#' 0-rawreads/run_jobs.sh
# Daligner jobs (60)
# Initial sort jobs (400)
# Check initial .las files jobs (80) (optional but recommended)
# Remove initial .las files
# Level 1 merge jobs (20)
# Check level 2 .las files jobs (20) (optional but recommended)
# Remove level 1 .las files (optional)

find 0-rawreads -name "job*done" | wc -l
60

find 0-rawreads/ -name "m_*done" | wc -l
20

# Assessing Run Performance

# Raw and Pread Coverage and Quality
DBstats 0-rawreads/raw_reads.db > 0-rawreads/raw_reads.stats
head 0-rawreads/raw_reads.stats
DBstats 1-preads_ovl/preads.db > 1-preads_ovl/preads.stats 
head 1-preads_ovl/preads.stats 
cat 0-rawreads/report/pre_assembly_stats.json

# Contig Stats
perl /srv/scratch/z5039045/Scripts/countFasta.pl 2-asm-falcon/p_ctg.fa > 2-asm-falcon/p_ctg.stats
tail 2-asm-falcon/p_ctg.stats
perl /srv/scratch/z5039045/Scripts/countFasta.pl 2-asm-falcon/a_ctg.fa > 2-asm-falcon/a_ctg.stats

# Assembly Graph and Pread Overlaps
