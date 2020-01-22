*** estimate cross-state variation in employment growth ***

set trace off
set more 1 
capture log close
clear
clear matrix
set mem 100m
set matsize 400

log using stateemp.log, replace

insheet using data1.csv, clear
quietly for var ruc_rstak_nam-v208: destring X, force replace
rename v208 eet
rename date year
sort year
save temp, replace

insheet using data2.csv, clear
quietly for var ee_rstak_nam-ee_rstwy_nam: destring X, force replace \ rename X Xt
rename date year
sort year
merge year using temp
drop _merge
sort year
save temp, replace

insheet using statedata3.csv, clear
rename date year
rename hpus ushp
sort year
merge year using temp
drop _merge


quietly for any ak al ar az ca co ct dc de fl ga hi ia id il in ks ky la ma md me mi mn mo ms mt nc nd ne nh nj nm nv ny oh ok or pa ri sc sd tn tx ut va vt wa wi wv wy: rename ruc_rstX_nam2 ruc_rstX \ rename ee_rstX_nam ee_rstX \ rename ee_rstX_namt eet_rstX \ rename hpX_nm hpX
rename eeam ee
rename rucam2 ruc


quietly reshape long  ruc_rst ee_rst eet_rst hp, i(year) string j(state)
drop if index(state,"_nam")~=0
sort state year
quietly by state: gen c1ee_rst = ee_rst/ee_rst[_n-1]-1
quietly by state: gen c1ee = ee/ee[_n-1]-1
quietly for var hp ushp: destring X, replace force

drop if state=="ak" | state=="hi"


gr7 c1ee_rst year

rename state abbrev
replace abbrev = upper(abbrev)
gen     state = 1 if abbrev=="AL"
replace state = 2  if abbrev=="AK"
replace state = 4  if abbrev=="AZ"
replace state = 5  if abbrev=="AR"
replace state = 6  if abbrev=="CA"
replace state = 8  if abbrev=="CO"
replace state = 9  if abbrev=="CT"
replace state = 10 if abbrev=="DE"
replace state = 11 if abbrev=="DC"
replace state = 12 if abbrev=="FL"
replace state = 13 if abbrev=="GA"
replace state = 15 if abbrev=="HI"
replace state = 16 if abbrev=="ID"
replace state = 17 if abbrev=="IL"
replace state = 18 if abbrev=="IN"
replace state = 19 if abbrev=="IA"
replace state = 20 if abbrev=="KS"
replace state = 21 if abbrev=="KY"
replace state = 22 if abbrev=="LA"
replace state = 23 if abbrev=="ME"
replace state = 24 if abbrev=="MD"
replace state = 25 if abbrev=="MA"
replace state = 26 if abbrev=="MI"
replace state = 27 if abbrev=="MN"
replace state = 28 if abbrev=="MS"
replace state = 29 if abbrev=="MO"
replace state = 30 if abbrev=="MT"
replace state = 31 if abbrev=="NE"
replace state = 32 if abbrev=="NV"
replace state = 33 if abbrev=="NH"
replace state = 34 if abbrev=="NJ"
replace state = 35 if abbrev=="NM"
replace state = 36 if abbrev=="NY"
replace state = 37 if abbrev=="NC"
replace state = 38 if abbrev=="ND"
replace state = 39 if abbrev=="OH"
replace state = 40 if abbrev=="OK"
replace state = 41 if abbrev=="OR"
replace state = 42 if abbrev=="PA"
replace state = 44 if abbrev=="RI"
replace state = 45 if abbrev=="SC"
replace state = 46 if abbrev=="SD"
replace state = 47 if abbrev=="TN"
replace state = 48 if abbrev=="TX"
replace state = 49 if abbrev=="UT"
replace state = 50 if abbrev=="VT"
replace state = 51 if abbrev=="VA"
replace state = 53 if abbrev=="WA"
replace state = 54 if abbrev=="WV"
replace state = 55 if abbrev=="WI"
replace state = 56 if abbrev=="WY"


rename ruc ur12
rename c1ee c1eeus
rename ee eeus
rename eet eetus
rename ushp hpius
rename hp hpi

sort state 
save temp, replace

insheet using medval05state.csv, clear
gen state = real(v2)
gen medval05 = real(v5)
keep state medval05
drop if state==. | state==72
sort state
merge state using temp
drop _merge

