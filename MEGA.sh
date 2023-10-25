
module load mega/11.0.10
megacc -h


megacc -a reltime_ml_amino_acid.mao -d Yang_markers_concatenated_trimmed.aln.fas -t Yang_markers_concatenated_trimmed_MFP.contree.newick -g outgroup.txt -c calibrations.txt -o output_time_tree.newick


# Generating the MEGA Analysis Options File (.mao)
# https://www.megasoftware.net/web_help_10/Running_in_Command-Line_Mode.htm


