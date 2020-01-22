* investigate drop in migration in CPS microdata

set trace off
set more 1 
capture log close
clear
clear matrix
set mem 5g
set matsize 800
set linesize 200

log using cpsmicro.log, replace

! gunzip /mcr/home/m1res00/archive/cps_00007.dat.gz
quietly infix                ///
  int     year      1-4      ///
  long    serial    5-9      ///
  byte    numprec   10-11    ///
  float   hhwt      12-18    ///
  byte    gq        19-19    ///
  byte    region    20-21    ///
  byte    statefip  22-23    ///
  byte    metro     24-24    ///
  byte    ownershp  25-26    ///
  long    hhincome  27-33    ///
  byte    pernum    34-35    ///
  float   perwt     36-43    ///
  float   blswt     44-51    ///
  byte    nchild    52-52    ///
  int     relate    53-56    ///
  byte    age       57-58    ///
  byte    sex       59-59    ///
  int     race      60-62    ///
  byte    marst     63-63    ///
  long    bpl       64-68    ///
  byte    citizen   69-69    ///
  byte    nativity  70-70    ///
  int     hispan    71-73    ///
  int     educ      74-76    ///
  int     higrade   77-79    ///
  byte    educ99    80-81    ///
  byte    empstat   82-83    ///
  byte    labforce  84-84    ///
  int     occ       85-87    ///
  int     occ1950   88-90    ///
  int     ind       91-94    ///
  int     ind1950   95-97    ///
  byte    classwkr  98-99    ///
  int     occly     100-102  ///
  int     occ50ly   103-105  ///
  int     indly     106-109  ///
  int     ind50ly   110-112  ///
  byte    classwly  113-114  ///
  byte    wkswork2  115-115  ///
  byte    fullpart  116-116  ///
  byte    whynwly   117-117  ///
  long    inctot    118-123  ///
  long    incwage   124-129  ///
  byte    filestat  130-130  ///
  byte    migsta1   131-132  ///
  byte    migsta5   133-134  ///
  byte    whymove   135-136  ///
  byte    migrate1  137-137  ///
  byte    migrate5  138-139  ///
  byte    migrat75  140-141  ///
  byte    qage      142-142  ///
  byte    qmarst    143-143  ///
  byte    qrace     144-145  ///
  byte    qrelate   146-146  ///
  byte    qsex      147-147  ///
  byte    qnativit  148-149  ///
  byte    qhispan   150-151  ///
  byte    qeduc     152-152  ///
  byte    qhigrade  153-153  ///
  byte    qclasswk  154-154  ///
  byte    qclasswl  155-155  ///
  byte    qempstat  156-156  ///
  byte    qind      157-157  ///
  byte    qlabforc  158-158  ///
  byte    qocc      159-159  ///
  byte    qoccly    160-160  ///
  byte    qwhynwly  161-161  ///
  byte    qwkswork  162-162  ///
  byte    qincwage  163-163  ///
  byte    qmigrat1  164-164  ///
  byte    qmigst1a  165-165  ///
  byte    qmigst1b  166-166  ///
  byte    qwhymove  167-167  ///
 using /mcr/home/m1res00/archive/cps_00007.dat

! gzip /mcr/home/m1res00/archive/cps_00007.dat

replace hhwt=hhwt/100
replace perwt=perwt/100
replace blswt=blswt/100

label var year `"Survey year"'
label var serial `"Household serial number"'
label var numprec `"Number of person records following"'
label var hhwt `"Household weight"'
label var gq `"Group Quarters status"'
label var region `"Region and division"'
label var statefip `"State (FIPS code)"'
label var metro `"Metropolitan central city status"'
label var ownershp `"Ownership of dwelling"'
label var hhincome `"Total household income"'
label var pernum `"Person number in sample unit"'
label var perwt `"Person weight"'
label var blswt `"BLS weight"'
label var nchild `"Number of own children in household"'
label var relate `"Relationship to household head"'
label var age `"Age"'
label var sex `"Sex"'
label var race `"Race"'
label var marst `"Marital status"'
label var bpl `"Birthplace"'
label var citizen `"Citizenship status"'
label var nativity `"Foreign birthplace or parentage"'
label var hispan `"Hispanic origin"'
label var educ `"Educational attainment recode"'
label var educ99 `"Educational attainment, 1990"'
label var higrade `"Highest grade of school"'
label var empstat `"Employment status"'
label var labforce `"Labor force status"'
label var occ `"Occupation"'
label var occ1950 `"Occupation, 1950 basis"'
label var ind `"Industry"'
label var ind1950 `"Industry, 1950 basis"'
label var classwkr `"Class of worker"'
label var occly `"Occupation last year"'
label var occ50ly `"Occupation last year, 1950 basis"'
label var indly `"Industry last year"'
label var ind50ly `"Industry last year, 1950 basis"'
label var classwly `"Class of worker last year"'
label var wkswork2 `"Weeks worked last year, intervalled"'
label var fullpart `"Worked full or part time last year"'
label var whynwly `"Reason not working last year"'
label var inctot `"Total personal income"'
label var incwage `"Wage and salary income"'
label var filestat `"Tax filer status"'
label var migsta1 `"State of residence 1 year ago"'
label var migsta5  `"State of residence 5 years ago"'
label var whymove `"Reason for moving"'
label var migrate1 `"Migration status, 1 year"'
label var migrate5 `"Migration status, 5 years"'
label var migrat75 `"Migration status, 1975 to this year"'
label var qage `"Data quality flag for AGE"'
label var qmarst `"Data quality flag for MARST"'
label var qrace `"Data quality flag for RACE"'
label var qrelate `"Data quality flag for RELATE"'
label var qsex `"Data quality flag for SEX"'
label var qnativit `"Data quality flag for NATIVITY"'
label var qeduc `"Data quality flag for EDUC"'
label var qhigrade `"Data quality flag for HIGRADE"'
label var qclasswk `"Data quality flag for CLASSWKR"'
label var qclasswl `"Data quality flag for CLASSWLY"'
label var qempstat `"Data quality flag for EMPSTAT"'
label var qind `"Data quality flag for IND"'
label var qlabforc `"Data quality flag for LABFORCE"'
label var qocc `"Data quality flag for OCC"'
label var qoccly `"Data quality flag for OCCLY"'
label var qwhynwly `"Data quality flag for WHYNWLY"'
label var qwkswork `"Data quality flag for WKSWORK1 and WKSWORK2"'
label var qincwage `"Data quality flag for INCWAGE"'
label var qmigrat1 `"Data quality flag for MIGRATE1"'
label var qmigst1a `"Data quality flag for MIGSTA1"'
label var qmigst1b `"Data quality flag for MIGSTA1"'
label var qwhymove `"Data quality flag for WHYMOVE"'

label define gqlbl 0 `"NIU (Vacant units)"'
label define gqlbl 1 `"Households"', add
label define gqlbl 2 `"Group Quarters"', add
label values gq gqlbl

label define regionlbl 11 `"New England Division"', add
label define regionlbl 12 `"Middle Atlantic Division"', add
label define regionlbl 21 `"East North Central Division"', add
label define regionlbl 22 `"West North Central Division"', add
label define regionlbl 31 `"South Atlantic Division"', add
label define regionlbl 32 `"East South Central Division"', add
label define regionlbl 33 `"West South Central Division"', add
label define regionlbl 41 `"Mountain Division"', add
label define regionlbl 42 `"Pacific Division"', add
label define regionlbl 97 `"State not identified"', add
label values region regionlbl

label define statefiplbl 01 `"Alabama"'
label define statefiplbl 02 `"Alaska"', add
label define statefiplbl 04 `"Arizona"', add
label define statefiplbl 05 `"Arkansas"', add
label define statefiplbl 06 `"California"', add
label define statefiplbl 08 `"Colorado"', add
label define statefiplbl 09 `"Connecticut"', add
label define statefiplbl 10 `"Delaware"', add
label define statefiplbl 11 `"District of Columbia"', add
label define statefiplbl 12 `"Florida"', add
label define statefiplbl 13 `"Georgia"', add
label define statefiplbl 15 `"Hawaii"', add
label define statefiplbl 16 `"Idaho"', add
label define statefiplbl 17 `"Illinois"', add
label define statefiplbl 18 `"Indiana"', add
label define statefiplbl 19 `"Iowa"', add
label define statefiplbl 20 `"Kansas"', add
label define statefiplbl 21 `"Kentucky"', add
label define statefiplbl 22 `"Louisiana"', add
label define statefiplbl 23 `"Maine"', add
label define statefiplbl 24 `"Maryland"', add
label define statefiplbl 25 `"Massachusetts"', add
label define statefiplbl 26 `"Michigan"', add
label define statefiplbl 27 `"Minnesota"', add
label define statefiplbl 28 `"Mississippi"', add
label define statefiplbl 29 `"Missouri"', add
label define statefiplbl 30 `"Montana"', add
label define statefiplbl 31 `"Nebraska"', add
label define statefiplbl 32 `"Nevada"', add
label define statefiplbl 33 `"New Hampshire"', add
label define statefiplbl 34 `"New Jersey"', add
label define statefiplbl 35 `"New Mexico"', add
label define statefiplbl 36 `"New York"', add
label define statefiplbl 37 `"North Carolina"', add
label define statefiplbl 38 `"North Dakota"', add
label define statefiplbl 39 `"Ohio"', add
label define statefiplbl 40 `"Oklahoma"', add
label define statefiplbl 41 `"Oregon"', add
label define statefiplbl 42 `"Pennsylvania"', add
label define statefiplbl 44 `"Rhode Island"', add
label define statefiplbl 45 `"South Carolina"', add
label define statefiplbl 46 `"South Dakota"', add
label define statefiplbl 47 `"Tennessee"', add
label define statefiplbl 48 `"Texas"', add
label define statefiplbl 49 `"Utah"', add
label define statefiplbl 50 `"Vermont"', add
label define statefiplbl 51 `"Virginia"', add
label define statefiplbl 53 `"Washington"', add
label define statefiplbl 54 `"West Virginia"', add
label define statefiplbl 55 `"Wisconsin"', add
label define statefiplbl 56 `"Wyoming"', add
label define statefiplbl 61 `"Maine-New Hampshire-Vermont"', add
label define statefiplbl 65 `"Montana-Idaho-Wyoming"', add
label define statefiplbl 68 `"Alaska-Hawaii"', add
label define statefiplbl 69 `"Nebraska-North Dakota-South Dakota"', add
label define statefiplbl 70 `"Maine-Massachusetts-New Hampshire-Rhode Island-Vermont"', add
label define statefiplbl 71 `"Michigan-Wisconsin"', add
label define statefiplbl 72 `"Minnesota-Iowa"', add
label define statefiplbl 73 `"Nebraska-North Dakota-South Dakota-Kansas"', add
label define statefiplbl 74 `"Delaware-Virginia"', add
label define statefiplbl 75 `"North Carolina-South Carolina"', add
label define statefiplbl 76 `"Alabama-Mississippi"', add
label define statefiplbl 77 `"Arkansas-Oklahoma"', add
label define statefiplbl 78 `"Arizona-New Mexico-Colorado"', add
label define statefiplbl 79 `"Idaho-Wyoming-Utah-Montana-Nevada"', add
label define statefiplbl 80 `"Alaska-Washington-Hawaii"', add
label define statefiplbl 81 `"New Hampshire-Maine-Vermont-Rhode Island"', add
label define statefiplbl 83 `"South Carolina-Georgia"', add
label define statefiplbl 84 `"Kentucky-Tennessee"', add
label define statefiplbl 85 `"Arkansas-Louisiana-Oklahoma"', add
label define statefiplbl 87 `"Iowa-N Dakota-S Dakota-Nebraska-Kansas-Minnesota-Missouri"', add
label define statefiplbl 88 `"Washington-Oregon-Alaska-Hawaii"', add
label define statefiplbl 89 `"Montana-Wyoming-Colorado-New Mexico-Utah-Nevada-Arizona"', add
label define statefiplbl 90 `"Delaware-Maryland-Virginia-West Virginia"', add
label define statefiplbl 99 `"State not identified"', add
label values statefip statefiplbl

label define metrolbl 0 `"Not identifiable"'
label define metrolbl 1 `"Not in metro area"', add
label define metrolbl 2 `"Central city"', add
label define metrolbl 3 `"Outside central city"', add
label define metrolbl 4 `"Central city status unknown"', add
label define metrolbl 9 `"Missing/Unknown"', add
label values metro metrolbl

label define ownershplbl 00 `"NIU"'
label define ownershplbl 10 `"Owned or being bought"', add
label define ownershplbl 21 `"No cash rent"', add
label define ownershplbl 22 `"With cash rent"', add
label values ownershp ownershplbl

label define nchildlbl 0 `"0 children present"'
label define nchildlbl 1 `"1 child present"', add
label define nchildlbl 2 `"2"', add
label define nchildlbl 3 `"3"', add
label define nchildlbl 4 `"4"', add
label define nchildlbl 5 `"5"', add
label define nchildlbl 6 `"6"', add
label define nchildlbl 7 `"7"', add
label define nchildlbl 8 `"8"', add
label define nchildlbl 9 `"9+"', add
label values nchild nchildlbl

