
####################################### ranger-DTL #######################################

/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-D.mac -h
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-U.mac -h
/srv/scratch/z5039045/Ranger-DTL/ranger-dtl-D.linux -h
/srv/scratch/z5039045/Ranger-DTL/ranger-dtl-U.linux -h 

cd /Users/weizhisong/Desktop/ranger-DTL_wd
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-D.mac -i combined_tree_posidonia_bin45_00741___rock_bin3_00030.txt 
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-D.mac -i combined_tree_ulva_bin45_02049___water_bin61_00337.txt 
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-D.mac -i combined_tree_posidonia_bin50_00235___water_bin61_00266.txt 
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-D.mac -i combined_tree_phylospora_bin50_00337___ulva_bin45_01970.txt 

cd /Users/weizhisong/Desktop/working_directory/output_75%_200bp_80%_Ranger-DTL
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-U.mac -i halophila_bin57_00373___ulva_bin75_00125.txt -o halophila_bin57_00373___ulva_bin75_00125_output.txt
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-U.mac -i ulva_bin45_02049___water_bin61_00337.txt
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-U.mac -i ecklonia_bin26_02227___ulva_bin4_00493.txt
/Users/weizhisong/Softwares/Ranger-DTL/ranger-dtl-U.mac -i halophila_bin57_00373___ulva_bin75_00125.txt -o halophila_bin57_00373___ulva_bin75_00125_out.txt


####################################### ranger-DTL2 ######################################

# executables
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/CorePrograms/AggregateRanger.linux    
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/CorePrograms/OptRoot.linux
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/CorePrograms/Ranger-DTL.linux
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/OptResolutions.linux
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/OptRoot-Dated.linux
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/OptRoot-Fast.linux
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Fast.linux

# version 1 command
cd /srv/scratch/z5039045/Test_and_backup/RangerDTL2_test
/srv/scratch/z5039045/Softwares/Ranger-DTL/ranger-dtl-U.linux -q -D 2 -T 3 -L 1 -i AAM_00205___BNM_00307.txt -o AAM_00205___BNM_00307_ranger_output.txt

# version 2 command
cd /srv/scratch/z5039045/Test_and_backup/RangerDTL2_test
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/CorePrograms/Ranger-DTL.linux -q -D 2 -T 3 -L 1 -i AAM_00205___BNM_00307_rooted.txt -o AAM_00205___BNM_00307_rooted_ranger_output.txt
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -D 2 -T 3 -L 1 -i AAM_00205___BNM_00307_dated.txt -o AAM_00205___BNM_00307_dated_ranger_output.txt
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -D 2 -T 3 -L 1 -i rh_lh_Refined_31_00842___rh_hl_Refined_23_02143.txt -o rh_lh_Refined_31_00842___rh_hl_Refined_23_02143_dated_ranger_output.txt
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated1
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated2
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated3
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated4
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated5
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated6
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated7
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated8
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated9
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o NorthSea_bin014_02345___NorthSea_bin092_00867_dated10
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation1
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation2
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation3
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation4
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation5
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation6
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation7
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation8
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation9
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/SupplementaryPrograms/Ranger-DTL-Dated.linux -q -i NorthSea_bin014_02345___NorthSea_bin092_00867.txt -o reconciliation10

/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/CorePrograms/AggregateRanger.linux ranger_out/NorthSea_bin014_02345___NorthSea_bin092_00867_dated > NorthSea_bin014_02345___NorthSea_bin092_00867_dated.txt
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/CorePrograms/AggregateRanger.linux ranger_out/reconciliation
/srv/scratch/z5039045/Softwares/Ranger-DTL2/Linux/CorePrograms/AggregateRanger.linux OutputFiles1/rangerOutput >> AggregateOutput1.txt

AggregateRanger.mac NorthSea37bins_MetaCHIP_wd/NorthSea37bins_c5_HGTs_ip90_al200bp_c75_ei90bp_f10kbp/NorthSea37bins_c5_PG_Ranger_output/NorthSea_bin053_01976___NorthSea_bin057_02176_Ranger_output/NorthSea_bin053_01976___NorthSea_bin057_02176_bootstrap > NorthSea37bins_MetaCHIP_wd/NorthSea37bins_c5_HGTs_ip90_al200bp_c75_ei90bp_f10kbp/NorthSea37bins_c5_PG_Ranger_output/NorthSea_bin053_01976___NorthSea_bin057_02176_ranger_bootstrap.txt
AggregateRanger.mac aaa/NorthSea_bin067_00728___NorthSea_bin022_02724_bootstrap > test.txt
AggregateRanger.mac NorthSea_bin034_00737___NorthSea_bin014_02350/NorthSea_bin034_00737___NorthSea_bin014_02350_bootstrap
AggregateRanger.mac 00737___02350/NorthSea_bin034_00737___NorthSea_bin014_02350_bootstrap
