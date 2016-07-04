//********************************************************************************************
// This is a collection and summary of what we have been checked for cyclone-import project.
// All the regressions I run after receiving data from Jonathan Colmer.
//********************************************************************************************
// All firm ids are unique and different among countries.
use "/Users/apple/360yunpan/DaveDonaldson/2016summer/ready_to_go_data.dta"

// Only import country data
xtset fd year
//single major indicator regression 
areg log_value major_storm_all_country i.year, absorb(destination) vce(robust)

//regress on all indicators/ 10 lags
areg log_value major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country i.year, absorb(destination) vce(robust)

// regress on 15 lags
areg log_value major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country L11.major_storm_all_country L12.major_storm_all_country L13.major_storm_all_country L14.major_storm_all_country L15.major_storm_all_country i.year, absorb(destination) vce(robust)



// regress on all the covariates with "all" and storm

areg log_value storm max_windspeed_all_country PDI_all_country_total ACE_all_country_total saffir_simpson_all_country major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country i.year, absorb(destination) vce(robust)



// 10 lag set

//5,6,7 negative
areg log_value major_storm_country L.major_storm_country L2.major_storm_country L3.major_storm_country L4.major_storm_country L5.major_storm_country L6.major_storm_country L7.major_storm_country L8.major_storm_country L9.major_storm_country L10.major_storm_country i.year, absorb(destination) vce(robust)
// 1,3,4,7 negative
areg log_value major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country i.year, absorb(destination) vce(robust)
// 3,5,6,7 negative
areg log_value saffir_simpson_country L.saffir_simpson_country L2.saffir_simpson_country L3.saffir_simpson_country L4.saffir_simpson_country L5.saffir_simpson_country L6.saffir_simpson_country L7.saffir_simpson_country L8.saffir_simpson_country L9.saffir_simpson_country L10.saffir_simpson_country i.year, absorb(destination) vce(robust)
// with 7 lags, most are 0
areg log_value saffir_simpson_all_country L.saffir_simpson_all_country L2.saffir_simpson_all_country  L3.saffir_simpson_all_country  L4.saffir_simpson_all_country  L5.saffir_simpson_all_country L6.saffir_simpson_all_country  L7.saffir_simpson_all_country  L8.saffir_simpson_all_country  L9.saffir_simpson_all_country L10.saffir_simpson_all_country  i.year, absorb(destination) vce(robust)
// most powerful
areg log_value ACE_country_total L.ACE_country_total L2.ACE_country_total L3.ACE_country_total L4.ACE_country_total L5.ACE_country_total L6.ACE_country_total L7.ACE_country_total L8.ACE_country_total L9.ACE_country_total L10.ACE_country_total i.year, absorb(destination) vce(robust)
//many negative, small 
areg log_value ACE_all_country_total L.ACE_all_country_total L2.ACE_all_country_total L3.ACE_all_country_total L4.ACE_all_country_total L5.ACE_all_country_total L6.ACE_all_country_total L7.ACE_all_country_total L8.ACE_all_country_total L9.ACE_all_country_total L10.ACE_all_country_total i.year, absorb(destination) vce(robust)
// negative
areg log_value PDI_country_total L.PDI_country_total L2.PDI_country_total L3.PDI_country_total L4.PDI_country_total L5.PDI_country_total L6.PDI_country_total L7.PDI_country_total L8.PDI_country_total L9.PDI_country_total L10.PDI_country_total i.year, absorb(destination) vce(robust)
// negative
areg log_value PDI_all_country_total L.PDI_all_country_total L2.PDI_all_country_total L3.PDI_all_country_total L4.PDI_all_country_total L5.PDI_all_country_total L6.PDI_all_country_total L7.PDI_all_country_total L8.PDI_all_country_total L9.PDI_all_country_total L10.PDI_all_country_total i.year, absorb(destination) vce(robust)
// nearly all negative, small
areg log_value max_windspeed_country L.max_windspeed_country L2.max_windspeed_country L3.max_windspeed_country L4.max_windspeed_country L5.max_windspeed_country L6.max_windspeed_country L7.max_windspeed_country L8.max_windspeed_country L9.max_windspeed_country L10.max_windspeed_country i.year, absorb(destination) vce(robust)
// negative but small
areg log_value max_windspeed_all_country L.max_windspeed_all_country L2.max_windspeed_all_country L3.max_windspeed_all_country L4.max_windspeed_all_country L5.max_windspeed_all_country L6.max_windspeed_all_country L7.max_windspeed_all_country L8.max_windspeed_all_country L9.max_windspeed_all_country L10.max_windspeed_all_country i.year, absorb(destination) vce(robust)









//import and export data
 use "\\afs\userhome\Downloads\all.country.export.storm.both.dta" 
//generate group indentification
egen it = group(export_destination year)
egen ij = group(export_destination destination)
unique it
unique ij

// regress on indicator variable and lags of major storm status
areg log_value major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 i.it, absorb(ij)

// ************** 0611 meeting ******************* It is good with all lags
// regress on indicator variable and lags of major storm status, fixed year effect and ij
egen ij = group(destination export_destination)
areg log_value i.year major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10, absorb(ij)  vce(robust)

//regress on max wind speed, pdi, major storm indicators and its lags
areg log_value max_windspeed_all_country PDI_all_country_total major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 i.it, absorb(ij)  vce(robust)



// collapse by i and t to form a X_it value and so on.

collapse log_value major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10, by(destination year)
// ln X_it = alpha_t + alpha_i + sum(beta_i times major_wind and its lags)
areg log_value major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 i.year, absorb(destination)  vce(robust)











// ************** all below, 0611 meeting *******************
//import and export data
use "/Users/apple/360yunpan/DaveDonaldson/0511/data.firm.level.0515.dta", clear
egen id = group(newf destination)
encode destination, generate(destination_)
// form a X_fti based data with varible: major_storm_all_country and its lags, export log_value.
collapse log_value major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10, by(id year destination)

//run regression: ln X_ift = alpha_f + alpha_i + alpha_t + sum(beta_i * wind_it)
//THis only good with 1 or 2 lags, which means it will return negative effect for only 1 or 2 period of time after storm.
reghdfe log_value i.year major_storm_all_country l1 l2, absorb(destination_ id)  vce(robust)

//run regression: ln X_ift = alpha_fi + alpha_t + sum(beta_i * wind_it)
// negative effect only if we include 1 lag.
areg log_value i.year major_storm_all_country l1 , absorb(fi)  vce(robust)



//non_i_shock panel regression

use "/Users/apple/360yunpan/DaveDonaldson/2016summer/ready_to_go_data.dta",clear
drop it
egen it = group(destination year)

 areg log_value non_i_shock i.it, absorb(unique_firm) vce(robust)