label define relatelbl 0101 `"Head/householder"', add
label define relatelbl 0201 `"Spouse"', add
label define relatelbl 0301 `"Child"', add
label define relatelbl 0303 `"Stepchild"', add
label define relatelbl 0501 `"Parent"', add
label define relatelbl 0701 `"Sibling"', add
label define relatelbl 0901 `"Grandchild"', add
label define relatelbl 1001 `"Other relatives, n.s."', add
label define relatelbl 1113 `"Partner/roommate"', add
label define relatelbl 1114 `"Unmarried partner"', add
label define relatelbl 1115 `"Housemate/roomate"', add
label define relatelbl 1241 `"Roomer/boarder/lodger"', add
label define relatelbl 1242 `"Foster children"', add
label define relatelbl 1260 `"Other nonrelatives"', add
label define relatelbl 9100 `"Armed Forces, relationship unknown"', add
label define relatelbl 9200 `"Age under 14, relationship unknown"', add
label define relatelbl 9900 `"Relationship unknown"', add
label values relate relatelbl

label define agelbl 00 `"Under 1 year"'
label define agelbl 01 `"1"', add
label define agelbl 02 `"2"', add
label define agelbl 03 `"3"', add
label define agelbl 04 `"4"', add
label define agelbl 05 `"5"', add
label define agelbl 06 `"6"', add
label define agelbl 07 `"7"', add
label define agelbl 08 `"8"', add
label define agelbl 09 `"9"', add
label define agelbl 10 `"10"', add
label define agelbl 11 `"11"', add
label define agelbl 12 `"12"', add
label define agelbl 13 `"13"', add
label define agelbl 14 `"14"', add
label define agelbl 15 `"15"', add
label define agelbl 16 `"16"', add
label define agelbl 17 `"17"', add
label define agelbl 18 `"18"', add
label define agelbl 19 `"19"', add
label define agelbl 20 `"20"', add
label define agelbl 21 `"21"', add
label define agelbl 22 `"22"', add
label define agelbl 23 `"23"', add
label define agelbl 24 `"24"', add
label define agelbl 25 `"25"', add
label define agelbl 26 `"26"', add
label define agelbl 27 `"27"', add
label define agelbl 28 `"28"', add
label define agelbl 29 `"29"', add
label define agelbl 30 `"30"', add
label define agelbl 31 `"31"', add
label define agelbl 32 `"32"', add
label define agelbl 33 `"33"', add
label define agelbl 34 `"34"', add
label define agelbl 35 `"35"', add
label define agelbl 36 `"36"', add
label define agelbl 37 `"37"', add
label define agelbl 38 `"38"', add
label define agelbl 39 `"39"', add
label define agelbl 40 `"40"', add
label define agelbl 41 `"41"', add
label define agelbl 42 `"42"', add
label define agelbl 43 `"43"', add
label define agelbl 44 `"44"', add
label define agelbl 45 `"45"', add
label define agelbl 46 `"46"', add
label define agelbl 47 `"47"', add
label define agelbl 48 `"48"', add
label define agelbl 49 `"49"', add
label define agelbl 50 `"50"', add
label define agelbl 51 `"51"', add
label define agelbl 52 `"52"', add
label define agelbl 53 `"53"', add
label define agelbl 54 `"54"', add
label define agelbl 55 `"55"', add
label define agelbl 56 `"56"', add
label define agelbl 57 `"57"', add
label define agelbl 58 `"58"', add
label define agelbl 59 `"59"', add
label define agelbl 60 `"60"', add
label define agelbl 61 `"61"', add
label define agelbl 62 `"62"', add
label define agelbl 63 `"63"', add
label define agelbl 64 `"64"', add
label define agelbl 65 `"65"', add
label define agelbl 66 `"66"', add
label define agelbl 67 `"67"', add
label define agelbl 68 `"68"', add
label define agelbl 69 `"69"', add
label define agelbl 70 `"70"', add
label define agelbl 71 `"71"', add
label define agelbl 72 `"72"', add
label define agelbl 73 `"73"', add
label define agelbl 74 `"74"', add
label define agelbl 75 `"75"', add
label define agelbl 76 `"76"', add
label define agelbl 77 `"77"', add
label define agelbl 78 `"78"', add
label define agelbl 79 `"79"', add
label define agelbl 80 `"80"', add
label define agelbl 81 `"81"', add
label define agelbl 82 `"82"', add
label define agelbl 83 `"83"', add
label define agelbl 84 `"84"', add
label define agelbl 85 `"85"', add
label define agelbl 86 `"86"', add
label define agelbl 87 `"87"', add
label define agelbl 88 `"88"', add
label define agelbl 89 `"89"', add
label define agelbl 90 `"90 (90+, 1988-2002)"', add
label define agelbl 91 `"91"', add
label define agelbl 92 `"92"', add
label define agelbl 93 `"93"', add
label define agelbl 94 `"94"', add
label define agelbl 95 `"95"', add
label define agelbl 96 `"96"', add
label define agelbl 97 `"97"', add
label define agelbl 98 `"98"', add
label define agelbl 99 `"99+"', add
label values age agelbl

label define sexlbl 1 `"Male"'
label define sexlbl 2 `"Female"', add
label values sex sexlbl

label define racelbl 100 `"White"'
label define racelbl 200 `"Black/Negro"', add
label define racelbl 300 `"American Indian/Aleut/Eskimo"', add
label define racelbl 650 `"Asian or Pacific Islander"', add
label define racelbl 651 `"Asian only"', add
label define racelbl 652 `"Hawaiian/Pacific Islander only"', add
label define racelbl 700 `"Other (single) race, n.e.c."', add
label define racelbl 801 `"White-Black"', add
label define racelbl 802 `"White-American Indian"', add
label define racelbl 803 `"White-Asian"', add
label define racelbl 804 `"White-Hawaiian/Pacific Islander"', add
label define racelbl 805 `"Black-American Indian"', add
label define racelbl 806 `"Black-Asian"', add
label define racelbl 807 `"Black-Hawaiian/Pacific Islander"', add
label define racelbl 808 `"American Indian-Asian"', add
label define racelbl 809 `"Asian-Hawaiian/Pacific Islander"', add
label define racelbl 810 `"White-Black-American Indian"', add
label define racelbl 811 `"White-Black-Asian"', add
label define racelbl 812 `"White-American Indian-Asian"', add
label define racelbl 813 `"White-Asian-Hawaiian/Pacific Islander"', add
label define racelbl 814 `"White-Black-American Indian-Asian"', add
label define racelbl 820 `"Two or three races, unspecified"', add
label define racelbl 830 `"Four or five races, unspecified"', add
label values race racelbl

label define marstlbl 1 `"Married, spouse present"'
label define marstlbl 2 `"Married, spouse absent"', add
label define marstlbl 3 `"Separated"', add
label define marstlbl 4 `"Divorced"', add
label define marstlbl 5 `"Widowed"', add
label define marstlbl 6 `"Never married/single"', add
label define marstlbl 9 `"Unknown"', add
label values marst marstlbl

label define bpllbl 09900 `"United States, n.s."', add
label define bpllbl 10000 `"American Samoa"', add
label define bpllbl 10500 `"Guam"', add
label define bpllbl 11000 `"Puerto Rico"', add
label define bpllbl 11500 `"U.S. Virgin Islands"', add
label define bpllbl 12090 `"U.S. outlying areas, n.s."', add
label define bpllbl 15000 `"Canada"', add
label define bpllbl 16010 `"Bermuda"', add
label define bpllbl 19900 `"North America, n.s."', add
label define bpllbl 20000 `"Mexico"', add
label define bpllbl 21010 `"Belize/British Honduras"', add
label define bpllbl 21020 `"Costa Rica"', add
label define bpllbl 21030 `"El Salvador"', add
label define bpllbl 21040 `"Guatemala"', add
label define bpllbl 21050 `"Honduras"', add
label define bpllbl 21060 `"Nicaragua"', add
label define bpllbl 21070 `"Panama"', add
label define bpllbl 21090 `"Central America, n.s."', add
label define bpllbl 25000 `"Cuba"', add
label define bpllbl 26010 `"Dominican Republic"', add
label define bpllbl 26020 `"Haiti"', add
label define bpllbl 26030 `"Jamaica"', add
label define bpllbl 26043 `"Bahamas"', add
label define bpllbl 26044 `"Barbados"', add
label define bpllbl 26054 `"Dominica"', add
label define bpllbl 26055 `"Grenada"', add
label define bpllbl 26060 `"Trinidad and Tobago"', add
label define bpllbl 26065 `"Antigua and Barbuda"', add
label define bpllbl 26070 `"St. Kitts--Nevis"', add
label define bpllbl 26075 `"St. Lucia"', add
label define bpllbl 26080 `"St. Vincent and the Grenadi"', add
label define bpllbl 26091 `"Caribbean, n.s."', add
label define bpllbl 30005 `"Argentina"', add
label define bpllbl 30010 `"Bolivia"', add
label define bpllbl 30015 `"Brazil"', add
label define bpllbl 30020 `"Chile"', add
label define bpllbl 30025 `"Colombia"', add
label define bpllbl 30030 `"Ecuador"', add
label define bpllbl 30040 `"Guyana/British Guiana"', add
label define bpllbl 30050 `"Peru"', add
label define bpllbl 30060 `"Uruguay"', add
label define bpllbl 30065 `"Venezuela"', add
label define bpllbl 30070 `"Paraguay"', add
label define bpllbl 30090 `"South America, n.s."', add
label define bpllbl 31000 `"Americas, n.s."', add
label define bpllbl 40000 `"Denmark"', add
label define bpllbl 40100 `"Finland"', add
label define bpllbl 40400 `"Norway"', add
label define bpllbl 40500 `"Sweden"', add
label define bpllbl 41000 `"England"', add
label define bpllbl 41100 `"Scotland"', add
label define bpllbl 41200 `"Wales"', add
label define bpllbl 41300 `"United Kingdom, n.s."', add
label define bpllbl 41400 `"Ireland"', add
label define bpllbl 41410 `"Northern Ireland"', add
label define bpllbl 42000 `"Belgium"', add
label define bpllbl 42100 `"France"', add
label define bpllbl 42500 `"Netherlands"', add
label define bpllbl 42600 `"Switzerland"', add
label define bpllbl 43300 `"Greece"', add
label define bpllbl 43400 `"Italy"', add
label define bpllbl 43600 `"Portugal"', add
label define bpllbl 43610 `"Azores"', add
label define bpllbl 43800 `"Spain"', add
label define bpllbl 45000 `"Austria"', add
label define bpllbl 45200 `"Czechoslavakia"', add
label define bpllbl 45212 `"Slovakia"', add
label define bpllbl 45213 `"Czech Republic"', add
label define bpllbl 45300 `"Germany"', add
label define bpllbl 45400 `"Hungary"', add
label define bpllbl 45500 `"Poland"', add
label define bpllbl 45600 `"Romania"', add
label define bpllbl 45650 `"Bulgaria"', add
label define bpllbl 45700 `"Yugoslavia"', add
label define bpllbl 45710 `"Albania"', add
label define bpllbl 45720 `"Bosnia and Herzegovina"', add
label define bpllbl 45730 `"Croatia"', add
label define bpllbl 45740 `"Macedonia"', add
label define bpllbl 45750 `"Serbia"', add
label define bpllbl 45760 `"Kosovo"', add
label define bpllbl 46100 `"Latvia"', add
label define bpllbl 46200 `"Lithuania"', add
label define bpllbl 46500 `"Other USSR/Russia"', add
label define bpllbl 46530 `"Ukraine"', add
label define bpllbl 46535 `"Belarus"', add
label define bpllbl 46540 `"Moldova"', add
label define bpllbl 46590 `"USSR, n.s."', add
label define bpllbl 49900 `"Europe, n.s."', add
label define bpllbl 50000 `"China"', add
label define bpllbl 50010 `"Hong Kong"', add
label define bpllbl 50040 `"Taiwan"', add
label define bpllbl 50100 `"Japan"', add
label define bpllbl 50200 `"Korea"', add
label define bpllbl 50220 `"South Korea"', add
label define bpllbl 51100 `"Cambodia"', add
label define bpllbl 51200 `"Indonesia"', add
label define bpllbl 51300 `"Laos"', add
label define bpllbl 51400 `"Malaysia"', add
label define bpllbl 51500 `"Philippines"', add
label define bpllbl 51600 `"Singapore"', add
label define bpllbl 51700 `"Thailand"', add
label define bpllbl 51800 `"Vietnam"', add
label define bpllbl 52000 `"Afghanistan"', add
label define bpllbl 52100 `"India"', add
label define bpllbl 52110 `"Bangladesh"', add
label define bpllbl 52130 `"Burma"', add
label define bpllbl 52140 `"Pakistan"', add
label define bpllbl 52150 `"Sri Lanka"', add
label define bpllbl 52200 `"Nepal"', add
label define bpllbl 55100 `"Armenia"', add
label define bpllbl 55200 `"Azerbaijan"', add
label define bpllbl 55300 `"Georgia"', add
label define bpllbl 55400 `"Uzbekistan"', add
label define bpllbl 53000 `"Iran"', add
label define bpllbl 53200 `"Iraq"', add
label define bpllbl 53400 `"Israel/Palestine"', add
label define bpllbl 53420 `"Palestine"', add
label define bpllbl 53500 `"Jordan"', add
label define bpllbl 53700 `"Lebanon"', add
label define bpllbl 54000 `"Saudi Arabia"', add
label define bpllbl 54100 `"Syria"', add
label define bpllbl 54200 `"Turkey"', add
label define bpllbl 54300 `"Cyprus"', add
label define bpllbl 54350 `"Kuwait"', add
label define bpllbl 54400 `"Yemen"', add
label define bpllbl 54700 `"Middle East, n.s."', add
label define bpllbl 59900 `"Asia, n.e.c./n.s."', add
label define bpllbl 60010 `"Northern Africa"', add
label define bpllbl 60012 `"Egypt/United Arab Rep."', add
label define bpllbl 60014 `"Morocco"', add
label define bpllbl 60016 `"Algeria"', add
label define bpllbl 60018 `"Sudan"', add
label define bpllbl 60023 `"Ghana"', add
label define bpllbl 60031 `"Nigeria"', add
label define bpllbl 60032 `"Cameroon"', add
label define bpllbl 60033 `"Cape Verde"', add
label define bpllbl 60034 `"Liberia"', add
label define bpllbl 60035 `"Sengal"', add
label define bpllbl 60036 `"Sierra Leone"', add
label define bpllbl 60040 `"Eritrea"', add
label define bpllbl 60044 `"Ethiopia"', add
label define bpllbl 60045 `"Kenya"', add
label define bpllbl 60050 `"Somalia"', add
label define bpllbl 60060 `"Tanzania"', add
label define bpllbl 60065 `"Uganda"', add
label define bpllbl 60070 `"Zimbabwe"', add
label define bpllbl 60094 `"South Africa (Union of)"', add
label define bpllbl 60099 `"Africa, n.s./n.e.c."', add
label define bpllbl 70010 `"Australia"', add
label define bpllbl 70020 `"New Zealand"', add
label define bpllbl 71000 `"Pacific Islands"', add
label define bpllbl 71021 `"Fiji"', add
label define bpllbl 71022 `"Tonga"', add
label define bpllbl 96000 `"Other, n.e.c. and unknown"', add
label values bpl bpllbl

label define citizenlbl 0 `"NIU"'
label define citizenlbl 1 `"Born abroad of American parents"', add
label define citizenlbl 2 `"Naturalized citizen"', add
label define citizenlbl 3 `"Not a citizen"', add
label values citizen citizenlbl

label define nativitylbl 0 `"Unknown"'
label define nativitylbl 1 `"Both parents native-born"', add
label define nativitylbl 2 `"Father foreign, mother native"', add
label define nativitylbl 3 `"Mother foreign, father native"', add
label define nativitylbl 4 `"Both parents foreign"', add
label define nativitylbl 5 `"Foreign born"', add
label values nativity nativitylbl

label define hispanlbl 000 `"Not Hispanic"'
label define hispanlbl 100 `"Mexican"', add
label define hispanlbl 102 `"Mexican American"', add
label define hispanlbl 103 `"Mexicano/Mexicana"', add
label define hispanlbl 104 `"Chicano/Chicana"', add
label define hispanlbl 108 `"Mexican (Mexicano)"', add
label define hispanlbl 109 `"Mexicano/Chicano"', add
label define hispanlbl 200 `"Puerto Rican"', add
label define hispanlbl 300 `"Cuban"', add
label define hispanlbl 400 `"Other Spanish"', add
label define hispanlbl 410 `"Central/South American"', add
label define hispanlbl 901 `"Do not know"', add
label define hispanlbl 902 `"N/A (and no response 1985-87)"', add
label values hispan hispanlbl

label define educlbl 000 `"NIU or no schooling"'
label define educlbl 001 `"NIU"', add
label define educlbl 002 `"None or preschool"', add
label define educlbl 010 `"Grades 1, 2, 3, or 4"', add
label define educlbl 011 `"Grade 1"', add
label define educlbl 012 `"Grade 2"', add
label define educlbl 013 `"Grade 3"', add
label define educlbl 014 `"Grade 4"', add
label define educlbl 020 `"Grades 5 or 6"', add
label define educlbl 021 `"Grade 5"', add
label define educlbl 022 `"Grade 6"', add
label define educlbl 030 `"Grades 7 or 8"', add
label define educlbl 031 `"Grade 7"', add
label define educlbl 032 `"Grade 8"', add
label define educlbl 040 `"Grade 9"', add
label define educlbl 050 `"Grade 10"', add
label define educlbl 060 `"Grade 11"', add
label define educlbl 070 `"Grade 12"', add
label define educlbl 071 `"12th grade, no diploma"', add
label define educlbl 072 `"12th grade, diploma unclear"', add
label define educlbl 073 `"High school diploma or equivalent"', add
label define educlbl 080 `"1 year of college"', add
label define educlbl 081 `"Some college but no degree"', add
label define educlbl 090 `"2 years of college"', add
label define educlbl 091 `"Associate's degree, occupational/vocational program"', add
label define educlbl 092 `"Associate's degree, academic program"', add
label define educlbl 100 `"3 years of college"', add
label define educlbl 110 `"4 years of college"', add
label define educlbl 111 `"Bachelor's degree"', add
label define educlbl 112 `"6+ years of college"', add
label define educlbl 113 `"Master's degree"', add
label define educlbl 114 `"Professional school degree"', add
label define educlbl 115 `"Doctorate degree"', add
label define educlbl 999 `"Missing/Unknown"', add
label values educ educlbl

