setwd("C:\\Bradyrhizobium\\pan-core-cur\\")
a<-read.csv("278_for_pan_list_matrix01_new1.txt",sep = "\t",header = T,row.names = 1)
result<-c()
total_sample <- ncol(a)
name_core <- rep(c("core"),c(500))
name_pan <- rep(c("pan"),c(500))
#end_pan_sum<-matrix(rowSums(a),byrow = FALSE)
#total_pan<-length(end_pan_sum[,1][which(end_pan_sum[,1]!=0)])
#total_core<-length(end_pan_sum[,1][which(end_pan_sum[,1]==total_sample)])
for(kk in 1:total_sample){
  circle_01 <- rep(c(kk),c(500))
  Core_01<-c()
  Pan_01<-c()
  for(i in 1:500){
    s <- sample(x=a, kk, replace=F)
    c<-matrix(rowSums(s),byrow = FALSE)
    core <- 0
    pan <- 0
    pan<-length(c[,1][which(c[,1]!=0)])
    Pan_01<-c(Pan_01,pan)
    core<-length(c[,1][which(c[,1]==kk)])
    Core_01<-c(Core_01,core)
  }
  c_pan_01<-cbind(circle_01,name_pan,Pan_01)
  c_core_01<-cbind(circle_01,name_core,Core_01)
  write.table(c_pan_01, file="278_Brad_pan_core_cur500.txt", append = TRUE, sep="\t",quote=F, row.names = F,col.names = F)
  write.table(c_core_01, file="278_Brad_pan_core_cur500.txt", append = TRUE, sep="\t",quote=F, row.names = F,col.names = F)
}