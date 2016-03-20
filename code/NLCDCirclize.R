rm(list=ls())
library(lattice)
library(latticeExtra)
library(circlize)
library(igraph)
#devtools::install_github("mattflor/chorddiag")
library(chorddiag)

fileDirectory <- "C:/Users/dnachajon/Documents/NLCD/Project"
data <- "ChangeMatrix_Cols_From2001_Rows_To2011.csv"

data <- read.csv(file=paste(fileDirectory, data, sep="/"), header = T, row.names = 1)
M <- as.matrix(data)
diag(M) <- 0.0
#This is now Rows From 2001 Columns To 2011
M <- t(M)
#Converts from Pixels to Sq KM
f <- 0.03^2
M <- M*f

if(F){
# Net out all transfers
for(i in 1:nrow(M)){
  for(j in 2:ncol(M)){
   if(M[i,j] > M[j,i]){ 
      M[i,j] <- M[i,j] - M[j,i]
      M[j,i] <- 0
   }
   else{ 
     M[j,i] <- M[j,i] - M[i,j]
     M[i,j] <- 0
   }
  }
}
}

M <- round(M,2)
#rownames(M) <- paste0("S-", colnames(M))
#colnames(M) <- paste0("E-", colnames(M))
df = data.frame(from = rep(rownames(M), times = ncol(M)),
                to = rep(colnames(M), times = nrow(M)),
                value = as.vector(M), stringsAsFactors = FALSE)
df <- df[df$value != 0, ]



chorddiag(type = "bipartite" , data=M, groupnameFontsize=10, margin = 125)
chorddiag(data=M, groupnameFontsize=10, margin = 125)
#chordDiagram(df)

circos.clear()
