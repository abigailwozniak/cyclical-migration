*** Stata do-file to run regressions for Table 1 and make Figures 1 and 2, and makes Appendix Figure 1
set trace off
set more 1 
capture log close
clear
clear matrix
set mem 300m
set matsize 800
set linesize 200

log using table1_figs1and2.log, replace

*use table1, clear
use Input/table1, clear

* the two series plotted in figure 1 are mv14_upsp (inter-county migration) and ds14_upsp (inter-state migration)
* the figure was made in a program called Fame to get the NBER peak-trough shading
l year  mv14_upsp ds14_upsp, nod noobs

* regressions for Table 1
for var  mv14_upspd: reg X gapusstd \ reg X05 gapusstd if year<=2005  \ reg X gapusstd sdgapstd \ reg X05 gapusstd  sdgapstd if year<=2005 
for var  mv14_upspd: reg X ur12std if sdur~=. \ reg X05 ur12std if year<=2005 & sdur~=. \ reg X ur12std sdurstd \ reg X05 ur12std sdurstd if year<=2005
for var  mv14_upspd: reg X urateus1std \ reg X05 urateus1std if year<=2005\ reg X urateus1std sdurate1std \ reg X05 urateus1std sdurate1std if year<=2005 


* regression lines for Figure 2
for var  mv14_upspd: reg X gapus \ quietly predict Xfit if e(sample), xb 
for var  mv14_upspd: reg X ur12 \ quietly predict Xfit2 if e(sample), xb 
for var  mv14_upspd: reg X urateus1 \ quietly predict Xfit3 if e(sample), xb 

* top panel of Figure 2
sort gapus
gr7 mv14_upspd mv14_upspdfit gapus, c(.l) s([year].)   ylab(-.006(.002).008) xlab(-.05(.01).04) b2("Ln(US Employment/Trend Employment)") b1("") l1("Detrended Migration 14+") l2("(Fraction of Population 14+)") key1("") saving(Output/g1, replace)
* middle panel of Figure 2
replace ur12 = ur12*100
sort ur12
gr7 mv14_upspd mv14_upspdfit2 ur12, c(.l) s([year].)   ylab(-.006(.002).008) xlab(3(1)10) b2("Unemployment Rate") b1("") l1("Detrended Migration 14+") l2("(Fraction of Population 14+)") key1("") saving(Output/g2, replace)
* bottom panel of Figure 2
replace urateus1 = urateus1*100
sort urateus1
gr7 mv14_upspd mv14_upspdfit3 urateus1, c(.l) s([year].)   ylab(-.006(.002).008) xlab(6(3)24) b2("UI Claims Rate") b1("") l1("Detrended Migration 14+") l2("(Fraction of Population 14+)") key1("") saving(Output/g3, replace)
* Appendix Figure 1
gen gapus100 = gapus*100
sort year
*twoway line gapus100 ur12 urateus1 year if year>=1948, legend(lab(1 "Employment Gap") lab(2 "Unemployment Rate") lab(3 "UI Claims Rate")) xlab(1950(10)2010) ylab(-5(5)25, nogrid) ysca(r(-5 25)) lpattern(solid dash shortdash) lcolor(black black black) graphregion(color(white))
twoway line gapus100 ur12 urateus1 year if year>=1948, legend(lab(1 "Employment Gap") lab(2 "Unemployment Rate") lab(3 "UI Claims Rate")) xlab(1950(10)2010) ylab(-5(5)25, nogrid) ysca(r(-5 25)) lpattern(solid dash shortdash) lcolor(black black black) graphregion(color(white)) saving(Output/A1, replace)

quietly log off
quietly log close
