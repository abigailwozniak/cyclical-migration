calendar 1946 1 1

ALLOCATE 2009:1


***READ IN THE DATA***************

open data /mcr/home/m1res00/research/migration/cpsdata_final.txt
   data(format=free, org=columns) / year mv14_upsp  ds14_upsp 
close


smpl 1946:1 2009:1

*** HP Filter ***

*** dofor i = mv14_upsp  ds14_upsp mv14_upmsp mv18_24msp mv25_34msp mv35_44msp mv45_64msp mv65_upmsp
dofor i = mv14_upsp  ds14_upsp 
  filter(type=hp) i / 
end dofor


*** save data 
open copy /mcr/home/m1res00/research/migration/cpsdata_final_trend.txt
   copy(format=prn, org=columns) / year mv14_upsp ds14_upsp 
close copy


end
 
