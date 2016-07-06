 // firm-level data with year, export (from) ctry, destination (to) ctry.
 collapse (sum) v , by(c f y d)
 
 rename v value
 rename c exporter
 rename f firm_non_unique
 rename d destination
 rename y year
 
 egen fd = group(firm_non_unique exporter)
egen it = group(exporter year)

save "/Users/apple/360yunpan/DaveDonaldson/2016summer/exporter_data_unique_firm.dta"


use "/Users/apple/360yunpan/DaveDonaldson/0502/Storm_measures_1990_2014_all_countries.dta"
rename iso3v10 destination
encode destination , gen(des)
drop destination 
rename des destination
drop unsdcode

 merge m:m destination using "/Users/apple/360yunpan/DaveDonaldson/2016summer/exporter_data_unique_firm.dta"

 
 
 use "/Users/apple/360yunpan/DaveDonaldson/2016summer/exporter_data_unique_firm.dta", clear
sort destination year
use "/Users/apple/360yunpan/DaveDonaldson/2016summer/Storm_measures_1990_2014_all_countries.dta", clear
sort destination year
merge 1:m destination year using "/Users/apple/360yunpan/DaveDonaldson/2016summer/exporter_data_unique_firm.dta"
keep if _m == 3
drop _m
 save "/Users/apple/360yunpan/DaveDonaldson/2016summer/stata_merged_ready_cyclone.dta"


// go to R to merge with year and destination.
use "/Users/apple/360yunpan/DaveDonaldson/2016summer/cleaned_unique_firm_exporter_storm_all_country_0703.dta", clear

drop fd
egen unique_firm = group(firm_non_unique exporter)
egen fd = group(unique_firm destination)

xtset fd year
bys year unique_firm: egen firm_total = sum(value)
bys year unique_firm: gen ratio = value/firm_total

xtset fd year
g ratio_lag = l.ratio

replace ratio_lag = 0 if ratio_lag == .

// generate single firm shock variables

g shock_max_wind = ratio_lag * max_windspeed_country

g shock_max_wind_all = ratio_lag * max_windspeed_all_country

g shock_pdi = ratio_lag * PDI_country_total

g shock_pdi_all = ratio_lag * PDI_all_country_total

g shock_ace = ratio_lag * ACE_country_total

g shock_ace_all = ratio_lag * ACE_all_country_total

g shock_saffir = ratio_lag * saffir_simpson_country

g shock_saffir_all = ratio_lag * saffir_simpson_all_country

g shock_major_all = ratio_lag* major_storm_all_country

g shock_major = ratio_lag* major_storm_country

// shock total generator variables

bys year unique_firm: egen shock_max_wind_total = sum(shock_max_wind)

bys year unique_firm: egen shock_max_wind_all_total = sum(shock_max_wind_all)

bys year unique_firm: egen shock_pdi_total = sum(shock_pdi)

bys year unique_firm: egen shock_pdi_all_total = sum(shock_pdi_all)

bys year unique_firm: egen shock_ace_total = sum(shock_ace)

bys year unique_firm: egen shock_ace_all_total = sum(shock_ace_all)

bys year unique_firm: egen shock_saffir_total = sum(shock_saffir)

bys year unique_firm: egen shock_saffir_all_total = sum(shock_saffir_all)

bys year unique_firm: egen shock_major_all_total = sum(shock_major_all)

bys year unique_firm: egen shock_major_total = sum(shock_major)



g non_i_shock_max = shock_max_wind_total - shock_max_wind

g non_i_shock_max_all = shock_max_wind_all_total - shock_max_wind_all

g non_i_shock_pdi = shock_pdi_total  - shock_pdi

g non_i_shock_pdi_total = shock_pdi_all_total - shock_pdi_all

g non_i_shock_ace = shock_ace_total - shock_ace

g non_i_shock_ace_all = shock_ace_all_total - shock_ace_all

g non_i_shock_saffir = shock_saffir_total - shock_saffir

g non_i_shock_saffir_all = shock_saffir_all_total -shock_saffir_all

g non_i_shock_major_all = shock_major_all_total - shock_major_all

g non_i_shock_major = shock_major_total - shock_major




g log_value = log(value)