gen temp = hpi if year==2005
egen hpi05 = mean(temp), by(state)
drop temp
gen hp = hpi/hpi05*medval05
gen hpus = hpius/349.73*167500

gen lhp = log(hp)
gen lhpus = log(hpus)
sort state year
quietly by state: gen dlhpus = lhpus - lhpus[_n-1]
quietly by state: gen dlhp = lhp - lhp[_n-1]

replace ruc = ruc/100
replace ur12 = ur12/100

quietly for num 10 90: egen pXc1ee_rst = pctile(c1ee_rst), p(X) by (year)
gen p9010c1emp = p90c1ee_rst - p10c1ee_rst

gen gap = log(ee_rst/eet_rst)
gen gapus = log(eeus/eetus)
gen rgap = gap - gapus
gen rruc = ruc_rst - ur12
gen rlhp = lhp - lhpus
gen rdlhp = dlhp - dlhpus

* the pce chain price index is for Q1 of each year
                    
gen pce     =  31.46  if year==1975
replace pce =  33.35  if year==1976
replace pce =  35.30  if year==1977
replace pce =  37.58  if year==1978
replace pce =  40.52  if year==1979
replace pce =  44.99  if year==1980
replace pce =  49.58  if year==1981
replace pce =  52.67  if year==1982
replace pce =  55.08  if year==1983
replace pce =  57.31  if year==1984
replace pce =  59.30  if year==1985
replace pce =  61.03  if year==1986
replace pce =  62.71  if year==1987
replace pce =  65.02  if year==1988
replace pce =  68.00  if year==1989
replace pce =  70.88  if year==1990
replace pce =  73.99  if year==1991
replace pce =  76.19  if year==1992
replace pce =  78.07 if year==1993
replace pce =  79.52 if year==1994
replace pce =  81.42 if year==1995
replace pce =  83.08 if year==1996
replace pce =  85.03 if year==1997
replace pce =  85.85 if year==1998
replace pce =  86.88 if year==1999
replace pce =  89.10 if year==2000
replace pce =  91.14 if year==2001
replace pce =  91.86 if year==2002
replace pce =  94.15 if year==2003
replace pce =  96.07 if year==2004
replace pce =  98.75 if year==2005
replace pce = 101.80  if year==2006
replace pce = 104.25 if year==2007
replace pce = 107.97 if year==2008
replace pce = 108.45 if year==2009

* existing home sales = convert(overlay(us'hupxe1us.m/1000,us'h0.hupxe1us.m/us'h0.hupxe1us.m[1989m1]*(us'hupxe1us.m[1989m1]/1000)),q,disc,ave)
gen ehs     =  2009   if year==1975
replace ehs =  2637   if year==1976
replace ehs =  3165   if year==1977
replace ehs =  3571   if year==1978
replace ehs =  3605   if year==1979
replace ehs =  2897   if year==1980
replace ehs =  2442   if year==1981
replace ehs =  1801   if year==1982
replace ehs =  2323   if year==1983
replace ehs =  2650   if year==1984
replace ehs =  2692   if year==1985
replace ehs =  2979   if year==1986
replace ehs =  3294   if year==1987
replace ehs =  2967   if year==1988
replace ehs =  3140   if year==1989
replace ehs =  3133   if year==1990
replace ehs =  2753   if year==1991
replace ehs =  3103   if year==1992
replace ehs =  3233  if year==1993
replace ehs =  3683  if year==1994
replace ehs =  3327  if year==1995
replace ehs =  3710  if year==1996
replace ehs =  3850  if year==1997
replace ehs =  4350  if year==1998
replace ehs =  4613  if year==1999
replace ehs =  4617  if year==2000
replace ehs =  4680  if year==2001
replace ehs =  5133  if year==2002
replace ehs =  5263  if year==2003
replace ehs =  5667  if year==2004
replace ehs =  6107  if year==2005
replace ehs =  5953   if year==2006
replace ehs =  5563  if year==2007
replace ehs =  4370  if year==2008
replace ehs =  4133  if year==2009

