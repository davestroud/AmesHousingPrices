data WORK.TRAIN;
%let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile '/home/mpednekar0/train.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;  /* <---- YOUR PATH HERE */
informat Id best32. ; 
informat MSSubClass best32. ; 
informat MSZoning $20. ; 
informat LotFrontage best32. ; 
informat LotArea best32. ; 
informat Street $20. ; 
informat Alley $20. ; 
informat LotShape $20. ;
informat LandContour $20. ; 
informat Utilities $20. ; 
informat LotConfig $20. ;  
informat LandSlope $20. ; 
informat Neighborhood $20. ;
informat Condition1 $20. ;
informat Condition2 $20. ;
informat BldgType $20. ;
informat HouseStyle $20. ;
informat OverallQual best32. ;
informat OverallCond best32. ;
informat YearBuilt best32. ;
informat YearRemodAdd best32. ;
informat RoofStyle $20. ;
informat RoofMatl $20. ;
informat Exterior1st $20. ;
informat Exterior2nd $20. ;
informat MasVnrType $20. ;
informat MasVnrArea best32. ;
informat ExterQual $20. ;
informat ExterCond $20. ;
informat Foundation $20. ;
informat BsmtQual $20. ;
informat BsmtCond $20. ;
informat BsmtExposure $20. ;
informat BsmtFinType1 $20. ;
informat BsmtFinSF1 best32. ;
informat BsmtFinType2 $20.;
informat BsmtFinSF2 best32. ;
informat BsmtUnfSF best32. ;
informat TotalBsmtSF best32. ;
informat Heating $20. ;
informat HeatingQC $20. ;
informat CentralAir $20. ;
informat Electrical $20. ;
informat X1stFlrSF best32. ;
informat X2ndFlrSF best32. ;
informat LowQualFinSF best32. ;
informat GrLivArea best32. ;
informat BsmtFullBath best32. ;
informat BsmtHalfBath best32. ;
informat FullBath best32. ;
informat HalfBath best32. ;
informat BedroomAbvGr best32. ;
informat KitchenAbvGr best32. ;
informat KitchenQual $20. ;
informat TotRmsAbvGrd best32. ;
informat Functional $20. ;
informat Fireplaces best32. ;
informat FireplaceQu $20. ;
informat GarageType $20. ;
informat GarageYrBlt best32. ;
informat GarageFinish $20. ;
informat GarageCars best32. ;
informat GarageArea best32. ;
informat GarageQual $20. ;
informat GarageCond $20. ;
informat PavedDrive $20. ;
informat WoodDeckSF best32. ;
informat OpenPorchSF best32. ;
informat EnclosedPorch best32. ;
informat X3SsnPorch best32. ;
informat ScreenPorch best32. ;
informat PoolArea best32. ;
informat PoolQC $20. ;
informat Fence $20. ;
informat MiscFeature $20. ;
informat MiscVal best32. ;
informat MoSold best32. ;
informat YrSold best32. ;
informat SaleType $20. ;
informat SaleCondition $20. ;
informat SalePrice best32. ;
format Id best32. ;
format MSSubClass best32. ;
format MSZoning $20. ;
format LotFrontage best32. ;
format LotArea best32. ;
format Street $20. ;
format Alley $20. ;
format LotShape $20. ;
format LandContour $20.;
format Utilities $20. ;
format LotConfig $20. ;
format LandSlope $20. ;
format Neighborhood $20. ;
format Condition1 $20. ;
format Condition2 $20. ;
format BldgType $20. ;
format HouseStyle $20. ;
format OverallQual best32. ;
format OverallCond best32. ;
format YearBuilt best32. ;
format YearRemodAdd best32. ;
format RoofStyle $20. ;
format RoofMatl $20. ;
format Exterior1st $20. ;
format Exterior2nd $20. ;
format MasVnrType $20. ;
format MasVnrArea best32. ;
format ExterQual $20. ;
format ExterCond $20. ;
format Foundation $20. ;
format BsmtQual $20. ;
format BsmtCond $20. ;
format BsmtExposure $20. ;
format BsmtFinType1 $20. ;
format BsmtFinSF1 best32. ;
format BsmtFinType2 $20. ;
format BsmtFinSF2 best32. ;
format BsmtUnfSF best32. ;
format TotalBsmtSF best32. ;
format Heating $20. ;
format HeatingQC $20. ;
format CentralAir $20. ;
format Electrical $20. ;
format X1stFlrSF best32. ;
format X2ndFlrSF best32. ;
format LowQualFinSF best32. ;
format GrLivArea best32. ;
format BsmtFullBath best32. ;
format BsmtHalfBath best32. ;
format FullBath best32. ;
format HalfBath best32. ;
format BedroomAbvGr best32. ;
format KitchenAbvGr best32. ;
format KitchenQual $20. ;
format TotRmsAbvGrd best32. ;
format Functional $20. ;
format Fireplaces best32. ;
format FireplaceQu $20. ;
format GarageType $20. ;
format GarageYrBlt best32. ;
format GarageFinish $20. ;
format GarageCars best32. ;
format GarageArea best32. ;
format GarageQual $20. ;
format GarageCond $20. ;
format PavedDrive $20. ;
format WoodDeckSF best32. ;
format OpenPorchSF best32. ;
format EnclosedPorch best32. ;
format X3SsnPorch best32. ;
format ScreenPorch best32. ;
format PoolArea best32. ;
format PoolQC $20. ;
format Fence $20. ;
format MiscFeature $20. ;
format MiscVal best32. ;
format MoSold best32. ;
format YrSold best32. ;
format SaleType $20. ;
format SaleCondition $20. ;
format SalePrice best32. ;
input
Id
MSSubClass
MSZoning $
LotFrontage
LotArea
Street $
Alley $
LotShape $
LandContour $
Utilities $
LotConfig $
LandSlope $
Neighborhood $
Condition1 $
Condition2 $
BldgType $
HouseStyle $
OverallQual
OverallCond
YearBuilt
YearRemodAdd
RoofStyle $
RoofMatl $
Exterior1st $
Exterior2nd $
MasVnrType $
MasVnrArea
ExterQual $
ExterCond $
Foundation $
BsmtQual $
BsmtCond $
BsmtExposure $
BsmtFinType1 $
BsmtFinSF1
BsmtFinType2 $
BsmtFinSF2
BsmtUnfSF
TotalBsmtSF
Heating $
HeatingQC $
CentralAir $
Electrical $
X1stFlrSF
X2ndFlrSF
LowQualFinSF
GrLivArea
BsmtFullBath
BsmtHalfBath
FullBath
HalfBath
BedroomAbvGr
KitchenAbvGr
KitchenQual $
TotRmsAbvGrd
Functional $
Fireplaces
FireplaceQu $
GarageType $
GarageYrBlt
GarageFinish $
GarageCars
GarageArea
GarageQual $
GarageCond $
PavedDrive $
WoodDeckSF
OpenPorchSF
EnclosedPorch
X3SsnPorch
ScreenPorch
PoolArea
PoolQC $
Fence $
MiscFeature $
MiscVal
MoSold
YrSold
SaleType $
SaleCondition $
SalePrice
;
if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;


