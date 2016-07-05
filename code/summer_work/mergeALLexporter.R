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

exporter$c[which(exporter$c == "MEX1")]<- "MEX"
exporter$c[which(exporter$c == "MEX2")]<- "MEX"
exporter<-exporter[,1:6]
exporter[,1]<-as.factor(exporter[,1])
exporter[,2]<-as.factor(exporter[,2])
exporter[,3]<-as.factor(exporter[,3])
exporter[,4]<-as.factor(exporter[,4])
exporter[,5]<-as.factor(exporter[,5])

write.dta(exporter, file = "raw_exporter.dta")

# move to stata to collapse the data, form exporter_unique_firm
# refer to cleaningData.do


setwd("/Users/apple/360yunpan/DaveDonaldson/0502")
all.country<-read.dta13("Storm_measures_1990_2014_all_countries.dta")
colnames(all.country)[13]<-"destination"


exporter_unique_firm<-read.dta13("/Users/apple/360yunpan/DaveDonaldson/2016summer/exporter_data_unique_firm.dta")

merged.storm.exporter<-merge(exporter_unique_firm,all.country,  by = c("destination","year"), all = F)
setwd("/Users/apple/360yunpan/DaveDonaldson/2016summer/")
write.dta(merged.storm.exporter, file = "cleaned_unique_firm_exporter_storm_all_country_0703.dta")





