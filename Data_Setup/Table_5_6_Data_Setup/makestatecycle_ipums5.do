set more off

log using makestatecycle_ipums5.log, replace

** merge IPUMS cps state codes by abbreviation to state level BC data
** merge the above with annual national BC data

** now the state level BC data will have correct codes in each year for merging
** with IPUMS cps -- note that prior to 1977, some states not uniquely identified
** annual state BC data is now also linked to annual national BC data

** merge with new dataset from raven
** add change in national and state ur to data set

** program starts with a state emp data set, merges in cps state codes for 1963 to 2005 saves as stateccyle_ipums
** second part of program creates variables in statecycle_ipums for merging with march cps data

** keep nondetrended urates 

** added bartik and oil price shocks developed by raven 

set mem 100m

cd .\Input\.

use ipumscps_statecodes.dta
sort abbrev
save ipumscps_statecodes.dta, replace 
clear

/*
* Not using vars from cycle anymore - 2/16/2010
use cycle.dta
sort year 
tempfile tempcycle
save tempcycle, replace
clear
*/

use bartik_s10.dta
sort year state
save bartik_s10.dta, replace
clear


use stateemp3

summ

* merge in bartik shocks which are in a state-year dataset for 1969 to 2006

sort year state

merge year state using bartik_s10
tab1 _merge
tab1 year if _merge < 3
tab1 year state if _merge==1
tab1 year state if _merge==2
tab1 year state if _merge==3

drop _merge

rename state xstatefip
sort year xstatefip
preserve

* push UI claims back one year to match april to march pattern of cps
* so for example 1970 march cps survey is matched with 1969 UI claims
* do this in statemp data set which has all states and years, before relabeling states with cps limited fips codes

keep year xstatefip urated uratedus ruratedx urate urateus
replace year = year + 1
sort year xstatefip
tempfile tempUI
save tempUI, replace
clear

restore
drop urated uratedus ruratedx urate urateus
sort year xstatefip
merge year xstatefip using tempUI
tab1 _merge 
tab1 year if _merge < 3
drop _merge

sort year abbrev

preserve

** Create first differences, leads and lags 

collapse (mean) gapus ur12 uratedus (sd) sdur12=ur12, by(year)
summ
drop sdur12
sort year

gen c1gapus  = gapus[_n] - gapus[_n-1]
*gen c1ur12 = ur12[_n] - ur12[_n-1]
gen c1uratedus = uratedus[_n] - uratedus[_n-1]

gen l1gapus = gapus[_n-1]
gen l1ur12 = ur12[_n-1]
gen l1uratedus = uratedus[_n-1]

gen L1gapus = gapus[_n+1]
gen L1ur12 = ur12[_n+1]
gen L1uratedus = uratedus[_n+1]

sort year
*list
tempfile tempdev
save tempdev, replace
clear


restore

sort year
merge year using tempdev
tab1 _merge
drop _merge

sort abbrev year
by abbrev: gen c1gap = gap[_n] - gap[_n-1]
*by abbrev: gen c1ruc_rst = ruc_rst[_n] - ruc_rst[_n-1]
by abbrev: gen c1urated = urated[_n] - urated[_n-1]

by abbrev: gen l1gap = gap[_n-1]
by abbrev: gen l1ruc_rst = ruc_rst[_n-1]
by abbrev: gen l1urated = urated[_n-1]

by abbrev: gen L1gap = gap[_n+1]
by abbrev: gen L1ruc_rst = ruc_rst[_n+1]
by abbrev: gen L1urated = urated[_n+1]

summ

*summ if c1ur12==.
*summ if c1ur12~=.
*summ if year >= 1963
*summ if ruc_rst~=.

*save statecycle_ipums, replace

tempfile tempstateemp
save tempstateemp, replace
clear


** Merge in cps fips codes by year of survey

use tempstateemp
drop if year > 1967 | year < 1963
summ year
sort abbrev year
merge abbrev using ipumscps_statecodes.dta
tab1 _merge
drop _merge
drop code6872 code7375 code76 code77plus
rename code6367 statefip
*summ
tempfile temp6367
save temp6367, replace
clear

use tempstateemp
drop if year > 1972 | year < 1968
summ year
sort abbrev year
merge abbrev using ipumscps_statecodes.dta
tab1 _merge
drop _merge
drop code6367 code7375 code76 code77plus
rename code6872 statefip
tempfile temp6872
save temp6872, replace
clear

use tempstateemp
drop if year > 1975 | year < 1973
summ year
sort abbrev year
merge abbrev using ipumscps_statecodes.dta
tab1 _merge
drop _merge
drop code6367 code6872 code76 code77plus
rename code7375 statefip
tempfile temp7375
save temp7375, replace
clear

use tempstateemp
drop if year ~= 1976
summ year
sort abbrev year
merge abbrev using ipumscps_statecodes.dta
tab1 _merge
drop _merge
drop code6367 code6872 code7375 code77plus
rename code76 statefip
tempfile temp76
save temp76, replace
clear

use tempstateemp
drop if year < 1977
summ year
sort abbrev year
merge abbrev using ipumscps_statecodes.dta
tab1 _merge
drop _merge
drop code6367 code6872 code7375 code76
rename code77plus statefip
tempfile temp77plus
save temp77plus, replace
clear

use temp6367
append using temp6872
append using temp7375
append using temp76
append using temp77plus

*summ

sort year statefip
summ year

/*
merge year using tempcycle
tab1 _merge
tab1 year if _merge < 3
drop if _merge < 3
drop _merge
*/

*summ

* save statecycle_ipums.dta, replace
* clear


* have to collapse to get correct means for years in which states not separately identified
* this drops a bunch of things from bartik.dta not specified in list below

#delimit ;

drop if statefip < 1 | statefip >= 99 ;
drop if statefip==0 ;
drop abbrev abbrevlc xstatefip fullname ;

collapse ruc_rst ee_rst c1ee_rst p10c1ee_rst p90c1ee_rst p9010c1emp 
   ur12 eeus eetus eet_rst 
   gapus gap urated uratedus rgap rgapx gapx rrucx ruratedx
   urate urateus 
   bartik15r oilshock151r oilshock1512r, 
   by(year statefip) ;

*collapse ruc_rst ee_rst c1ee_rst p10c1ee_rst p90c1ee_rst p9010c1emp 
   ur12 c1ur12 c1ruc_rst c1eeus eeus eetus eet_rst 
   gapus gap c1gapus c1gap urated uratedus rgap rgapx gapx c1eex rrucx ruratedx
   c1uratedus c1urated l1gapus l1ur12 l1uratedus L1gapus L1ur12 L1uratedus 
   l1gap l1ruc_rst l1urated L1gap L1ruc_rst L1urated
   urate urateus 
   bartik15r oilshock151r oilshock1512r, 
   by(year statefip) ;

* Current preferred BC vars are gapus, rgap, ur12, rruc, urateus and rurate ;
* Controls for state conditions relative to national ;

* relative state unemployment and scaled unemployment ;
gen rruc = ruc_rst - ur12 ;

* relative deviation of state emp growth from HP trend - already in data ;
*gen rgap = gap - gapus ;

* relative state UI claims rate ;
gen rurate = urate - urateus ;

summ gapus rgap urateus rurate ur12 rruc ;


summ ;
tab1 year ;

sort year statefip ;

sort year ;
by year: summ ;

cd ..\Output\. ;

save statecycle_ipums.dta, replace  ;

log close ;
clear ;