/* Import test data */
data WORK.TEST;
%let _EFIERR_ = 0; /* set the ERROR detection macro variable */
infile '/home/mpednekar0/test.csv' delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;  /* <---- YOUR PATH HERE */
informat Id best32. ; 
informat MSSubClass best32. ; 
informat MSZoning $20. ; 
informat LotFrontage best32. ; 
informat LotArea best32. ; 
informat Street $20. ; 
informat Alley $20. ; 
informat LotShape $20. ;
informat LandContour $20. ; 
informat Utilities $20. ; 
informat LotConfig $20. ;  
informat LandSlope $20. ; 
informat Neighborhood $20. ;
informat Condition1 $$20. ;
informat Condition2 $20. ;
informat BldgType $20. ;
informat HouseStyle $20. ;
informat OverallQual best32. ;
informat OverallCond best32. ;
informat YearBuilt best32. ;
informat YearRemodAdd best32. ;
informat RoofStyle $20. ;
informat RoofMatl $20. ;
informat Exterior1st $20. ;
informat Exterior2nd $20. ;
informat MasVnrType $20. ;
informat MasVnrArea best32. ;
informat ExterQual $20. ;
informat ExterCond $$20. ;
informat Foundation $20. ;
informat BsmtQual $20. ;
informat BsmtCond $20. ;
informat BsmtExposure $20. ;
informat BsmtFinType1 $20. ;
informat BsmtFinSF1 best32. ;
informat BsmtFinType2 $20.;
informat BsmtFinSF2 best32. ;
informat BsmtUnfSF best32. ;
informat TotalBsmtSF best32. ;
informat Heating $20. ;
informat HeatingQC $20. ;
informat CentralAir $20. ;
informat Electrical $20. ;
informat X1stFlrSF best32. ;
informat X2ndFlrSF best32. ;
informat LowQualFinSF best32. ;
informat GrLivArea best32. ;
informat BsmtFullBath best32. ;
informat BsmtHalfBath best32. ;
informat FullBath best32. ;
informat HalfBath best32. ;
informat BedroomAbvGr best32. ;
informat KitchenAbvGr best32. ;
informat KitchenQual $20. ;
informat TotRmsAbvGrd best32. ;
informat Functional $20. ;
informat Fireplaces best32. ;
informat FireplaceQu $20. ;
informat GarageType $20. ;
informat GarageYrBlt best32. ;
informat GarageFinish $20. ;
informat GarageCars best32. ;
informat GarageArea best32. ;
informat GarageQual $20. ;
informat GarageCond $20. ;
informat PavedDrive $20. ;
informat WoodDeckSF best32. ;
informat OpenPorchSF best32. ;
informat EnclosedPorch best32. ;
informat X3SsnPorch best32. ;
informat ScreenPorch best32. ;
informat PoolArea best32. ;
informat PoolQC $20. ;
informat Fence $20. ;
informat MiscFeature $20. ;
informat MiscVal best32. ;
informat MoSold best32. ;
informat YrSold best32. ;
informat SaleType $20. ;
informat SaleCondition $20. ;
format Id best32. ;
format MSSubClass best32. ;
format MSZoning $20. ;
format LotFrontage best32. ;
format LotArea best32. ;
format Street $20. ;
format Alley $20. ;
format LotShape $20. ;
format LandContour $20.;
format Utilities $20. ;
format LotConfig $20. ;
format LandSlope $20. ;
format Neighborhood $20. ;
format Condition1 $20. ;
format Condition2 $20. ;
format BldgType $20. ;
format HouseStyle $20. ;
format OverallQual best32. ;
format OverallCond best32. ;
format YearBuilt best32. ;
format YearRemodAdd best32. ;
format RoofStyle $20. ;
format RoofMatl $20. ;
format Exterior1st $20. ;
format Exterior2nd $20. ;
format MasVnrType $20. ;
format MasVnrArea best32. ;
format ExterQual $20. ;
format ExterCond $20. ;
format Foundation $20. ;
format BsmtQual $20. ;
format BsmtCond $20. ;
format BsmtExposure $20. ;
format BsmtFinType1 $20. ;
format BsmtFinSF1 best32. ;
format BsmtFinType2 $20. ;
format BsmtFinSF2 best32. ;
format BsmtUnfSF best32. ;
format TotalBsmtSF best32. ;
format Heating $20. ;
format HeatingQC $20. ;
format CentralAir $20. ;
format Electrical $20. ;
format X1stFlrSF best32. ;
format X2ndFlrSF best32. ;
format LowQualFinSF best32. ;
format GrLivArea best32. ;
format BsmtFullBath best32. ;
format BsmtHalfBath best32. ;
format FullBath best32. ;
format HalfBath best32. ;
format BedroomAbvGr best32. ;
format KitchenAbvGr best32. ;
format KitchenQual $20. ;
format TotRmsAbvGrd best32. ;
format Functional $20. ;
format Fireplaces best32. ;
format FireplaceQu $20. ;
format GarageType $20. ;
format GarageYrBlt best32. ;
format GarageFinish $20. ;
format GarageCars best32. ;
format GarageArea best32. ;
format GarageQual $20. ;
format GarageCond $20. ;
format PavedDrive $20. ;
format WoodDeckSF best32. ;
format OpenPorchSF best32. ;
format EnclosedPorch best32. ;
format X3SsnPorch best32. ;
format ScreenPorch best32. ;
format PoolArea best32. ;
format PoolQC $20. ;
format Fence $20. ;
format MiscFeature $20. ;
format MiscVal best32. ;
format MoSold best32. ;
format YrSold best32. ;
format SaleType $20. ;
format SaleCondition $20. ;
input
Id
MSSubClass
MSZoning $
LotFrontage
LotArea
Street $
Alley $
LotShape $
LandContour $
Utilities $
LotConfig $
LandSlope $
Neighborhood $
Condition1 $
Condition2 $
BldgType $
HouseStyle $
OverallQual
OverallCond
YearBuilt
YearRemodAdd
RoofStyle $
RoofMatl $
Exterior1st $
Exterior2nd $
MasVnrType $
MasVnrArea
ExterQual $
ExterCond $
Foundation $
BsmtQual $
BsmtCond $
BsmtExposure $
BsmtFinType1 $
BsmtFinSF1
BsmtFinType2 $
BsmtFinSF2
BsmtUnfSF
TotalBsmtSF
Heating $
HeatingQC $
CentralAir $
Electrical $
X1stFlrSF
X2ndFlrSF
LowQualFinSF
GrLivArea
BsmtFullBath
BsmtHalfBath
FullBath
HalfBath
BedroomAbvGr
KitchenAbvGr
KitchenQual $
TotRmsAbvGrd
Functional $
Fireplaces
FireplaceQu $
GarageType $
GarageYrBlt
GarageFinish $
GarageCars
GarageArea
GarageQual $
GarageCond $
PavedDrive $
WoodDeckSF
OpenPorchSF
EnclosedPorch
X3SsnPorch
ScreenPorch
PoolArea
PoolQC $
Fence $
MiscFeature $
MiscVal
MoSold
YrSold
SaleType $
SaleCondition $
;
if _ERROR_ then call symputx('_EFIERR_',1);  /* set ERROR detection macro variable */
run;

