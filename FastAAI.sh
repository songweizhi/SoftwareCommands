
######################## install FastAAI with anaconda3 (on HPC3) ########################

module load anaconda3
conda create --name fastaaienv
conda activate fastaaienv
pip install FastAAI


################################## run FastAAI (on HPC3) #################################

module load anaconda3
conda activate fastaaienv
cd /scratch/PI/ocessongwz/Tests/fastaai
fastaai build_db --proteins Ting-tests --threads 4 --verbose --output fastaai_outputs --database user_genomes.db --compress
fastaai db_query --query fastaai_outputs/database/user_genomes.db --target fastaai_outputs/database/user_genomes.db --threads 4 --verbose --output fastaai_outputs --output_style matrix
