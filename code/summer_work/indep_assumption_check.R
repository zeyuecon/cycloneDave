library("stringr")
cyclone<-read.dta13("/Users/apple/360yunpan/DaveDonaldson/2016summer/ready_to_go_data.dta")

cyclone$destination<-as.factor(cyclone$destination)

# Reference to http://www.imf.org/external/pubs/ft/weo/2015/01/weodata/groups.htm
# assigning dummy for undeveloped country
LDC <- read.delim("~/360yunpan/DaveDonaldson/2016summer/LDC.txt", header=FALSE, stringsAsFactors=FALSE)

LDC<-str_trim(LDC$V1)
m<-match(cyclone$countryeng,LDC)
undeveloped<-rep(0,length(cyclone$countryeng))
undeveloped[which(!is.na(m))]<-1

sum(undeveloped)

# assigning dummy for developed country
advEcon <- read.csv("~/360yunpan/DaveDonaldson/2016summer/advEcon.txt", comment.char="#")
advEcon<-str_trim(advEcon$Adv_Economies)
advEcon[which(advEcon == "United States")]<-"United States of America"
m<-match(cyclone$countryeng,advEcon)
developed<-rep(0,length(cyclone$countryeng))
developed[which(!is.na(m))]<-1


# assigning dummy for developed country
developing <- read.csv("~/360yunpan/DaveDonaldson/2016summer/developing.txt", header=FALSE, sep=";")
developing<-str_trim(developing$V1)
#developing[which(developing == "United States")]<-"United States of America"
m<-match(cyclone$countryeng,developing)
developing<-rep(0,length(cyclone$countryeng))
developing[which(!is.na(m))]<-1



cyclone<-cbind(cyclone, developed,developing)



