* Stata do-file to run MSA-level gross in-migration and out-migration regressions
* This data file does not include the LoanPerformance house price variables because these variables are proprietary
* Therefore, the results will not exactly match the published tables

set trace off
set more 1 
capture log close
clear
clear matrix
set mem 500m
set matsize 800
version 7.0

log using table4.log, replace

*use table4, clear
use Input/table4, clear

set seed 423985738
foreach V of var exems2is exems2os lexems2i lexems2o {
   foreach C of var gapus1std rucusstd urateus1std {
      *bs "xi: qreg `V' `C' rgap1std lrincpc1  i.cbsa*trend" "_b[`C'] _b[rgap1std] _b[lrincpc1]", cluster(year) reps(50) saving(t4results) replace
      bs "xi: qreg `V' `C' rgap1std lrincpc1  i.cbsa*trend" "_b[`C'] _b[rgap1std] _b[lrincpc1]", cluster(year) reps(50) saving(Output/t4results) replace
	  *use t4results, clear
      use Output/t4results, clear
	  mat accum VCE = bs1 bs2 bs3, dev nocons
      mat VCE = VCE/(50-1)
      use Input/table4, clear
      quietly xi: qreg `V' `C' rgap1std lrincpc1 i.cbsa*trend
      mat myb=e(b)
      matrix myb = myb[1,1..3]
      mat colnames VCE= `C'  rgap1std lrincpc1
      mat rownames VCE= `C'  rgap1std lrincpc1
      estimates post myb VCE
      estimates display
   }
} 
 

quietly log off
quietly log close
set more 0