label define educ99lbl 00 `"NIU"'
label define educ99lbl 01 `"No school completed"', add
label define educ99lbl 04 `"1st-4th grade"', add
label define educ99lbl 05 `"5th-8th grade"', add
label define educ99lbl 06 `"9th grade"', add
label define educ99lbl 07 `"10th grade"', add
label define educ99lbl 08 `"11th grade"', add
label define educ99lbl 09 `"12th grade, no diploma"', add
label define educ99lbl 10 `"High school graduate, or GED"', add
label define educ99lbl 11 `"Some college, no degree"', add
label define educ99lbl 12 `"Associate degree, type of program not specified"', add
label define educ99lbl 13 `"Associate degree, occupational program"', add
label define educ99lbl 14 `"Associate degree, academic program"', add
label define educ99lbl 15 `"Bachelors degree"', add
label define educ99lbl 16 `"Masters degree"', add
label define educ99lbl 17 `"Professional degree"', add
label define educ99lbl 18 `"Doctorate degree"', add
label values educ99 educ99lbl

label define higradelbl 000 `"NIU"'
label define higradelbl 010 `"None"', add
label define higradelbl 031 `"Did not finish 1st grade"', add
label define higradelbl 040 `"1st grade"', add
label define higradelbl 041 `"Did not finish 2nd grade"', add
label define higradelbl 050 `"2nd grade"', add
label define higradelbl 051 `"Did not finish 3rd grade"', add
label define higradelbl 060 `"3rd grade"', add
label define higradelbl 061 `"Did not finish 4th grade"', add
label define higradelbl 070 `"4th grade"', add
label define higradelbl 071 `"Did not finish 5th grade"', add
label define higradelbl 080 `"5th grade"', add
label define higradelbl 081 `"Did not finish 6th grade"', add
label define higradelbl 090 `"6th grade"', add
label define higradelbl 091 `"Did not finish 7th grade"', add
label define higradelbl 100 `"7th grade"', add
label define higradelbl 101 `"Did not finish 8th grade"', add
label define higradelbl 110 `"8th grade"', add
label define higradelbl 111 `"Did not finish 9th grade"', add
label define higradelbl 120 `"9th grade"', add
label define higradelbl 121 `"Did not finish 10th grade"', add
label define higradelbl 130 `"10th grade"', add
label define higradelbl 131 `"Did not finish 11th grade"', add
label define higradelbl 140 `"11th grade"', add
label define higradelbl 141 `"Did not finish 12th grade"', add
label define higradelbl 150 `"12th grade"', add
label define higradelbl 151 `"Did not finish 1st year college"', add
label define higradelbl 160 `"1st year college"', add
label define higradelbl 161 `"Did not finish 2nd year"', add
label define higradelbl 170 `"2nd year college"', add
label define higradelbl 171 `"Did not finish 3rd year"', add
label define higradelbl 180 `"3rd year college"', add
label define higradelbl 181 `"Did not finish 4th year"', add
label define higradelbl 190 `"4th year college"', add
label define higradelbl 191 `"Did not finish 5th year"', add
label define higradelbl 200 `"5th year college"', add
label define higradelbl 201 `"Did not finish 6th year"', add
label define higradelbl 210 `"6th year college"', add
label define higradelbl 999 `"Missing/Unknown"', add
label values higrade higradelbl

label define empstatlbl 00 `"NIU"'
label define empstatlbl 10 `"At work"', add
label define empstatlbl 12 `"Has job, not at work last week"', add
label define empstatlbl 13 `"Armed Forces"', add
label define empstatlbl 20 `"Unemployed"', add
label define empstatlbl 21 `"Unemployed, experienced worker"', add
label define empstatlbl 22 `"Unemployed, new worker"', add
label define empstatlbl 30 `"Not in labor force"', add
label define empstatlbl 31 `"NILF, housework"', add
label define empstatlbl 32 `"NILF, unable to work"', add
label define empstatlbl 33 `"NILF, school"', add
label define empstatlbl 34 `"NILF, other"', add
label define empstatlbl 35 `"NILF, unpaid, lt 15 hours"', add
label values empstat empstatlbl

label define labforcelbl 0 `"NIU"'
label define labforcelbl 1 `"No, not in the labor force"', add
label define labforcelbl 2 `"Yes, in the labor force"', add
label values labforce labforcelbl

