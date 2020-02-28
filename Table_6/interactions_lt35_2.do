#delimit ;
capture program drop _all ;
capture macro drop _all ;

log using interactions_lt35_2.log, replace ;

/*****************************************

Interactions of baseline specs with educ, age, gender, and emp status.
Put all interactions in one program.  Now using non-detrended UI claims.

Do without weights.  No weights in data prior to 1976.

Restrict sample to people under 35. 

Add metro status to set of main controls.

*******************************************/

set matsize 100 ;

set mem 1000m ;
*use /homes/nber/waggoner/bulk/marchcps_mig.dta ;

cd ..\Data_Setup\Table_5_6_Data_Setup\Output\. ;

use markcps_mig.dta ;

*set mem 500m ;
*use /homes/nber/waggoner/bulk/marchcps_mig_test.dta ;

drop if age > 35 ;

* Create age grouping along major mobility lines ;
gen agegrp = . ;
replace agegrp = 1 if age <= 25 & age ~=. ;
replace agegrp = 2 if age >= 26 & age <= 30 ;
replace agegrp = 3 if age >= 31 & age <= 35 ;
replace agegrp = 4 if age >= 36 & age <= 45 ;
replace agegrp = 5 if age >= 46 & age <= 55 ;
replace agegrp = 6 if age >= 56 & age ~=. ;

tab1 agegrp ;

gen age2=age*age ;

char educ[omit] 2 ;
char empstat[omit] 1 ;

egen timet = group(year) ;
gen timet2 = timet*timet ;

gen kids = (nchild >=1 ) ;
summ kids nchild ;

* metro status - lots of not identifiable early on - set these to . ;
gen metrostat=. ;
replace metrostat=0 if metro==1 ;
replace metrostat=1 if metro==2 | metro==3 | metro==4 ; * in later years there are lots of 4s so merge these in one group ;

tab1 year if blswt==. ;

* Controls for state conditions relative to national ;

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

ivreg2 cmigrant $bc $lbc black hisp spouse kids timet timet2 _I* ,cluster(year) robust ;
capture drop _J* _K* ;

end ;

program define regsrace ;

ivreg2 cmigrant $bc $lbc spouse kids timet timet2 _I* ,cluster(year) robust ;
capture drop _J* _K* ;

end ;

program define regsiv ;

ivreg2 cmigrant $bc black hisp spouse kids timet timet2 _I* ($lbc = $zvars),cluster(year) robust ;
capture drop _J* _K* _Z* ;

end ;

program define regsraceiv ;

ivreg2 cmigrant $bc spouse kids timet timet2 _I* ($lbc = $zvars),cluster(year) robust ;
capture drop _J* _K* _Z* ;

end ;


gen styr = (year*100) + statefip ;

summ year ;

* preferred spec includes aggregate BC, state relative conditions, and group interactions with these;

** age interactions ;

xi i.educ i.owner i.female i.metrostat ;

xi, prefix(_J) i.agegrp|ur12_std ;
xi, prefix(_K) i.agegrp|rruc_std ;
global bc ur12_std _J* ;
global lbc rruc_std _K* ;

xi, prefix(_Z) i.agegrp|bartik15r i.agegrp|oilshock151r i.agegrp|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;

xi, prefix(_J) i.agegrp|gapus_std ;
xi, prefix(_K) i.agegrp|rgap_std ;
global bc gapus_std _J* ;
global lbc rgap_std _K* ;

xi, prefix(_Z) i.agegrp|bartik15r i.agegrp|oilshock151r i.agegrp|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;


xi, prefix(_J) i.agegrp|urateus_std ;
xi, prefix(_K) i.agegrp|rurate_std ;
global bc urateus_std _J* ;
global lbc rurate_std _K* ;

regs ;

drop _I* ;


** education interactions ;

xi i.agegrp i.owner i.female i.metrostat ;

xi, prefix(_J) i.educ|ur12_std ;
xi, prefix(_K) i.educ|rruc_std ;
global bc ur12_std _J* ;
global lbc rruc_std _K* ;

xi, prefix(_Z) i.educ|bartik15r i.educ|oilshock151r i.educ|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;

xi, prefix(_J) i.educ|gapus_std ;
xi, prefix(_K) i.educ|rgap_std ;
global bc gapus_std _J* ;
global lbc rgap_std _K* ;

xi, prefix(_Z) i.educ|bartik15r i.educ|oilshock151r i.educ|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;


xi, prefix(_J) i.educ|urateus_std ;
xi, prefix(_K) i.educ|rurate_std ;
global bc urateus_std _J* ;
global lbc rurate_std _K* ;

regs ;

drop _I* ;


** female interactions ;

xi i.agegrp i.educ i.owner i.metrostat ;

xi, prefix(_J) i.female|ur12_std ;
xi, prefix(_K) i.female|rruc_std ;
global bc ur12_std _J* ;
global lbc rruc_std _K* ;

xi, prefix(_Z) i.female|bartik15r i.female|oilshock151r i.female|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;

