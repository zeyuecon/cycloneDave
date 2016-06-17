


setwd("/Volumes/SAMSUNG/DataSharing")
setwd("/afs/ir.stanford.edu/users/z/e/zeyujin/Desktop/Dave_after0503/0503report/rawdata")


all.country<-read.dta13("Storm_measures_1990_2014_all_countries.dta")
colnames(all.country)[13]<-"iso"

storm.country<-read.dta13("Storm_measures_1990_2014_storm_countries.dta")
export<-read.dta13("/afs/ir.stanford.edu/users/z/e/zeyujin/Downloads/export.f.dta")
#export$values<-log(as.numeric(as.character(export$value)))


all.f<- merge(all.country, export, by = c("year","iso"), all = T)
all.f<-na.omit(all.f)
all.f$iso<-factor(all.f$iso)
all.f$year<-factor(all.f$year)