sort state year
quietly by state: gen pce1 = pce[_n-1] if year==year[_n-1]+1
quietly by state: gen ehs1 = ehs[_n-1] if year==year[_n-1]+1
gen rdlhpus = dlhpus - log(pce/pce1)
gen dlehs = log(ehs/ehs1)
quietly by state: gen dlehs1 = dlehs[_n-1] if year==year[_n-1]+1
quietly by state: gen rdlhpus1 = rdlhpus[_n-1] if year==year[_n-1]+1
gen lrhpus = log(hpus/pce)
gen trend = year - 1975
egen mark = tag(year) if lrhpus~=.
reg lrhpus trend if mark==1
predict lrhpust
gen lrhpusdt = lrhpus - lrhpust
drop mark trend



sort state year
save stateemp, replace

* merge in state unemployment claims
quietly infile using uratet.dct, clear
reshape long uratet, i(year) j(state)
sort state year
merge state year using urate
gen urated = urate - uratet
quietly for var urate uratet urated: gen temp = X if state==0 \ egen Xus = mean(temp), by(year) \ drop temp
drop if state==0
gen rurate = urate - urateus
gen rurated = urated - uratedus
drop _merge
sort state year
merge state year using stateemp
tab _merge
drop _merge
sort state year
save stateemp, replace


gen ur = ruc_rst
quietly for num 10 25 75 90: egen pXgap = pctile(gap), p(X) by (year) \ egen pXur = pctile(ur), p(X) by (year) \ egen pXurated = pctile(urated), p(X) by (year)\ egen pXurate = pctile(urate), p(X) by (year)
quietly for var gap ur urated urate: gen p9010X = p90X - p10X \ gen p7525X = p75X - p25X \ egen sdX = sd(X), by(year)

* number of states with employment above trend
egen temp = count(gap) if gap>0, by(year)
egen gappos = mean(temp), by(year)
drop temp
egen ngap = count(gap), by(year)
gen gapposs = gappos/ngap

* number of states with employment growth > 0
egen temp = count(c1ee_rst) if c1ee_rst>0, by(year)
egen c1eepos = mean(temp), by(year)
drop temp
egen nc1ee = count(c1ee_rst), by(year)
gen c1eeposs = c1eepos/nc1ee

sort state year
save stateemp, replace

* merge in personal income data
insheet using personal_income_per_capita.csv, clear
rename v2 state
quietly for var state v4-v43: destring X, replace force
drop if state==.
drop v1 v3
quietly for num 1969/2008 \ num 4/43: rename vY yX
reshape long y, i(state) j(year)
rename y inc
gen temp = inc if state==0
egen incus = mean(temp), by(year)
gen rinc = log(inc/incus)
drop temp
drop if state==0
sort state year
merge state year using stateemp
drop if _merge==1
drop _merge
sort state year
save stateemp, replace

* merge in population data
insheet using statepop6908.csv, clear
rename v2 state
quietly for var state v4-v43: destring X, replace force
drop if state==.
drop v1 v3
quietly for num 1969/2008 \ num 4/43: rename vY yX
reshape long y, i(state) j(year)
rename y pop
gen temp = pop if state==0
egen popus = mean(temp), by(year)
drop temp
drop if state==0
sort state year
merge state year using stateemp
drop if _merge==1
drop _merge
sort state year
save stateemp, replace

* merge in latitude and longitude
use statecapitalslatlon, clear
rename fips state
keep state lat lon
drop if state==2 | state==15
sort state
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen distlatX = . \ gen distlonX = . \ gen distX = .
quietly foreach S of num 1 4/6 8/13 16/42 44/51 53/56 {
   sum lat if state==`S'
   scalar startlat = r(mean)
   sum lon if state==`S' 
   scalar startlon = r(mean)
   replace distlat`S' = 69.1*(lat - startlat)
   replace distlon`S' = 53*(lon - startlon)
   replace dist`S' = sqrt(distlat`S'^2+distlon`S'^2)
}
drop distlat* distlon*

sort state
merge state using stateemp
tab _merge
drop _merge

* average relative conditions in all other states
gen rgapx2 = .
quietly for num 1 4/6 8/13 16/42 44/51 53/56: egen temp = mean(rgap) if state~=X, by(year) \ egen temp2 = mean(temp), by(year) \ replace rgapx2 = temp2 if state==X \ drop temp*

