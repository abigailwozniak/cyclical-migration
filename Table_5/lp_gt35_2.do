#delimit ;
capture program drop _all ;
capture macro drop _all ;

log using lp_gt35_2.log, replace ;

/*****************************************

This file generates baseline estimates of a linear prob migration model using CPS
microdata.  

Business cycle variables are expressed in standardized format and SEs are HAC consistent. 
Local conditions are IV'd in the case of unemployment rate and emp gap.

Specifications are unweighted and include controls for age, educ, rac, ethnicity,
marital status, number of children, gender and quadratic time trend.
Sample is heads ages 18-65.

Note: This script was created from table6_gt35 in _submission2008.

Restrict sample to those 36 and up ;

*******************************************/

set matsize 100 ;

set mem 1g ;
*use /homes/nber/waggoner/bulk/marchcps_mig.dta ;

cd ../Data_Setup/. ;

use Table_5_6_Data_Setup/Output/marchcps_mig.dta ;

cd ../Table_5/. ;

*set mem 500m ;
*use /homes/nber/waggoner/bulk/marchcps_mig_test.dta ;

* CHECK that this produces same results as with earlier data ;
* Not exactly the same - some sample sizes different - maybe last iteration had data through 2006? ;
* But point estimates not really changed ;
* drop if year > 2004 ;

drop if age < 36 ;
drop if head~= 1 ;

* Create age grouping along major mobility lines ;
gen agegrp = . ;
replace agegrp = 1 if age <= 25 & age ~=. ;
replace agegrp = 2 if age >= 26 & age <= 30 ;
replace agegrp = 3 if age >= 31 & age <= 35 ;
replace agegrp = 4 if age >= 36 & age <= 45 ;
replace agegrp = 5 if age >= 46 & age <= 55 ;
replace agegrp = 6 if age >= 56 & age ~=. ;

char educ[omit] 2 ;

egen timet = group(year) ;
gen timet2 = timet*timet ;

gen kids = (nchild >=1 ) ;
summ kids nchild ;

* metro status - lots of not identifiable early on - set these to . ;
gen metrostat=. ;
replace metrostat=0 if metro==1 ;
replace metrostat=1 if metro==2 | metro==3 | metro==4 ; * in later years there are lots of 4s so merge these in one group ;

replace ruc_rst = . if year < 1977 ;
replace rrucx = . if year < 1977 ;

summ rgap gapus rruc ur12 rurate urateus ;

* Standardize aggregate and state level variables ;

foreach varn in rgap gapus rruc ur12 rurate urateus { ;
   egen `varn'_std = std(`varn') ;
} ;

summ *_std ;

gen perid = serial*10000 + year ;
summ perid ;

tsset perid year ; 

program define regs ;

ivreg2 cmigrant $bc $lbc black hisp female spouse kids timet timet2 _I* ,cluster(year) robust;
ivreg2 smigrant $bc $lbc black hisp female spouse kids timet timet2 _I* ,cluster(year) robust;

end ;

program define regsiv ;

ivreg2 cmigrant $bc black hisp female spouse kids timet timet2 _I* ($lbc=bartik15r oilshock151r oilshock1512r),cluster(year) robust;
ivreg2 smigrant $bc black hisp female spouse kids timet timet2 _I* ($lbc=bartik15r oilshock151r oilshock1512r),cluster(year) robust;

end ;

**NOTE: Compute first stages elsewhere.  These give too big Fs, since not clustered. ;

xi i.agegrp i.educ i.empstat i.metrostat ;

gen styr = (year*100) + statefip ;

global bc ur12_std ;
global lbc rruc_std  ;
regsiv ;

global bc gapus_std ;
global lbc rgap_std  ;
regsiv ;

* Not instrumenting for ui claims, since that is plausibly exog by itself. ;
global bc urateus_std ;
global lbc rurate_std  ;
regs ;


log close ;


