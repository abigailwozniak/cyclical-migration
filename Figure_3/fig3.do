* Stata do-file to make Figure 3

set trace off
set more 1 
capture log close
clear
clear matrix
set mem 300m
set matsize 800
set linesize 200

log using fig3.log, replace

cd .\Input\.

use fig3, clear

/*
the peak and trough values of local economic conditions were created from the following commands (based on national economic conditions)
* employment gap
gen gapt = gap if gapus<=-.016 & year>=1947
gen gapp = gap if gapus>=.015 & gapus~=. & year>=1947

* unemployment rate
gen rucp = ruc if ur12<=5.3
gen ruct = ruc if ur12>7 & ur12~=.

* UI claims rate
gen uratep = urate if urateus<=.087 & year>=1947
gen uratet = urate if urateus>=.128 & urate~=. & year>=1947
*/

cd ..\Output\.

* top panel
kdensity gapp, lcolor(black) addplot(kdensity gapt, lcolor(black)) legend(lab(1 "years in the top quartile of the national employment gap") lab(2 "years in the bottom quartile of the national employment gap")) xtitle("Distribution of State Employment Gaps") ylab(,nogrid) lpattern(dash) note("") title("") saving(g1, replace) graphregion(color(white))
* middle panel
kdensity ruct, lcolor(black) addplot(kdensity rucp, lcolor(black)) legend(lab(1 "years in the top quartile of the national unemployment rate") lab(2 "years in the bottom quartile of the national unemployment rate")) xtitle("Distribution of State Unemployment Rates") ylab(,nogrid) lpattern(dash) note("") title("") saving(g2, replace) graphregion(color(white))
* bottom panel
kdensity uratet, lcolor(black) addplot(kdensity uratep, lcolor(black)) legend(lab(1 "years in the top quartile of the national UI claims rate") lab(2 "years in the bottom quartile of the national UI claims rate")) xtitle("Distribution of State UI Claims Rates") ylab(,nogrid) lpattern(dash) note("") title("") saving(g3, replace) graphregion(color(white))


quietly log off
quietly log close
