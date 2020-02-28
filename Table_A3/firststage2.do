#delimit ;

log using firststage2.log, replace ;

/*****************************************

Run first stages "manually" for table 6 estimates.
Cluster on year only.

*******************************************/


set matsize 100 ;

set mem 1g ;

cd ..\Data_Setup\Table_5_6_Data_Setup\Output\. ;

use marchcps_mig.dta ;

*set mem 500m ;
*use ~waggoner/bulk/marchcps_mig_test.dta ;

drop if age < 18 | age > 65 ;
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

foreach varn in rgap gapus rruc ur12 rurate urateus bartik15r oilshock151r oilshock1512r { ;
   egen `varn'_std = std(`varn') ;
} ;

summ *_std ;

program define firststage1 ;

ivreg2 $lbc bartik15r_std oilshock151r_std oilshock1512r_std $bc black hisp female spouse kids metrostat timet timet2 _I*, cluster(year) robust ;
test (bartik15r_std=0) (oilshock151r_std=0) (oilshock1512r_std=0) ;
outreg using firststage2.out, se br bdec(4) replace ;

end ;

program define firststage ;

ivreg2 $lbc bartik15r_std oilshock151r_std oilshock1512r_std $bc black hisp female spouse kids metrostat timet timet2 _I*, cluster(year) robust ;
test (bartik15r_std=0) (oilshock151r_std=0) (oilshock1512r_std=0) ;
outreg using firststage2.out, se br bdec(4) append ;

end ;


xi i.agegrp i.educ i.empstat ;

gen styr = (year*100) + statefip ;

preserve ;

drop if age > 35 ;


global bc ur12_std ;
global lbc rruc_std  ;
firststage1 ;

global bc gapus_std ;
global lbc rgap_std  ;
firststage ;

drop _I* ;

restore ;

** Repeat for the less than 35 sample ;

drop if age < 36 ;

xi i.agegrp i.educ i.empstat ;

global bc ur12_std ;
global lbc rruc_std  ;
firststage ;

global bc gapus_std ;
global lbc rgap_std  ;
firststage ;

log close ;
clear ;