label define occ1950lbl 000 `"Accountants and auditors"', add
label define occ1950lbl 001 `"Actors and actresses"', add
label define occ1950lbl 002 `"Airplane pilots and navigators"', add
label define occ1950lbl 003 `"Architects"', add
label define occ1950lbl 004 `"Artists and art teachers"', add
label define occ1950lbl 005 `"Athletes"', add
label define occ1950lbl 006 `"Authors"', add
label define occ1950lbl 007 `"Chemists"', add
label define occ1950lbl 008 `"Chiropractors"', add
label define occ1950lbl 009 `"Clergymen"', add
label define occ1950lbl 010 `"College presidents and deans"', add
label define occ1950lbl 012 `"Agricultural sciences"', add
label define occ1950lbl 013 `"Biological sciences"', add
label define occ1950lbl 014 `"Chemistry"', add
label define occ1950lbl 015 `"Economics"', add
label define occ1950lbl 016 `"Engineering"', add
label define occ1950lbl 017 `"Geology and geophysics"', add
label define occ1950lbl 018 `"Mathematics"', add
label define occ1950lbl 019 `"Medical sciences"', add
label define occ1950lbl 023 `"Physics"', add
label define occ1950lbl 024 `"Psychology"', add
label define occ1950lbl 025 `"Statistics"', add
label define occ1950lbl 026 `"Natural science (n.e.c.)"', add
label define occ1950lbl 027 `"Social sciences (n.e.c.)"', add
label define occ1950lbl 028 `"Nonscientific subjects"', add
label define occ1950lbl 029 `"Subject not specified"', add
label define occ1950lbl 031 `"Dancers and dancing teachers"', add
label define occ1950lbl 032 `"Dentists"', add
label define occ1950lbl 033 `"Designers"', add
label define occ1950lbl 034 `"Dieticians and nutritionists"', add
label define occ1950lbl 035 `"Draftsmen"', add
label define occ1950lbl 036 `"Editors and reporters"', add
label define occ1950lbl 041 `"Engineers, aeronautical"', add
label define occ1950lbl 042 `"Engineers, chemical"', add
label define occ1950lbl 043 `"Engineers, civil"', add
label define occ1950lbl 044 `"Engineers, electrical"', add
label define occ1950lbl 045 `"Engineers, industrial"', add
label define occ1950lbl 046 `"Engineers, mechanical"', add
label define occ1950lbl 047 `"Engineers, metallurgical, metallurgists"', add
label define occ1950lbl 048 `"Engineers, mining"', add
label define occ1950lbl 049 `"Engineers (n.e.c.)"', add
label define occ1950lbl 051 `"Entertainers (n.e.c.)"', add
label define occ1950lbl 052 `"Farm and home management advisors"', add
label define occ1950lbl 053 `"Foresters and conservationists"', add
label define occ1950lbl 054 `"Funeral directors and embalmers"', add
label define occ1950lbl 055 `"Lawyers and judges"', add
label define occ1950lbl 056 `"Librarians"', add
label define occ1950lbl 057 `"Musicians and music teachers"', add
label define occ1950lbl 058 `"Nurses, professional"', add
label define occ1950lbl 059 `"Nurses, student professional"', add
label define occ1950lbl 061 `"Agricultural scientists"', add
label define occ1950lbl 062 `"Biological scientists"', add
label define occ1950lbl 063 `"Geologists and geophysicists"', add
label define occ1950lbl 067 `"Mathematicians"', add
label define occ1950lbl 068 `"Physicists"', add
label define occ1950lbl 069 `"Miscellaneous natural scientists"', add
label define occ1950lbl 070 `"Optometrists"', add
label define occ1950lbl 071 `"Osteopaths"', add
label define occ1950lbl 072 `"Personnel and labor relations workers"', add
label define occ1950lbl 073 `"Pharmacists"', add
label define occ1950lbl 074 `"Photographers"', add
label define occ1950lbl 075 `"Physicians and surgeons"', add
label define occ1950lbl 076 `"Radio operators"', add
label define occ1950lbl 077 `"Recreation and group workers"', add
label define occ1950lbl 078 `"Religious workers"', add
label define occ1950lbl 079 `"Social and welfare workers, except group"', add
label define occ1950lbl 081 `"Economists"', add
label define occ1950lbl 082 `"Psychologists"', add
label define occ1950lbl 083 `"Statisticians and actuaries"', add
label define occ1950lbl 084 `"Miscellaneous social scientists"', add
label define occ1950lbl 091 `"Sports instructors and officials"', add
label define occ1950lbl 092 `"Surveyors"', add
label define occ1950lbl 093 `"Teachers (n.e.c.)"', add
label define occ1950lbl 094 `"Technicians, medical and dental"', add
label define occ1950lbl 095 `"Technicians, testing"', add
label define occ1950lbl 096 `"Technicians (n.e.c.)"', add
label define occ1950lbl 097 `"Therapists and healers (n.e.c.)"', add
label define occ1950lbl 098 `"Veterinarians"', add
label define occ1950lbl 099 `"Professional, technical and kindred workers (n.e.c.)"', add
label define occ1950lbl 100 `"Farmers (owners and tenants)"', add
label define occ1950lbl 123 `"Farm managers"', add
label define occ1950lbl 200 `"Buyers and department heads, store"', add
label define occ1950lbl 201 `"Buyers and shippers, farm products"', add
label define occ1950lbl 203 `"Conductors, railroad"', add
label define occ1950lbl 204 `"Credit men"', add
label define occ1950lbl 205 `"Floormen and floor managers, store"', add
label define occ1950lbl 210 `"Inspectors, public administration"', add
label define occ1950lbl 230 `"Managers and superintendents, building"', add
label define occ1950lbl 240 `"Officers, pilots, pursers and engineers, ship"', add
label define occ1950lbl 250 `"Officials and administrators (n.e.c.), public administration"', add
label define occ1950lbl 260 `"Officials, lodge, society, union, etc."', add
label define occ1950lbl 270 `"Postmasters"', add
label define occ1950lbl 280 `"Purchasing agents and buyers (n.e.c.)"', add
label define occ1950lbl 290 `"Managers, officials, and proprietors (n.e.c.)"', add
label define occ1950lbl 300 `"Agents (n.e.c.)"', add
label define occ1950lbl 301 `"Attendants and assistants, library"', add
label define occ1950lbl 302 `"Attendants, physicians and dentists office"', add
label define occ1950lbl 304 `"Baggagemen, transportation"', add
label define occ1950lbl 305 `"Bank tellers"', add
label define occ1950lbl 310 `"Bookkeepers"', add
label define occ1950lbl 320 `"Cashiers"', add
label define occ1950lbl 321 `"Collectors, bill and account"', add
label define occ1950lbl 322 `"Dispatchers and starters, vehicle"', add
label define occ1950lbl 325 `"Express messengers and railway mail clerks"', add
label define occ1950lbl 335 `"Mail carriers"', add
label define occ1950lbl 340 `"Messengers and office boys"', add
label define occ1950lbl 341 `"Office machine operators"', add
label define occ1950lbl 342 `"Shipping and receiving clerks"', add
label define occ1950lbl 350 `"Stenographers, typists, and secretaries"', add
label define occ1950lbl 360 `"Telegraph messengers"', add
label define occ1950lbl 365 `"Telegraph operators"', add
label define occ1950lbl 370 `"Telephone operators"', add
label define occ1950lbl 380 `"Ticket, station, and express agents"', add
label define occ1950lbl 390 `"Clerical and kindred workers (n.e.c.)"', add
label define occ1950lbl 400 `"Advertising agents and salesmen"', add
label define occ1950lbl 410 `"Auctioneers"', add
label define occ1950lbl 420 `"Demonstrators"', add
label define occ1950lbl 430 `"Hucksters and peddlers"', add
label define occ1950lbl 450 `"Insurance agents and brokers"', add
label define occ1950lbl 460 `"Newsboys"', add
label define occ1950lbl 470 `"Real estate agents and brokers"', add
label define occ1950lbl 480 `"Stock and bond salesmen"', add
label define occ1950lbl 490 `"Salesmen and sales clerks (n.e.c.)"', add
label define occ1950lbl 500 `"Bakers"', add
label define occ1950lbl 501 `"Blacksmiths"', add
label define occ1950lbl 502 `"Bookbinders"', add
label define occ1950lbl 503 `"Boilermakers"', add
label define occ1950lbl 504 `"Brickmasons, stonemasons, and tile setters"', add
label define occ1950lbl 505 `"Cabinetmakers"', add
label define occ1950lbl 510 `"Carpenters"', add
label define occ1950lbl 511 `"Cement and concrete finishers"', add
label define occ1950lbl 512 `"Compositors and typesetters"', add
label define occ1950lbl 513 `"Cranemen, derrickmen, and hoistmen"', add
label define occ1950lbl 514 `"Decorators and window dressers"', add
label define occ1950lbl 515 `"Electricians"', add
label define occ1950lbl 520 `"Electrotypers and stereotypers"', add
label define occ1950lbl 521 `"Engravers, except photoengravers"', add
label define occ1950lbl 522 `"Excavating, grading, and road machinery operators"', add
label define occ1950lbl 523 `"Foremen (n.e.c.)"', add
label define occ1950lbl 524 `"Forgemen and hammermen"', add
label define occ1950lbl 525 `"Furriers"', add
label define occ1950lbl 530 `"Glaziers"', add
label define occ1950lbl 531 `"Heat treaters, annealers, temperers"', add
label define occ1950lbl 532 `"Inspectors, scalers, and graders, log and lumber"', add
label define occ1950lbl 533 `"Inspectors (n.e.c.)"', add
label define occ1950lbl 534 `"Jewelers, watchmakers, goldsmiths, and silversmiths"', add
label define occ1950lbl 535 `"Job setters, metal"', add
label define occ1950lbl 540 `"Linemen and servicemen, telegraph, telephone, and power"', add
label define occ1950lbl 541 `"Locomotive engineers"', add
label define occ1950lbl 542 `"Locomotive firemen"', add
label define occ1950lbl 543 `"Loom fixers"', add
label define occ1950lbl 544 `"Machinists"', add
label define occ1950lbl 545 `"Mechanics and repairmen, airplane"', add
label define occ1950lbl 550 `"Mechanics and repairmen, automobile"', add
label define occ1950lbl 551 `"Mechanics and repairmen, office machine"', add
label define occ1950lbl 552 `"Mechanics and repairmen, radio and television"', add
label define occ1950lbl 553 `"Mechanics and repairmen, railroad and car shop"', add
label define occ1950lbl 554 `"Mechanics and repairmen (n.e.c.)"', add
label define occ1950lbl 555 `"Millers, grain, flour, feed, etc."', add
label define occ1950lbl 560 `"Millwrights"', add
label define occ1950lbl 561 `"Molders, metal"', add
label define occ1950lbl 562 `"Motion picture projectionists"', add
label define occ1950lbl 563 `"Opticians and lens grinders and polishers"', add
label define occ1950lbl 564 `"Painters, construction and maintenance"', add
label define occ1950lbl 565 `"Paperhangers"', add
label define occ1950lbl 570 `"Pattern and model makers, except paper"', add
label define occ1950lbl 571 `"Photoengravers and lithographers"', add
label define occ1950lbl 572 `"Piano and organ tuners and repairmen"', add
label define occ1950lbl 573 `"Plasterers"', add
label define occ1950lbl 574 `"Plumbers and pipe fitters"', add
label define occ1950lbl 575 `"Pressmen and plate printers, printing"', add
label define occ1950lbl 580 `"Rollers and roll hands, metal"', add
label define occ1950lbl 581 `"Roofers and slaters"', add
label define occ1950lbl 582 `"Shoemakers and repairers, except factory"', add
label define occ1950lbl 583 `"Stationary engineers"', add
label define occ1950lbl 584 `"Stone cutters and stone carvers"', add
label define occ1950lbl 585 `"Structural metal workers"', add
label define occ1950lbl 590 `"Tailors and tailoresses"', add
label define occ1950lbl 591 `"Tinsmiths, coppersmiths, and sheet metal workers"', add
label define occ1950lbl 592 `"Tool makers, and die makers and setters"', add
label define occ1950lbl 593 `"Upholsterers"', add
label define occ1950lbl 594 `"Craftsmen and kindred workers (n.e.c.)"', add
label define occ1950lbl 595 `"Members of the armed services"', add
label define occ1950lbl 600 `"Apprentice auto mechanics"', add
label define occ1950lbl 601 `"Apprentice bricklayers and masons"', add
label define occ1950lbl 602 `"Apprentice carpenters"', add
label define occ1950lbl 603 `"Apprentice electricians"', add
label define occ1950lbl 604 `"Apprentice machinists and toolmakers"', add
label define occ1950lbl 605 `"Apprentice mechanics, except auto"', add
label define occ1950lbl 610 `"Apprentice plumbers and pipe fitters"', add
label define occ1950lbl 611 `"Apprentices, building trades (n.e.c.)"', add
label define occ1950lbl 612 `"Apprentices, metalworking trades (n.e.c.)"', add
label define occ1950lbl 613 `"Apprentices, printing trades"', add
label define occ1950lbl 614 `"Apprentices, other specified trades"', add
label define occ1950lbl 615 `"Apprentices, trade not specified"', add
label define occ1950lbl 620 `"Asbestos and insulation workers"', add
label define occ1950lbl 621 `"Attendants, auto service and parking"', add
label define occ1950lbl 622 `"Blasters and powdermen"', add
label define occ1950lbl 623 `"Boatmen, canalmen, and lock keepers"', add
label define occ1950lbl 624 `"Brakemen, railroad"', add
label define occ1950lbl 625 `"Bus drivers"', add
label define occ1950lbl 630 `"Chainmen, rodmen, and axmen, surveying"', add
label define occ1950lbl 631 `"Conductors, bus and street railway"', add
label define occ1950lbl 632 `"Deliverymen and routemen"', add
label define occ1950lbl 633 `"Dressmakers and seamstresses, except factory"', add
label define occ1950lbl 634 `"Dyers"', add
label define occ1950lbl 635 `"Filers, grinders, and polishers, metal"', add
label define occ1950lbl 640 `"Fruit, nut, veg graders and packers, except factory"', add
label define occ1950lbl 641 `"Furnacemen, smeltermen and pourers"', add
label define occ1950lbl 642 `"Heaters, metal"', add
label define occ1950lbl 643 `"Laundry and dry cleaning operatives"', add
label define occ1950lbl 644 `"Meat cutters, except slaughter and packing house"', add
label define occ1950lbl 645 `"Milliners"', add
label define occ1950lbl 650 `"Mine operatives and laborers"', add
label define occ1950lbl 660 `"Motormen, mine, factory, logging camp, etc."', add
label define occ1950lbl 661 `"Motormen, street, subway, and elevated railway"', add
label define occ1950lbl 662 `"Oilers and greaser, except auto"', add
label define occ1950lbl 670 `"Painters, except construction or maintenance"', add
label define occ1950lbl 671 `"Photographic process workers"', add
label define occ1950lbl 672 `"Power station operators"', add
label define occ1950lbl 673 `"Sailors and deck hands"', add
label define occ1950lbl 674 `"Sawyers"', add
label define occ1950lbl 675 `"Spinners, textile"', add
label define occ1950lbl 680 `"Stationary firemen"', add
label define occ1950lbl 681 `"Switchmen, railroad"', add
label define occ1950lbl 682 `"Taxicab drivers and chauffers"', add
label define occ1950lbl 683 `"Truck and tractor drivers"', add
label define occ1950lbl 684 `"Weavers, textile"', add
label define occ1950lbl 685 `"Welders and flame cutters"', add
label define occ1950lbl 690 `"Operative and kindred workers (n.e.c.)"', add
label define occ1950lbl 700 `"Housekeepers, private household"', add
label define occ1950lbl 710 `"Laundressses, private household"', add
label define occ1950lbl 720 `"Private household workers (n.e.c.)"', add
label define occ1950lbl 730 `"Attendants, hospital and other institution"', add
label define occ1950lbl 731 `"Attendants, professional and personal service (n.e.c.)"', add
label define occ1950lbl 732 `"Attendants, recreation and amusement"', add
label define occ1950lbl 740 `"Barbers, beauticians, and manicurists"', add
label define occ1950lbl 750 `"Bartenders"', add
label define occ1950lbl 751 `"Bootblacks"', add
label define occ1950lbl 752 `"Boarding and lodging house keepers"', add
label define occ1950lbl 753 `"Charwomen and cleaners"', add
label define occ1950lbl 754 `"Cooks, except private household"', add
label define occ1950lbl 760 `"Counter and fountain workers"', add
label define occ1950lbl 761 `"Elevator operators"', add
label define occ1950lbl 762 `"Firemen, fire protection"', add
label define occ1950lbl 763 `"Guards, watchmen, and doorkeepers"', add
label define occ1950lbl 764 `"Housekeepers and stewards, except private household"', add
label define occ1950lbl 770 `"Janitors and sextons"', add
label define occ1950lbl 771 `"Marshals and constables"', add
label define occ1950lbl 772 `"Midwives"', add
label define occ1950lbl 773 `"Policemen and detectives"', add
label define occ1950lbl 780 `"Porters"', add
label define occ1950lbl 781 `"Practical nurses"', add
label define occ1950lbl 782 `"Sheriffs and bailiffs"', add
label define occ1950lbl 783 `"Ushers, recreation and amusement"', add
label define occ1950lbl 784 `"Waiters and waitresses"', add
label define occ1950lbl 785 `"Watchmen (crossing) and bridge tenders"', add
label define occ1950lbl 790 `"Service workers, except private household (n.e.c.)"', add
label define occ1950lbl 810 `"Farm foremen"', add
label define occ1950lbl 820 `"Farm laborers, wage workers"', add
label define occ1950lbl 830 `"Farm laborers, unpaid family workers"', add
label define occ1950lbl 840 `"Farm service laborers, self-employed"', add
label define occ1950lbl 910 `"Fishermen and oystermen"', add
label define occ1950lbl 920 `"Garage laborers and car washers and greasers"', add
label define occ1950lbl 930 `"Gardeners, except farm, and groundskeepers"', add
label define occ1950lbl 940 `"Longshoremen and stevedores"', add
label define occ1950lbl 950 `"Lumbermen, raftsmen, and woodchoppers"', add
label define occ1950lbl 960 `"Teamsters"', add
label define occ1950lbl 970 `"Laborers (n.e.c.)"', add
label define occ1950lbl 997 `"Unknown"', add
label define occ1950lbl 999 `"Unemployed- last worked over x years ago"', add
label values occ1950 occ1950lbl

label define ind1950lbl 000 `"NIU"'
label define ind1950lbl 105 `"Agriculture"', add
label define ind1950lbl 116 `"Forestry"', add
label define ind1950lbl 126 `"Fisheries"', add
label define ind1950lbl 206 `"Metal mining"', add
label define ind1950lbl 216 `"Coal mining"', add
label define ind1950lbl 226 `"Crude petroleum and natural gas extraction"', add
label define ind1950lbl 236 `"Nonmetallic mining and quarrying, except fuel"', add
label define ind1950lbl 246 `"Construction"', add
label define ind1950lbl 306 `"Logging"', add
label define ind1950lbl 307 `"Sawmills, planing mills, and millwork"', add
label define ind1950lbl 308 `"Misc wood products"', add
label define ind1950lbl 309 `"Furniture and fixtures"', add
label define ind1950lbl 316 `"Glass and glass products"', add
label define ind1950lbl 317 `"Cement, concrete, gypsum and plaster products"', add
label define ind1950lbl 318 `"Structural clay products"', add
label define ind1950lbl 319 `"Pottery and related products"', add
label define ind1950lbl 326 `"Miscellaneous nonmetallic mineral and stone products"', add
label define ind1950lbl 336 `"Blast furnaces, steel works, and rolling mills"', add
label define ind1950lbl 337 `"Other primary iron and steel industries"', add
label define ind1950lbl 338 `"Primary nonferrous industries"', add
label define ind1950lbl 346 `"Fabricated steel products"', add
label define ind1950lbl 347 `"Fabricated nonferrous metal products"', add
label define ind1950lbl 348 `"Not specified metal industries"', add
label define ind1950lbl 356 `"Agricultural machinery and tractors"', add
label define ind1950lbl 357 `"Office and store machines and devices"', add
label define ind1950lbl 358 `"Miscellaneous machinery"', add
label define ind1950lbl 367 `"Electrical machinery, equipment, and supplies"', add
label define ind1950lbl 376 `"Motor vehicles and motor vehicle equipment"', add
label define ind1950lbl 377 `"Aircraft and parts"', add
label define ind1950lbl 378 `"Ship and boat building and repairing"', add
label define ind1950lbl 379 `"Railroad and miscellaneous transportation equipment"', add
label define ind1950lbl 386 `"Professional equipment and supplies"', add
label define ind1950lbl 387 `"Photographic equipment and supplies"', add
label define ind1950lbl 388 `"Watches, clocks, and clockwork-operated devices"', add
label define ind1950lbl 399 `"Miscellaneous manufacturing industries"', add
label define ind1950lbl 406 `"Meat products"', add
label define ind1950lbl 407 `"Dairy products"', add
label define ind1950lbl 408 `"Canning and preserving fruits, vegetables, and seafoods"', add
label define ind1950lbl 409 `"Grain-mill products"', add
label define ind1950lbl 416 `"Bakery products"', add
label define ind1950lbl 417 `"Confectionery and related products"', add
label define ind1950lbl 418 `"Beverage industries"', add
label define ind1950lbl 419 `"Miscellaneous food preparations and kindred products"', add
label define ind1950lbl 426 `"Not specified food industries"', add
label define ind1950lbl 429 `"Tobacco manufactures"', add
label define ind1950lbl 436 `"Knitting mills"', add
label define ind1950lbl 437 `"Dyeing and finishing textiles, except knit goods"', add
label define ind1950lbl 438 `"Carpets, rugs, and other floor coverings"', add
label define ind1950lbl 439 `"Yarn, thread, and fabric mills"', add
label define ind1950lbl 446 `"Miscellaneous textile mill products"', add
label define ind1950lbl 448 `"Apparel and accessories"', add
label define ind1950lbl 449 `"Miscellaneous fabricated textile products"', add
label define ind1950lbl 456 `"Pulp, paper, and paperboard mills"', add
label define ind1950lbl 457 `"Paperboard containers and boxes"', add
label define ind1950lbl 458 `"Miscellaneous paper and pulp products"', add
label define ind1950lbl 459 `"Printing, publishing, and allied industries"', add
label define ind1950lbl 466 `"Synthetic fibers"', add
label define ind1950lbl 467 `"Drugs and medicines"', add
label define ind1950lbl 468 `"Paints, varnishes, and related products"', add
label define ind1950lbl 469 `"Miscellaneous chemicals and allied products"', add
label define ind1950lbl 476 `"Petroleum refining"', add
label define ind1950lbl 477 `"Miscellaneous petroleum and coal products"', add
label define ind1950lbl 478 `"Rubber products"', add
label define ind1950lbl 487 `"Leather: tanned, curried, and finished"', add
label define ind1950lbl 488 `"Footwear, except rubber"', add
label define ind1950lbl 489 `"Leather products, except footwear"', add
label define ind1950lbl 499 `"Not specified manufacturing industries"', add
label define ind1950lbl 506 `"Railroads and railway express service"', add
label define ind1950lbl 516 `"Street railways and bus lines"', add
label define ind1950lbl 526 `"Trucking service"', add
label define ind1950lbl 527 `"Warehousing and storage"', add
label define ind1950lbl 536 `"Taxicab service"', add
label define ind1950lbl 546 `"Water transportation"', add
label define ind1950lbl 556 `"Air transportation"', add
label define ind1950lbl 567 `"Petroleum and gasoline pipe lines"', add
label define ind1950lbl 568 `"Services incidental to transportation"', add
label define ind1950lbl 578 `"Telephone"', add
label define ind1950lbl 579 `"Telegraph"', add
label define ind1950lbl 586 `"Electric light and power"', add
label define ind1950lbl 587 `"Gas and steam supply systems"', add
label define ind1950lbl 588 `"Electric-gas utilities"', add
label define ind1950lbl 596 `"Water supply"', add
label define ind1950lbl 597 `"Sanitary services"', add
label define ind1950lbl 598 `"Other and not specified utilities"', add
label define ind1950lbl 606 `"Motor vehicles and equipment"', add
label define ind1950lbl 607 `"Drugs, chemicals, and allied products"', add
label define ind1950lbl 608 `"Dry goods apparel"', add
label define ind1950lbl 609 `"Food and related products"', add
label define ind1950lbl 616 `"Electrical goods, hardware, and plumbing equipment"', add
label define ind1950lbl 617 `"Machinery, equipment, and supplies"', add
label define ind1950lbl 618 `"Petroleum products"', add
label define ind1950lbl 619 `"Farm products--raw materials"', add
label define ind1950lbl 626 `"Miscellaneous wholesale trade"', add
label define ind1950lbl 627 `"Not specified wholesale trade"', add
label define ind1950lbl 636 `"Food stores, except dairy products"', add
label define ind1950lbl 637 `"Dairy products stores and milk retailing"', add
label define ind1950lbl 646 `"General merchandise stores"', add
label define ind1950lbl 647 `"Five and ten cent stores"', add
label define ind1950lbl 656 `"Apparel and accessories stores, except shoe"', add
label define ind1950lbl 657 `"Shoe stores"', add
label define ind1950lbl 658 `"Furniture and house furnishing stores"', add
label define ind1950lbl 659 `"Household appliance and radio stores"', add
label define ind1950lbl 667 `"Motor vehicles and accessories retailing"', add
label define ind1950lbl 668 `"Gasoline service stations"', add
label define ind1950lbl 669 `"Drug stores"', add
label define ind1950lbl 679 `"Eating and drinking places"', add
label define ind1950lbl 686 `"Hardware and farm implement stores"', add
label define ind1950lbl 687 `"Lumber and building material retailing"', add
label define ind1950lbl 688 `"Liquor stores"', add
label define ind1950lbl 689 `"Retail florists"', add
label define ind1950lbl 696 `"Jewelry stores"', add
label define ind1950lbl 697 `"Fuel and ice retailing"', add
label define ind1950lbl 698 `"Miscellaneous retail stores"', add
label define ind1950lbl 699 `"Not specified retail trade"', add
label define ind1950lbl 716 `"Banking and credit agencies"', add
label define ind1950lbl 726 `"Security and commodity brokerage and investment companies"', add
label define ind1950lbl 736 `"Insurance"', add
label define ind1950lbl 746 `"Real estate"', add
label define ind1950lbl 806 `"Advertising"', add
label define ind1950lbl 807 `"Accounting, auditing, and bookkeeping services"', add
label define ind1950lbl 808 `"Miscellaneous business services"', add
label define ind1950lbl 816 `"Auto repair services and garages"', add
label define ind1950lbl 817 `"Miscellaneous repair services"', add
label define ind1950lbl 826 `"Private households"', add
label define ind1950lbl 836 `"Hotels and lodging places"', add
label define ind1950lbl 846 `"Laundering, cleaning, and dyeing services"', add
label define ind1950lbl 847 `"Dressmaking shops"', add
label define ind1950lbl 848 `"Shoe repair shops"', add
label define ind1950lbl 849 `"Miscellaneous personal services"', add
label define ind1950lbl 856 `"Radio broadcasting and television"', add
label define ind1950lbl 857 `"Theaters and motion pictures"', add
label define ind1950lbl 858 `"Bowling alleys, and billiard and pool parlors"', add
label define ind1950lbl 859 `"Miscellaneous entertainment and recreation services"', add
label define ind1950lbl 868 `"Medical and other health services, except hospitals"', add
label define ind1950lbl 869 `"Hospitals"', add
label define ind1950lbl 879 `"Legal services"', add
label define ind1950lbl 888 `"Educational services"', add
label define ind1950lbl 896 `"Welfare and religious services"', add
label define ind1950lbl 897 `"Nonprofit membership organizations"', add
label define ind1950lbl 898 `"Engineering and architectural services"', add
label define ind1950lbl 899 `"Miscellaneous professional and related services"', add
label define ind1950lbl 906 `"Postal service"', add
label define ind1950lbl 916 `"Federal public administration"', add
label define ind1950lbl 926 `"State public administration"', add
label define ind1950lbl 936 `"Local public administration"', add
label define ind1950lbl 997 `"Nonclassifiable"', add
label define ind1950lbl 998 `"Industry not reported"', add
label values ind1950 ind1950lbl

label define classwkrlbl 00 `"NIU"'
label define classwkrlbl 10 `"Self-employed"', add
label define classwkrlbl 13 `"Self-employed, not incorporated"', add
label define classwkrlbl 14 `"Self-employed, incorporated"', add
label define classwkrlbl 20 `"Works for wages or salary"', add
label define classwkrlbl 22 `"Wage/salary, private"', add
label define classwkrlbl 24 `"Wage/salary, government"', add
label define classwkrlbl 25 `"Federal government employee"', add
label define classwkrlbl 26 `"Armed forces"', add
label define classwkrlbl 27 `"State government employee"', add
label define classwkrlbl 28 `"Local government employee"', add
label define classwkrlbl 29 `"Unpaid family worker"', add
label define classwkrlbl 99 `"Missing/Unknown"', add
label values classwkr classwkrlbl

