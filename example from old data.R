setwd("~/Google Drive/Hurwitz Lab/")

library(RColorBrewer)

example_graph_data_raw<-read.csv("interesting five.csv")

#TODO: make this a github repo
#use this as a template
#for something like "make_pretty_bar_graphs_in_R"

example_graph_data <- example_graph_data_raw
example_graph_data$bacteria <- factor(example_graph_data_raw$Species,levels=c("Bacteroides fragilis","Butyrivibrio fibrisolvens","Escherichia coli","Fusobacterium nucleatum","Bacteroides Distasonis"),labels=c("B.fragilis","B.fibrisolvens","E.coli","F.nucleatum","B.distasonis"))
example_graph_data$sample <- factor(example_graph_data_raw$Sample,levels=c("DNA_3","DNA_1","DNA_4","DNA_2"),labels=c("SMAD3(+/+),H.hep neg","SMAD3(+/+),H.hep pos","SMAD3(-/-),H.hep neg","SMAD3(-/-),H.hep pos"))

mydata <- data.frame(B.fragilis=example_graph_data[which(example_graph_data$bacteria=="B.fragilis"),]$Fraction.of.Bacterial.Counts
                     ,B.fibrisolvens=example_graph_data[which(example_graph_data$bacteria=="B.fibrisolvens"),]$Fraction.of.Bacterial.Counts
                     ,E.coli=example_graph_data[which(example_graph_data$bacteria=="E.coli"),]$Fraction.of.Bacterial.Counts
                     ,F.nucleatum=example_graph_data[which(example_graph_data$bacteria=="F.nucleatum"),]$Fraction.of.Bacterial.Counts
                     ,B.distasonis=example_graph_data[which(example_graph_data$bacteria=="B.distasonis"),]$Fraction.of.Bacterial.Counts,row.names=unique(example_graph_data$Sample))
mydata_ord<-mydata[c("DNA_3","DNA_4","DNA_1","DNA_2"),]

colors<-brewer.pal(4,"RdBu")[4:1]
colors_alpha50<-paste(colors[1:4],"80",sep='')

barplot(as.matrix(mydata_ord)
        ,ylab="Fraction of Total Bacterial Counts"
        ,xlab="Species"
        ,beside=TRUE
        ,col=colors)

legend("center"
       ,c("SMAD3(+/+),H.hep neg"
          ,"SMAD3(-/-),H.hep neg"
          ,"SMAD3(+/+),H.hep pos"
          ,"SMAD3(-/-),H.hep pos")
       ,cex=1
       ,fill=colors)

# bfrag<-example_graph_data_raw[which(example_graph_data_raw$Species=="Bacteroides fragilis"),]
# bfrag<-bfrag[,3:4]
# chisq.test(bfrag)
#
# ecol<-example_graph_data_raw[which(example_graph_data_raw$Species=="Escherichia coli"),]
# ecol<-ecol[2:3,3:4]
# fisher.test(ecol)
#
# plot(Fraction.of.Bacterial.Counts*100 ~ Sample, data=example_graph_data_raw[which(example_graph_data_raw$Species=="Bacteroides fragilis"),])
#
# library(ggplot2)
# library(scales)
#
#
# qplot(Fraction.of.Bacterial.Counts, sample, data=example_graph_data, facets=bacteria~sample)
# small_data<-example_graph_data[,c("sample","bacteria","Fraction.of.Bacterial.Counts")]
# c<-ggplot(small_data[which(small_data$bacteria=="B.fragilis"),],aes(x=factor(sample),y=Fraction.of.Bacterial.Counts))
# c + geom_bar(stat="identity")
#
