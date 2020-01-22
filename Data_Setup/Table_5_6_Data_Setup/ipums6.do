/* Important: you need to put the .dat and .do files in one folder/
   directory and then set the working folder to that folder. */

set more off

clear
infix ///
 int     year                                 1-4 ///
 long    serial                               5-9 ///
 byte    numprec                             10-11 ///
 float  hhwt                                12-18 ///
 byte    gq                                  19 ///
 byte    region                              20-21 ///
 byte    statefip                            22-23 ///
 byte    metro                               24 ///
 byte    ownershp                            25-26 ///
 long    hhincome                            27-33 ///
 byte    pernum                              34-35 ///
 float  perwt                               36-43 ///
 float  blswt                               44-51 ///
 int     relate                              52-55 ///
 byte    age                                 56-57 ///
 byte    sex                                 58 ///
 int     race                                59-61 ///
 byte    marst                               62 ///
 byte    citizen                             63 ///
 int     hispan                              64-66 ///
 byte    educ99                              67-68 ///
 int     higrade                             69-71 ///
 byte    empstat                             72-73 ///
 int     occ                                 74-76 ///
 int     occ1950                             77-79 ///
 int     ind                                 80-83 ///
 int     ind1950                             84-86 ///
 int     occly                               87-89 ///
 int     occ50ly                             90-92 ///
 int     indly                               93-96 ///
 int     ind50ly                             97-99 ///
 byte    wkswork2                           100 ///
 byte    fullpart                           101 ///
 byte    whynwly                            102 ///
 long    inctot                             103-108 ///
 long    incwage                            109-114 ///
 byte    filestat                           115 ///
 byte    migsta1                            116-117 ///
 byte    whymove                            118-119 ///
 byte    migrate1                           120 ///
 byte    qmigrat1                           121 ///
 byte    qmigst1a                           122 ///
 byte    qmigst1b                           123 ///
 byte    qwhymove                           124 ///
 using "ipums_march6.dat"

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
label var relate `"Relationship to household head"'
label var age `"Age"'
label var sex `"Sex"'
label var race `"Race"'
label var marst `"Marital status"'
label var citizen `"Citizenship status"'
label var hispan `"Hispanic origin"'
label var educ99 `"Educational attainment, 1990"'
label var higrade `"Highest grade of school"'
label var empstat `"Employment status"'
label var occ `"Occupation"'
label var occ1950 `"Occupation, 1950 basis"'
label var ind `"Industry"'
label var ind1950 `"Industry, 1950 basis"'
label var occly `"Occupation last year"'
label var occ50ly `"Occupation last year, 1950 basis"'
label var indly `"Industry last year"'
label var ind50ly `"Industry last year, 1950 basis"'
label var wkswork2 `"Weeks worked last year, intervalled"'
label var fullpart `"Worked full or part time last year"'
label var whynwly `"Reason not working last year"'
label var inctot `"Total personal income"'
label var incwage `"Wage and salary income"'
label var filestat `"Tax filer status"'
label var migsta1 `"State of residence 1 year ago"'
label var whymove `"Reason for moving"'
label var migrate1 `"Migration status, 1 year"'
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

label define citizenlbl 0 `"NIU"'
label define citizenlbl 1 `"Born abroad of American parents"', add
label define citizenlbl 2 `"Naturalized citizen"', add
label define citizenlbl 3 `"Not a citizen"', add
label values citizen citizenlbl

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

