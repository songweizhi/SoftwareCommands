
######################## install FastAAI with anaconda3 (on HPC3) ########################

module load anaconda3
conda create --name fastaaienv
conda activate fastaaienv
pip install FastAAI

fastaai build_db --genomes example_genomes/ --threads 4 --verbose --output example_build --database my_example_db.db --compress
fastaai db_query --query example_build/database/my_example_db.db --target example_build/database/my_example_db.db --threads 4 --verbose --output example_build


################################## run FastAAI (on HPC3) #################################

module load anaconda3
conda activate ezaaienv
cd /scratch/PI/ocessongwz/Tests/fastaai

fastaai build_db --proteins Ting-tests --threads 4 --verbose --output fastaai_outputs --database user_genomes.db --compress
fastaai db_query --query fastaai_outputs/database/user_genomes.db --target fastaai_outputs/database/user_genomes.db --threads 4 --verbose --output fastaai_outputs --output_style matrix

