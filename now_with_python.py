#/usr/bin/env python

import os

os.chdir("/Users/Scott/Google Drive/Hurwitz Lab/PATRIC-taxoner-species/now-with-fastq/")

import pandas as pd

#Write a script like
#for each row in data.frame
#printf "%s increased %d.2-fold in the SMAD3 knockout treatment 
#and %d.2-fold in the induced inflammation treatment. 
#In the condition with both of these treatments, %s 
#increased %d.2-fold" "phyla, smad3ko_change, inf_change, phyla, cancer_change"

phylum_changes = pd.read_csv("phylum_changes_perc.csv")
phylum_changes = phylum_changes.loc[:,['phyla','smad3ko','inflammation','cancer']]

for index, row in phylum_changes.iterrows():
    print("{:s} increased {:.2f}-fold in the SMAD3 knockout treatment and {:.2f}-fold in the induced inflammation treatment.").format(row[0],row[1],row[2])
    print("In the condition with both of these treatments, {:s} increased {:.2f}-fold.").format(row[0],row[3])
    
family_changes = pd.read_csv("family_changes_perc.csv")
family_changes = family_changes.loc[:,['family','smad3ko','inflammation','cancer']]

for index, row in family_changes.iterrows():
    print("{:s} increased {:.2f}-fold in the SMAD3 knockout treatment and {:.2f}-fold in the induced inflammation treatment.").format(row[0],row[1],row[2])
    print("In the condition with both of these treatments, {:s} increased {:.2f}-fold.").format(row[0],row[3])    
    
species_changes = pd.read_csv("species_changes_perc.csv")
species_changes = species_changes.loc[:,['species','smad3ko','inflammation','cancer']]

for index, row in species_changes.iterrows():
    print("{:s} increased {:.2f}-fold in the SMAD3 knockout treatment and {:.2f}-fold in the induced inflammation treatment.").format(row[0],row[1],row[2])
    print("In the condition with both of these treatments, {:s} increased {:.2f}-fold.").format(row[0],row[3])    
    
    
    
