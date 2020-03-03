
set mem 2500m
set matsize 400
set more off

log using make_marchcps.log, replace

* read in extract from ipums - contains March CPS data 1962-2009
* now create separate data sets for heads and nonheads, keep everyone in allcps data set

*quietly do ipums6.do 
quietly do Input\ipums6.do 

* drop years for which migration status 1 year ago is n.a.

drop if inlist(year,1962,1963,1972,1973,1974,1975,1977,1978,1979,1980,1985,1995) 
tab1 year 


* create family status variables 

gen spouse = (marst==1) 

*drop if inlist(relate,101,301,303)~=1
gen child=(relate==301 | relate==303)
*gen child=(relate > 101)
sort year serial
by year serial: egen nchild=sum(child)

gen ndependents = numprec - 1


* label hh heads -- relate = 101 -- do we have hh observed more than once?
gen head=(relate==101)
tab1 relate head
tab1 relate if head==0

tab1 nchild ndependents if head==1
*drop child


* education variable is higrade 1962-91 and educ99 for 1992 onwards

gen educ = 1 if higrade>=31 & higrade<=141 & year < 1992
replace educ = 2 if higrade==150  & year < 1992
replace educ = 3 if higrade>=151 & higrade<=181 & year < 1992
replace educ = 4 if higrade>=190 & higrade<=210 & year < 1992

replace educ = 1 if educ99>=1 & educ99<=9 & year >= 1992
replace educ = 2 if educ99>=10 & educ99<=10 & year >= 1992
replace educ = 3 if educ99>=11 & educ99<=13 & year >= 1992
replace educ = 4 if educ99>=14 & educ99<=17 & year >= 1992

tab educ
tab year educ, row

/*
* educrec no longer available on ipums data
gen educ2 = 1 if educrec >=1 & educrec <= 6 
replace educ2 = 2 if educrec==7 
replace educ2 = 3 if educrec==8 
replace educ2 = 4 if educrec==9 

tab educ educ2
tab1 year if educ~=educ2
*/

* specific race/ethnicity dummies
gen black=(race==200)

* hisp includes hisp and other -- hispan starts in 1971
gen hisp=(race>=300)
replace hisp = 1 if hispan > 0 & hispan <=410
tab1 hispan if hisp==1

gen female=(sex==2)
drop sex

* the state variable takes on 51 values starting in 1977

gen stateflag=(statefip >= 61 & statefip <= 90)
tab1 stateflag

* migration variables for domestic residents - categories are exclusive
* 1=same county, 2=same state, 3=different state

gen migdist = 0 if migrate1==1
replace migdist = 1 if migrate1==3
replace migdist = 2 if migrate1==4 
replace migdist = 3 if migrate1==5

tab year migrate1, row
tab year migdist, row

* drop those not in migration sample or abroad in prev year
drop if migrate1==0 | migrate1==6

* new migration variables 

* combines within and across state migration--have this for longest time period
* 0=nonmover/same county, 1=different county
gen cmigrant = (migdist==2 | migdist==3)
tab cmigrant
tab year cmigrant

* dummy for cross state migration only -- also have this for long time period
* 0=same state/nonmover, 1=different state
gen smigrant = (migdist==3) 
tab smigrant
tab year smigrant

* dummy for moving houses within county, cross counties, or cross states, 0=same house
gen hmigrant=(migdist > 0)
tab hmigrant
tab year hmigrant


* homeownership -- 1976 on
gen owner = (ownershp==10)
replace owner = . if ownershp==. | ownershp==0

tab owner


* employment: 1 = working, 2=unemployed, 3=not in labor force (including armed forces)

rename empstat esr

gen empstat = 1 if esr==10 | esr==12
replace empstat = 2 if esr>=20 & esr <= 22
replace empstat = 3 if esr==13 | (esr >= 30 & esr <= 35)

tab year empstat, row

gen wgtfnl = int(blswt / 100)
replace wgtfnl = int(perwt / 100) if wgtfnl==.


* merge in annual business cycle variables using statecycle
* contains state and national BC vars, supercedes cycle.dta

preserve
clear

*use statecycle_ipums.dta
use Output/statecycle_ipums.dta
sort year statefip
tempfile tempstatecycle
*save tempstatecycle, replace
save Output\tempstatecycle, replace
clear

restore

sort year statefip
*merge year statefip using tempstatecycle
merge year statefip using Output\tempstatecycle
tab1 _merge
drop if _merge < 3

drop _merge

summ

* data set with all cps respondents

summ 

compress

*save marchcps_mig_allcps.dta, replace
save Output\marchcps_mig_allcps.dta, replace

* data set as before with only hhhs ages 18 to 65
* keep only working age individuals

preserve 

drop if age < 18 | age > 65
summ age
drop if head==0

*save marchcps_mig.dta, replace
save Output\marchcps_mig.dta, replace

summ 

sample 10 
*save marchcps_mig_test.dta, replace
save Output\marchcps_mig_test.dta, replace

restore 

drop if age  < 65 

*save marchcps_mig_65up.dta, replace
save Output\marchcps_mig_65up.dta, replace

log close
clear


