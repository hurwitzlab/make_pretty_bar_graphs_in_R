#/usr/bin/env python

import os

os.chdir("/Users/Scott/Google Drive/Hurwitz Lab/PATRIC-taxoner-species/now-with-fastq/")

import pandas as pd

from __future__ import print_function

#Write a script like
#for each row in data.frame
#printf "%s increased %d.2-fold in the SMAD3 knockout treatment 
#and %d.2-fold in the induced inflammation treatment. 
#In the condition with both of these treatments, %s 
#increased %d.2-fold" "phyla, smad3ko_change, inf_change, phyla, cancer_change"

phylum_changes = pd.read_csv("phylum_changes_perc.csv",index_col='phyla')
phylum_changes = phylum_changes.loc[:,['smad3ko','inflammation','cancer']]
phylum_changes

for index, row in phylum_changes.iterrows():
    print("{:s} increased {:.2f}-fold in the SMAD3 knockout treatment and\
 {:.2f}-fold in the induced inflammation treatment.".format(index,row[0],row[1]),end=" ")
    print("In the condition with both of these treatments,\
 {:s} increased {:.2f}-fold.".format(index,row[2]),end=" ")
    
family_changes = pd.read_csv("family_changes_perc.csv",index_col='family')
family_changes = family_changes.loc[:,['smad3ko','inflammation','cancer']]
family_changes
#reorder to correspond with taxonomic hierarchy (e.g. Bacteroidaceae is under Bacteroidetes)
new_index = ['Bacteroidaceae','Deferribacteraceae','Lachnospiraceae','Lactobacillaceae',
             'Helicobacteraceae']
family_changes = family_changes.reindex(new_index)

for index, row in family_changes.iterrows():
    print("{:s} increased {:.2f}-fold in the SMAD3 knockout treatment and\
 {:.2f}-fold in the induced inflammation treatment.".format(index,row[0],row[1]),end=" ")
    print("In the condition with both of these treatments, {:s} increased\
 {:.2f}-fold.".format(index,row[2]),end=" ")   
    
species_changes = pd.read_csv("species_changes_perc.csv",index_col='species')
species_changes = species_changes.loc[:,['smad3ko','inflammation','cancer']]
species_changes
#reording here to for same reason above
new_index = ['M. schaedleri','L. bacterium-A4','L. plantarum','L. murinus',
             'P. distasonis','H. hepaticus']
species_changes = species_changes.reindex(new_index)

for index, row in species_changes.iterrows():
    print("{:s} increased {:.2f}-fold in the SMAD3 knockout treatment and\
 {:.2f}-fold in the induced inflammation treatment.".format(index,row[0],row[1]),end=" ")
    print("In the condition with both of these treatments,\
 {:s} increased {:.2f}-fold.".format(index,row[2]),end=" ")    
    
    
    