* distance weighted averages
sort year state
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = 1/distX \ replace tempX = 0 if state==X  
quietly for num 1 4/6 8/13 16/42 44/51 53/56: egen wtsumX = rsum(temp*)
drop temp*
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = rgap if state==X \ egen rgapX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*rgapX \ replace tempX = 0 if state==X
egen rgapx = rsum(temp*)
drop temp* 
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = gap if state==X \ egen gapX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*gapX \ replace tempX = 0 if state==X
egen gapx = rsum(temp*)
drop temp* 
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = rurated if state==X \ egen ruratedX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*ruratedX \ replace tempX = 0 if state==X
egen ruratedx = rsum(temp*)
drop temp* 
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = rurate if state==X \ egen rurateX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*rurateX \ replace tempX = 0 if state==X
egen ruratex = rsum(temp*)
drop temp* 
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = rruc if state==X \ egen rrucX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*rrucX \ replace tempX = 0 if state==X
egen rrucx = rsum(temp*)
drop temp* 
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = c1ee_rst if state==X \ egen c1eeX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*c1eeX \ replace tempX = 0 if state==X
egen c1eex = rsum(temp*)
drop temp* 
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = rlhp if state==X \ egen rlhpX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*rlhpX \ replace tempX = 0 if state==X
egen rlhpx = rsum(temp*)
drop temp* 
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = rdlhp if state==X \ egen rdlhpX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*rdlhpX \ replace tempX = 0 if state==X
egen rdlhpx = rsum(temp*)
drop temp* 

quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen temp = rinc if state==X \ egen rincX = mean(temp), by(year) \ drop temp
quietly for num 1 4/6 8/13 16/42 44/51 53/56: gen tempX = (1/wtsumX)*1/distX*rincX \ replace tempX = 0 if state==X
egen rincx = rsum(temp*)
drop temp* 

gen rgapx3 = .
quietly for num 1 4/6 8/13 16/42 44/51 53/56: egen temp = mean(rgap-rgapX) if state~=X, by(year) \ egen temp2 = mean(temp), by(year) \ replace rgapx3 = temp2 if state==X \ drop temp*

sort state year
save stateemp, replace
drop rgap1-rgap56 gap1-gap56 rurated1-rurated56 rurate1-rurate56 rruc1-rruc56 c1ee1-c1ee56 rlhp1-rlhp56 rdlhp1-rdlhp56 rinc1-rinc56 wtsum1-wtsum56
sort state year
quietly for any urateus uratedus rurate rurate1 ruratex rurated rurated1 rgap rruc lhpus rlhp rlhpx dlhpus rdlhp rdlhpx inc rinc incus rincx: quietly by state: gen X1 = X[_n-1]
quietly for any rinc1 rlhp1: quietly by state: gen X1 = X[_n-1]
sort state year
save stateemp3, replace

gen gapt = gap if gapus<=-.016 & year>=1947
gen gapp = gap if gapus>=.015 & gapus~=. & year>=1947
gen rgapt = rgap if gapus<=-.016 & year>=1947
gen rgapp = rgap if gapus>=.015 & gapus~=. & year>=1947

kdensity gapt, addplot(kdensity gapp)

replace ur12 = ur12*100
rename ruc_rst ruc
gen rucp = ruc if ur12<=5.3
gen ruct = ruc if ur12>7 & ur12~=.
kdensity ruct, addplot(kdensity rucp)
gen rrucp = ruc-ur12 if ur12<=5.3
gen rruct = ruc-ur12 if ur12>7 & ur12~=.
kdensity rruct, addplot(kdensity rrucp)

gen uratedp = urated if uratedus<=-.014 & year>=1947
gen uratedt = urated if uratedus>=.013 & urated~=. & year>=1947
kdensity uratedt, addplot(kdensity uratedp)
gen ruratedp = rurated if uratedus<=-.014 & year>=1947
gen ruratedt = rurated if uratedus>=.013 & urated~=. & year>=1947
kdensity ruratedt, addplot(kdensity ruratedp)

drop uratet 
gen uratep = urate if urateus<=.087 & year>=1947
gen uratet = urate if urateus>=.128 & urate~=. & year>=1947
replace uratet = .4 if uratet>.4 & uratet~=.
kdensity uratet, addplot(kdensity uratep)
gen ruratep = rurate if urateus<=.087 & year>=1947
gen ruratet = rurate if urateus>=.128 & urate~=. & year>=1947
kdensity ruratet, addplot(kdensity ruratep)

