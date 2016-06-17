


setwd("/Volumes/SAMSUNG/DataSharing")


all.country<-read.dta13("Storm_measures_1990_2014_all_countries.dta")
colnames(all.country)[13]<-"iso"

storm.country<-read.dta13("Storm_measures_1990_2014_storm_countries.dta")
export<-read.dta13("export.dta")
export$values<-log(as.numeric(as.character(export$value)))

# generate i to j data
xij<-read.dta13("export.ij.dta")

#xij.sub<-xij[,1:4]
colnames(all.country)[13]<-"iso"

# from i to j, both export country and import country
all.ij<- merge(all.country, xij, by = c("year","iso"), all = T)
all.ij<-na.omit(all.ij)
all.ij$iso<-factor(all.ij$iso)
all.ij$year<-factor(all.ij$year)


save.dta13(all.ij, file ="all.country.export.storm.both.dta")


# only import matters
all<- merge(all.country, export, by = c("year","iso"), all = T)
all<-data.frame(all)

all<-all[,-3]

all$iso<-factor(all$iso)
all$year<-factor(all$year)

#all<-all[-which(all$iso==c("ATA","ATF","CCK","BVT","CUW","CXR","ESH","HMD","IOT","MAF","MNE","UMI","VAT")),]

all<-all[-which(all$iso==c("ATA")),]
all<-all[-which(all$iso==c("ATF")),]
all<-all[-which(all$iso==c("CCK")),]
all<-all[-which(all$iso==c("BVT")),]
all<-all[-which(all$iso==c("CUW")),]
all<-all[-which(all$iso==c("CXR")),]
all<-all[-which(all$iso==c("ESH")),]
all<-all[-which(all$iso==c("HMD")),]
all<-all[-which(all$iso==c("IOT")),]
all<-all[-which(all$iso==c("MAF")),]
all<-all[-which(all$iso==c("MNE")),]
all<-all[-which(all$iso==c("UMI")),]
all<-all[-which(all$iso==c("VAT")),]
#5815

save.dta13(all, file ="all.country.export.storm.dta")






