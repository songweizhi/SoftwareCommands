
#################################### setup PopCOGenT #####################################

# install PopCOGenT on server
# PopCOGenT requires networkx lower than 2.0
conda deactivate
conda create -n popcogent
conda activate popcogent
pip uninstall networkx
pip install joblib


###################################### From Xiaojun ######################################

维志，示例在这里可以拿到
/mnt/ivy/xjwang/Linglu/C1_PB/02_PopCOGenT/PopCOGenT_Brady1.sh
/mnt/ivy/xjwang/Linglu/C1_PB/02_PopCOGenT/config_Brady1.sh

输入是genome fasta文件，fasta的路径可以在config_Brady1.sh文件中对应的genome_dir 和 genome_ext处修改；
其他根据你的数据需要修改的就是
base_name
final_output_dir
alignment_dir （注意最后一定要加“/”，不然就报错）
script_dir

设置完成后运行PopCOGenT_Brady1.sh就好


##########################################################################################

# Test
conda deactivate
conda activate popcogent
source /home-user/software/mugsy_v1r2.3/mugsyenv.sh
cd /home-user/wzsong/Tests/PopCOGenT
mkdir Test
mkdir Test/aln
python3 /home-user/software/PopCOGenT/src/PopCOGenT/get_alignment_and_length_bias.py --genome_dir gnm_dir/ --genome_ext .genome --alignment_dir Test/aln --mugsy_path /home-user/software/mugsy_v1r2.3/mugsy --mugsy_env /home-user/software/mugsy_v1r2.3/mugsyenv.sh --base_name Test --final_output_dir Test --num_threads 6
python3 /home-user/software/PopCOGenT/src/PopCOGenT/cluster.py --base_name Japo --length_bias_file /home-user/wzsong/Japonicum/PopCOGenT/PopCOGenT_op_C8/Japo.length_bias.txt --output_directory /home-user/wzsong/Japonicum/PopCOGenT/PopCOGenT_op_C8 --infomap_path /home-user/software/PopCOGenT/Infomap/Infomap