/* Outlier Removal  */ 
data train;
set train;
     IF GrLivArea  > 4000 THEN DELETE;
  RUN;
  
  /* Combine Data After Outlier Removal */
data house;
   set train test;
run;
/* Nice little check sum to see that our data has values */
/* proc means data=house NMISS N; run; */

/* Set categorical variables to numeric */

data house;  
set house;
IF Alley = "Pave" THEN cAlley = 1;
IF Alley ^= "Pave" THEN cAlley = 0;
IF BldgType = "1Fam" OR "TwnhsE" THEN cBldgType = 1;
IF BldgType ^= "1Fam" OR "TwnhsE" THEN cBldgType = 1;
IF BsmtCond = "Ex" THEN cBsmtCond = 5;
IF BsmtCond = "Gd" THEN cBsmtCond = 4;
IF BsmtCond = "TA" THEN cBsmtCond = 3;
IF BsmtCond = "Fa" THEN cBsmtCond = 2;
IF BsmtCond = "NA" THEN cBsmtCond = 1;
IF BsmtCond = "Po" THEN cBsmtCond = 0;
IF BsmtCond ^="Ex" OR "Gd" OR "TA" OR "Fa" OR "NA" OR "Po" THEN cBsmtCond = 1; 
IF BsmtExposure = "Gd" THEN cBsmtExposure = 3;
IF BsmtExposure = "Av" THEN cBsmtExposure = 2;
IF BsmtExposure = "Mn" THEN cBsmtExposure = 1;
IF BsmtExposure = "No" THEN cBsmtExposure = 0;
IF BsmtExposure = "NA" THEN cBsmtExposure = 0;
IF BsmtExposure ^="Gd" OR "Av" OR "Mn" OR "No" OR "NA" THEN cBsmtExposure = 0; 
IF BsmtFinType1 = "GLQ" THEN cBsmtFinType1 = 5;
IF BsmtFinType1 = "Unf" THEN cBsmtFinType1 = 4;
IF BsmtFinType1 = "ALQ" THEN cBsmtFinType1 = 3;
IF BsmtFinType1 = "BLQ" THEN cBsmtFinType1 = 2;
IF BsmtFinType1 = "Rec" THEN cBsmtFinType1 = 2;
IF BsmtFinType1 = "LwQ" THEN cBsmtFinType1 = 2;
IF BsmtFinType1 = "NA" THEN cBsmtFinType1 = 1;
IF BsmtFinType1 ^="GLQ" OR "Unf" OR "ALQ" OR "BLQ" OR "Rec" OR "LwQ" OR "NA" THEN cBsmtFinType1 = 1; 
IF BsmtFinType2 = "GLQ" THEN cBsmtFinType2 = 6;
IF BsmtFinType2 = "Unf" THEN cBsmtFinType2 = 5;
IF BsmtFinType2 = "ALQ" THEN cBsmtFinType2 = 4;
IF BsmtFinType2 = "Rec" THEN cBsmtFinType2 = 3;
IF BsmtFinType2 = "LwQ" THEN cBsmtFinType2 = 3;
IF BsmtFinType2 = "BLQ" THEN cBsmtFinType2 = 2;
IF BsmtFinType2 = "NA" THEN cBsmtFinType2 = 1;
IF BsmtFinType2 ^="GLQ" OR "Unf" OR "ALQ" OR "BLQ" OR "Rec" OR "LwQ" OR "NA" THEN cBsmtFinType2 = 1;
IF BsmtQual = "Ex" THEN cBsmtQual = 5;
IF BsmtQual = "Gd" THEN cBsmtQual = 4;
IF BsmtQual = "TA" THEN cBsmtQual = 3;
IF BsmtQual = "Fa" THEN cBsmtQual = 2;
IF BsmtQual = "Po" THEN cBsmtQual = 1;
IF BsmtQual = "NA" THEN cBsmtQual = 0;
IF BsmtQual ^="Ex" OR "Gd" OR "TA" OR "Fa" OR "Po" OR "NA" THEN cBsmtQual = 0;
IF CentralAir = "Y" THEN cCentralAir = 1;
IF CentralAir ^= "Y" THEN cCentralAir = 0;
IF Condition1 = "PosN" OR "PosA" THEN cCondition1 = 1;
IF Condition1 ^= "PosN" OR "PosA" THEN cCondition1 = 0;
IF Condition2 = "PosN" OR "PosA" THEN cCondition2 = 1;
IF Condition2 ^= "PosN" OR "PosA" THEN cCondition2 = 0;
IF Electrical = "SBrkr" THEN cElectrical = 1;
IF Electrical ^= "SBrkr" THEN cElectrical = 0;
IF ExterCond = "Ex" THEN cExterCond = 5;
IF ExterCond = "Gd" THEN cExterCond = 4;
IF ExterCond = "TA" THEN cExterCond = 3;
IF ExterCond = "Fa" THEN cExterCond = 2;
IF ExterCond = "Po" THEN cExterCond = 1;
IF ExterQual = "Ex" THEN cExterQual = 5;
IF ExterQual = "Gd" THEN cExterQual = 4;
IF ExterQual = "TA" THEN cExterQual = 3;
IF ExterQual = "Fa" THEN cExterQual = 2;
IF ExterQual = "Po" THEN cExterQual = 1;
IF Fence = "GdPrv" THEN cFence = 2;
IF Fence = "MnPrv" THEN cFence = 1;
IF Fence = "GdWo" THEN cFence = 2;
IF Fence = "MnWw" THEN cFence = 1;
IF Fence = "NA" THEN cFence = 0;
IF FireplaceQu = "Ex" THEN cFireplaceQu = 5;
IF FireplaceQu = "Gd" THEN cFireplaceQu = 4;
IF FireplaceQu = "TA" THEN cFireplaceQu = 3;
IF FireplaceQu = "Fa" THEN cFireplaceQu = 2;
IF FireplaceQu = "Po" THEN cFireplaceQu = 1;
IF FireplaceQu = "NA" THEN cFireplaceQu = 0;
IF Foundation = "PConc" THEN cFoundation = 1;
IF Foundation = "BrkTil" THEN cFoundation = 0;
IF Foundation = "CBlock" THEN cFoundation = 0;
IF Foundation = "Slab" THEN cFoundation = 0;
IF Foundation = "Stone" THEN cFoundation = 0;
IF Foundation = "Wood" THEN cFoundation = 0;
IF Functional = "Typ" THEN cFunctional = 0;
IF Functional = "Mod" THEN cFunctional = 2;
IF Functional = "Min1" THEN cFunctional = 1;
IF Functional = "Min2" THEN cFunctional = 1;
IF Functional = "NA" THEN cFunctional = 2;
IF Functional = "Maj1" THEN cFunctional = 3;
IF Functional = "Maj2" THEN cFunctional = 4;
IF Functional = "Sev" THEN cFunctional = 5;
IF Functional = "Sal" THEN cFunctional = 6;
IF GarageCond = "Ex" THEN cGarageCond = 5;
IF GarageCond = "Gd" THEN cGarageCond = 4;
IF GarageCond = "TA" THEN cGarageCond = 3;
IF GarageCond = "Fa" THEN cGarageCond = 2;
IF GarageCond = "Po" THEN cGarageCond = 1;
IF GarageCond = "NA" THEN cGarageCond = 0;
IF GarageCond ^= "Ex" OR "Gd" OR "TA" OR "Fa" OR "Po" OR "NA" THEN cGarageCond = 0; 
IF GarageFinish = "Fin" OR "RFn" THEN cGarageFinish = 1;
IF GarageFinish ^= "Fin" OR "RFn" THEN cGarageFinish = 0;
IF GarageQual = "Ex" THEN cGarageQual = 5;
IF GarageQual = "Gd" THEN cGarageQual = 4;
IF GarageQual = "TA" THEN cGarageQual = 3;
IF GarageQual = "Fa" THEN cGarageQual = 2;
IF GarageQual = "Po" THEN cGarageQual = 1;
IF GarageQual = "NA" THEN cGarageQual = 0;
IF GarageQual ^= "Ex" OR "Gd" OR "TA" OR "Fa" OR "Po" OR "NA" THEN cGarageQual = 0;
IF GarageType = "Attchd" THEN cGarageType = 1;
IF GarageType = "BuiltIn" THEN cGarageType = 1;
IF GarageType = "2Types" THEN cGarageType = 0;
IF GarageType = "Basment" THEN cGarageType = 0;
IF GarageType = "CarPort" THEN cGarageType = 0;
IF GarageType = "Detchd" THEN cGarageType = 0;
IF GarageType = "NA" THEN cGarageType = 0;
IF Heating = "GasA" THEN cHeating = 1;
IF Heating = "GasW" THEN cHeating = 1;
IF Heating = "Floor" THEN cHeating = 0;
IF Heating = "Grav" THEN cHeating = 0;
IF Heating = "OthW" THEN cHeating = 0;
IF Heating = "Wall" THEN cHeating = 0;
IF HeatingQC = "Ex" THEN cHeatingQC = 5;
IF HeatingQC = "Gd" THEN cHeatingQC = 4;
IF HeatingQC = "TA" THEN cHeatingQC = 3;
IF HeatingQC = "Fa" THEN cHeatingQC = 2;
IF HeatingQC = "Po" THEN cHeatingQC = 1;
IF KitchenQual = "Ex" THEN cKitchenQual = 5;
IF KitchenQual = "Gd" THEN cKitchenQual = 4;
IF KitchenQual = "TA" THEN cKitchenQual = 3;
IF KitchenQual = "Fa" THEN cKitchenQual = 2;
IF KitchenQual = "Po" THEN cKitchenQual = 1;
IF KitchenQual = "NA" THEN cKitchenQual = 3;
IF LandContour = "Lvl" THEN cLandContour = 1;
IF LandContour = "Bnk" THEN cLandContour = 0;
IF LandContour = "HLS" THEN cLandContour = 0;
IF LandContour = "Low" THEN cLandContour = 0;
IF LandSlope = "Gtl" THEN cLandSlope = 1;
IF LandSlope = "Mod" THEN cLandSlope = 0;
IF LandSlope = "Sev" THEN cLandSlope = 0;
IF LotConfig = "CulDSac" THEN cLotConfig = 1;
IF LotConfig = "FR3" THEN cLotConfig = 1;
IF LotConfig = "Inside" THEN cLotConfig = 0;
IF LotConfig = "Corner" THEN cLotConfig = 0;
IF LotConfig = "FR2" THEN cLotConfig = 0;
IF LotShape = "Reg" THEN cLotShape = 1;
IF LotShape = "IR1" THEN cLotShape = 0;
IF LotShape = "IR2" THEN cLotShape = 0;
IF LotShape = "IR3" THEN cLotShape = 0;
IF MasVnrType = "BrkFace" OR "Stone" OR "BrkCmn" OR "CBlock" THEN cMasVnrType = 1;
IF MasVnrType ^= "BrkFace" OR "Stone" OR "BrkCmn" OR "CBlock" THEN cMasVnrType = 0;
IF MiscFeature = "TenC" THEN cMiscFeature = 1;
IF MiscFeature = "Elev" THEN cMiscFeature = 0;
IF MiscFeature = "Gar2" THEN cMiscFeature = 0;
IF MiscFeature = "Othr" THEN cMiscFeature = 0;
IF MiscFeature = "Shed" THEN cMiscFeature = 0;
IF MiscFeature = "NA" THEN cMiscFeature = 0;
IF MSSubClass = 20 THEN cMSSubClass = 1; 
IF MSSubClass = 30 THEN cMSSubClass = 0; 
IF MSSubClass = 40 THEN cMSSubClass = 0; 
IF MSSubClass = 45 THEN cMSSubClass = 0; 
IF MSSubClass = 50 THEN cMSSubClass = 0; 
IF MSSubClass = 60 THEN cMSSubClass = 1; 
IF MSSubClass = 70 THEN cMSSubClass = 0; 
IF MSSubClass = 75 THEN cMSSubClass = 0; 
IF MSSubClass = 80 THEN cMSSubClass = 0; 
IF MSSubClass = 85 THEN cMSSubClass = 0; 
IF MSSubClass = 90 THEN cMSSubClass = 0; 
IF MSSubClass = 120 THEN cMSSubClass = 1; 
IF MSSubClass = 150 THEN cMSSubClass = 0; 
IF MSSubClass = 160 THEN cMSSubClass = 0; 
IF MSSubClass = 180 THEN cMSSubClass = 0; 
IF MSSubClass = 190 THEN cMSSubClass = 0; 
IF MSZoning = "FV" THEN cMSZoning = 4;
IF MSZoning = "RL" THEN cMSZoning = 3;
IF MSZoning = "RP" THEN cMSZoning = 3;
IF MSZoning = "RH" THEN cMSZoning = 2;
IF MSZoning = "RM" THEN cMSZoning = 2;
IF MSZoning = "NA" THEN cMSZoning = 2;
IF MSZoning = "A" THEN cMSZoning = 1;
IF MSZoning = "C (all)" THEN cMSZoning = 1;
IF MSZoning = "I" THEN cMSZoning = 1;
IF MSZoning ^= "FV" OR "RL" OR "RP" OR "RH" OR "RM" OR "NA" OR "A" OR "C (all)" OR "I" THEN cMSZoning = 1;
IF PavedDrive = "Y" THEN cPavedDrive = 1;
IF PavedDrive ^= "Y" THEN cPavedDrive = 0;
IF PoolQC = "Ex" THEN cPoolQC = 1;
IF PoolQC = "Gd" THEN cPoolQC = 0;
IF PoolQC = "TA" THEN cPoolQC = 0;
IF PoolQC = "Fa" THEN cPoolQC = 0;
IF PoolQC = "NA" THEN cPoolQC = 0;
IF RoofMatl = "Membran" THEN cRoofMatl = 1;
IF RoofMatl = "WdShake" THEN cRoofMatl = 1;
IF RoofMatl = "WdShngl" THEN cRoofMatl = 1;
IF RoofMatl = "ClyTile" THEN cRoofMatl = 0;
IF RoofMatl = "CompShg" THEN cRoofMatl = 0;
IF RoofMatl = "Metal" THEN cRoofMatl = 0;
IF RoofMatl = "Roll" THEN cRoofMatl = 0;
IF RoofMatl = "Tar&Grv" THEN cRoofMatl = 0;
IF RoofStyle = "Hip" THEN cRoofStyle = 1;
IF RoofStyle = "Shed" THEN cRoofStyle = 1;
IF RoofStyle = "Flat" THEN cRoofStyle = 0;
IF RoofStyle = "Gable" THEN cRoofStyle = 0;
IF RoofStyle = "Gambrel" THEN cRoofStyle = 0;
IF RoofStyle = "Mansard" THEN cRoofStyle = 0;
IF SaleCondition = "Partial" THEN cSaleCondition = 4;
IF SaleCondition = "Normal" THEN cSaleCondition = 3;
IF SaleCondition = "Alloca" THEN cSaleCondition = 3;
IF SaleCondition = "Abnorml" THEN cSaleCondition = 2;
IF SaleCondition = "Family" THEN cSaleCondition = 2;
IF SaleCondition = "AdjLand" THEN cSaleCondition = 1;
IF SaleType = "New" THEN cSaleType = 5;
IF SaleType = "Con" THEN cSaleType = 5;
IF SaleType = "CWD" THEN cSaleType = 4;
IF SaleType = "ConLI" THEN cSaleType = 4;
IF SaleType = "WD" THEN cSaleType = 3;
IF SaleType = "NA" THEN cSaleType = 3;
IF SaleType = "VWD" THEN cSaleType = 3;
IF SaleType = "COD" THEN cSaleType = 2;
IF SaleType = "ConLw" THEN cSaleType = 2;
IF SaleType = "ConLD" THEN cSaleType = 2;
IF SaleType = "Oth" THEN cSaleType = 1;
IF Street = "Pave" THEN cStreet = 1;
IF Street = "Grvl" THEN cStreet = 0;
IF Utilities = "AllPub" THEN cUtilities = 1;
IF Utilities = "NoSewr" THEN cUtilities = 0;
IF Utilities = "NoSeWa" THEN cUtilities = 0;
IF Utilities = "ELO" THEN cUtilities = 0;
IF Utilities = "NA" THEN cUtilities = 0;
RUN; 	
 	

