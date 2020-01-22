calendar 1946 1 1

ALLOCATE 2009:1


***READ IN THE DATA***************

open data /mcr/home/m1res00/research/migration/cpsdata_final.txt
   data(format=free, org=columns) / year mv14_upsp  ds14_upsp 
close



*** HP Filter ***
smpl 1946:1 2005:1

dofor i = mv14_upsp  ds14_upsp 
  filter(type=hp) i / 
end dofor


*** save data 
open copy /mcr/home/m1res00/research/migration/cpsdata_final_trend05.txt
   copy(format=prn, org=columns) / year mv14_upsp ds14_upsp 
close copy


end
 
