setwd("C:/Users/asdfe/Desktop")
library("ape")
library("phytools")
geotree <- read.tree("binaryPGLMM____light_utilization.tre")
geodata <- read.table("binaryPGLMM____light_utilization.txt", header = TRUE, sep = "\t")
row.names(geodata) <- geodata[,1]
row.names(geodata) <- geodata$ID
geodata <- geodata[geotree$tip.label,]
tmp <- phylosig(tree = geotree, x = geodata$light, method = "lambda", test = TRUE)
result <- binaryPGLMM(light ~ PRC, data = geodata, phy = geotree)
result$B.pvalue