/* Clean up Lot Frontage missing values */
data house;
   set house;
   array change _numeric_;
        do over change;
            if LotFrontage=. then LotFrontage=LotArea*0.0078;
        end;
 run ;
 
 /* Clean up missing values  */ 
/* Replace Garage Year Built missing values with House Year Built  */ 
data house;
   set house;
   array change _numeric_;
        do over change;
            if GarageYrBlt=. then GarageYrBlt=YearBuilt;
        end;
 run ;

/* Replace missing masonry veneer area with zero  */ 
data house;
   set house;
   array change _numeric_;
        do over change;
            if MasVnrArea=. then MasVnrArea=0;
        end;
 run ;
 
 /* Replace missing values  */ 
data house;
   set house;
   array change _numeric_;
        do over change;
            if BsmtFinSF1=. then BsmtFinSF1=0;
            if BsmtFinSF2=. then BsmtFinSF2=0;
            if BsmtUnfSF=. then BsmtUnfSF=0;
            if TotalBsmtSF=. then TotalBsmtSF=0;
            if BsmtFullBath=. then BsmtFullBath=0;
            if BsmtHalfBath=. then BsmtHalfBath=0;
            if GarageCars=. then GarageCars=0;
            if GarageArea=. then GarageArea=0;
        end;
run ;
 
