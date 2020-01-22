* Stata do-file to run state-to-state migration regessions for table 2
* This data file does not include the LoanPerformance house price variables because these variables are proprietary
* Therefore, the results will not exactly match the published tables

set trace off
set more 1 
capture log close
clear
clear matrix
set mem 300m
set matsize 800
set linesize 200

log using table2.log, replace

use table2, clear

xi: ivreg28 exemptss  gapusstd  (orgapstd drgapstd=obartik15r1std dbartik15r1std ooilshock151rstd doilshock151rstd ooilshock151rstd2 doilshock151rstd2) orinc1 drinc1  i.ofips*trend i.dfips*trend ,  cluster(year) first fwl(_I*)
estimates store m1gap
xi: ivreg28 exemptss  ur12std  (orurstd drurstd=obartik15r1std dbartik15r1std ooilshock151rstd doilshock151rstd ooilshock151rstd2 doilshock151rstd2) orinc1 drinc1  i.ofips*trend i.dfips*trend ,  cluster(year) first fwl(_I*)
estimates store m1ur
xi: ivreg28 exemptss  urateus1std orurate1std drurate1std orinc1 drinc1  i.ofips*trend i.dfips*trend ,  cluster(year) fwl(_I*)
estimates store m1c
xi: ivreg28 lexempts  gapusstd  (orgapstd drgapstd=obartik15r1std dbartik15r1std ooilshock151rstd doilshock151rstd ooilshock151rstd2 doilshock151rstd2)  orinc1 drinc1  i.ofips*trend i.dfips*trend ,  cluster(year) fwl(_I*)
estimates store m2gap
xi: ivreg28 lexempts  ur12std  (orurstd drurstd=obartik15r1std dbartik15r1std ooilshock151rstd doilshock151rstd ooilshock151rstd2 doilshock151rstd2) orinc1 drinc1  i.ofips*trend i.dfips*trend ,  cluster(year) fwl(_I*)
estimates store m2ur
xi: ivreg28 lexempts  urateus1std  orurate1std drurate1std  orinc1 drinc1  i.ofips*trend i.dfips*trend ,  cluster(year) fwl(_I*)
estimates store m2c
estout m1gap m1ur m1c m2gap m2ur m2c,  cells(b(star fmt(3)) se(par fmt(3))) stats(N)


quietly log off
quietly log close
