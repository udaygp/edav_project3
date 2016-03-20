rm(list=ls())

library(raster)
library(rasterVis)
library(gridExtra)

setwd(choose.dir(default='C:/Downloads/',caption="Select the folder where the NLCD Data is kept"))


nlcd2001 <- raster(paste(getwd(),'/2001/nlcd_2001_landcover_2011_edition_2014_10_10.img',sep=""))
nlcd2011 <- raster(paste(getwd(),'/2011/nlcd_2011_landcover_2011_edition_2014_10_10.img',sep=""))

png("Project/NLCD2001.png")
plot(nlcd2001)
title("National Land Cover Data - 2001", line=-3)
dev.off()

png("Project/NLCD2011.png")
plot(nlcd2011)
title("National Land Cover Data - 2011", line=-3)
dev.off()