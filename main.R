setwd("~/Google Drive/Hurwitz Lab/PATRIC-taxoner-species/now-with-fastq/")

library(RColorBrewer)

raw_graph_data<-read.csv("source_data_for_R_based_on_new_normalization.csv")

graph_data <- raw_graph_data

sum_by_species <- rowsum(graph_data[,c("percDNA1","percDNA2","percDNA3","percDNA4")],graph_data$species,reorder = T)

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

sum_by_phylum <- rowsum(graph_data[,c("percDNA1","percDNA2","percDNA3","percDNA4")],graph_data$phylum,reorder = T)

second_graph <- sum_by_phylum[c("Bacteroidetes","Deferribacteres","Firmicutes","Proteobacteria"),]

second_graph<-t(second_graph)

second_graph_ord<-second_graph[c("percDNA3","percDNA4","percDNA1","percDNA2"),]

barplot(as.matrix(second_graph_ord)
        ,ylab="Fraction of Total Bacterial Counts"
        ,xlab="Phylum"
        ,beside=TRUE
        ,col=colors)

legend("topleft"
       ,c("SMAD3(+/+),H.hep neg"
          ,"SMAD3(-/-),H.hep neg"
          ,"SMAD3(+/+),H.hep pos"
          ,"SMAD3(-/-),H.hep pos")
       ,cex=.75
       ,fill=colors)

sum_by_family <- rowsum(graph_data[,c("percDNA1","percDNA2","percDNA3","percDNA4")],graph_data$family,reorder = T)

third_graph <- sum_by_family[c("Lachnospiraceae","Lactobacillaceae","Helicobacteraceae","Bacteroidaceae","Deferribacteraceae"),]

third_graph<-t(third_graph)

third_graph_ord<-third_graph[c("percDNA3","percDNA4","percDNA1","percDNA2"),]

barplot(as.matrix(third_graph_ord)
        ,ylab="Fraction of Total Bacterial Counts"
        ,xlab="Family"
        ,beside=TRUE
        ,col=colors)

legend("topright"
       ,c("SMAD3(+/+),H.hep neg"
          ,"SMAD3(-/-),H.hep neg"
          ,"SMAD3(+/+),H.hep pos"
          ,"SMAD3(-/-),H.hep pos")
       ,cex=.75
       ,fill=colors)

phylum_changes <- data.frame(phyla=colnames(second_graph),"smad3ko"=0,"inflammation"=0,"cancer"=0)
only_control_phyla<-second_graph_ord[1,]
phylum_changes$smad3ko=second_graph_ord[2,]/only_control_phyla
phylum_changes$inflammation=second_graph_ord[3,]/only_control_phyla
phylum_changes$cancer=second_graph_ord[4,]/only_control_phyla

#Write a script like
#for each row in data.frame
#printf "%s increased %d.2-fold in the SMAD3 knockout treatment and %d.2-fold in the induced inflammation treatment. In the condition with both of these treatments, %s increased %d.2-fold" "phyla, smad3ko_change, inf_change, phyla, cancer_change"
#heh