/* We were trying to do some special things with these fields such as divide by averages, but had to revert to rank values  */
data house;  
set house;
IF Neighborhood="NoRidge" THEN cNeighborhood = 1;
IF Neighborhood="NridgHt" THEN cNeighborhood = 1;
IF Neighborhood="StoneBr" THEN cNeighborhood = 1;
IF Neighborhood^="StoneBr" OR "NridgHt" OR "NoRidge" THEN cNeighborhood = 0;

IF Exterior1st="ImStucc" THEN cExterior1st = 2;
IF Exterior1st="Stone" THEN cExterior1st = 2;
IF Exterior1st="CemntBd" THEN cExterior1st = 2;
IF Exterior1st="VinylSd" THEN cExterior1st = 2;
IF Exterior1st="BrkFace" THEN cExterior1st = 2;
IF Exterior1st="Plywood" THEN cExterior1st = 1;
IF Exterior1st="HdBoard" THEN cExterior1st = 1;
IF Exterior1st="Stucco" THEN cExterior1st = 1;
IF Exterior1st="NA" THEN cExterior1st = 0;
IF Exterior1st="WdShing" THEN cExterior1st = 1;
IF Exterior1st="Wd Sdng" THEN cExterior1st = 1;
IF Exterior1st="MetalSd" THEN cExterior1st = 1;
IF Exterior1st="AsbShng" THEN cExterior1st = 0;
IF Exterior1st="CBlock" THEN cExterior1st = 0;
IF Exterior1st="AsphShn" THEN cExterior1st = 0;
IF Exterior1st="BrkComm" THEN cExterior1st = 0;