label define occ50lylbl 000 `"Accountants and auditors"', add
label define occ50lylbl 001 `"Actors and actresses"', add
label define occ50lylbl 002 `"Airplane pilots and navigators"', add
label define occ50lylbl 003 `"Architects"', add
label define occ50lylbl 004 `"Artists and art teachers"', add
label define occ50lylbl 005 `"Athletes"', add
label define occ50lylbl 006 `"Authors"', add
label define occ50lylbl 007 `"Chemists"', add
label define occ50lylbl 008 `"Chiropractors"', add
label define occ50lylbl 009 `"Clergymen"', add
label define occ50lylbl 010 `"College presidents and deans"', add
label define occ50lylbl 012 `"Agricultural sciences"', add
label define occ50lylbl 013 `"Biological sciences"', add
label define occ50lylbl 014 `"Chemistry"', add
label define occ50lylbl 015 `"Economics"', add
label define occ50lylbl 016 `"Engineering"', add
label define occ50lylbl 017 `"Geology and geophysics"', add
label define occ50lylbl 018 `"Mathematics"', add
label define occ50lylbl 019 `"Medical sciences"', add
label define occ50lylbl 023 `"Physics"', add
label define occ50lylbl 024 `"Psychology"', add
label define occ50lylbl 025 `"Statistics"', add
label define occ50lylbl 026 `"Natural science (n.e.c.)"', add
label define occ50lylbl 027 `"Social sciences (n.e.c.)"', add
label define occ50lylbl 028 `"Nonscientific subjects"', add
label define occ50lylbl 029 `"Subject not specified"', add
label define occ50lylbl 031 `"Dancers and dancing teachers"', add
label define occ50lylbl 032 `"Dentists"', add
label define occ50lylbl 033 `"Designers"', add
label define occ50lylbl 034 `"Dieticians and nutritionists"', add
label define occ50lylbl 035 `"Draftsmen"', add
label define occ50lylbl 036 `"Editors and reporters"', add
label define occ50lylbl 041 `"Engineers, aeronautical"', add
label define occ50lylbl 042 `"Engineers, chemical"', add
label define occ50lylbl 043 `"Engineers, civil"', add
label define occ50lylbl 044 `"Engineers, electrical"', add
label define occ50lylbl 045 `"Engineers, industrial"', add
label define occ50lylbl 046 `"Engineers, mechanical"', add
label define occ50lylbl 047 `"Engineers, metallurgical, metallurgists"', add
label define occ50lylbl 048 `"Engineers, mining"', add
label define occ50lylbl 049 `"Engineers (n.e.c.)"', add
label define occ50lylbl 051 `"Entertainers (n.e.c.)"', add
label define occ50lylbl 052 `"Farm and home management advisors"', add
label define occ50lylbl 053 `"Foresters and conservationists"', add
label define occ50lylbl 054 `"Funeral directors and embalmers"', add
label define occ50lylbl 055 `"Lawyers and judges"', add
label define occ50lylbl 056 `"Librarians"', add
label define occ50lylbl 057 `"Musicians and music teachers"', add
label define occ50lylbl 058 `"Nurses, professional"', add
label define occ50lylbl 059 `"Nurses, student professional"', add
label define occ50lylbl 061 `"Agricultural scientists"', add
label define occ50lylbl 062 `"Biological scientists"', add
label define occ50lylbl 063 `"Geologists and geophysicists"', add
label define occ50lylbl 067 `"Mathematicians"', add
label define occ50lylbl 068 `"Physicists"', add
label define occ50lylbl 069 `"Miscellaneous natural scientists"', add
label define occ50lylbl 070 `"Optometrists"', add
label define occ50lylbl 071 `"Osteopaths"', add
label define occ50lylbl 072 `"Personnel and labor relations workers"', add
label define occ50lylbl 073 `"Pharmacists"', add
label define occ50lylbl 074 `"Photographers"', add
label define occ50lylbl 075 `"Physicians and surgeons"', add
label define occ50lylbl 076 `"Radio operators"', add
label define occ50lylbl 077 `"Recreation and group workers"', add
label define occ50lylbl 078 `"Religious workers"', add
label define occ50lylbl 079 `"Social and welfare workers, except group"', add
label define occ50lylbl 081 `"Economists"', add
label define occ50lylbl 082 `"Psychologists"', add
label define occ50lylbl 083 `"Statisticians and actuaries"', add
label define occ50lylbl 084 `"Miscellaneous social scientists"', add
label define occ50lylbl 091 `"Sports instructors and officials"', add
label define occ50lylbl 092 `"Surveyors"', add
label define occ50lylbl 093 `"Teachers (n.e.c.)"', add
label define occ50lylbl 094 `"Technicians, medical and dental"', add
label define occ50lylbl 095 `"Technicians, testing"', add
label define occ50lylbl 096 `"Technicians (n.e.c.)"', add
label define occ50lylbl 097 `"Therapists and healers (n.e.c.)"', add
label define occ50lylbl 098 `"Veterinarians"', add
label define occ50lylbl 099 `"Professional, technical and kindred workers (n.e.c.)"', add
label define occ50lylbl 100 `"Farmers (owners and tenants)"', add
label define occ50lylbl 123 `"Farm managers"', add
label define occ50lylbl 200 `"Buyers and department heads, store"', add
label define occ50lylbl 201 `"Buyers and shippers, farm products"', add
label define occ50lylbl 203 `"Conductors, railroad"', add
label define occ50lylbl 204 `"Credit men"', add
label define occ50lylbl 205 `"Floormen and floor managers, store"', add
label define occ50lylbl 210 `"Inspectors, public administration"', add
label define occ50lylbl 230 `"Managers and superintendents, building"', add
label define occ50lylbl 240 `"Officers, pilots, pursers and engineers, ship"', add
label define occ50lylbl 250 `"Officials and administrators (n.e.c.), public administration"', add
label define occ50lylbl 260 `"Officials, lodge, society, union, etc."', add
label define occ50lylbl 270 `"Postmasters"', add
label define occ50lylbl 280 `"Purchasing agents and buyers (n.e.c.)"', add
label define occ50lylbl 290 `"Managers, officials, and proprietors (n.e.c.)"', add
label define occ50lylbl 300 `"Agents (n.e.c.)"', add
label define occ50lylbl 301 `"Attendants and assistants, library"', add
label define occ50lylbl 302 `"Attendants, physicians and dentists office"', add
label define occ50lylbl 304 `"Baggagemen, transportation"', add
label define occ50lylbl 305 `"Bank tellers"', add
label define occ50lylbl 310 `"Bookkeepers"', add
label define occ50lylbl 320 `"Cashiers"', add
label define occ50lylbl 321 `"Collectors, bill and account"', add
label define occ50lylbl 322 `"Dispatchers and starters, vehicle"', add
label define occ50lylbl 325 `"Express messengers and railway mail clerks"', add
label define occ50lylbl 335 `"Mail carriers"', add
label define occ50lylbl 340 `"Messengers and office boys"', add
label define occ50lylbl 341 `"Office machine operators"', add
label define occ50lylbl 342 `"Shipping and receiving clerks"', add
label define occ50lylbl 350 `"Stenographers, typists, and secretaries"', add
label define occ50lylbl 360 `"Telegraph messengers"', add
label define occ50lylbl 365 `"Telegraph operators"', add
label define occ50lylbl 370 `"Telephone operators"', add
label define occ50lylbl 380 `"Ticket, station, and express agents"', add
label define occ50lylbl 390 `"Clerical and kindred workers (n.e.c.)"', add
label define occ50lylbl 400 `"Advertising agents and salesmen"', add
label define occ50lylbl 410 `"Auctioneers"', add
label define occ50lylbl 420 `"Demonstrators"', add
label define occ50lylbl 430 `"Hucksters and peddlers"', add
label define occ50lylbl 450 `"Insurance agents and brokers"', add
label define occ50lylbl 460 `"Newsboys"', add
label define occ50lylbl 470 `"Real estate agents and brokers"', add
label define occ50lylbl 480 `"Stock and bond salesmen"', add
label define occ50lylbl 490 `"Salesmen and sales clerks (n.e.c.)"', add
label define occ50lylbl 500 `"Bakers"', add
label define occ50lylbl 501 `"Blacksmiths"', add
label define occ50lylbl 502 `"Bookbinders"', add
label define occ50lylbl 503 `"Boilermakers"', add
label define occ50lylbl 504 `"Brickmasons, stonemasons, and tile setters"', add
label define occ50lylbl 505 `"Cabinetmakers"', add
label define occ50lylbl 510 `"Carpenters"', add
label define occ50lylbl 511 `"Cement and concrete finishers"', add
label define occ50lylbl 512 `"Compositors and typesetters"', add
label define occ50lylbl 513 `"Cranemen, derrickmen, and hoistmen"', add
label define occ50lylbl 514 `"Decorators and window dressers"', add
label define occ50lylbl 515 `"Electricians"', add
label define occ50lylbl 520 `"Electrotypers and stereotypers"', add
label define occ50lylbl 521 `"Engravers, except photoengravers"', add
label define occ50lylbl 522 `"Excavating, grading, and road machinery operators"', add
label define occ50lylbl 523 `"Foremen (n.e.c.)"', add
label define occ50lylbl 524 `"Forgemen and hammermen"', add
label define occ50lylbl 525 `"Furriers"', add
label define occ50lylbl 530 `"Glaziers"', add
label define occ50lylbl 531 `"Heat treaters, annealers, temperers"', add
label define occ50lylbl 532 `"Inspectors, scalers, and graders, log and lumber"', add
label define occ50lylbl 533 `"Inspectors (n.e.c.)"', add
label define occ50lylbl 534 `"Jewelers, watchmakers, goldsmiths, and silversmiths"', add
label define occ50lylbl 535 `"Job setters, metal"', add
label define occ50lylbl 540 `"Linemen and servicemen, telegraph, telephone, and power"', add
label define occ50lylbl 541 `"Locomotive engineers"', add
label define occ50lylbl 542 `"Locomotive firemen"', add
label define occ50lylbl 543 `"Loom fixers"', add
label define occ50lylbl 544 `"Machinists"', add
label define occ50lylbl 545 `"Mechanics and repairmen, airplane"', add
label define occ50lylbl 550 `"Mechanics and repairmen, automobile"', add
label define occ50lylbl 551 `"Mechanics and repairmen, office machine"', add
label define occ50lylbl 552 `"Mechanics and repairmen, radio and television"', add
label define occ50lylbl 553 `"Mechanics and repairmen, railroad and car shop"', add
label define occ50lylbl 554 `"Mechanics and repairmen (n.e.c.)"', add
label define occ50lylbl 555 `"Millers, grain, flour, feed, etc."', add
label define occ50lylbl 560 `"Millwrights"', add
label define occ50lylbl 561 `"Molders, metal"', add
label define occ50lylbl 562 `"Motion picture projectionists"', add
label define occ50lylbl 563 `"Opticians and lens grinders and polishers"', add
label define occ50lylbl 564 `"Painters, construction and maintenance"', add
label define occ50lylbl 565 `"Paperhangers"', add
label define occ50lylbl 570 `"Pattern and model makers, except paper"', add
label define occ50lylbl 571 `"Photoengravers and lithographers"', add
label define occ50lylbl 572 `"Piano and organ tuners and repairmen"', add
label define occ50lylbl 573 `"Plasterers"', add
label define occ50lylbl 574 `"Plumbers and pipe fitters"', add
label define occ50lylbl 575 `"Pressmen and plate printers, printing"', add
label define occ50lylbl 580 `"Rollers and roll hands, metal"', add
label define occ50lylbl 581 `"Roofers and slaters"', add
label define occ50lylbl 582 `"Shoemakers and repairers, except factory"', add
label define occ50lylbl 583 `"Stationary engineers"', add
label define occ50lylbl 584 `"Stone cutters and stone carvers"', add
label define occ50lylbl 585 `"Structural metal workers"', add
label define occ50lylbl 590 `"Tailors and tailoresses"', add
label define occ50lylbl 591 `"Tinsmiths, coppersmiths, and sheet metal workers"', add
label define occ50lylbl 592 `"Tool makers, and die makers and setters"', add
label define occ50lylbl 593 `"Upholsterers"', add
label define occ50lylbl 594 `"Craftsmen and kindred workers (n.e.c.)"', add
label define occ50lylbl 595 `"Members of the armed services"', add
label define occ50lylbl 600 `"Apprentice auto mechanics"', add
label define occ50lylbl 601 `"Apprentice bricklayers and masons"', add
label define occ50lylbl 602 `"Apprentice carpenters"', add
label define occ50lylbl 603 `"Apprentice electricians"', add
label define occ50lylbl 604 `"Apprentice machinists and toolmakers"', add
label define occ50lylbl 605 `"Apprentice mechanics, except auto"', add
label define occ50lylbl 610 `"Apprentice plumbers and pipe fitters"', add
label define occ50lylbl 611 `"Apprentices, building trades (n.e.c.)"', add
label define occ50lylbl 612 `"Apprentices, metalworking trades (n.e.c.)"', add
label define occ50lylbl 613 `"Apprentices, printing trades"', add
label define occ50lylbl 614 `"Apprentices, other specified trades"', add
label define occ50lylbl 615 `"Apprentices, trade not specified"', add
label define occ50lylbl 620 `"Asbestos and insulation workers"', add
label define occ50lylbl 621 `"Attendants, auto service and parking"', add
label define occ50lylbl 622 `"Blasters and powdermen"', add
label define occ50lylbl 623 `"Boatmen, canalmen, and lock keepers"', add
label define occ50lylbl 624 `"Brakemen, railroad"', add
label define occ50lylbl 625 `"Bus drivers"', add
label define occ50lylbl 630 `"Chainmen, rodmen, and axmen, surveying"', add
label define occ50lylbl 631 `"Conductors, bus and street railway"', add
label define occ50lylbl 632 `"Deliverymen and routemen"', add
label define occ50lylbl 633 `"Dressmakers and seamstresses, except factory"', add
label define occ50lylbl 634 `"Dyers"', add
label define occ50lylbl 635 `"Filers, grinders, and polishers, metal"', add
label define occ50lylbl 640 `"Fruit, nut, veg graders and packers, except factory"', add
label define occ50lylbl 641 `"Furnacemen, smeltermen and pourers"', add
label define occ50lylbl 642 `"Heaters, metal"', add
label define occ50lylbl 643 `"Laundry and dry cleaning operatives"', add
label define occ50lylbl 644 `"Meat cutters, except slaughter and packing house"', add
label define occ50lylbl 645 `"Milliners"', add
label define occ50lylbl 650 `"Mine operatives and laborers"', add
label define occ50lylbl 660 `"Motormen, mine, factory, logging camp, etc."', add
label define occ50lylbl 661 `"Motormen, street, subway, and elevated railway"', add
label define occ50lylbl 662 `"Oilers and greaser, except auto"', add
label define occ50lylbl 670 `"Painters, except construction or maintenance"', add
label define occ50lylbl 671 `"Photographic process workers"', add
label define occ50lylbl 672 `"Power station operators"', add
label define occ50lylbl 673 `"Sailors and deck hands"', add
label define occ50lylbl 674 `"Sawyers"', add
label define occ50lylbl 675 `"Spinners, textile"', add
label define occ50lylbl 680 `"Stationary firemen"', add
label define occ50lylbl 681 `"Switchmen, railroad"', add
label define occ50lylbl 682 `"Taxicab drivers and chauffers"', add
label define occ50lylbl 683 `"Truck and tractor drivers"', add
label define occ50lylbl 684 `"Weavers, textile"', add
label define occ50lylbl 685 `"Welders and flame cutters"', add
label define occ50lylbl 690 `"Operative and kindred workers (n.e.c.)"', add
label define occ50lylbl 700 `"Housekeepers, private household"', add
label define occ50lylbl 710 `"Laundressses, private household"', add
label define occ50lylbl 720 `"Private household workers (n.e.c.)"', add
label define occ50lylbl 730 `"Attendants, hospital and other institution"', add
label define occ50lylbl 731 `"Attendants, professional and personal service (n.e.c.)"', add
label define occ50lylbl 732 `"Attendants, recreation and amusement"', add
label define occ50lylbl 740 `"Barbers, beauticians, and manicurists"', add
label define occ50lylbl 750 `"Bartenders"', add
label define occ50lylbl 751 `"Bootblacks"', add
label define occ50lylbl 752 `"Boarding and lodging house keepers"', add
label define occ50lylbl 753 `"Charwomen and cleaners"', add
label define occ50lylbl 754 `"Cooks, except private household"', add
label define occ50lylbl 760 `"Counter and fountain workers"', add
label define occ50lylbl 761 `"Elevator operators"', add
label define occ50lylbl 762 `"Firemen, fire protection"', add
label define occ50lylbl 763 `"Guards, watchmen, and doorkeepers"', add
label define occ50lylbl 764 `"Housekeepers and stewards, except private household"', add
label define occ50lylbl 770 `"Janitors and sextons"', add
label define occ50lylbl 771 `"Marshals and constables"', add
label define occ50lylbl 772 `"Midwives"', add
label define occ50lylbl 773 `"Policemen and detectives"', add
label define occ50lylbl 780 `"Porters"', add
label define occ50lylbl 781 `"Practical nurses"', add
label define occ50lylbl 782 `"Sheriffs and bailiffs"', add
label define occ50lylbl 783 `"Ushers, recreation and amusement"', add
label define occ50lylbl 784 `"Waiters and waitresses"', add
label define occ50lylbl 785 `"Watchmen (crossing) and bridge tenders"', add
label define occ50lylbl 790 `"Service workers, except private household (n.e.c.)"', add
label define occ50lylbl 810 `"Farm foremen"', add
label define occ50lylbl 820 `"Farm laborers, wage workers"', add
label define occ50lylbl 830 `"Farm laborers, unpaid family workers"', add
label define occ50lylbl 840 `"Farm service laborers, self-employed"', add
label define occ50lylbl 910 `"Fishermen and oystermen"', add
label define occ50lylbl 920 `"Garage laborers and car washers and greasers"', add
label define occ50lylbl 930 `"Gardeners, except farm, and groundskeepers"', add
label define occ50lylbl 940 `"Longshoremen and stevedores"', add
label define occ50lylbl 950 `"Lumbermen, raftsmen, and woodchoppers"', add
label define occ50lylbl 960 `"Teamsters"', add
label define occ50lylbl 970 `"Laborers (n.e.c.)"', add
label define occ50lylbl 997 `"Unknown"', add
label define occ50lylbl 999 `"Unemployed- last worked over x years ago"', add
label values occ50ly occ50lylbl

label define ind50lylbl 000 `"NIU"'
label define ind50lylbl 105 `"Agriculture"', add
label define ind50lylbl 116 `"Forestry"', add
label define ind50lylbl 126 `"Fisheries"', add
label define ind50lylbl 206 `"Metal mining"', add
label define ind50lylbl 216 `"Coal mining"', add
label define ind50lylbl 226 `"Crude petroleum and natural gas extraction"', add
label define ind50lylbl 236 `"Nonmetallic mining and quarrying, except fuel"', add
label define ind50lylbl 239 `"Mining not specified"', add
label define ind50lylbl 246 `"Construction"', add
label define ind50lylbl 306 `"Logging"', add
label define ind50lylbl 307 `"Sawmills, planing mills, and millwork"', add
label define ind50lylbl 308 `"Misc wood products"', add
label define ind50lylbl 309 `"Furniture and fixtures"', add
label define ind50lylbl 316 `"Glass and glass products"', add
label define ind50lylbl 317 `"Cement, concrete, gypsum and plaster products"', add
label define ind50lylbl 318 `"Structural clay products"', add
label define ind50lylbl 319 `"Pottery and related products"', add
label define ind50lylbl 326 `"Miscellaneous nonmetallic mineral and stone products"', add
label define ind50lylbl 336 `"Blast furnaces, steel works, and rolling mills"', add
label define ind50lylbl 337 `"Other primary iron and steel industries"', add
label define ind50lylbl 338 `"Primary nonferrous industries"', add
label define ind50lylbl 346 `"Fabricated steel products"', add
label define ind50lylbl 347 `"Fabricated nonferrous metal products"', add
label define ind50lylbl 348 `"Not specified metal industries"', add
label define ind50lylbl 356 `"Agricultural machinery and tractors"', add
label define ind50lylbl 357 `"Office and store machines and devices"', add
label define ind50lylbl 358 `"Miscellaneous machinery"', add
label define ind50lylbl 367 `"Electrical machinery, equipment, and supplies"', add
label define ind50lylbl 376 `"Motor vehicles and motor vehicle equipment"', add
label define ind50lylbl 377 `"Aircraft and parts"', add
label define ind50lylbl 378 `"Ship and boat building and repairing"', add
label define ind50lylbl 379 `"Railroad and miscellaneous transportation equipment"', add
label define ind50lylbl 386 `"Professional equipment and supplies"', add
label define ind50lylbl 387 `"Photographic equipment and supplies"', add
label define ind50lylbl 388 `"Watches, clocks, and clockwork-operated devices"', add
label define ind50lylbl 399 `"Miscellaneous manufacturing industries"', add
label define ind50lylbl 406 `"Meat products"', add
label define ind50lylbl 407 `"Dairy products"', add
label define ind50lylbl 408 `"Canning and preserving fruits, vegetables, and seafoods"', add
label define ind50lylbl 409 `"Grain-mill products"', add
label define ind50lylbl 416 `"Bakery products"', add
label define ind50lylbl 417 `"Confectionery and related products"', add
label define ind50lylbl 418 `"Beverage industries"', add
label define ind50lylbl 419 `"Miscellaneous food preparations and kindred products"', add
label define ind50lylbl 426 `"Not specified food industries"', add
label define ind50lylbl 429 `"Tobacco manufactures"', add
label define ind50lylbl 436 `"Knitting mills"', add
label define ind50lylbl 437 `"Dyeing and finishing textiles, except knit goods"', add
label define ind50lylbl 438 `"Carpets, rugs, and other floor coverings"', add
label define ind50lylbl 439 `"Yarn, thread, and fabric mills"', add
label define ind50lylbl 446 `"Miscellaneous textile mill products"', add
label define ind50lylbl 448 `"Apparel and accessories"', add
label define ind50lylbl 449 `"Miscellaneous fabricated textile products"', add
label define ind50lylbl 456 `"Pulp, paper, and paperboard mills"', add
label define ind50lylbl 457 `"Paperboard containers and boxes"', add
label define ind50lylbl 458 `"Miscellaneous paper and pulp products"', add
label define ind50lylbl 459 `"Printing, publishing, and allied industries"', add
label define ind50lylbl 466 `"Synthetic fibers"', add
label define ind50lylbl 467 `"Drugs and medicines"', add
label define ind50lylbl 468 `"Paints, varnishes, and related products"', add
label define ind50lylbl 469 `"Miscellaneous chemicals and allied products"', add
label define ind50lylbl 476 `"Petroleum refining"', add
label define ind50lylbl 477 `"Miscellaneous petroleum and coal products"', add
label define ind50lylbl 478 `"Rubber products"', add
label define ind50lylbl 487 `"Leather: tanned, curried, and finished"', add
label define ind50lylbl 488 `"Footwear, except rubber"', add
label define ind50lylbl 489 `"Leather products, except footwear"', add
label define ind50lylbl 499 `"Not specified manufacturing industries"', add
label define ind50lylbl 506 `"Railroads and railway express service"', add
label define ind50lylbl 516 `"Street railways and bus lines"', add
label define ind50lylbl 526 `"Trucking service"', add
label define ind50lylbl 527 `"Warehousing and storage"', add
label define ind50lylbl 536 `"Taxicab service"', add
label define ind50lylbl 546 `"Water transportation"', add
label define ind50lylbl 556 `"Air transportation"', add
label define ind50lylbl 567 `"Petroleum and gasoline pipe lines"', add
label define ind50lylbl 568 `"Services incidental to transportation"', add
label define ind50lylbl 578 `"Telephone"', add
label define ind50lylbl 579 `"Telegraph"', add
label define ind50lylbl 586 `"Electric light and power"', add
label define ind50lylbl 587 `"Gas and steam supply systems"', add
label define ind50lylbl 588 `"Electric-gas utilities"', add
label define ind50lylbl 596 `"Water supply"', add
label define ind50lylbl 597 `"Sanitary services"', add
label define ind50lylbl 598 `"Other and not specified utilities"', add
label define ind50lylbl 606 `"Motor vehicles and equipment"', add
label define ind50lylbl 607 `"Drugs, chemicals, and allied products"', add
label define ind50lylbl 608 `"Dry goods apparel"', add
label define ind50lylbl 609 `"Food and related products"', add
label define ind50lylbl 616 `"Electrical goods, hardware, and plumbing equipment"', add
label define ind50lylbl 617 `"Machinery, equipment, and supplies"', add
label define ind50lylbl 618 `"Petroleum products"', add
label define ind50lylbl 619 `"Farm products--raw materials"', add
label define ind50lylbl 626 `"Miscellaneous wholesale trade"', add
label define ind50lylbl 627 `"Not specified wholesale trade"', add
label define ind50lylbl 636 `"Food stores, except dairy products"', add
label define ind50lylbl 637 `"Dairy products stores and milk retailing"', add
label define ind50lylbl 646 `"General merchandise stores"', add
label define ind50lylbl 647 `"Five and ten cent stores"', add
label define ind50lylbl 656 `"Apparel and accessories stores, except shoe"', add
label define ind50lylbl 657 `"Shoe stores"', add
label define ind50lylbl 658 `"Furniture and house furnishing stores"', add
label define ind50lylbl 659 `"Household appliance and radio stores"', add
label define ind50lylbl 667 `"Motor vehicles and accessories retailing"', add
label define ind50lylbl 668 `"Gasoline service stations"', add
label define ind50lylbl 669 `"Drug stores"', add
label define ind50lylbl 679 `"Eating and drinking places"', add
label define ind50lylbl 686 `"Hardware and farm implement stores"', add
label define ind50lylbl 687 `"Lumber and building material retailing"', add
label define ind50lylbl 688 `"Liquor stores"', add
label define ind50lylbl 689 `"Retail florists"', add
label define ind50lylbl 696 `"Jewelry stores"', add
label define ind50lylbl 697 `"Fuel and ice retailing"', add
label define ind50lylbl 698 `"Miscellaneous retail stores"', add
label define ind50lylbl 699 `"Not specified retail trade"', add
label define ind50lylbl 716 `"Banking and credit agencies"', add
label define ind50lylbl 726 `"Security and commodity brokerage and investment companies"', add
label define ind50lylbl 736 `"Insurance"', add
label define ind50lylbl 746 `"Real estate"', add
label define ind50lylbl 806 `"Advertising"', add
label define ind50lylbl 807 `"Accounting, auditing, and bookkeeping services"', add
label define ind50lylbl 808 `"Miscellaneous business services"', add
label define ind50lylbl 816 `"Auto repair services and garages"', add
label define ind50lylbl 817 `"Miscellaneous repair services"', add
label define ind50lylbl 826 `"Private households"', add
label define ind50lylbl 836 `"Hotels and lodging places"', add
label define ind50lylbl 846 `"Laundering, cleaning, and dyeing services"', add
label define ind50lylbl 847 `"Dressmaking shops"', add
label define ind50lylbl 848 `"Shoe repair shops"', add
label define ind50lylbl 849 `"Miscellaneous personal services"', add
label define ind50lylbl 856 `"Radio broadcasting and television"', add
label define ind50lylbl 857 `"Theaters and motion pictures"', add
label define ind50lylbl 858 `"Bowling alleys, and billiard and pool parlors"', add
label define ind50lylbl 859 `"Miscellaneous entertainment and recreation services"', add
label define ind50lylbl 868 `"Medical and other health services, except hospitals"', add
label define ind50lylbl 869 `"Hospitals"', add
label define ind50lylbl 879 `"Legal services"', add
label define ind50lylbl 888 `"Educational services"', add
label define ind50lylbl 896 `"Welfare and religious services"', add
label define ind50lylbl 897 `"Nonprofit membership organizations"', add
label define ind50lylbl 898 `"Engineering and architectural services"', add
label define ind50lylbl 899 `"Miscellaneous professional and related services"', add
label define ind50lylbl 906 `"Postal service"', add
label define ind50lylbl 916 `"Federal public administration"', add
label define ind50lylbl 926 `"State public administration"', add
label define ind50lylbl 936 `"Local public administration"', add
label define ind50lylbl 997 `"Nonclassifiable"', add
label define ind50lylbl 998 `"Industry not reported"', add
label values ind50ly ind50lylbl

