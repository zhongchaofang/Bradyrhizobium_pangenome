library(pheatmap)
library(plyr)
setwd("C:\\Bradyrhizobium\\pheatmap\\")
data1 <- read.csv("278-tss-nif-gene.txt",header=T,row.names = 1,sep = "\t")
colgroup <- read.csv("annotation-group1.txt",header=T,row.names = 1,sep = "\t")
colgroup2 <- read.csv("annotation-group2.txt",header=T,row.names = 1,sep = "\t")
p<-pheatmap(data1,annotation_row=colgroup, annotation_col=colgroup2, show_rownames = T,fontsize_row = 5, clustering_method="ward.D",
         cluster_row = T,cluster_col = F,border = T,cutree_rows = 3)