IF Exterior2nd="Other" THEN cExterior2nd = 2;
IF Exterior2nd="ImStucc" THEN cExterior2nd = 2;
IF Exterior2nd="Stone" THEN cExterior2nd = 1;
IF Exterior2nd="CmentBd" THEN cExterior2nd = 2;
IF Exterior2nd="VinylSd" THEN cExterior2nd = 2;
IF Exterior2nd="BrkFace" THEN cExterior2nd = 2;
IF Exterior2nd="Plywood" THEN cExterior2nd = 1;
IF Exterior2nd="HdBoard" THEN cExterior2nd = 1;
IF Exterior2nd="Stucco" THEN cExterior2nd = 1;
IF Exterior2nd="WdShing" THEN cExterior2nd = 1;
IF Exterior2nd="Wd Shng" THEN cExterior2nd = 1;
IF Exterior2nd="Wd Sdng" THEN cExterior2nd = 1;
IF Exterior2nd="MetalSd" THEN cExterior2nd = 1;
IF Exterior2nd="Wd Sdng" THEN cExterior2nd = 1;
IF Exterior2nd="NA" THEN cExterior2nd = 1;
IF Exterior2nd="AsphShn" THEN cExterior2nd = 1;
IF Exterior2nd="AsbShng" THEN cExterior2nd = 1;
IF Exterior2nd="CBlock" THEN cExterior2nd = 1;
IF Exterior2nd="AsphShn" THEN cExterior2nd = 1;
IF Exterior2nd="Brk Cmn" THEN cExterior2nd = 1;

