library(meta);library(metafor);library(readxl);library(readr);library(dmetar)

# the data spread sheat should be in the working directory: 
data <- read_csv("Data for analysis.csv");data <- data[-10,]
x <- read_excel("/Data for analysis.xlsx");x <- x[-5,1];names(x) <- "Study"
data <- cbind(data,x[-10,]);rm(x)
datalogit <- data; rm(data)

metalogit <- metaprop(datalogit$PE,datalogit$samplesize, datalogit$study ,data = datalogit, sm= "PLOGIT",prediction = T, method = "GLMM",backtransf= T,byvar=NULL)

subgroup <- metaprop(datalogit$PE,datalogit$samplesize, datalogit$study ,data = datalogit, sm= "PLOGIT",prediction = T, method = "GLMM",backtransf= T,byvar=datalogit$Design)
forest.meta(metalogit,leftlabs =c("Study", "PE", "num.COVID-19"))
forest.meta(subgroup,leftlabs =c("Study", "PE", "num.COVID-19"))
