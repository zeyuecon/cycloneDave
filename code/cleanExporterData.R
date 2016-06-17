install.packages("readstata13")
library(readstata13)
library(foreign)
library(data.table)
# Set directory
setwd("/Volumes/SAMSUNG/DataSharing")
# import all the raw data from Worldbank
ALB<-read.dta13("ALB.dta")

BFA<-read.dta("BFA.dta")

BGR<-read.dta("BGR.dta")

GTM<-read.dta("GTM.dta")

JOR<-read.dta13("JOR.dta") #not 5-12

MEX<-read.dta("MEX.dta")

MWI<-read.dta("MWI.dta")

PER<-read.dta("PER.dta")

SEN<-read.dta("SEN.dta")

URY<-read.dta13("URY.dta") #not 5-12

YEM<-read.dta13("YEM.dta") #not 5-12

# Clean data for JOR since there are only 6 columns , others are 7
q<- rep(0,73844)
JOR<- cbind(JOR, q)

# combined all the exporters into 1
exporter<- rbind(ALB,BFA,BGR,GTM, JOR, MEX, MWI, PER, SEN, URY, YEM)

# c for exporter; y for year; d for importor; v for values
exporter<-exporter[,c(1,3,5,6)]

# factorize destination country
exporter$d<- as.factor(exporter$d)

# rename colname
colnames(exporter)<-c("export.iso", "year", "iso", "values")
# There are 2 Mexico exporter, merge them into 1
exporter$export.iso[which(exporter$export.iso == "MEX1")]<- "MEX"
exporter$export.iso[which(exporter$export.iso == "MEX2")]<- "MEX"

exporter$export.iso<-factor(exporter$export.iso)

# split data by country 
group <- split(exporter, exporter$iso)

#View(group$ABW)

# Sum over year to form yearly data. (aggregate)

group.sum<- list()

for( i in 1:length(group)){
  
  k<- group[[i]]
  c<- list(aggregate(values ~year, data = k, sum))
  names(c)<- names(group[i])
  group.sum = c(group.sum, c)
}

#save(group.sum, file = "group.sum.RData")
##############################################
## sum over exporter -> import over year######
##############################################
group.sum1<- list()

for( i in 1:length(group)){
  
  k<- group[[i]]
  c<- list(aggregate(values  ~year+export.iso+iso, data = k, sum))
  names(c)<- names(group[i])
  group.sum1 = c(group.sum1, c)
}

###########################################
#### importer at year t's value (M_jt) ####
###########################################

# Make all the list element into data frame. exporter data output

final<-NULL
for(i in 1: length(group.sum)){
  release<- as.matrix(group.sum[[i]])
  name<-rep(names(group.sum[i]), dim(release)[1])
  result<- cbind(name, release)
  final<- rbind(result,final)
}

export<- data.frame(final)
# name colnames
colnames(export)<-c("iso", "year", "values")

save.dta13(export, file = "export.dta")




###################################
#### exporter -> importer by t ####
###################################

final.ij<-NULL
for(i in 1: length(group.sum1)){
  release<- as.matrix(group.sum1[[i]])
  
  #name<-rep(names(group.sum1[i]), dim(release)[1])
  #result<- cbind(name, release)
  #final.ij<- rbind(result,final.ij)
  final.ij<- rbind(release,final.ij)
}

export.ij<- data.frame(final.ij)
# take log of import values
export.ij$values<- log(as.numeric(as.character(export.ij$values)))

save.dta13(export.ij, file = "export.ij.dta")