IF HouseStyle="2.5Fin" THEN cHouseStyle = 220000/100000;
IF HouseStyle="2Story" THEN cHouseStyle = 210051/100000;
IF HouseStyle="1Story" THEN cHouseStyle = 175985/100000;
IF HouseStyle="SLvl" THEN cHouseStyle = 166703/100000;
IF HouseStyle="2.5Unf" THEN cHouseStyle = 157354/100000;
IF HouseStyle="1.5Fin" THEN cHouseStyle = 143116/100000;
IF HouseStyle="SFoyer" THEN cHouseStyle = 135074/100000;
IF HouseStyle="1.5Unf" THEN cHouseStyle = 110150/100000;
RUN;


/* Nice little check sum to see that our data has values */
/* proc means data=house NMISS N; run;  */

/* Create new correlated variables */
data house;  
set house;
BRBR = log(((FullBath + HalfBath)+1) / (1+BedroomAbvGr));
GLARooms = log(1+(GrLivArea / TotRmsAbvGrd));
GQGC = log(1+(cGarageQual * GarageCars));
/*  GRGR = GrLivArea Placeholder for code below instead of using ALTER TABLE ADD */  
OQEC = log(1+(OverallQual * cExterCond));
OQFB  = log(1+(OverallQual * FullBath));
OQGLA = log(1+(OverallQual * GrLivArea));
OQTBSF = log(1+(OverallQual * TotalBsmtSF));
OQYB = log(1+(OverallQual * YearBuilt));
OQYR = log(1+(OverallQual * YearRemodAdd));
RUN;
/* GRGR Correlated variable based on macro variable (GrLivArea / mean(GrLivArea))  */ 
PROC SQL noprint; 
ALTER TABLE house ADD GRGR num informat=best32. format=best32.;
SELECT mean(GrLivArea) INTO :n FROM house;
UPDATE house SET GRGR=log(1+(GrLivArea/&n));
QUIT;

/* Clear out the unused variables   */
proc sql noprint;
ALTER TABLE house DROP COLUMN Alley, BldgType, BsmtCond, BsmtExposure, BsmtFinType1, BsmtFinType2, BsmtQual, CentralAir,
Condition1, Condition2, Electrical, ExterCond,ExterQual,Fence,FireplaceQu,Foundation,Functional,GarageCond,GarageFinish,
GarageQual,GarageType,Heating,HeatingQC,KitchenQual,LandContour,LandSlope,LotConfig, LotShape,MasVnrType,MiscFeature,
MSSubClass, MSZoning,PavedDrive,PoolQC, RoofMatl, RoofStyle, SaleCondition, SaleType, Street, Utilities, Exterior1st, Exterior2nd,
HouseStyle, Neighborhood;
quit;

