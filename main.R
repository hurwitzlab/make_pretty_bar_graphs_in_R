setwd("~/Google Drive/Hurwitz Lab/PATRIC-taxoner-species/now-with-fastq/")

library(RColorBrewer)

raw_graph_data<-read.csv("source_data_for_R_based_on_new_normalization.csv")

graph_data <- raw_graph_data

graph_data$bacteria <- factor(raw_graph_data$Species,levels=c("Bacteroides fragilis","Butyrivibrio fibrisolvens","Escherichia coli","Fusobacterium nucleatum","Bacteroides Distasonis"),labels=c("B.fragilis","B.fibrisolvens","E.coli","F.nucleatum","B.distasonis"))

graph_data$sample <- factor(raw_graph_data$Sample,levels=c("DNA_3","DNA_1","DNA_4","DNA_2"),labels=c("SMAD3(+/+),H.hep neg","SMAD3(+/+),H.hep pos","SMAD3(-/-),H.hep neg","SMAD3(-/-),H.hep pos"))

mydata <- data.frame(B.fragilis=graph_data[which(graph_data$bacteria=="B.fragilis"),]$Fraction.of.Bacterial.Counts
                     ,B.fibrisolvens=graph_data[which(graph_data$bacteria=="B.fibrisolvens"),]$Fraction.of.Bacterial.Counts
                     ,E.coli=graph_data[which(graph_data$bacteria=="E.coli"),]$Fraction.of.Bacterial.Counts
                     ,F.nucleatum=graph_data[which(graph_data$bacteria=="F.nucleatum"),]$Fraction.of.Bacterial.Counts
                     ,B.distasonis=graph_data[which(graph_data$bacteria=="B.distasonis"),]$Fraction.of.Bacterial.Counts,row.names=unique(graph_data$Sample))
mydata_ord<-mydata[c("DNA_3","DNA_4","DNA_1","DNA_2"),]

colors<-brewer.pal(4,"RdBu")[4:1]
#colors_alpha50<-paste(colors[1:4],"80",sep='')

barplot(as.matrix(mydata_ord)
        ,ylab="Fraction of Total Bacterial Counts"
        ,xlab="Species"
        ,beside=TRUE
        ,col=colors_alpha50)

legend("center"
       ,c("SMAD3(+/+),H.hep neg"
          ,"SMAD3(-/-),H.hep neg"
          ,"SMAD3(+/+),H.hep pos"
          ,"SMAD3(-/-),H.hep pos")
       ,cex=1
       ,fill=colors)

# bfrag<-raw_graph_data[which(raw_graph_data$Species=="Bacteroides fragilis"),]
# bfrag<-bfrag[,3:4]
# chisq.test(bfrag)
#
# ecol<-raw_graph_data[which(raw_graph_data$Species=="Escherichia coli"),]
# ecol<-ecol[2:3,3:4]
# fisher.test(ecol)
#
# plot(Fraction.of.Bacterial.Counts*100 ~ Sample, data=raw_graph_data[which(raw_graph_data$Species=="Bacteroides fragilis"),])
#
# library(ggplot2)
# library(scales)
#
#
# qplot(Fraction.of.Bacterial.Counts, sample, data=graph_data, facets=bacteria~sample)
# small_data<-graph_data[,c("sample","bacteria","Fraction.of.Bacterial.Counts")]
# c<-ggplot(small_data[which(small_data$bacteria=="B.fragilis"),],aes(x=factor(sample),y=Fraction.of.Bacterial.Counts))
# c + geom_bar(stat="identity")
#
