library(pheatmap)
library(plyr)
setwd("C:\\Bradyrhizobium\\")
data1 <- read.csv("nod-nif.txt",header=T,row.names = 1,sep = "\t")
colgroup <- read.csv("annotation-1.txt",header=T,row.names = 1,sep = "\t")
colgroup2 <- read.csv("annotation-2.txt",header=T,row.names = 1,sep = "\t")
p<-pheatmap(data1,annotation_row=colgroup, annotation_col=colgroup2, show_rownames = T,fontsize_row = 5,clustering_method="ward.D", 
         cluster_row = T,cluster_col = T,border = T,cutree_cols =3,cutree_rows = 3)