gen rinct = rinc if gapus<=-.017 & year>=1947
gen rincp = rinc if gapus>=.015 & gapus~=. & year>=1947
kdensity rinct, addplot(kdensity rincp)
gen rinct2 = rinc if urateus>=.1307 & urate~=. & year>=1947
gen rincp2 = rinc if urateus<=.0889 & year>=1947
kdensity rinct2, addplot(kdensity rincp2)

gen rlhpp = rlhp if  gapus>=.015 & gapus~=. 
gen rlhpt = rlhp if  gapus<=-.017 
kdensity rlhpt, addplot(kdensity rlhpp)
gen rlhpp2 = rlhp if ur12<=5.37 & ruc~=.
gen rlhpt2 = rlhp if ur12>7.14 & ur12~=. & ruc~=.
kdensity rlhpt2, addplot(kdensity rlhpp2)
gen rlhpp3 = rlhp if dlhpus>=.0792 & dlhpus~=.
gen rlhpt3 = rlhp if dlhpus<=.0370
kdensity rlhpt3, addplot(kdensity rlhpp3)


gen gapusdum = gapus>=.015 & gapus~=. & year>=1947
replace gapusdum = -1 if gapus<=-.017 & year>=1947
replace gapusdum = . if year<=1946 | gapus==.
gen urateusdum = urateus<=.0889 & year>=1947
replace urateusdum = -1 if urateus>=.1307 & urateus~=.
replace urateusdum = . if year<=1946 | urateus==.
sort state year
quietly by state: gen urateusdum1 = urateusdum[_n-1]
gen ur12dum = ur12<=5.37
replace ur12dum = -1 if ur12>7.14 & ur12~=.
replace ur12dum = . if ruc==.


kdensity gapp, generate(gappx gappy) lcolor(black) addplot(kdensity gapt, lcolor(black)) legend(lab(1 "years in the top quartile of the national employment gap") lab(2 "years in the bottom quartile of the national employment gap")) xtitle("Distribution of State Employment Gaps") ylab(,nogrid) lpattern(dash) note("") title("") saving(g1, replace) graphregion(color(white))
kdensity ruct, generate(ructx ructy)  lcolor(black) addplot(kdensity rucp, lcolor(black)) legend(lab(1 "years in the top quartile of the national unemployment rate") lab(2 "years in the bottom quartile of the national unemployment rate")) xtitle("Distribution of State Unemployment Rates") ylab(,nogrid) lpattern(dash) note("") title("") saving(g2, replace) graphregion(color(white))
kdensity uratet, generate(uratetx uratety)  lcolor(black) addplot(kdensity uratep, lcolor(black)) legend(lab(1 "years in the top quartile of the national UI claims rate") lab(2 "years in the bottom quartile of the national UI claims rate")) xtitle("Distribution of State UI Claims Rates") ylab(,nogrid) lpattern(dash) note("") title("") saving(g3, replace) graphregion(color(white))
kdensity gapt, generate(gaptx gapty) nogr
kdensity rucp, generate(rucpx rucpy) nogr
kdensity uratep, generate(uratepx uratepy) nogr

outfile gappx gappy gaptx gapty ructx ructy rucpx rucpy uratetx uratety uratepx uratepy if gappx~=. using fig3.csv, comma wide replace
save fig3, replace
/*
keep if state==51
keep c1eeus gapus ur12 hpus dlhpus rdlhpus p9010c1emp p9010gap p7525gap sdgap gapposs c1eeposs  urateus uratedus p9010ur p7525ur sdur  p9010urated p7525urated sdurated  p9010urate p7525urate sdurate year eeus eetus pce
rename ur12 rucus
sort year
quietly for var urateus uratedus: gen X1 = X[_n-1]

sort year
save stateemp2, replace

for var p9010gap p7525gap sdgap: reg gapus X if year>=1946
for var p9010ur p7525ur sdur: reg rucus X if year>=1946
for var p9010urated p7525urated sdurated: reg uratedus X if year>=1946
*/


quietly log off
quietly log close
set more 0

