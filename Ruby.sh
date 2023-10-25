
######################################## install #########################################

conda create -n ruby
conda activate ruby
conda install -c conda-forge ruby=3.1.2  # this one works
gem update --system
gem install parallel
gem install colorize
gem install getoptlong
gem install time
gem install util


################################### run do_mcmctree.rb ###################################

# do_mcmctree.rb
conda activate ruby
RUBYLIB=$RUBYLIB:/home-user/wzsong/Software/ruby_lib_sswang/
export RUBYLIB
ruby /home-user/wzsong/Scripts/do_mcmctree.rb -h


conda activate ruby
RUBYLIB=$RUBYLIB:/home-user/wzsong/Software/ruby_lib_sswang/
export RUBYLIB
cd /home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2
ruby /home-user/wzsong/Scripts/do_mcmctree.rb -i concatenated.phy -t deltall75_pa75_rooted_with_calibrations.nwk --outdir deltall75_pa75_dating_wd --pep --clock 2 --nsample 50000 --cpu 1


/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/DateArTree_out.txt
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/js_50k_approx02.sh
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/js_50k_approx02.sh.e39295
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/js_50k_approx02.sh.e39296
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/js_50k_approx02.sh.o39295
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/js_50k_approx02.sh.o39296
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/mcmctree.ctl
/home-user/wzsong/DateArTree/04_dating_Williams_2017_45_arCOG/50k_clock2/SeedUsed


##################################### run deltaLL.rb #####################################

# copy input files from Sishuo
cd /home-user/wzsong/Tests
cp -r /home-user/sswang/project/BTL/results/dating/0827/prepare/wBacillus/check_zong/check_seq.btl_noProteo/wAlpha/clean1/deltaLL ./

# run deltaLL.rb
conda activate ruby
RUBYLIB=$RUBYLIB:/home-user/wzsong/Software/ruby_lib_sswang/
export RUBYLIB
cd /home-user/wzsong/Tests/deltaLL
ruby /home-user/wzsong/Scripts/deltaLL.rb --indir tree.sp/aln/ -t constr.tre --outdir delta_Weizhi --force --cpu 3 -T 3 --taxa euk.list --outgrp_file outgrp.list
# input files
# --indir tree.sp/aln/ 
# -t constr.tre 
# --taxa euk.list 
# --outgrp_file outgrp.list



# run deltaLL for the 45 markers
conda activate ruby
RUBYLIB=$RUBYLIB:/home-user/wzsong/Software/ruby_lib_sswang/
export RUBYLIB
cd /home-user/wzsong/DateArTree/02_identify_marker_gene_Williams_2017_45_arCOG_DeltaLL
ruby /home-user/wzsong/Scripts/deltaLL.rb --outdir deltaLL_op --force --cpu 3 -T 3 --indir /home-user/wzsong/DateArTree/02_identify_marker_gene_Williams_2017_45_arCOG/best_hit_by_marker_5_aln_trimmed -t /home-user/wzsong/DateArTree/03_iqtree_Williams_2017_45_arCOG/iqtree_wd/concatenated.treefile --outgrp_file outgroup.txt --taxa eu_taxa_list.txt
# input files
# --indir /home-user/wzsong/DateArTree/02_identify_marker_gene_Williams_2017_45_arCOG/best_hit_by_marker_5_aln_trimmed
# -t /home-user/wzsong/DateArTree/03_iqtree_Williams_2017_45_arCOG/iqtree_wd/concatenated.treefile
# --outgrp_file outgroup.txt
# --taxa eu_taxa_list.txt
nohup ruby /home-user/wzsong/Scripts/deltaLL.rb --outdir deltaLL_op --force --cpu 3 -T 3 --indir /home-user/wzsong/DateArTree/02_identify_marker_gene_Williams_2017_45_arCOG/best_hit_by_marker_5_aln_trimmed -t /home-user/wzsong/DateArTree/03_iqtree_Williams_2017_45_arCOG/iqtree_wd/concatenated.treefile --outgrp_file outgroup.txt --taxa eu_taxa_list.txt &



nohup python3 ~/PycharmProjects/MyFinance/s2_log_yahoo_currency.py &






# install ruby package
gem install bio





export RUBYLIB=$RUBYLIB:/home-user/sswang/program/ruby/lib/ruby/gems/3.0.0/gems/








