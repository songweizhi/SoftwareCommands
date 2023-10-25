 
# Please can everyone have a bit of a scratch spring clean:
# Zip up any big text files, such as fasta or fastq, that do not currently need to be unzipped. (Many programs can process gzipped files directly.)
# Convert any SAM files to BAM files (unless SAM absolutely required) and then delete the SAM files.
# Backup files to the RDS and delete any files that are no longer required on the system. Tim has been working on scripts for checking the archive status of directories for those (understandably) scared of deleting precious data. (Remember that scratch is not backed up and therefore not a safe place for precious data anyway.)
# If you need to run a job that needs a lot of space, please check the free space before running your job. If space is low, you can (a) delete stuff, (b) email me to find out who else might need to delete stuff, (c) run your job in someone else’s scratch with more space (see point 3 below), or (d) request to be moved to a scratch drive with more space.
# If your lab share a lot of files, consider setting up a lab group on katana (through me or IT), which will allow multiple people to access the same directories and/or files without needing to set up a shared scratch drive, nor making the directories/files available for everyone. Just choose a short name (<10 character) for the group (e.g. xlab) and provide the zIDs of the members for that group. If you would like Tim to help with archiving data to RDS for your lab, you might also want to add him to the group. This way, you can reduce the number of redundant copies. (Note: this can also be useful for sharing data outside the lab for specific collaborative projects – you can be in multiple groups.)
# If you use big public datasets that you think others might also use (e.g. NCBInr), let me know and we can explore sticking them somewhere more sensible for everyone to access to reduce redundant copies.
# If you routinely copy big files into other directories for file organisation reasons (e.g. generate a big assembly and then copy the fasta files somewhere else), consider creating a link to the file (ln) rather than copying it (cp). This can make the desired files or directories appear in multiple places (or with multiple names) without using more disk space. (Don’t do this if you plan to make changes to the copy but not the original.)
 
 
# Support and advice: 
# Following successful uptake in July, we are extending “BABS Bioinformatics at Hacky Hour” into August. Each Thursday afternoon 3-4PM (i.e. today), Tim Amos will be attending Hacky Hour at Penny Lane, along with the ResTech IT folks. They can help with any of the above.
 
 
# Command tips:
 
# To find out how much space you have available:
df -h /srv/scratch/$USER
# NOTE: This is shared by everyone on the same scratch volume.
 

# To find your big directories:
du -h --max-depth 1 /srv/scratch/$USER
#NOTE:  Change the max depth setting to see deeper into your file structure, or remove for a full list of all subdirectories. (If you have a lot of directories, you might want to direct this into a text file to peruse later.)
 

# To zip up a file:
gzip $FILE
 

# To pack up a directory (useful when file counts are high):
tar -czf $DIRECTORY.tgz $DIRECTORY
# Remember to delete the directory itself once complete, or you are increasing usage not decreasing!
