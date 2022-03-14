ylab=paste0('PC2:',expl.var[2],'%'),
ylim=my.ylim,
xlim=my.xlim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
text(loadings[,1:2], labels=rownames(loadings))
setwd("D:/Masteroppgave/Data Analysis R/Multiparameter1")
getwd()
#################
# Get libraries
#################
# install.packages("readxl")
# install.packages("factoextra")
# install.packages("ffmanova")
library(readxl)
#library(factoextra)
#library(ffmanova)
#library(sjPlot)
#library(sjmisc)
#library(ggplot2)
#################
# Clear all
#################
rm(list=ls())
propVar <- function(object){
  vars <- object$sdev^2
  vars/sum(vars)
}
data_summary <- function(data, varname, groupnames){
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}
Imp <- as.data.frame(read_excel("Data/Multi-param 1b.xlsx", sheet = "2R"))
rownames(Imp)<- Imp[,1]
Imp[1:4,]
my.labels <- Imp[,1]
idc1      <- which(colnames(Imp)=='EOS');     idc1
idc2      <- which(colnames(Imp)=='Mesh');    idc2
idc3      <- which(colnames(Imp)=='Friction');idc3
idc4      <- which(colnames(Imp)=='A.12');    idc4
idc5      <- which(colnames(Imp)=='B.123');   idc5
idc6      <- which(colnames(Imp)=='C.123');   idc6
idc7      <- which(colnames(Imp)=='R1'); idc7
k         <- dim(Imp)[2];k
Design    <- Imp[,idc1:idc3]
D         <- Imp[,idc4:idc6]
Data      <- Imp[,idc7:k]
DF        <- data.frame(Design,D,Data); # all except my.labels
rm(Imp)
# Define colors
cls.3       <- c('black','cyan','blue')
points.3    <- c(2,15,22)
cls.2       <- c('red','blue')
points.2    <- c(9,19)
Inn       <-  Data
my.labels
pca.mod   <- prcomp(Inn,scale=TRUE)
scores    <- pca.mod$x
loadings  <- pca.mod$rotation
expl.var <- round(propVar(pca.mod)*100,digits = 0);expl.var
# 1D plot of PC
pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.2[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-4,4)
plot(scores[,1],
     main=paste0('PCA scores'),
     xlab='samples',
     ylab=paste0('PC1:',expl.var[1],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
my.ylim <- c(-1,1)
plot(loadings[,1],xaxt='n',
     main=paste0('PCA loadings'),
     xlab=paste0(''),
     ylab=paste0('PC1:',expl.var[1],'%'),
     ylim=my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.2[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-4,4)
plot(scores[,1],
     main=paste0('PCA scores'),
     xlab='samples',
     ylab=paste0('PC1:',expl.var[1],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
###############
Inn       <-  Data
my.labels
pca.mod   <- prcomp(Inn,scale=TRUE)
scores    <- pca.mod$x
loadings  <- pca.mod$rotation
expl.var <- round(propVar(pca.mod)*100,digits = 0);expl.var
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.2[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-4,4)
plot(scores[,1],
     main=paste0('PCA scores'),
     xlab='samples',
     ylab=paste0('PC1:',expl.var[1],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
my.ylim <- c(-1,1)
plot(loadings[,1],xaxt='n',
     main=paste0('PCA loadings'),
     xlab=paste0(''),
     ylab=paste0('PC1:',expl.var[1],'%'),
     ylim=my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.2[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-4,4)
plot(scores[,1],
     main=paste0('PCA scores'),
     xlab='samples',
     ylab=paste0('PC1:',expl.var[1],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
rm(list=ls())
propVar <- function(object){
  vars <- object$sdev^2
  vars/sum(vars)
}
data_summary <- function(data, varname, groupnames){
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}
Imp <- as.data.frame(read_excel("Data/Multi-param 1b.xlsx", sheet = "2R"))
rownames(Imp)<- Imp[,1]
Imp[1:4,]
my.labels <- Imp[,1]
idc1      <- which(colnames(Imp)=='EOS');     idc1
idc2      <- which(colnames(Imp)=='Mesh');    idc2
idc3      <- which(colnames(Imp)=='Friction');idc3
idc4      <- which(colnames(Imp)=='A.12');    idc4
idc5      <- which(colnames(Imp)=='B.123');   idc5
idc6      <- which(colnames(Imp)=='C.123');   idc6
idc7      <- which(colnames(Imp)=='R1'); idc7
k         <- dim(Imp)[2];k
Design    <- Imp[,idc1:idc3]
D         <- Imp[,idc4:idc6]
Data      <- Imp[,idc7:k]
DF        <- data.frame(Design,D,Data); # all except my.labels
rm(Imp)
# Define colors
cls.3       <- c('black','cyan','blue')
points.3    <- c(2,15,22)
cls.2       <- c('red','blue')
points.2    <- c(9,19)
Inn       <-  Data
my.labels
pca.mod   <- prcomp(Inn,scale=TRUE)
scores    <- pca.mod$x
loadings  <- pca.mod$rotation
expl.var <- round(propVar(pca.mod)*100,digits = 0);expl.var
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.2[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-4,4)
plot(scores[,1],
     main=paste0('PCA scores'),
     xlab='samples',
     ylab=paste0('PC1:',expl.var[1],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
my.ylim <- c(-1,1)
plot(loadings[,1],xaxt='n',
     main=paste0('PCA loadings'),
     xlab=paste0(''),
     ylab=paste0('PC1:',expl.var[1],'%'),
     ylim=my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
# 2D
my.xlim <- c(-4,3)
my.ylim <- c(-3,3)
plot(scores[,1:2],cex=0.00001,
     main=paste0('PCA scores \n label factor EOS'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
text(scores[,1:2],labels=substr(my.labels,2,2),col=my.cls.s)
abline(h=0,v=0,lty=1,col='gray50')
plot(scores[,1:2],cex=0.00001,
     main=paste0('PCA scores \n label factor Mesh'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
text(scores[,1:2],labels=substr(my.labels,5,5),col=my.cls.s)
abline(h=0,v=0,lty=1,col='gray50')
setwd("D:/Masteroppgave/Data Analysis R/Multiparameter1")
getwd()
library(readxl)
#library(factoextra)
#library(ffmanova)
#library(sjPlot)
#library(sjmisc)
#library(ggplot2)
#################
# Clear all
#################
rm(list=ls())
propVar <- function(object){
  vars <- object$sdev^2
  vars/sum(vars)
}
data_summary <- function(data, varname, groupnames){
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}
Imp <- as.data.frame(read_excel("Data/Multi-param 1b.xlsx", sheet = "2R"))
rownames(Imp)<- Imp[,1]
Imp[1:4,]
my.labels <- Imp[,1]
idc1      <- which(colnames(Imp)=='EOS');     idc1
idc2      <- which(colnames(Imp)=='Mesh');    idc2
idc3      <- which(colnames(Imp)=='Friction');idc3
idc4      <- which(colnames(Imp)=='A.12');    idc4
idc5      <- which(colnames(Imp)=='B.123');   idc5
idc6      <- which(colnames(Imp)=='C.123');   idc6
idc7      <- which(colnames(Imp)=='R1'); idc7
k         <- dim(Imp)[2];k
Design    <- Imp[,idc1:idc3]
D         <- Imp[,idc4:idc6]
Data      <- Imp[,idc7:k]
DF        <- data.frame(Design,D,Data); # all except my.labels
rm(Imp)
# Define colors
cls.3       <- c('black','cyan','blue')
points.3    <- c(2,15,22)
cls.2       <- c('red','blue')
points.2    <- c(9,19)
Inn       <-  Data
my.labels
pca.mod   <- prcomp(Inn,scale=TRUE)
scores    <- pca.mod$x
loadings  <- pca.mod$rotation
expl.var <- round(propVar(pca.mod)*100,digits = 0);expl.var
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.2[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-4,4)
plot(scores[,1],
     main=paste0('PCA scores'),
     xlab='samples',
     ylab=paste0('PC1:',expl.var[1],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
my.ylim <- c(-1,1)
plot(loadings[,1],xaxt='n',
     main=paste0('PCA loadings'),
     xlab=paste0(''),
     ylab=paste0('PC1:',expl.var[1],'%'),
     ylim=my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
setwd("D:/Masteroppgave/Data Analysis R/Multiparameter2_2")
getwd()
#################
# Get libraries
#################
# install.packages("readxl")
# install.packages("factoextra")
# install.packages("ffmanova")
library(readxl)
#library(factoextra)
#library(ffmanova)
#library(sjPlot)
#library(sjmisc)
#library(ggplot2)
#################
# Clear all
#################
rm(list=ls())
propVar <- function(object){
  vars <- object$sdev^2
  vars/sum(vars)
}
data_summary <- function(data, varname, groupnames){
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}
Imp <- as.data.frame(read_excel("Data/Multi-param 2_2.xlsx", sheet = "2R"))
rownames(Imp)<- Imp[,1]
Imp[1:4,]
my.labels <- Imp[,1]
idc1      <- which(colnames(Imp)=='A.123');     idc1
idc2      <- which(colnames(Imp)=='B.123');    idc2
idc3      <- which(colnames(Imp)=='C.123');idc3
idc4      <- which(colnames(Imp)=='Density');   idc4
idc5      <- which(colnames(Imp)=='Wc');   idc5
idc6      <- which(colnames(Imp)=='Yield');   idc6
idc7      <- which(colnames(Imp)=='R1'); idc7
k         <- dim(Imp)[2];k
D         <- Imp[,idc1:idc3]
Design    <- Imp[,idc4:idc6]
Data      <- Imp[,idc7:k]
DF        <- data.frame(D,Design,Data); # all except my.labels
rm(Imp)
# Define colors
cls.3       <- c('black','cyan','blue')
points.3    <- c(2,15,22)
#####
Inn       <-  Data
my.labels
pca.mod   <- prcomp(Inn,scale=TRUE)
scores    <- pca.mod$x
loadings  <- pca.mod$rotation
expl.var <- round(propVar(pca.mod)*100,digits = 0);expl.var
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.3[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-5,5)
plot(scores[,1:2],
     main=paste0('PCA scores'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
my.ylim <- c(-1,1)
my.xlim <- c(-0.6,0.6)
plot(loadings[,1:2],cex=0.0001,
     main=paste0('PCA loadings'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     ylim=my.ylim,
     xlim=my.xlim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
text(loadings[,1:2], labels=rownames(loadings))
#my.xlim <- c(-4,3)
my.ylim <- c(-5,5)
plot(scores[,1:2],
     main=paste0('PCA scores'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.3[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-5,5)
plot(scores[,1:2],
     main=paste0('PCA scores'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
my.ylim <- c(-1,1)
my.xlim <- c(-0.6,0.6)
plot(loadings[,1:2],cex=0.0001,
     main=paste0('PCA loadings'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     ylim=my.ylim,
     xlim=my.xlim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
text(loadings[,1:2], labels=rownames(loadings))
setwd("D:/Masteroppgave/Data Analysis R/Multiparameter2_2")
getwd()
#################
# Get libraries
#################
# install.packages("readxl")
# install.packages("factoextra")
# install.packages("ffmanova")
library(readxl)
#library(factoextra)
#library(ffmanova)
#library(sjPlot)
#library(sjmisc)
#library(ggplot2)
#################
# Clear all
#################
rm(list=ls())
#################
# Run functions
#################
propVar <- function(object){
  vars <- object$sdev^2
  vars/sum(vars)
}
data_summary <- function(data, varname, groupnames){
  summary_func <- function(x, col){
    c(mean = mean(x[[col]], na.rm=TRUE),
      sd = sd(x[[col]], na.rm=TRUE))
  }
  data_sum<-ddply(data, groupnames, .fun=summary_func,
                  varname)
  data_sum <- rename(data_sum, c("mean" = varname))
  return(data_sum)
}
#################
# Get the data
#################
Imp <- as.data.frame(read_excel("Data/Multi-param 2_2.xlsx", sheet = "2R"))
rownames(Imp)<- Imp[,1]
Imp[1:4,]
my.labels <- Imp[,1]
idc1      <- which(colnames(Imp)=='A.123');     idc1
idc2      <- which(colnames(Imp)=='B.123');    idc2
idc3      <- which(colnames(Imp)=='C.123');idc3
idc4      <- which(colnames(Imp)=='Density');   idc4
idc5      <- which(colnames(Imp)=='Wc');   idc5
idc6      <- which(colnames(Imp)=='Yield');   idc6
idc7      <- which(colnames(Imp)=='R1'); idc7
k         <- dim(Imp)[2];k
D         <- Imp[,idc1:idc3]
Design    <- Imp[,idc4:idc6]
Data      <- Imp[,idc7:k]
DF        <- data.frame(D,Design,Data); # all except my.labels
rm(Imp)
# Define colors
cls.3       <- c('red','cyan','blue')
points.3    <- c(2,15,22)
Inn       <-  Data
my.labels
pca.mod   <- prcomp(Inn,scale=TRUE)
scores    <- pca.mod$x
loadings  <- pca.mod$rotation
expl.var <- round(propVar(pca.mod)*100,digits = 0);expl.var
# 1D plot of PC
#pdf('./Figures/PCA 1D plots PC1 PC2 PC3 PC4.pdf')
par(mfrow=c(2,2))
my.cls.s  <- cls.3[D$A.12];my.cls.s
my.pch.s  <- points.3[D$B.123];my.pch.s
#my.xlim <- c(-4,3)
my.ylim <- c(-5,5)
plot(scores[,1:2],
     main=paste0('PCA scores'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     col=my.cls.s,pch=my.pch.s,
     ylim = my.ylim)
abline(h=0,v=0,lty=1,col='gray50')
my.ylim <- c(-1,1)
my.xlim <- c(-0.6,0.6)
plot(loadings[,1:2],cex=0.0001,
     main=paste0('PCA loadings'),
     xlab=paste0('PC1:',expl.var[1],'%'),
     ylab=paste0('PC2:',expl.var[2],'%'),
     ylim=my.ylim,
     xlim=my.xlim)
abline(h=0,v=0,lty=1,col='gray50')
axis(1,at=c(1:6),labels=rownames(loadings),las=2)
text(loadings[,1:2], labels=rownames(loadings))




