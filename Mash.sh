
# download the dependency-free binary for Linux or OSX
https://github.com/marbl/Mash/releases/download/v2.3/mash-Linux64-v2.3.tar
https://github.com/marbl/Mash/releases/download/v2.3/mash-OSX64-v2.3.tar



/home-user/wzsong/DateArTree/01_genome_selection/d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2/
/home-user/wzsong/DateArTree/01_genome_selection/d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2/


# option 1
mash dist genome1.fna genome2.fna


# option 2
cd /home-user/wzsong/test
mash sketch genome1.fna
mash sketch genome2.fna
mash dist genome1.fna.msh genome2.fna.msh

cd /home-user/wzsong/DateArTree/01_genome_selection/d__Archaea_o_rs_gnms_Betts38_Spang81_Williams39_Wu2/0_msh_files
mash dist combined.msh combined.msh




cd /home-user/wzsong/test
mash sketch genome1.fna
mash sketch genome2.fna
mash dist genome1.fna.msh genome2.fna.msh
# genome1.fna	genome2.fna	0.0222766	0	456/1000

mash sketch -s 10000 genome1.fna
mash sketch -s 10000 genome2.fna
mash dist -s 10000 genome1.fna.msh genome2.fna.msh
# genome1.fna	genome2.fna	0.0221122	0	4583/10000

mash sketch -s 50000 genome1.fna
mash sketch -s 50000 genome2.fna
mash dist -s 50000 genome1.fna.msh genome2.fna.msh
# genome1.fna	genome2.fna	0.0219928	0	22999/50000

mash sketch -s 100000 genome1.fna
mash sketch -s 100000 genome2.fna
mash dist -s 100000 genome1.fna.msh genome2.fna.msh
# genome1.fna	genome2.fna	0.0221471	0	45781/100000


