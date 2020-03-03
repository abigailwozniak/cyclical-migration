* Stata do-file to run state-level gross in-migration and out-migration regessions for table 3
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

log using table3.log, replace

*use table3, clear
use Input\table3, clear

xi: ivreg28 inexemss gapusstd (rgapstd rgapxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m1igap
xi: ivreg28 inexemss ur12std (rrucstd rrucxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m1iur
xi: ivreg28 inexemss urateus1std rurate1std ruratex1std rinc1 rincx1 i.state*trend ,  fwl(_I*) cluster(year)
estimates store m1ic

xi: ivreg28 outexemss gapusstd (rgapstd rgapxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m1ogap
xi: ivreg28 outexemss ur12std (rrucstd rrucxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m1our
xi: ivreg28 outexemss urateus1std rurate1std ruratex1std rinc1 rincx1 i.state*trend ,  fwl(_I*) cluster(year)
estimates store m1oc

xi: ivreg28 linexems gapusstd (rgapstd rgapxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m2igap
xi: ivreg28 linexems ur12std (rrucstd rrucxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m2iur
xi: ivreg28 linexems urateus1std rurate1std ruratex1std rinc1 rincx1 i.state*trend ,  fwl(_I*) cluster(year)
estimates store m2ic

xi: ivreg28 loutexems gapusstd (rgapstd rgapxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m2ogap
xi: ivreg28 loutexems ur12std (rrucstd rrucxstd= bartik151rstd oilshock151rstd oilshock151rstd2 bartik151rxstd oilshock151rxstd oilshock151rxstd2 ) rinc1 rincx1 i.state*trend ,  fwl(_I*) first cluster(year)
estimates store m2our
xi: ivreg28 loutexems urateus1std rurate1std ruratex1std rinc1 rincx1 i.state*trend ,  fwl(_I*) cluster(year)
estimates store m2oc


estout m1igap m1ogap m2igap m2ogap,  keep(gapusstd rgapstd rgapxstd rinc1 rincx1) cells(b(star fmt(3)) se(par fmt(3))) stats(N)
estout m1iur m1our m2iur m2our, keep(ur12std rrucstd rrucxstd rinc1 rincx1) cells(b(star fmt(3)) se(par fmt(3))) stats(N)
estout m1ic m1oc m2ic m2oc, keep(urateus1std rurate1std ruratex1std rinc1 rincx1) cells(b(star fmt(3)) se(par fmt(3))) stats(N)


quietly log off
quietly log close