label define classwlylbl 00 `"NIU"'
label define classwlylbl 10 `"Self-employed"', add
label define classwlylbl 13 `"Self-employed, not incorporated"', add
label define classwlylbl 14 `"Self-employed, incorporated"', add
label define classwlylbl 20 `"Works for wages or salary"', add
label define classwlylbl 22 `"Wage/salary, private"', add
label define classwlylbl 24 `"Wage/salary, government"', add
label define classwlylbl 25 `"Federal government employee"', add
label define classwlylbl 27 `"State government employee"', add
label define classwlylbl 28 `"Local government employee"', add
label define classwlylbl 29 `"Unpaid family worker"', add
label define classwlylbl 99 `"Missing/Unknown"', add
label values classwly classwlylbl

label define wkswork2lbl 0 `"NIU"'
label define wkswork2lbl 1 `"1-13 weeks"', add
label define wkswork2lbl 2 `"14-26 weeks"', add
label define wkswork2lbl 3 `"27-39 weeks"', add
label define wkswork2lbl 4 `"40-47 weeks"', add
label define wkswork2lbl 5 `"48-49 weeks"', add
label define wkswork2lbl 6 `"50-52 weeks"', add
label define wkswork2lbl 9 `"Missing data"', add
label values wkswork2 wkswork2lbl

label define fullpartlbl 0 `"NIU"'
label define fullpartlbl 1 `"Full-time"', add
label define fullpartlbl 2 `"Part-time"', add
label define fullpartlbl 9 `"Unknown"', add
label values fullpart fullpartlbl

label define whynwlylbl 0 `"NIU"'
label define whynwlylbl 1 `"Could not find work"', add
label define whynwlylbl 2 `"Ill or disabled"', add
label define whynwlylbl 3 `"Taking care of home/family"', add
label define whynwlylbl 4 `"Going to school"', add
label define whynwlylbl 5 `"Retired"', add
label define whynwlylbl 6 `"In Armed Forces"', add
label define whynwlylbl 7 `"Other"', add
label define whynwlylbl 9 `"Unknown/missing"', add
label values whynwly whynwlylbl

label define filestatlbl 0 `"No data"'
label define filestatlbl 1 `"Joint, both less than 65"', add
label define filestatlbl 2 `"Joint, one less than 65, one 65+"', add
label define filestatlbl 3 `"Joint, both 65+"', add
label define filestatlbl 4 `"Head of household"', add
label define filestatlbl 5 `"Single"', add
label define filestatlbl 6 `"Nonfiler"', add
label values filestat filestatlbl

