use ch6pvarex.dta
xtreg ln_wage ttl_exp tenure wks_work,fe
xtreg ln_wage ttl_exp tenure wks_work,fe vce(cluster idcode)
reg ln_wage ttl_exp tenure wks_work i.year
reg ln_wage ttl_exp tenure wks_work i.idcode i.year
reg ln_wage ttl_exp tenure  i.idcode i.year
xtreg ln_wage ttl_exp tenure wks_work i.year,fe vce(cluster idcode)
