use CA,clear
tsline ca || tsline fa
tsline ca || tsline fa ||tsline (ca-fa)
gen ca_fa=ca+fa
tsline ca || tsline fa ||tsline ca_fa
tsline ca || tsline fa
dfuller ca, trend regress
dfuller D.ca, trend regress
dfuller fa, trend regress
dfuller D.fa, trend regress
var ca fa
varsoc ca fa,maxlag(4)
var ca fa,lag(1/2)
var ca fa,lag(1)
esti store VAR
varstable, estimate(VAR) graph dlabel
varnorm, jbera estimates(VAR)
vargranger,estimates(VAR)
irf create results1, set(myirf1) replace
!rm myirf1.irf
irf create results1, set(myirf1) replace
irf graph oirf, impulse(ca) response(fa)
irf graph fevd, impulse(ca) response(fa) lstep(2) 
var ca fa, lags(1/2) dfk
irf create order1, step(10) set(myirf1,replace)
irf create order2, step(10) order(fa ca)
irf ograph (order1 ca fa  oirf) (order2 ca fa oirf)
irf table sfevd fevd, impulse(ca) noci std
