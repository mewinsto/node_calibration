##THIS SCRIPT FINDS THE OPTIMAL ULTRAMETRIC TREE VIA CROSS-VALIDATION OF PENALIZED LIKELIHOOD METHOD (SANDERSON, 2002) AND THEN IMPLEMENTS IT
##Helps to output tree from FigTree first
library(ape)

NWA = read.nexus("/home/mwinston/node_calibration/node_calibrate_tree_10.5.15")

#Creates small sample of Lambdas over large range to find parameter region increased sampling  
#Runs CV on these values
L = 10^(-6:6)
CV = sapply(L, function (x) sum(attr(chronopl(NWA,lambda = x, CV = TRUE), "D2")))

write(CV, file = "CV_test_NWA_large.txt",ncolumns=length(CV))
write(L, file = "L_test_NWA_large.txt", ncolumns=length(L))

#Creates large sample of lambdas over short, determined range (from previous script) to determine optimal value of lambda
#Runs CV on these values
L2 = seq(0.1, 2.0, by = 0.05) 
CV2 = sapply(L2, function (x) sum(attr(chronopl(NWA,lambda = x, CV = TRUE), "D2")))

write(CV2, file = "CV_test_NWA.txt",ncolumns=length(CV2))
write(L2, file = "L_test_NWA.txt", ncolumns=length(L2))
