










// Only import country data
use "\\afs\userhome\Downloads\all.country.export.storm.dta" 
xtset iso year
//single major indicator regression 
areg values major_storm_all_country i.year, absorb(iso)

//regress on all indicators/ 10 lags
areg values major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country i.year, absorb(iso)

// regress on 15 lags
areg values major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country L11.major_storm_all_country L12.major_storm_all_country L13.major_storm_all_country L14.major_storm_all_country L15.major_storm_all_country i.year, absorb(iso)



// regress on all the covariates with "all" and storm

areg values storm max_windspeed_all_country PDI_all_country_total ACE_all_country_total saffir_simpson_all_country major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country i.year, absorb(iso)



// 10 lag set

//not negative
areg values major_storm_country L.major_storm_country L2.major_storm_country L3.major_storm_country L4.major_storm_country L5.major_storm_country L6.major_storm_country L7.major_storm_country L8.major_storm_country L9.major_storm_country L10.major_storm_country i.year, absorb(iso)
// very powerful
areg values major_storm_all_country L.major_storm_all_country L2.major_storm_all_country L3.major_storm_all_country L4.major_storm_all_country L5.major_storm_all_country L6.major_storm_all_country L7.major_storm_all_country L8.major_storm_all_country L9.major_storm_all_country L10.major_storm_all_country i.year, absorb(iso)
// not negative
areg values saffir_simpson_country L.saffir_simpson_country L2.saffir_simpson_country L3.saffir_simpson_country L4.saffir_simpson_country L5.saffir_simpson_country L6.saffir_simpson_country L7.saffir_simpson_country L8.saffir_simpson_country L9.saffir_simpson_country L10.saffir_simpson_country i.year, absorb(iso)
// good to use, small
areg values saffir_simpson_all_country L.saffir_simpson_all_country L2.saffir_simpson_all_country  L3.saffir_simpson_all_country  L4.saffir_simpson_all_country  L5.saffir_simpson_all_country L6.saffir_simpson_all_country  L7.saffir_simpson_all_country  L8.saffir_simpson_all_country  L9.saffir_simpson_all_country L10.saffir_simpson_all_country  i.year, absorb(iso)
//not negative(some of them), small 
areg values ACE_country_total L.ACE_country_total L2.ACE_country_total L3.ACE_country_total L4.ACE_country_total L5.ACE_country_total L6.ACE_country_total L7.ACE_country_total L8.ACE_country_total L9.ACE_country_total L10.ACE_country_total i.year, absorb(iso)
//not negative(some of them), small 
areg values ACE_all_country_total L.ACE_all_country_total L2.ACE_all_country_total L3.ACE_all_country_total L4.ACE_all_country_total L5.ACE_all_country_total L6.ACE_all_country_total L7.ACE_all_country_total L8.ACE_all_country_total L9.ACE_all_country_total L10.ACE_all_country_total i.year, absorb(iso)
//not negative
areg values PDI_country_total L.PDI_country_total L2.PDI_country_total L3.PDI_country_total L4.PDI_country_total L5.PDI_country_total L6.PDI_country_total L7.PDI_country_total L8.PDI_country_total L9.PDI_country_total L10.PDI_country_total i.year, absorb(iso)
//not negative
areg values PDI_all_country_total L.PDI_all_country_total L2.PDI_all_country_total L3.PDI_all_country_total L4.PDI_all_country_total L5.PDI_all_country_total L6.PDI_all_country_total L7.PDI_all_country_total L8.PDI_all_country_total L9.PDI_all_country_total L10.PDI_all_country_total i.year, absorb(iso)
// Not all negative, small
areg values max_windspeed_country L.max_windspeed_country L2.max_windspeed_country L3.max_windspeed_country L4.max_windspeed_country L5.max_windspeed_country L6.max_windspeed_country L7.max_windspeed_country L8.max_windspeed_country L9.max_windspeed_country L10.max_windspeed_country i.year, absorb(iso)
// negative but small
areg values max_windspeed_all_country L.max_windspeed_all_country L2.max_windspeed_all_country L3.max_windspeed_all_country L4.max_windspeed_all_country L5.max_windspeed_all_country L6.max_windspeed_all_country L7.max_windspeed_all_country L8.max_windspeed_all_country L9.max_windspeed_all_country L10.max_windspeed_all_country i.year, absorb(iso)









//import and export data
 use "\\afs\userhome\Downloads\all.country.export.storm.both.dta" 
//generate group indentification
egen it = group(export_iso year)
egen ij = group(export_iso iso)
unique it
unique ij

// regress on indicator variable and lags of major storm status
areg values major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 i.it, absorb(ij)

// regress on indicator variable and lags of major storm status, fixed year effect and ij
areg values i.year major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10, absorb(ij)

//regress on max wind speed, pdi, major storm indicators and its lags
areg values max_windspeed_all_country PDI_all_country_total major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 i.it, absorb(ij)

// collapse by i and t to form a X_it value and so on.

collapse values major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10, by(iso year)
// ln X_it = alpha_t + alpha_i + sum(beta_i times major_wind and its lags)
areg values major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10 i.year, absorb(iso)












//import and export data
use "/Users/apple/360yunpan/DaveDonaldson/0511/data.firm.level.0515.dta", clear
egen id = group(newf iso)

// form a X_fti based data with varible: major_storm_all_country and its lags, export values.
collapse log_values major_storm_all_country l1 l2 l3 l4 l5 l6 l7 l8 l9 l10, by(id year iso)

//run regression: ln X_ift = alpha_f + alpha_i + alpha_t + sum(beta_i * wind_it)
reghdfe log_values i.year major_storm_all_country l1 l2 l3 l4 l5 , absorb(iso_ id)









