# Subpopulation-analysis

The following codes were used for the experimental procedure for the paper: Identification of Rare Cell Populations in Autofluorescence Lifetime Image Data.

90RespRest_10QuiAct)build)K.py - this is what builds the csv file described below

90Resp_10ACD3_REnamed_Names_xlsm.csv - This is an example of a constructed CSV file that was fed into WEKA. This has a 90% cancer and 10% t cell population

chnage2variables - This was used for the supopulation analysis (Figure 2). Change the quantity of cells and mean or standard deviation for a heterogeneous mixture with two different 
types of cells. The output will give an insight into the quantity, mean, standard deviation, and proportion found by the model. if these parameters match your input, then successful
idenitification was achieved
heatmapcreation - creates the heatmaps for Figure 2, using the outputs of the previous code (chnage2variables). 

confusionmatrixcreaton2 - creates the confusion matrix (Figure 4). The numbers are gathered from the confusion marix output in WEKA.

fourgaussians - You can change the quantity, mean, or standard deviation for a heterogeneous mixture with two different types of cells. The output is the gaussian curves (Figure 1).

90RespRest_10QuiAct_umap.K.py - the UMAP code discussed in supplementary material