label define migsta1lbl 00 `"NIU"'
label define migsta1lbl 01 `"Alabama"', add
label define migsta1lbl 02 `"Alaska"', add
label define migsta1lbl 04 `"Arizona"', add
label define migsta1lbl 05 `"Arkansas"', add
label define migsta1lbl 06 `"California"', add
label define migsta1lbl 08 `"Colorado"', add
label define migsta1lbl 09 `"Connecticut"', add
label define migsta1lbl 10 `"Delaware"', add
label define migsta1lbl 11 `"District of Columbia"', add
label define migsta1lbl 12 `"Florida"', add
label define migsta1lbl 13 `"Georgia"', add
label define migsta1lbl 15 `"Hawaii"', add
label define migsta1lbl 16 `"Idaho"', add
label define migsta1lbl 17 `"Illinois"', add
label define migsta1lbl 18 `"Indiana"', add
label define migsta1lbl 19 `"Iowa"', add
label define migsta1lbl 20 `"Kansas"', add
label define migsta1lbl 21 `"Kentucky"', add
label define migsta1lbl 22 `"Louisiana"', add
label define migsta1lbl 23 `"Maine"', add
label define migsta1lbl 24 `"Maryland"', add
label define migsta1lbl 25 `"Massachusetts"', add
label define migsta1lbl 26 `"Michigan"', add
label define migsta1lbl 27 `"Minnesota"', add
label define migsta1lbl 28 `"Mississippi"', add
label define migsta1lbl 29 `"Missouri"', add
label define migsta1lbl 30 `"Montana"', add
label define migsta1lbl 31 `"Nebraska"', add
label define migsta1lbl 32 `"Nevada"', add
label define migsta1lbl 33 `"New Hampshire"', add
label define migsta1lbl 34 `"New Jersey"', add
label define migsta1lbl 35 `"New Mexico"', add
label define migsta1lbl 36 `"New York"', add
label define migsta1lbl 37 `"North Carolina"', add
label define migsta1lbl 38 `"North Dakota"', add
label define migsta1lbl 39 `"Ohio"', add
label define migsta1lbl 40 `"Oklahoma"', add
label define migsta1lbl 41 `"Oregon"', add
label define migsta1lbl 42 `"Pennsylvania"', add
label define migsta1lbl 44 `"Rhode Island"', add
label define migsta1lbl 45 `"South Carolina"', add
label define migsta1lbl 46 `"South Dakota"', add
label define migsta1lbl 47 `"Tennessee"', add
label define migsta1lbl 48 `"Texas"', add
label define migsta1lbl 49 `"Utah"', add
label define migsta1lbl 50 `"Vermont"', add
label define migsta1lbl 51 `"Virginia"', add
label define migsta1lbl 53 `"Washington"', add
label define migsta1lbl 54 `"West Virginia"', add
label define migsta1lbl 55 `"Wisconsin"', add
label define migsta1lbl 56 `"Wyoming"', add
label define migsta1lbl 91 `"Abroad"', add
label define migsta1lbl 99 `"Same house"', add
label values migsta1 migsta1lbl

label define whymovelbl 00 `"NIU"'
label define whymovelbl 01 `"Change in marital status"', add
label define whymovelbl 02 `"To establish own household"', add
label define whymovelbl 03 `"Other family reason"', add
label define whymovelbl 04 `"New job or job transfer"', add
label define whymovelbl 05 `"To look for work or lost job"', add
label define whymovelbl 06 `"For easier commute"', add
label define whymovelbl 07 `"Retired"', add
label define whymovelbl 08 `"Other job-related reason"', add
label define whymovelbl 09 `"Wanted to own home, not rent"', add
label define whymovelbl 10 `"Wanted new or better housing"', add
label define whymovelbl 11 `"Wanted better neighborhood"', add
label define whymovelbl 12 `"For cheaper housing"', add
label define whymovelbl 13 `"Other housing reason"', add
label define whymovelbl 14 `"Attend/leave college"', add
label define whymovelbl 15 `"Change of climate"', add
label define whymovelbl 16 `"Health reasons"', add
label define whymovelbl 17 `"Other reasons"', add
label define whymovelbl 18 `"Natural disaster"', add
label values whymove whymovelbl

label define migrate1lbl 0 `"NIU"'
label define migrate1lbl 1 `"Same house"', add
label define migrate1lbl 2 `"Different house, place not reported"', add
label define migrate1lbl 3 `"Moved within county"', add
label define migrate1lbl 4 `"Moved within state, different county"', add
label define migrate1lbl 5 `"Moved between states"', add
label define migrate1lbl 6 `"Abroad"', add
label define migrate1lbl 9 `"Unknown"', add
label values migrate1 migrate1lbl

label define migrate5_lbl 00 `"NIU"'
label define migrate5_lbl 10 `"Same house"', add
label define migrate5_lbl 20 `"Place not reported"', add
label define migrate5_lbl 30 `"Moved within county"', add
label define migrate5_lbl 40 `"Moved within state, between counties"', add
label define migrate5_lbl 41 `"Different county, same state, same SMSA"', add
label define migrate5_lbl 42 `"Different county, same state, different SMSA"', add
label define migrate5_lbl 50 `"Moved between states"', add
label define migrate5_lbl 51 `"Moved between contiguous states"', add
label define migrate5_lbl 52 `"Moved between non-contiguous states"', add
label define migrate5_lbl 60 `"Abroad five years ago"', add
label values migrate5 migrate5_lbl

label define migrat75_lbl 00 `"NIU"'
label define migrat75_lbl 10 `"Same house"', add
label define migrat75_lbl 30 `"Moved within county"', add
label define migrat75_lbl 40 `"Moved within state, between counties"', add
label define migrat75_lbl 41 `"Different county, same state, same SMSA"', add
label define migrat75_lbl 42 `"Different county, same state, not in same SMSA"', add
label define migrat75_lbl 50 `"Moved between states"', add
label define migrat75_lbl 51 `"Moved between contiguous states"', add
label define migrat75_lbl 52 `"Moved between non-contiguous states"', add
label define migrat75_lbl 60 `"Abroad five years ago"', add
label define migrat75_lbl 90 `"Unknown"', add
label values migrat75 migrat75_lbl

label define qagelbl 0 `"No change"'
label define qagelbl 2 `"Blank to value"', add
label define qagelbl 4 `"Allocated"', add
label values qage qagelbl

label define qmarstlbl 0 `"No change"'
label define qmarstlbl 2 `"Blank to value"', add
label define qmarstlbl 3 `"Value to value"', add
label define qmarstlbl 4 `"Allocated"', add
label define qmarstlbl 5 `"Value to value-no error"', add
label values qmarst qmarstlbl

label define qracelbl 0 `"No change"'
label define qracelbl 2 `"Blank to value"', add
label define qracelbl 4 `"Allocated"', add
label values qrace qracelbl

label define qrelatelbl 0 `"No change"'
label define qrelatelbl 2 `"Blank to value"', add
label define qrelatelbl 3 `"Value to value"', add
label define qrelatelbl 5 `"Value to value - no error"', add
label values qrelate qrelatelbl

label define qsexlbl 0 `"No change"'
label define qsexlbl 2 `"Blank to value"', add
label define qsexlbl 3 `"Value to value"', add
label define qsexlbl 4 `"Allocated"', add
label values qsex qsexlbl

label define qnativitlbl 00 `"Value-no change"'
label define qnativitlbl 01 `"Blank-no change"', add
label define qnativitlbl 02 `"Don't know-no change"', add
label define qnativitlbl 03 `"Refused-no change"', add
label define qnativitlbl 10 `"Value to value"', add
label define qnativitlbl 11 `"Blank to value"', add
label define qnativitlbl 12 `"Don't know to value"', add
label define qnativitlbl 13 `"Refused to value"', add
label define qnativitlbl 20 `"Value to longitudinal value"', add
label define qnativitlbl 21 `"Blank to longitudinal value"', add
label define qnativitlbl 22 `"Don't know to longitudinal value"', add
label define qnativitlbl 23 `"Refused to longitudinal value"', add
label define qnativitlbl 30 `"Value to allocated value long"', add
label define qnativitlbl 31 `"Blank to allocated value long"', add
label define qnativitlbl 32 `"Don't know to allocated value long"', add
label define qnativitlbl 33 `"Refused to allocated value long"', add
label define qnativitlbl 40 `"Value to allocated value"', add
label define qnativitlbl 41 `"Blank to allocated value"', add
label define qnativitlbl 42 `"Don't know to allocated value"', add
label define qnativitlbl 43 `"Refused to allocated value"', add
label define qnativitlbl 50 `"Value to blank"', add
label define qnativitlbl 52 `"Don't know to blank"', add
label define qnativitlbl 53 `"Refused to blank"', add
label define qnativitlbl 60 `"Not allocated"', add
label values qnativit qnativitlbl

label define qeduclbl 0 `"No change"'
label define qeduclbl 1 `"Attended allocated"', add
label define qeduclbl 2 `"Completed allocated"', add
label define qeduclbl 3 `"Both completed and attended allocated"', add
label values qeduc qeduclbl

label define qhigradelbl 0 `"No change"'
label define qhigradelbl 4 `"Allocated"', add
label values qhigrade qhigradelbl

label define qclasswklbl 0 `"No change or children or armed forces"'
label define qclasswklbl 1 `"Value to blank"', add
label define qclasswklbl 2 `"Blank to value"', add
label define qclasswklbl 3 `"Value to value"', add
label define qclasswklbl 4 `"Allocated"', add
label values qclasswk qclasswklbl

label define qclasswllbl 0 `"No change or children or armed forces"'
label define qclasswllbl 1 `"Allocated"', add
label values qclasswl qclasswllbl

label define qempstatlbl 0 `"No change or children or armed forces"'
label define qempstatlbl 1 `"Value to blank"', add
label define qempstatlbl 2 `"Blank to value"', add
label define qempstatlbl 3 `"Value to value"', add
label define qempstatlbl 4 `"Allocated"', add
label values qempstat qempstatlbl

label define qindlbl 0 `"No change or children or armed forces"'
label define qindlbl 1 `"Value to blank"', add
label define qindlbl 2 `"Blank to value"', add
label define qindlbl 3 `"Value to value"', add
label define qindlbl 4 `"Allocated"', add
label values qind qindlbl

label define qlabforclbl 0 `"No change or children or armed forces"'
label define qlabforclbl 1 `"Value to blank"', add
label define qlabforclbl 2 `"Blank to value"', add
label define qlabforclbl 3 `"Value to value"', add
label define qlabforclbl 4 `"Allocated"', add
label values qlabforc qlabforclbl

label define qocclbl 0 `"No change or children or armed forces"'
label define qocclbl 1 `"Value to blank"', add
label define qocclbl 2 `"Blank to value"', add
label define qocclbl 3 `"Value to value"', add
label define qocclbl 4 `"Allocated"', add
label values qocc qocclbl

label define qocclylbl 0 `"No change or children or armed forces"'
label define qocclylbl 1 `"Allocated"', add
label values qoccly qocclylbl

label define qwhynwlylbl 0 `"No change or children"'
label define qwhynwlylbl 1 `"Allocated"', add
label values qwhynwly qwhynwlylbl

label define qwksworklbl 0 `"No change or children"'
label define qwksworklbl 1 `"Allocated"', add
label values qwkswork qwksworklbl

label define qincwagelbl 0 `"No allocation"'
label define qincwagelbl 1 `"Income amount allocated"', add
label define qincwagelbl 2 `"Recipiency type allocated"', add
label define qincwagelbl 3 `"Income amount  and recipiency type allocated"', add
label values qincwage qincwagelbl

label define qmigrat1lbl 0 `"NIU, or not changed"'
label define qmigrat1lbl 1 `"Migration status assigned from householder"', add
label define qmigrat1lbl 2 `"Migration status assigned from spouse"', add
label define qmigrat1lbl 3 `"Migration status allocated from matrix mob"', add
label define qmigrat1lbl 4 `"Migration status assigned from parents"', add
label values qmigrat1 qmigrat1lbl

label define qmigst1albl 0 `"No change or children"'
label define qmigst1albl 1 `"Allocated"', add
label define qmigst1albl 2 `"County and below assigned"', add
label define qmigst1albl 3 `"State and below assigned"', add
label values qmigst1a qmigst1albl

label define qmigst1blbl 0 `"NIU or not changed"'
label define qmigst1blbl 1 `"Assigned from householder"', add
label define qmigst1blbl 2 `"Assigned from spouse"', add
label define qmigst1blbl 3 `"Assigned from parents"', add
label define qmigst1blbl 4 `"Allocated from matrix MIG1"', add
label define qmigst1blbl 5 `"Allocated from matrix MIG2"', add
label define qmigst1blbl 6 `"Allocated from matrix MIG3"', add
label define qmigst1blbl 7 `"Allocated from matrix MIG4"', add
label define qmigst1blbl 8 `"Allocated from matrix MIG5"', add
label define qmigst1blbl 9 `"Allocated from matrix MIG6"', add
label values qmigst1b qmigst1blbl

label define qwhymovelbl 0 `"No change or NIU"'
label define qwhymovelbl 1 `"Assigned from householder"', add
label define qwhymovelbl 2 `"Assigned from spouse"', add
label define qwhymovelbl 3 `"Assigned from parents"', add
label values qwhymove qwhymovelbl

drop if migrate1==. & migrate5==.
gen child=(relate==301 | relate==303) & age<=17
egen nchild2=sum(child), by(serial year)
replace nchild2 = 9 if nchild2>9 & nchild2~=.

rename educ educicpsr
gen educ = 1 if (educicpsr>=2 & educicpsr<=60) | educicpsr==71
replace educ = 2 if educicpsr==73
replace educ = 3 if educicpsr>=80 & educicpsr<=100
replace educ = 4 if educicpsr>=110 & educicpsr<=115
replace educ = . if age<=24
lab def educ 1 "No HS" 2 "HS" 3 "Some college" 4 "College+"
lab val educ educ

gen female = sex==2

replace migrate1 = . if qmigrat1~=0 & qmigrat1~=.
gen migdist = 0 if migrate1==1
replace migdist = 1 if migrate1==3
replace migdist = 2 if migrate1==4 
replace migdist = 3 if migrate1==5
* drop those not in migration sample or abroad in prev year
drop if (migrate1==0 | migrate1==6) & (migrate5==0 | migrate5==60)
replace migdist = . if migrate1==0 | migrate1==6 | (migrate1==. & year>=1996)
gen cmigrant = (migdist==2 | migdist==3)
gen smigrant = (migdist==3) 
gen hmigrant=(migdist > 0)
quietly for var cmigrant hmigrant smigrant: replace X = . if migrate1==. | migrate1==0 | migrate1==6 | migdist==.
tab migrate5 if year==1995
tab migrate5 if year==2005
gen smigrant5y = migrate5>=50 & migrate5<=52
replace smigrant5y = . if migrate5==. | migrate5==0 | migrate5==20 | migrate5==60
gen hmigrant5y = migrate5>=20 & migrate5<=52
replace hmigrant5y = . if migrate5==. | migrate5==0 | migrate5==60

sum hmigrant if year>=2000 & year<=2010 & age>=18 [w=wgtfnl]
stop

gen owner = (ownershp==10)
replace owner = . if ownershp==. | ownershp==0

rename empstat esr
gen empstat = 1 if esr==10 | esr==12
replace empstat = 2 if esr>=20 & esr <= 22
replace empstat = 3 if esr==13 
replace empstat = 4 if esr>=30 & esr<=35
lab def empstat 1 "Employed" 2 "Unemployed" 3 "Military" 4 "NLF"
lab val empstat empstat

gen wgtfnl = int(blswt / 100)
replace wgtfnl = int(perwt / 100) if wgtfnl==. | wgtfnl==0
replace wgtfnl = . if wgtfnl<0
* a few weights in 1976 look way too big
replace wgtfnl = . if wgtfnl>200 & year==1976

gen agegrp = . 
replace agegrp=1 if age>= 1  & age <= 13 
replace agegrp=2 if age>= 14 & age <= 17 
replace agegrp=3 if age>= 18 & age <= 19 
replace agegrp=4 if age>= 20 & age <= 24 
replace agegrp=5 if age>= 25 & age <= 34 
replace agegrp=6 if age>= 35 & age <= 44 
replace agegrp=7 if age>= 45 & age <= 64 
replace agegrp=8 if age>= 65 & age ~=. 
*drop if agegrp==.
lab def agegrp 1 "1-13" 2 "14-17" 3 "18-19" 4 "20-24" 5 "25-34" 6 "35-44" 7 "45-64" 8 "65+"
lab val agegrp agegrp

drop if age < 1
drop if gq==2
keep if qmigrat1==0 | (qmigrat1==. & qmigst1a==0) | year<=1987 | migrate5~=.
table year if smigrant5y~=. [w=wgtfnl], c(m smigrant5y)
table year if relate==101 & smigrant5y~=. [w=wgtfnl], c(m smigrant5y)

