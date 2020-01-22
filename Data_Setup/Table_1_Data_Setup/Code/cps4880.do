***  read in data from CPS reports, 1948-1980  ***
set trace off
set more 1 
capture log close
clear
set mem 300m
set matsize 800
set linesize 200

log using cps4880.log, replace

gen temp = .
save cps4880, replace

* starting obs for each year
  mat startobs = [5,6,4,6,6,5,6,7,6,9,5,8,8,11,0,0,13,8,6,8,6,10,2,3,0,0,0,0,1]

* loop over years
  foreach Y of num 1948/1971 1976 {
*  foreach Y of num 1976 {
    insheet using `Y'.csv, clear
    capture gen str2 v11 = " "
    capture gen str2 v12 = " "
    gen year = `Y'
    local ind = `Y' - 1947
    gen test = startobs[1,`ind']
    keep if _n>=startobs[1,`ind']
    quietly for var v3-v12: destring X, replace ignore(",") force
    if year<=1950 {
       rename v3 pop
       rename v4 nm
       rename v8 ss
       gen ds = v9+v10 
       rename v12 ab
       drop v5 v6 v7 v9 v10 v11 table*
       gen str7 type = "totm" if _n==11
       replace  type = "14_17m" if _n==13
       replace  type = "18_19m" if _n==14
       replace  type = "20_24m" if _n==15
       replace  type = "25_34m" if _n==16
       replace  type = "35_44m" if _n==17
       replace  type = "45_64m" if _n==18
       replace  type = "65_upm" if _n==19
       replace  type = "totf"  if _n==21
       replace  type = "14_17f" if _n==23
       replace  type = "18_19f" if _n==24
       replace  type = "20_24f" if _n==25
       replace  type = "25_34f" if _n==26
       replace  type = "35_44f" if _n==27
       replace  type = "45_64f" if _n==28
       replace  type = "65_upf" if _n==29
       }
    else if year>=1951 & year<=1961 {
       if year==1951 {
         rename v3 pop
         gen nm =  v4 + v6
         rename v8 ss 
         gen ds = v9+v10
         rename v12 ab
         drop v4 v5 v6 v7 v9 v10 v11 
       }
       else if (year>=1952 & year<=1953) | (year>=1958 & year~=1959) {
         rename v3 pop
         gen nm =  v4 + v6
         rename v8 ss
         rename v9 ds 
         rename v10 ab
         drop v4 v5 v6 v7 v11 v12 
       }
       else if year==1959 {
         rename v3 pop
         gen nm =  v4 + v6
         rename v8 ss
         rename v9 ds 
         rename v12 ab
         drop v4 v5 v6 v7 v10 v11 
       }
       else if year>=1954 & year<=1956 {
         rename v3 pop
         gen nm =  v4 + v6
         rename v8 ss
         rename v9 ds 
         rename v11 ab
         drop v4 v5 v6 v7 v10 v12 
           }
       else if year==1957 {
         quietly for var v4-v11: destring X, replace force ignore(",") 
         rename v4 pop
         gen nm =  v5 + v7
         rename v9 ss
         rename v10 ds 
         rename v11 ab
         drop table5 v3 v5 v6 v7 v8 v12 
          }
       capture drop v2
       capture drop table*
       capture drop v13-v256
       drop if (_n==2 | _n==14 | _n==26) & year>=1954 & year<=1956
       if year<=1956 {
         gen str7 type = "totm" if _n==12
         replace  type = "14_17m" if _n==14
         replace  type = "18_19m" if _n==15
         replace  type = "20_24m" if _n==16
         replace  type = "25_29m" if _n==17
         replace  type = "30_34m" if _n==18
         replace  type = "35_44m" if _n==19
         replace  type = "45_64m" if _n==20
         replace  type = "65_upm" if _n==21
         replace  type = "totf"  if _n==23
         replace  type = "14_17f" if _n==25
         replace  type = "18_19f" if _n==26
         replace  type = "20_24f" if _n==27
         replace  type = "25_29f" if _n==28
         replace  type = "30_34f" if _n==29
         replace  type = "35_44f" if _n==30
         replace  type = "45_64f" if _n==31
         replace  type = "65_upf" if _n==32
         }
       else if year>=1957 & year<=1961 {
         drop if (_n==6 | _n==7 | _n==14 | _n==15 | _n==23 | _n==24 | _n==32 | _n==33 | _n==41 | _n==42 |  _n==49 | _n==50 | _n==57 | _n==58 | _n==61) & (year==1957 | year>=1960)
         drop if ((_n>=6 & _n<=12) | (_n>=19 & _n<=25)| (_n>=33 & _n<=39)| (_n>=47 & _n<=53)| (_n>=61 & _n<=67)| (_n>=74 & _n<=80)| (_n>=87 & _n<=93)) & year==1959
         gen str7 type = "14_upem" if _n==5
         replace  type = "14_upum" if _n==6
         replace  type = "14_upnm" if _n==7
         replace  type = "18_24em" if _n==18
         replace  type = "18_24um" if _n==19
         replace  type = "18_24nm" if _n==20
         replace  type = "25_34em" if _n==25
         replace  type = "25_34um" if _n==26
         replace  type = "25_34nm" if _n==27
         replace  type = "35_44em" if _n==32
         replace  type = "35_44um" if _n==33
         replace  type = "35_44nm" if _n==34
         replace  type = "45_64em" if _n==38
         replace  type = "45_64um" if _n==39
         replace  type = "45_64nm" if _n==40
         replace  type = "65_upem" if _n==44
         replace  type = "65_upum" if _n==45
         replace  type = "65_upnm" if _n==46 
         replace  type = "14_upf" if _n==47 
         quietly for var pop nm ss ds ab: replace X = X*1000 if year>=1959
         }
       }
    
    else if year==1962 | year==1963 {
       drop v12
       capture gen v15 = .
       quietly for var v4-v15: destring X, replace ignore(",") force
       rename v4 pop
       gen nm =  v5 + v7
       rename v9 ss
       rename v10 ds 
       rename v15 ab
       replace ab = v14 if year==1963
       replace ab = v13 if year==1963 & _n>=100
       drop v2-v3 v5-v8 v11-v14 
       drop if (_n<=10) & year==1962

       drop if (_n<=10 | (_n>=50 & _n<=55)| (_n>=78 & _n<=86) | _n==126 | _n==126) & year==1963
       gen str7 type = "14_upem" if _n==4
       replace  type = "14_upum" if _n==5
       replace  type = "14_upnm" if _n==6
       replace  type = "18_24em" if _n==52
       replace  type = "18_24um" if _n==53
       replace  type = "18_24nm" if _n==54
       replace  type = "25_34em" if _n==78
       replace  type = "25_34um" if _n==79
       replace  type = "25_34nm" if _n==80
       replace  type = "35_44em" if _n==103 & year==1962
       replace  type = "35_44um" if _n==104 & year==1962
       replace  type = "35_44nm" if _n==105 & year==1962
       replace  type = "45_64em" if _n==127 
       replace  type = "45_64um" if _n==128 
       replace  type = "45_64nm" if _n==129 
       replace  type = "65_upem" if _n==159 & year==1962
       replace  type = "65_upum" if _n==160 & year==1962
       replace  type = "65_upnm" if _n==161 & year==1962
       replace  type = "35_44em" if _n==101 & year==1963
       replace  type = "35_44um" if _n==102 & year==1963
       replace  type = "35_44nm" if _n==103 & year==1963
       replace  type = "65_upem" if _n==151 & year==1963
       replace  type = "65_upum" if _n==152 & year==1963
       replace  type = "65_upnm" if _n==153 & year==1963 

       replace  type = "14_upf" if _n==180 & year==1962
       replace  type = "14_upf" if _n==173 & year==1963

      quietly for var pop nm ss ds ab: replace X = X*1000 
        
       }
else if year==1964 | (year>=1968 & year<=1971)  {
       destring v2, replace ignore(",") force
       if year==1968 | year==1970 | year==1971 {
         quietly for var v3-v12: destring X, replace ignore(",") force
       }
       rename v2 pop
       gen nm =  v3 + v5
       rename v7 ss
       rename v8 ds 
       rename v11 ab
       drop v3 v4 v5 v6 v9 v10
       capture drop v12 
       drop if ((_n>=84 & _n<=86) | _n==131  ) & year==1968 
       drop if ((_n>=84 & _n<=86)  ) & year==1970
       drop if ((_n>=84 & _n<=86) | _n==135 ) & year==1971
       drop if ((_n>=52 & _n<=55)| (_n>=87 & _n<=92)) & year==1969
       gen str7 type = "14_upem" if _n==4
       replace  type = "14_upum" if _n==5
       replace  type = "14_upnm" if _n==6
       replace  type = "18_24em" if _n==52 & year~=1968 & year~=1970 & year~=1971
       replace  type = "18_24um" if _n==53 & year~=1968 & year~=1970 & year~=1971
       replace  type = "18_24nm" if _n==54 & year~=1968 & year~=1970 & year~=1971
       replace  type = "18_24em" if _n==58 & (year==1968 | year==1970 | year==1971)
       replace  type = "18_24um" if _n==59 & (year==1968 | year==1970 | year==1971)
       replace  type = "18_24nm" if _n==60 & (year==1968 | year==1970 | year==1971)
       replace  type = "25_34em" if _n==87 
       replace  type = "25_34um" if _n==88 
       replace  type = "25_34nm" if _n==89
       replace  type = "35_44em" if _n==111
       replace  type = "35_44um" if _n==112
       replace  type = "35_44nm" if _n==113
       replace  type = "45_64em" if _n==146 & year~=1968 & year~=1970 & year~=1971
       replace  type = "45_64um" if _n==147 & year~=1968 & year~=1970 & year~=1971
       replace  type = "45_64nm" if _n==148 & year~=1968 & year~=1970 & year~=1971
       replace  type = "45_64em" if _n==136 & (year==1968 | year==1970 | year==1971)
       replace  type = "45_64um" if _n==137 & (year==1968 | year==1970 | year==1971)
       replace  type = "45_64nm" if _n==138 & (year==1968 | year==1970 | year==1971)
       replace  type = "65_upem" if _n==170 & year<=1966
       replace  type = "65_upum" if _n==171 & year<=1966
       replace  type = "65_upnm" if _n==172 & year<=1966
       replace  type = "14_upf" if _n==192 & year<=1966
       replace  type = "65_upem" if _n==168 & year==1969
       replace  type = "65_upum" if _n==169 & year==1969
       replace  type = "65_upnm" if _n==170 & year==1969
       replace  type = "65_upem" if _n==160 & (year==1968 | year==1970 | year==1971)
       replace  type = "65_upum" if _n==161 & (year==1968 | year==1970 | year==1971)
       replace  type = "65_upnm" if _n==162 & (year==1968 | year==1970 | year==1971)
       replace  type = "14_upf" if _n==164 & (year==1968)
       replace  type = "14_upf" if _n==190 & (year==1969)
       replace  type = "14_upf" if _n==182 & (year==1970 | year==1971)
       quietly for var pop nm ss ds ab: replace X = X*1000       
       }
else if year==1976 {
         quietly for var v5-v11: destring X, replace ignore(",") force
       rename v2 pop
       gen nm =  v3 + v5
       rename v7 ss
       rename v8 ds 
       rename v11 ab
       drop v3 v4 v5 v6 v9 v10
       gen str7 type = "14_upem" if _n==3
       replace  type = "14_upum" if _n==4
       replace  type = "14_upnm" if _n==6
       replace  type = "18_24em" if _n==27 
       replace  type = "18_24um" if _n==28 
       replace  type = "18_24nm" if _n==30 
       replace  type = "25_34em" if _n==51 
       replace  type = "25_34um" if _n==52 
       replace  type = "25_34nm" if _n==54
       replace  type = "35_44em" if _n==76
       replace  type = "35_44um" if _n==77
       replace  type = "35_44nm" if _n==79
       replace  type = "45_64em" if _n==100 
       replace  type = "45_64um" if _n==101 
       replace  type = "45_64nm" if _n==103 
       replace  type = "65_upem" if _n==124 
       replace  type = "65_upum" if _n==125 
       replace  type = "65_upnm" if _n==127 
       replace  type = "14_upf" if _n==147 
       quietly for var pop nm ss ds ab: replace X = X*1000      
       }

else if year>=1965 & year<=1967 {
       rename v3 pop
       gen nm =  v4 + v6
       rename v8 ss
       rename v9 ds 
       rename v12 ab
       drop v4-v7 v10 v11 
       drop if ((_n>=49 & _n<=55) | _n==111) & year==1965
       drop if ((_n>=49 & _n<=55) | _n==84 | _n==111 | _n==142 ) & year==1966
       drop if ((_n>=49 & _n<=55) | _n==111 | _n==132) & year==1967
       gen str7 type = "14_upem" if _n==5
       replace  type = "14_upum" if _n==6
       replace  type = "14_upnm" if _n==7
       replace  type = "18_24em" if _n==52
       replace  type = "18_24um" if _n==53
       replace  type = "18_24nm" if _n==54
       replace  type = "25_34em" if _n==88
       replace  type = "25_34um" if _n==89
       replace  type = "25_34nm" if _n==90
       replace  type = "35_44em" if _n==111
       replace  type = "35_44um" if _n==112
       replace  type = "35_44nm" if _n==113
       replace  type = "45_64em" if _n==136
       replace  type = "45_64um" if _n==137
       replace  type = "45_64nm" if _n==138
       replace  type = "65_upem" if _n==160 
       replace  type = "65_upum" if _n==161 
       replace  type = "65_upnm" if _n==162 
       replace  type = "14_upf" if _n==189 
       quietly for var pop nm ss ds ab: replace X = X*1000 
       }
    quietly for var pop nm ss ds ab: replace X = 0 if X==. 
    quietly for var pop nm ss ds ab: format X %14.0f
    l year v1 type pop nm ss ds ab  if type~=""
    drop v1

    drop if type==""
    reshape wide pop nm ss ds ab, j(type) i(year) string
    append using cps4880
    save cps4880, replace
    }

  
* data that was read incorrectly  
  replace pop18_19m = 1955000 if year==1948 
  replace pop20_24m = 5768000 if year==1948 
  replace pop20_24f = 6047000 if year==1948 
  replace pop25_34f = 11866000 if year==1948 
  replace pop35_44f = 10321000 if year==1948 
  replace pop65_upf = 5692000 if year==1948 
  replace  nm20_24m = 4905000 if year==1948 
  replace  nm35_44m = 9308000 if year==1948 
  replace  nm18_19f = 2035000 if year==1948 
  replace  nm20_24f = 5251000 if year==1948 
  replace  nm65_upf = 5472000 if year==1948 
  replace  ss18_19m = 54000 if year==1948 
  replace  ss20_24m = 352000 if year==1948 
  replace  ss35_44m = 328000 if year==1948 
  replace  ss65_upm = 105000 if year==1948 
  replace  sstotf = 2319000 if year==1948 
  replace  ss20_24f = 388000 if year==1948 
  replace  ss25_34f = 430000 if year==1948 
  replace  ss35_44f = 257000 if year==1948 
  replace  ss45_64f = 255000 if year==1948 
  replace  abtotm = 326000 if year==1948 
  replace  ab35_44m = 22000 if year==1948 
  replace  ab65_upm = 5000 if year==1948 
  replace  abtotf = 136000 if year==1948 
  replace  ab25_34m = 32000 if year==1948 

  replace  nm20_24f = 5343000 if year==1949 
  replace  ab20_24m = 88000 if year==1949 
  replace  ab25_34m = 39000 if year==1949 
  replace  ab25_34f = 57000 if year==1950 
  replace  ab35_44f = 25000 if year==1950 
  replace  ab45_64f = 25000 if year==1950 
  
  replace  pop30_34m = 5882000 if year==1953 
  replace  ab35_44m = 40000 if year==1953 
  
  replace  abtotm = 735000 if year==1954 
  replace  ab35_44f = 24000 if year==1954 
  replace  ab45_64f = 33000 if year==1954 

  replace  pop20_24f = 5386000 if year==1955 

  replace  pop45_64m = 16600000 if year==1956 
 
  replace  ab18_24um = 18000 if year==1957 
  replace  ab18_24nm = 23000 if year==1957 
  replace  pop35_44em = 10377000 if year==1957 
  replace  pop45_64um = 535000 if year==1957 
  replace  nm45_64nm = 488000 if year==1957 
  replace  ss45_64um = 16000 if year==1957 
  replace  ss45_64nm = 71000 if year==1957 
  replace  ab45_64um = 10000 if year==1957 
  replace  ab45_64nm = 2000 if year==1957 
  replace  pop65_upnm = 4271000 if year==1957 
  replace  nm65_upem = 2364000 if year==1957 
  replace  nm65_upum = 83000 if year==1957 
  replace  nm65_upnm = 4110000 if year==1957 
  replace  ds65_upnm = 55000 if year==1957 
  replace  ab65_upnm = 2000 if year==1957 

  replace  pop14_upnm = 12051000 if year==1958 
  replace  ss18_24nm = 58000 if year==1958 
  replace  ss25_34um = 63000 if year==1958 

  replace  pop35_44nm = 425000 if year==1962
  replace  nm18_24nm = 1545000 if year==1962
  replace  nm35_44em = 10001000 if year==1962
  replace  nm35_44nm = 355000 if year==1962
  replace  ab65_upem = 3000 if year==1962
  replace  ab65_upnm = 6000 if year==1962

  replace  ds45_64em = 202000 if year==1963

  replace  ds45_64um = 37000 if year==1964

  replace  ds45_64nm = 56000 if year==1967

  replace nm14_upem = 44130000 if year==1968
  replace ab18_24em = 223000 if year==1968
  replace nm45_64um = 330000 if year==1968

  replace pop14_upem = 48967000 if year==1970 
  replace ab14_upnm = 133000 if year==1970 
  replace ab25_34um = 4000 if year==1970 
  replace nm35_44em = 9708000 if year==1970 
  replace ab45_64em = 25000 if year==1970 
  replace ab45_64um = 3000 if year==1970 
  replace ab45_64nm = 1000 if year==1970 
  replace ab65_upem = 6000 if year==1970 
  replace ab65_upnm = 7000 if year==1970 

  replace nm35_44em = 8575000+879000 if year==1971 
  replace ab65_upum = 1000 if year==1971 

  replace pop14_17m = 4438000 if year==1953 
  replace ss14_17m  = 98000 if year==1954 

 * check the numbers below against the PDF files
 sort year 
 l year pop14_17m pop18_19m pop20_24m pop65_upm pop14_upem pop14_upum pop14_upnm, nod noobs
 l year pop14_17f pop18_19f pop20_24f pop14_upf, nod noobs
 l year nm14_17m nm18_19m nm20_24m nm65_upm nm14_upem nm14_upum nm14_upnm, nod noobs
 l year nm14_17f nm18_19f nm20_24f nm14_upf, nod noobs
 l year ss14_17m ss18_19m ss20_24m ss65_upm ss14_upem ss14_upum ss14_upnm, nod noobs
 l year ss14_17f ss18_19f ss20_24f ss14_upf, nod noobs
 l year ds14_17m ds18_19m ds20_24m ds65_upm ds14_upem ds14_upum ds14_upnm, nod noobs
 l year ds14_17f ds18_19f ds20_24f ds14_upf, nod noobs
 l year ab14_17m ab18_19m ab20_24m ab65_upm ab14_upem ab14_upum ab14_upnm, nod noobs
 l year ab14_17f ab18_19f ab20_24f ab14_upf, nod noobs


* check all age groups for 1958, 1960, 1961, 1965, 1969, 1971, 1976
* all data are for civilians.  
* starting in 1957, data exclude members of armed forces living off post or with their families on post
* in 1976, youngest age group is 16-24, not 18-24

 quietly for any pop ss ds nm ab: replace X25_34m = X25_29m+X30_34m if X25_34m==.\ replace X25_34f = X25_29f+X30_34f if X25_34f==.
 quietly for any pop ss ds nm ab: gen X14_24m =X14_17m+X18_19m+X20_24m \ replace X14_24m = X18_24em+X18_24um+X18_24nm if X14_24m==.
 quietly for any pop ss ds nm ab: replace X25_34m = X25_34e+X25_34u+X25_34n if X25_34m==.
 quietly for any pop ss ds nm ab: replace X35_44m = X35_44e+X35_44u+X35_44n if X35_44m==.
 quietly for any pop ss ds nm ab: replace X45_64m = X45_64e+X45_64u+X45_64n if X45_64m==.
 quietly for any pop ss ds nm ab: replace X65_upm = X65_upe+X65_upu+X65_upn if X65_upm==.
 quietly for any pop ss ds nm ab: gen X14_upm = X14_17m+X18_19m+X20_24m+X25_34m+X35_44m+X45_64m+X65_upm \ replace X14_upm = X14_upem+X14_upum+X14_upnm if X14_upm==.
 quietly for any pop ss ds nm ab: replace X14_upf = X14_17f+X18_19f+X20_24f+X25_34f+X35_44f+X45_64f+X65_upf if X14_upf==. 
* \ replace X14_upf = X14_upef+X14_upuf+X14_upnf if X14_upf==.
* quietly for any pop ss ds nm ab: replace Xtotm = Xtotem+Xtotum+Xtotnm if Xtotm==.

 sort year 
 l year pop25_34m nm25_34m ss25_34m ds25_34m ab25_34m
 l year pop35_44m nm35_44m ss35_44m ds35_44m ab35_44m
 l year pop45_64m nm45_64m ss45_64m ds45_64m ab45_64m

quietly for var nm25_34m ss25_34m ds25_34m: gen Xs = X/(nm25_34m+ss25_34m+ds25_34m)
quietly for var nm35_44m ss35_44m ds35_44m: gen Xs = X/(nm35_44m+ss35_44m+ds35_44m)
quietly for var nm45_64m ss45_64m ds45_64m: gen Xs = X/(nm45_64m+ss45_64m+ds45_64m)
quietly for var nm14_upm ss14_upm ds14_upm: gen Xs = X/(nm14_upm+ss14_upm+ds14_upm)
quietly for var nm14_upf ss14_upf ds14_upf: gen Xs = X/(nm14_upf+ss14_upf+ds14_upf)
quietly for var nmtotm sstotm dstotm: gen Xs = X/(nmtotm+sstotm+dstotm)

drop temp
save cps4880, replace
 l year ss25_34ms ds25_34ms ss35_44ms ds35_44ms ss45_64ms ds45_64ms ss14_upms ds14_upms sstotms dstotms



quietly log off
quietly log close
set more 0
