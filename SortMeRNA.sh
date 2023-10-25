
cd /srv/scratch/z5039045/MarkerMAG_wd/Kelp/sortmerna_test

sortmerna 


--ref
--ref
--reads
--reads

--aligned
--sam 
--blast "1"


cmd_line = sortmerna_bin
        cmd_line += ' --ref ' + complete_ref_db_filepath + ',' + complete_ref_db_basepath
        cmd_line += ' --reads ' + contigs_filepath
        cmd_line += ' --aligned ' + scaff_sortme_output_basepath
        cmd_line += ' --sam --blast "1"'
        cmd_line += ' --num_alignments 0 '
        #cmd_line += ' --num_seeds 3 '
        #cmd_line += ' --best 0 --min_lis 10 '
        cmd_line += ' -e {0:.2e}'.format(scaff_evalue)
        cmd_line += ' -a ' + str(args.cpu)
        if args.verbose:
            cmd_line += ' -v '



/srv/scratch/z5039045/DB/SILVA/SILVA_138_1_SSURef_NR99_99/SILVA_138.1_SSURef_NR99_tax_silva_NR99
