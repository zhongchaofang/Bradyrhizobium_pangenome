README for the order of execution for these scripts
1. Process for phylogenetic analysis:
the protein sequences of 625 single-copy core genes were first subjected to the multiple sequence alignment using MUSCLE,
and then Gblocks were used to make the selection of blocks from the multiple sequence alignment results,
the Gblocks results were then concatenated sequentially, 
followed by phylogenetic analysis using RAxML.


The specific execution steps are as follows:

1.1 sh muscle.sh
## The input file is 625 Fasta sequence files, with a file name prefix of cluster*.
## The output file is the corresponding 625 aligned sequence files, with a file suffix of .muscleout
##Then execute:
1.2 python combine_single.py name_list278 single_copy_combine_muscle_out278
## The input file is a sequence file of 625 aligned sequence files from the previous step
##output file is single_copy_combine_muscle_out278
##Then execute:
1.3 sh gblock.sh
## The input file is single_copy_combine_muscle_out278
##output file is single_copy_combine_muscle_out278-gb
##Then execute:
1.4 sh cover.sh
## The input file is single_copy_combine_muscle_out278-gb
## output file is single_copy_combine_muscle_out278-gb.phy
##Then execute: 
1.5 sh protest.sh
## The input file is single_copy_combine_muscle_out278-gb.phy
## output file is prottestoutput2

1.6 sh RAxML.sh
## The input file is single_copy_combine_muscle_out278-gb.phy
output file included: RAxML_bestTree.ex, RAxML_bipartitions.ex, RAxML_bipartitionsBranchLabels.ex, RAxML_bootstrap.ex, RAxML_info.ex


2. Process for image visualization
2.1. pheatmap.r
##Execute pheatmap.r in R studio, with input file 278-tss-nif-gene.txt, annotation-group1, and annotation-group2.

2.2 01pan-core-cur.r
##Execute 01pan-core-cur.r in R studio, with input file 278_for_pan_list_matrix01_new1.txt and outfile 278_Brad_pan_core_cur500.txt.

2.3 02pan_core_cur.r
##Execute 02pan_core_cur.r in R studio, with input file 278_Brad_pan_core_cur500.txt and outfiles 278_Brad_core_cur_SF1.txt, 278_Brad_pan_cur_SF1.txt. 

3. the GO enrichment analysis
##GO Functional Enrichment is performed at the KOBAS website (http://bioinfo.org/kobas/genelist/), which provides Gene-list Enrichment analysis and hypergeometric test / Fisher's exact test examination. The results are obtained and can be visualised at https://www.bioladder.cn/web/#/chart/2.

4. ANI analysis
sh dRep.sh
##Execute dRep.sh, with input files are all *.fna files in the ANI_analysis folder, output folder includes data, data_tables, dereplicated_genomes, figures, log 
