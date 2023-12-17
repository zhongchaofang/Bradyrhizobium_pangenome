library(ggplot2)
library(doBy)
library(plyr)

setwd("C:\\Bradyrhizobium\\pan-core-cur\\")
data<-read.csv("278_Brad_pan_core_cur500.txt",sep = "\t",header = F)
names(data)=c("name","group","count") 

tgc <- ddply(data, c("name","group"),summarise, N=length(count),mean=mean(count), sd = sd(count), se = sd/sqrt(N))
tgc
core <- subset(tgc,tgc$group == "core")
pan <- subset(tgc,tgc$group == "pan")
write.table(core, file="278_Brad_core_cur_SF1.txt", append = TRUE, sep="\t",quote=F, row.names = F,col.names = T)
write.table(pan, file="278_Brad_pan_cur_SF1.txt", append = TRUE, sep="\t",quote=F, row.names = F,col.names = T)

ggplot(tgc, aes(x=name, y=mean, colour=group)) + 
  geom_errorbar(aes(ymin=mean-sd, ymax=mean+sd), width=0.3, colour="black") +
  geom_line() +
  geom_point(size=1,shape=15)+
  theme(plot.background=element_rect(fill="white",color=NA),text=element_text(color="black"),
        panel.grid.major.x=element_blank(),
        panel.grid.minor.x=element_blank(),
        panel.grid.major.y=element_blank(),
        panel.grid.minor.y=element_blank())