xi, prefix(_J) i.female|gapus_std ;
xi, prefix(_K) i.female|rgap_std ;
global bc gapus_std _J* ;
global lbc rgap_std _K* ;

xi, prefix(_Z) i.female|bartik15r i.female|oilshock151r i.female|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;


xi, prefix(_J) i.female|urateus_std ;
xi, prefix(_K) i.female|rurate_std ;
global bc urateus_std _J* ;
global lbc rurate_std _K* ;

regs ;

drop _I* ;


** race and ethnicity interactions ;

xi i.agegrp i.educ i.owner i.female i.metrostat ;

xi, prefix(_J) i.black|ur12_std i.hisp|ur12_std ;
xi, prefix(_K) i.black|rruc_std i.hisp|rruc_std ;
global bc ur12_std _J* ;
global lbc rruc_std _K* ;

xi, prefix(_Z) i.black|bartik15r i.black|oilshock151r i.black|oilshock1512r i.hisp|bartik15r i.hisp|oilshock151r i.hisp|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsraceiv ;

xi, prefix(_J) i.black|gapus_std i.hisp|gapus_std ;
xi, prefix(_K) i.black|rgap_std i.hisp|rgap_std ;
global bc gapus_std _J* ;
global lbc rgap_std _K* ;

xi, prefix(_Z) i.black|bartik15r i.black|oilshock151r i.black|oilshock1512r i.hisp|bartik15r i.hisp|oilshock151r i.hisp|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsraceiv ;

xi, prefix(_J) i.black|urateus_std i.hisp|urateus_std ; 
xi, prefix(_K) i.black|rurate_std i.hisp|rurate_std ;
global bc urateus_std _J* ;
global lbc rurate_std _K* ;
regsrace ;


** empstat interactions ;

xi i.agegrp i.educ i.female i.metrostat ;

xi, prefix(_J) i.empstat|ur12_std ;
xi, prefix(_K) i.empstat|rruc_std ;
global bc ur12_std _J* ;
global lbc rruc_std _K* ;

xi, prefix(_Z) i.empstat|bartik15r i.empstat|oilshock151r i.empstat|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;

xi, prefix(_J) i.empstat|gapus_std ;
xi, prefix(_K) i.empstat|rgap_std ;
global bc gapus_std _J* ;
global lbc rgap_std _K* ;

xi, prefix(_Z) i.empstat|bartik15r i.empstat|oilshock151r i.empstat|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;


xi, prefix(_J) i.empstat|urateus_std ;
xi, prefix(_K) i.empstat|rurate_std ;
global bc urateus_std _J* ;
global lbc rurate_std _K* ;

regs ;

drop _I* ;


** homeowner interactions ;

xi i.agegrp i.educ i.female i.empstat i.metrostat ;

xi, prefix(_J) i.owner|ur12_std i.kids|ur12_std ;
xi, prefix(_K) i.owner|rruc_std i.kids|rruc_std ;
global bc ur12_std _J* ;
global lbc rruc_std _K* ;

xi, prefix(_Z) i.owner|bartik15r i.owner|oilshock151r i.owner|oilshock1512r i.kids|bartik15r i.kids|oilshock151r i.kids|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;

xi, prefix(_J) i.owner|gapus_std i.kids|gapus_std ;
xi, prefix(_K) i.owner|rgap_std i.kids|rgap_std ;
global bc gapus_std _J* ;
global lbc rgap_std _K* ;

xi, prefix(_Z) i.owner|bartik15r i.owner|oilshock151r i.owner|oilshock1512r i.kids|bartik15r i.kids|oilshock151r i.kids|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;


xi, prefix(_J) i.owner|urateus_std i.kids|urateus_std ;
xi, prefix(_K) i.owner|rurate_std i.kids|rurate_std ;
global bc urateus_std _J* ;
global lbc rurate_std _K* ;

regs ;

drop _I* ;


** metrostat interactions ;

xi i.agegrp i.educ i.female i.empstat i.owner i.kids ;

xi, prefix(_J) i.metrostat|ur12_std ;
xi, prefix(_K) i.metrostat|rruc_std ;
global bc ur12_std _J* ;
global lbc rruc_std _K* ;

xi, prefix(_Z) i.metrostat|bartik15r i.metrostat|oilshock151r i.metrostat|oilshock1512r i.kids|bartik15r i.kids|oilshock151r i.kids|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;

xi, prefix(_J) i.metrostat|gapus_std ;
xi, prefix(_K) i.metrostat|rgap_std ;
global bc gapus_std _J* ;
global lbc rgap_std _K* ;

xi, prefix(_Z) i.metrostat|bartik15r i.metrostat|oilshock151r i.metrostat|oilshock1512r i.kids|bartik15r i.kids|oilshock151r i.kids|oilshock1512r ;
global zvars bartik15r oilshock151r oilshock1512r _Z* ;
regsiv ;


xi, prefix(_J) i.metrostat|urateus_std ;
xi, prefix(_K) i.metrostat|rurate_std ;
global bc urateus_std _J* ;
global lbc rurate_std _K* ;

regs ;

drop _I* ;



log close ;

