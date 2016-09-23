setwd("~/Google Drive/Hurwitz Lab/PATRIC-taxoner-species/now-with-fastq/")

library(RColorBrewer)

raw_graph_data<-read.csv("source_data_for_R_based_on_new_normalization.csv")

graph_data <- raw_graph_data

sum_by_species <- rowsum(graph_data[,c("percDNA1","percDNA2","percDNA3","percDNA4")],species,reorder = T)

first_graph <- sum_by_species[c("Mucispirillum schaedleri","Lactobacillus murinus","Lactobacillus plantarum","Lachnospiraceae bacterium A4","Helicobacter hepaticus","Parabacteroides distasonis"),]

first_graph$bacteria <- factor(row.names(first_graph),levels=c("Mucispirillum schaedleri","Lactobacillus murinus","Lactobacillus plantarum","Lachnospiraceae bacterium A4","Helicobacter hepaticus","Parabacteroides distasonis"),labels = c("M.schaedleri","L.murinus","L.plantarum","L.bacterium-A4","H.hepaticus","P.distasonis"))

row.names(first_graph)<-first_graph$bacteria

first_graph<-first_graph[,c(1,2,3,4)]

first_graph<-t(first_graph)

first_graph_ord<-first_graph[c("percDNA3","percDNA4","percDNA1","percDNA2"),]

colors<-brewer.pal(4,"RdBu")[4:1]

barplot(as.matrix(first_graph_ord)
        ,ylab="Fraction of Total Bacterial Counts"
        ,xlab="Species"
        ,beside=TRUE
        ,col=colors)

legend("topright"
       ,c("SMAD3(+/+),H.hep neg"
          ,"SMAD3(-/-),H.hep neg"
          ,"SMAD3(+/+),H.hep pos"
          ,"SMAD3(-/-),H.hep pos")
       ,cex=.75
       ,fill=colors)