/* Take the logs of the continuous variables   */ 
data house;
set house;
logSalePrice = log(1+SalePrice);
logX1stFlrSF = log(1+X1stFlrSF);
logX2ndFlrSF = log(1+X2ndFlrSF);
logX3SsnPorch = log(1+X3SsnPorch);
logBsmtFinSF1 = log(1+BsmtFinSF1);
logBsmtFinSF2 = log(1+BsmtFinSF2);
logBsmtUnfSF = log(1+BsmtUnfSF);
logEnclosedPorch = log(1+EnclosedPorch);
logGarageArea = log(1+GarageArea);
logGrLivArea = log(1+GrLivArea);
logLotArea = log(1+LotArea);
logLotFrontage = log(1+LotFrontage);
logLowQualFinSF = log(1+LowQualFinSF);
logMasVnrArea = log(1+MasVnrArea);
logMiscVal = log(1+MiscVal);
logOpenPorchSF = log(1+OpenPorchSF);
logPoolArea = log(1+PoolArea);
logScreenPorch = log(1+ScreenPorch);
logTotalBsmtSF = log(1+ScreenPorch);
logWoodDeckSF = log(1+WoodDeckSF);
logYear=log(YearBuilt);
logYrRemod = log(YearRemodAdd);
run;

/* Normalize years  */
data house;
set house;
YrSold = 2010-YrSold;
run;
  
/* proc means data=house NMISS N; */


/* We ended up addressing a few more last minute outliers and also stacking terms here  */ 
data house_out;
set house;
if GrLivArea=5642 then delete;
if GrLivArea=4676 then delete;
if LotArea=159000 then delete;
if LotArea=215245 then delete;
if LotArea=164660 then delete;
if LotArea=115149 then delete;
if TotalBsmtSF=6110 then delete;
sqOverallCond=OverallCond**2;
sqGarageCars=GarageCars**2;
sqYearBuilt=logLotArea**2;/*what is this*/
stot=(logGrLivArea+cFunctional)**2;
ctot=(logGrLivArea+cFunctional)**3;
run;
/*My method
ods graphics on;                                                                                                                                                                                                   
proc glmselect data=house_out                                                                                                                                                                 
               seed=1 plots(stepAxis=number)=(criterionPanel ASEPlot CRITERIONPANEL);                                                                                                                              
model logSalePrice = OverallQual logYear logYrRemod MasVnrArea BsmtFinSF1 BsmtFinSF1 BsmtFinSF2 BsmtFullBath KitchenAbvGr Fireplaces 
WoodDeckSF EnclosedPorch YrSold cBsmtExposure cBsmtQual cCentralAir cExterQual cFoundation cFunctional|cCentralAir 
cHeatingQC cKitchenQual cMSZoning cPavedDrive cSaleCondition cStreet cNeighborhood cExterior1st cExterior2nd logBsmtFinSF1 
logBsmtFinSF2 X1stFlrSF stot logGarageArea logLotArea logLowQualFinSF logScreenPorch BRBR GQGC OQTBSF GRGR sqGarageCars
cExterior1st|MasVnrArea/
 selection=LASSO(choose=CV stop=CV) CVdetails;                                                                                                                    
run;                                                                                                                                                                                                               
quit;                                                                                                                                                                                                
ods graphics off;                 
*/

proc glm data=house_out plots=all;
model logSalePrice = OverallQual OQYB|OverallCond OQYR|OverallCond YearRemodAdd MasVnrArea OQYR|BsmtFinSF1 OQYB|BsmtFinSF1 BsmtFinSF2
BsmtFullBath KitchenAbvGr Fireplaces WoodDeckSF EnclosedPorch YrSold cBsmtExposure cBsmtQual cCentralAir OQYR|cExterCond 
cExterQual cFoundation cFunctional|cCentralAir cHeatingQC cKitchenQual cMSZoning cPavedDrive cSaleCondition cStreet cNeighborhood 
cExterior1st cExterior2nd logBsmtFinSF1 logBsmtUnfSF X1stFlrSF logGarageArea logLotArea logLowQualFinSF logScreenPorch BRBR GQGC 
OQTBSF GRGR sqGarageCars cExterior1st|MasVnrArea
/solution cli clparm; 
output out=results6 predicted=logpredict;
run;

/* Model output code block. Cut paste variables from your testing output into the model below  */
/*proc glm data=house_out plots=all;
model logSalePrice = 
OverallQual OQYB|OverallCond OQYR|OverallCond YearBuilt YearRemodAdd MasVnrArea OQYB|BsmtFinSF1 OQYR|BsmtFinSF1 BsmtFinSF2 
BsmtFullBath KitchenAbvGr Fireplaces 
WoodDeckSF EnclosedPorch YrSold cBsmtExposure cBsmtQual cCentralAir OQYB|cExterCond OQYR|cExterCond cExterQual cFoundation 
cFunctional|cCentralAir 
cHeatingQC cKitchenQual cMSZoning cPavedDrive cSaleCondition cStreet cNeighborhood cExterior1st cExterior2nd logBsmtFinSF1 
logBsmtFinSF2 logBsmtUnfSF X1stFlrSF stot ctot logGarageArea logLotArea logLowQualFinSF logScreenPorch BRBR GQGC OQTBSF GRGR 
sqGarageCars
cExterior1st|MasVnrArea
/solution cli clparm; 
output out=results predicted=logpredict;
run;*/
data kaggle_out (KEEP=id SalePrice);
   set results6;
   array change _numeric_;
        do over change;
            if SalePrice=. then SalePrice=exp(logpredict);
        end;
 run ;

/* Clean up for Kaggle formatted output   */
proc sql noprint;
DELETE FROM kaggle_out WHERE ID<1461;
quit;

proc print data=kaggle_out;run;

/* Export to file */
proc export data=kaggle_out 
outfile='/home/mpednekar0/final.csv'             
dbms=csv replace; 
delimiter=',';
run;









 