gen timegrp = 1 if year>=1981 & year<=1984
replace timegrp = 2 if year>=1986 & year<=1990
replace timegrp = 3 if year>=1991 & year<=1994
replace timegrp = 4 if year>=1996 & year<=2000
replace timegrp = 5 if year>=2001 & year<=2004
replace timegrp = 6 if year>=2005 & year<=2009
lab def timegrp 1 "1981-84" 2 "1986-90" 3 "1991-94" 4 "1996-2000" 5 "2001-2004" 6 "2005-2009"
lab val timegrp timegrp
gen timegrp2 = 1 if year>=1981 & year<=1990
replace timegrp2 = 2 if year>=1991 & year<=2000
replace timegrp2 = 3 if year>=2001 & year<=2010
lab def timegrp2 1 "1981-90" 2 "1991-00" 3 "2001-10" 
lab val timegrp2 timegrp2


replace inctot = . if inctot==999999
gen incdum = . 
*quietly for num 1981/1984 1986/1994 1996/2010: xtile temp=inctot if year==X, nq(5) \ replace incdum = temp if year==X \ drop temp
*quietly for num 2006/2009: xtile temp=inctot if year==X, nq(5) \ replace incdum = temp if year==X \ drop temp
replace incdum = . if inctot==.

gen marstb = 1 if marst==1 | marst==2
replace marstb = 2 if marst>=3 & marst<=5
replace marstb = 3 if marst==6
replace marstb = . if age<18
lab def marstb 1 "Married" 2 "Separated/Divorced/Widowed" 3 "Single"
lab val marstb marstb

gen     cenreg = 1 if statefip==9 | statefip==23 | statefip==25 | statefip==33 | statefip==44 | statefip==50 |statefip==34 | statefip==36 | statefip==42 
replace cenreg = 2 if statefip==17 | statefip==18 | statefip==26 | statefip==39 | statefip==55 | statefip==19 | statefip==20 | statefip==27 | statefip==29 | statefip==31 | statefip==38 | statefip==46
replace cenreg = 3 if statefip==10 | statefip==11 | statefip==12 | statefip==13 | statefip==24 | statefip==37 | statefip==45 | statefip==51 | statefip==54 | statefip==1  | statefip==21 | statefip==28 | statefip==47 | statefip==5  | statefip==22 | statefip==40 | statefip==48
replace cenreg = 4 if statefip==4  | statefip==8  | statefip==16 | statefip==30  | statefip==32 | statefip==35  | statefip==49 | statefip==56 | statefip==2  | statefip==6  | statefip==15 | statefip==41 | statefip==53

gen     cenreg1 = 1 if migsta1==9 | migsta1==23 | migsta1==25 | migsta1==33 | migsta1==44 | migsta1==50 |migsta1==34 | migsta1==36 | migsta1==42 
replace cenreg1 = 2 if migsta1==17 | migsta1==18 | migsta1==26 | migsta1==39 | migsta1==55 | migsta1==19 | migsta1==20 | migsta1==27 | migsta1==29 | migsta1==31 | migsta1==38 | migsta1==46
replace cenreg1 = 3 if migsta1==10 | migsta1==11 | migsta1==12 | migsta1==13 | migsta1==24 | migsta1==37 | migsta1==45 | migsta1==51 | migsta1==54 | migsta1==1  | migsta1==21 | migsta1==28 | migsta1==47 | migsta1==5  | migsta1==22 | migsta1==40 | migsta1==48
replace cenreg1 = 4 if migsta1==4  | migsta1==8  | migsta1==16 | migsta1==30  | migsta1==32 | migsta1==35  | migsta1==49 | migsta1==56 | migsta1==2  | migsta1==6  | migsta1==15 | migsta1==41 | migsta1==53

gen rmigrant = 1 if cenreg~=cenreg1 & cenreg~=. & cenreg1~=.
replace rmigrant = 0 if cenreg==cenreg1 & cenreg~=. & cenreg1~=.
replace rmigrant = 0 if smigrant==0
gen cmigrant2 = cmigrant
replace cmigrant2 = 0 if smigrant==1
gen hmigrant2 = 1 if migdist==1
replace hmigrant2 = 0 if migdist~=1 & migdist~=.

gen citizenb = 0 if citizen==2 | citizen==3
replace citizenb = 1 if citizen==0 | citizen==1
lab def citizenb 0 "Naturalized/Non-Citizen" 1 "Citizen"
lab val citizenb citizenb
gen noncitizen = 1 if citizenb==0
replace noncitizen = 0 if citizenb==1

gen fborn = 0 if nativity==1
replace fborn = 1 if nativity>=2 & nativity<=4
replace fborn = 2 if nativity==5
lab def fborn 1 "Native" 2 ">=1 parent fborn" 3 "Fborn"
lab var fborn fborn

gen race2 = 1 if race==100 & hispan==0
replace race2 = 2 if race==200 & hispan==0
replace race2 = 3 if hispan>=100 & hispan<=410
replace race2 = 4 if race==650 | race==651
replace race2 = 5 if race==300 | race==652 | race==700
lab def race2 1 "White" 2 "Black" 3 "Hispanic" 4 "Asian" 5 "Other"
lab val race2 race2

gen metro2 = 1 if metro>=2 & metro<=4
replace metro2 = 0 if metro==1
gen nonmetro = 1 if metro2==0
replace nonmetro = 0 if metro2==1

gen nonfiler = filestat==6
replace nonfiler = . if filestat==.


gen nchilddum = 0 if nchild==0
replace nchilddum = 1 if nchild>=1 & nchild~=.
replace nchilddum = . if age<18
lab def nchilddum 0 "No kids" 1 "Kids"
lab val nchilddum nchilddum

gen nchild2dum = 0 if nchild2==0
replace nchild2dum = 1 if nchild2>=1 & nchild2~=.
replace nchild2dum = . if age<18
lab def nchild2dum 0 "No kids" 1 "Kids"
lab val nchild2dum nchild2dum

replace whymove = . if qwhymove~=0
gen ownhome = whymove==9
gen newhouse = whymove==10
gen betternh = whymove==11
gen otherhr = whymove==13
gen othernhr = whymove<=8 | whymove==12 | (whymove>=14 & whymove<=18)
gen famreason = whymove==1 | whymove==3
gen ownhh = whymove==2
gen jobchange = whymove>=4 & whymove<=5
gen housingreason = whymove>=9 & whymove<=13
gen otherreason = (whymove>=6 & whymove<=8) | (whymove>=14 & whymove<=18)
quietly for var ownhome newhouse betternh otherhr othernhr famreason-otherreason: replace X = . if whymove==. \ replace X = 0 if migdist==0

gen wagewkr = 1 if classwly>=20 & classwly<=28
egen nwkr = sum(wagewkr) if relate==101 | relate==201, by(serial year)
gen dualhh = nwkr==2

*quietly for var agegrp marstb ownershp race2 fborn empstat educ metro2 nchilddum incdum region: tab X, gen(Xdum)
/*
reg smigrant agegrpdum2-agegrpdum8 marstbdum2-marstbdum3 fborndum2-fborndum3 race2dum2-race2dum5 educdum2-educdum4 nchilddum incdumdum2-incdumdum5 empstatdum2-empstatdum4 owner  [w=wgtfnl] if year>=1994 & empstat~=3
dprobit smigrant agegrpdum2-agegrpdum8 marstbdum2-marstbdum3 fborndum2-fborndum3 race2dum2-race2dum5 educdum2-educdum4 nchilddum incdumdum2-incdumdum5 empstatdum2-empstatdum4 owner [w=wgtfnl] if year>=1994 & empstat~=3
dprobit cmigrant agegrpdum2-agegrpdum8 marstbdum2-marstbdum3 fborndum2-fborndum3 race2dum2-race2dum5 educdum2-educdum4 nchilddum incdumdum2-incdumdum5 empstatdum2-empstatdum4 owner [w=wgtfnl] if year>=1994 & empstat~=3
dprobit rmigrant agegrpdum2-agegrpdum8 marstbdum2-marstbdum3 fborndum2-fborndum3 race2dum2-race2dum5 educdum2-educdum4 nchilddum incdumdum2-incdumdum5 empstatdum2-empstatdum4 owner [w=wgtfnl] if year>=1994 & empstat~=3
quietly for num 1996/2009: gen yX = year==X
dprobit smigrant agegrpdum2-agegrpdum8 marstbdum2-marstbdum3 fborndum2-fborndum3 race2dum2-race2dum5 educdum2-educdum4 nchilddum incdumdum2-incdumdum5 empstatdum2-empstatdum4 owner y1996-y2009 [w=wgtfnl] if year>=1994
stop
*/
*tab agegrp year if smigrant~=. & year>=2005, col
*tab educ year if smigrant~=. & year>=2005, col

/*
for num 1988 1990 1992 2000 2002 2005 2008 2009: table agegrp if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table marst if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 2000 2002 2005 2008 2009: table citizen if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table ownershp if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table female if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table race2 if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table empstat if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table educ if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table metro2 if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 1988 1990 1992 2000 2002 2005 2008 2009: table incdum if year==X [w=wgtfnl], c(m smigrant m cmigrant2)
for num 2000 2002 2005 2008 2009: table whymove if year==X [w=wgtfnl], c(sum smigrant sum cmigrant2)
*/

/*
quietly for var smigrant cmigrant2: replace X = X*100

for var agegrp educ female marstb race2 fborn nchilddum nchild2dum incdum empstat owner metro2 region: table X [w=wgtfnl], c(m smigrant) format(%9.1f)
for var agegrp educ female marstb race2 fborn nchilddum nchild2dum incdum empstat owner metro2 region: table X timegrp2 [w=wgtfnl], c(m smigrant) format(%9.1f)

reg smigrant agegrpdum6-agegrpdum8 marstbdum2-marstbdum3 owner race2dum2-race2dum4 empstatdum2-empstatdum4 educdum2-educdum4 nonmetro regiondum2-regiondum9  [w=wgtfnl] if year==2010 & region~=10
estimates store m10
reg smigrant agegrpdum6-agegrpdum8 marstbdum2-marstbdum3 owner race2dum2-race2dum4 empstatdum2-empstatdum4 educdum2-educdum4 nonmetro regiondum2-regiondum9  [w=wgtfnl] if year==1981 & region~=10
estimates store m81
oaxaca8 m10 m81, detail tf asis
reg cmigrant2 agegrpdum7-agegrpdum8 marstbdum2-marstbdum3 owner race2dum2-race2dum4 empstatdum2-empstatdum4 educdum2-educdum4 nonmetro regiondum2-regiondum9  [w=wgtfnl] if year==2010 & region~=10
estimates store m10
reg cmigrant2 agegrpdum7-agegrpdum8 marstbdum2-marstbdum3 owner race2dum2-race2dum4 empstatdum2-empstatdum4 educdum2-educdum4 nonmetro regiondum2-regiondum9  [w=wgtfnl] if year==1981 & region~=10
estimates store m81
oaxaca8 m10 m81, detail tf asis

stop
*/
/*
egen nsmig = sum(smigrant) if whymove~=., by(year)
quietly for num 1/19: egen wmnX = sum(smigrant) if smigrant==1 & whymove==X & year>=2000, by(year) \ gen wmsX = wmnX/nsmig
egen ncmig = sum(cmigrant2) if whymove~=., by(year)
quietly for num 1/19: egen wmncX = sum(cmigrant2) if cmigrant2==1 & whymove==X & year>=2000, by(year) \ gen wmscX = wmncX/ncmig
egen nhmig = sum(hmigrant) if whymove~=., by(year)
quietly for num 1/19: egen wmnhX = sum(hmigrant) if hmigrant==1 & whymove==X & year>=2000, by(year) \ gen wmshX = wmnhX/nhmig

table year if smigrant==1 & year>=2000 , c(m wms1 m wms2 m wms3 m wms4 m wms5)
table year if smigrant==1 & year>=2000  , c(m wms6 m wms7 m wms8 m wms9 m wms10)
table year if smigrant==1 & year>=2000  , c(m wms11 m wms12 m wms13 m wms14 m wms15)
table year if smigrant==1 & year>=2000  , c(m wms16 m wms17 m wms18 m wms19)
stop
*/
/*
table year, c(m smigrant)

table year marst, c(m smigrant)
table year citizen, c(m smigrant)
table year ownershp, c(m smigrant)
table year black, c(m smigrant)
table year hisp, c(m smigrant)
table year metro, c(m smigrant)

* armed forces
replace empstat = 4 if esr==13
table year empstat, c(m smigrant)

table year educ2, c(m smigrant)

table statefip year if year>=2000, c(m smigrant)
*/
/*
egen markhh = tag(year serial) if qmigrat1==0 | (qmigrat1==. & qmigst1a==0) | year<=1987
egen cpshh = sum(hhwt) if markhh==1, by(year)

gen cmigf = cmigrant if nonfiler==0
gen smigf = smigrant if nonfiler==0
gen smigc = smigrant if esr~=13
gen smigc14 = smigrant if esr~=13 & age>=14
gen smig14 = smigrant if age>=14
egen pop = sum(wgtfnl) if qmigrat1==0 | (qmigrat1==. & qmigst1a==0) | year<=1987, by(year)
egen cmigw = sum(cmigrant*wgtfnl), by(year)
egen smigw = sum(smigrant*wgtfnl), by(year)
gen smigh = smigrant if owner==1
gen smigr = smigrant if owner==0
gen cmig2h = cmigrant2 if owner==1
gen cmig2r = cmigrant2 if owner==0
gen smigdhh = smigrant if dualhh==1 & relate==101
gen smigshh = smigrant if dualhh==0 & relate==101
gen cmig2dhh = cmigrant2 if dualhh==1 & relate==101
gen cmig2shh = cmigrant2 if dualhh==0 & relate==101
collapse (mean) cmigrant cmigrant2 smigrant smigc smig14 smigc14 smigrant5y rmigrant hmigrant hmigrant2 hmigrant5y ownhome newhouse betternh otherhr othernhr nonfiler cmigf smigf pop cmigw smigw cpshh smigr smigh cmig2r cmig2h smigdhh smigshh cmig2dhh cmig2shh [w=wgtfnl], by(year)
sort year
save cpsmigann, replace
*/
drop if age<14
collapse (mean) cmigrant smigrant [w=wgtfnl], by(year)
sort year
save cpsmigann_jole, replace
l year cmigrant smigrant

/*
egen pop = sum(wgtfnl) if qmigrat1==0 | (qmigrat1==. & qmigst1a==0) | year<=1987, by(statefip year)
egen smigw = sum(smigrant*wgtfnl), by(statefip year)
collapse (mean) cmigrant cmigrant2 smigrant hmigrant hmigrant2 pop smigw [w=wgtfnl], by(statefip year)
rename statefip state
sort state year
save cpsmig_state, replace
gen test = smigw/pop
sum smigrant test if test~=. & smigrant~=. & smigrant~=0 & test~=0

*/
/*
replace migsta1 = . if (qmigst1a>=1 & qmigst1a<=3) | (qmigst1b>=1 & qmigst1b<=9) 
gen highne = (migsta1==6 | migsta1==12 | migsta1==32 | migsta1==4 | migsta1==26) if migsta1~=.
*gen highne = 1 if migsta1==12 | migsta1==32 | migsta1==26
*replace highne = 0 if migsta1~=. & migrate1~=1 & migsta1~=2 & migsta1~=19 & migsta1~=27 & migsta1~=30 & migsta1~=38 & migsta1~=41 & migsta1~=53 & migsta1~=12 & migsta1~=32 & migsta1~=26
replace highne = 1 if (statefip==6 | statefip==12 | statefip==32 | statefip==4 | statefip==26) & migrate1==1

*replace highne = 1 if (statefip==12 | statefip==32 | statefip==26) & migrate1==1
*replace highne = 0 if (statefip~=12 & statefip~=32 & statefip~=26 & statefip~=2 & statefip~=19 & statefip~=27 & statefip~=30 & statefip~=38 & statefip~=41 & statefip~=53) & migrate1==1 & statefip<=56
*replace migsta1 = statefip if migsta1==99
*collapse (mean) cmigrant smigrant  [w=wgtfnl], by(migsta1 year)
collapse (mean) cmigrant  [w=wgtfnl], by(highne year)
*drop if migsta1==.
drop if highne==.
*quietly for var cmigrant smigrant: rename X Xo
reshape wide cmigrant, i(year) j(highne)
* rename migsta1 state
* sort state year
sort year
save cpsmigann4, replace

l year cmigrant0 cmigrant1
*/

quietly log off
quietly log close
set more 0

