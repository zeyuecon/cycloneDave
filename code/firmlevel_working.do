egen id = group(newf iso)
egen it = group(iso year)

xtset id year
g ratio_lag = l.ratio
replace ratio_lag = 0 if ratio_lag == .
g shock = ratio_lag*i_wind_k
g shock_major = ratio_lag*i_wind_major_all_k
g shock_max = ratio_lag*i_wind_max_k

bys year newf: egen shock_total = sum(shock)

g non_i_shock = shock_total-shock
g log_values = log(values)


