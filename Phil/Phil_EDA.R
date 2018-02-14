
train <- read.csv("C:/Users/flip/Desktop/SMU/MSDS6371/group project/train.csv", stringsAsFactors=FALSE)
test <- read.csv("C:/Users/flip/Desktop/SMU/MSDS6371/group project/test.csv", stringsAsFactors=FALSE)

names(train)

library(DT)
datatable(head(train, n=20),options = list(scrollX = TRUE))

library(VIM)
aggr(train, prop = F, numbers = T)

apply(is.na(train),2,sum)

#Outlier removal
train <- train [!(train$GrLivArea > 4000),]

library(dplyr)
summarize(group_by(train, cAlley), mean(SalePrice, na.rm=T))
train$cAlley[train$Alley %in% c("Pave")] <- 1
train$cAlley[!train$Alley %in% c("Pave")] <- 0
summarize(group_by(train, cAlley), mean(SalePrice, na.rm=T))

table(train$BldgType)
train$cBldgType[train$BldgType %in% c("1Fam", "TwnhsE")] <- 1
train$cBldgType[!train$BldgType %in% c("1Fam", "TwnhsE")] <- 0
table(train$cBldgType)

summarize(group_by(train, BsmtCond), mean(SalePrice, na.rm=T))
train$cBsmtCond[train$BsmtCond == "Ex"] <- 5
train$cBsmtCond[train$BsmtCond == "Gd"] <- 4
train$cBsmtCond[train$BsmtCond == "TA"] <- 3
train$cBsmtCond[train$BsmtCond == "Fa"] <- 2
train$cBsmtCond[is.na(train$BsmtCond)] <- 1
train$cBsmtCond[train$BsmtCond == "Po"] <- 0
summarize(group_by(train, cBsmtCond), mean(SalePrice, na.rm=T))

summarize(group_by(train, BsmtExposure), mean(SalePrice, na.rm=T))
train$cBsmtExposure[train$BsmtExposure == "Gd"] <- 3
train$cBsmtExposure[train$BsmtExposure == "Av"] <- 2
train$cBsmtExposure[train$BsmtExposure == "Mn"] <- 1
train$cBsmtExposure[train$BsmtExposure == "No"] <- 0
train$cBsmtExposure[is.na(train$BsmtExposure)] <- 0
summarize(group_by(train, cBsmtExposure), mean(SalePrice, na.rm=T))

summarize(group_by(train, BsmtFinType1), mean(SalePrice, na.rm=T))
train$cBsmtFinType1[train$BsmtFinType1 == "GLQ"] <- 5
train$cBsmtFinType1[train$BsmtFinType1 == "Unf"] <- 4
train$cBsmtFinType1[train$BsmtFinType1 == "ALQ"] <- 3
train$cBsmtFinType1[train$BsmtFinType1 %in% c("BLQ", "Rec", "LwQ")] <- 2
train$cBsmtFinType1[is.na(train$BsmtFinType1)] <- 1
summarize(group_by(train, cBsmtFinType1), mean(SalePrice, na.rm=T))

summarize(group_by(train, BsmtFinType2), mean(SalePrice, na.rm=T))
train$cBsmtFinType2[train$BsmtFinType2 == "GLQ"] <- 6
train$cBsmtFinType2[train$BsmtFinType2 == "Unf"] <- 5
train$cBsmtFinType2[train$BsmtFinType2 == "ALQ"] <- 4
train$cBsmtFinType2[train$BsmtFinType2 %in% c("Rec", "LwQ")] <- 3
train$cBsmtFinType2[train$BsmtFinType2 == "BLQ"] <- 2
train$cBsmtFinType2[is.na(train$BsmtFinType2)] <- 1
summarize(group_by(train, cBsmtFinType2), mean(SalePrice, na.rm=T))

summarize(group_by(train, BsmtQual), mean(SalePrice, na.rm=T))
train$cBsmtQual[train$BsmtQual == "Ex"] <- 5
train$cBsmtQual[train$BsmtQual == "Gd"] <- 4
train$cBsmtQual[train$BsmtQual == "TA"] <- 3
train$cBsmtQual[train$BsmtQual == "Fa"] <- 2
train$cBsmtQual[train$BsmtQual == "Po"] <- 1
train$cBsmtQual[is.na(train$BsmtQual)] <- 0
summarize(group_by(train, cBsmtQual), mean(SalePrice, na.rm=T))

summarize(group_by(train, CentralAir), mean(SalePrice, na.rm=T))
train$cCentralAir[train$CentralAir == "Y"] <- 1
train$cCentralAir[train$CentralAir == "N"] <- 0
summarize(group_by(train, cCentralAir), mean(SalePrice, na.rm=T))

table(train$Condition1)
train$Condition1[train$Condition1 %in% c("PosA", "PosN")] <- 1
train$Condition1[!train$Condition1 %in% c("PosA", "PosN")] <- 0
table(train$cCondition1)

table(train$Condition2)
train$cCondition2 [train$Condition2 %in% c("PosA", "PosN")] <- 1
train$cCondition2 [!train$Condition2 %in% c("PosA", "PosN")] <- 0
table(train$cCondition2)

summarize(group_by(train, Electrical), mean(SalePrice, na.rm=T))
train$cElectrical[train$Electrical == "SBrkr" | is.na(train$Electrical)] <- 1
train$cElectrical[!train$Electrical == "SBrkr" & !is.na(train$Electrical)] <- 0
summarize(group_by(train, cElectrical), mean(SalePrice, na.rm=T))

summarize(group_by(train, ExterCond), mean(SalePrice, na.rm=T))
train$cExterCond[train$ExterCond == "Ex"] <- 5
train$cExterCond[train$ExterCond == "Gd"] <- 4
train$cExterCond[train$ExterCond == "TA"] <- 3
train$cExterCond[train$ExterCond == "Fa"] <- 2
train$cExterCond[train$ExterCond == "Po"] <- 1
summarize(group_by(train, cExterCond), mean(SalePrice, na.rm=T))

summarize(group_by(train, ExterQual), mean(SalePrice, na.rm=T))
train$cExterQual[train$ExterQual == "Ex"] <- 5
train$cExterQual[train$ExterQual == "Gd"] <- 4
train$cExterQual[train$ExterQual == "TA"] <- 3
train$cExterQual[train$ExterQual == "Fa"] <- 2
train$cExterQual[train$ExterQual == "Po"] <- 1
summarize(group_by(train, cExterQual), mean(SalePrice, na.rm=T))

summarize(group_by(train, Fence), mean(SalePrice, na.rm=T))
train$cFence[train$Fence %in% c("GdPrv", "GdWo")] <- 2
train$cFence[train$Fence %in% c("MnPrv", "MnWw")] <- 1
train$cFence[is.na(train$Fence)] <- 0
summarize(group_by(train, cFence), mean(SalePrice, na.rm=T))

summarize(group_by(train, FireplaceQu), mean(SalePrice, na.rm=T))
train$cFireplaceQu[train$FireplaceQu == "Ex"] <- 5
train$cFireplaceQu[train$FireplaceQu == "Gd"] <- 4
train$cFireplaceQu[train$FireplaceQu == "TA"] <- 3
train$cFireplaceQu[train$FireplaceQu == "Fa"] <- 2
train$cFireplaceQu[train$FireplaceQu == "Po"] <- 1
train$cFireplaceQu[is.na(train$FireplaceQu)] <- 0
summarize(group_by(train, cFireplaceQu), mean(SalePrice, na.rm=T))

summarize(group_by(train, Foundation), mean(SalePrice, na.rm=T))
train$cFoundation[train$Foundation == "PConc"] <- 1
train$cFoundation[train$Foundation != "PConc"] <- 0
summarize(group_by(train, cFoundation), mean(SalePrice, na.rm=T))

summarize(group_by(train, Functional), mean(SalePrice, na.rm=T))
train$cFunctional[train$Functional %in% c("Sal")] <- 6
train$cFunctional[train$Functional %in% c("Sev")] <- 5
train$cFunctional[train$Functional %in% c("Maj2")] <- 4
train$cFunctional[train$Functional %in% c("Maj1")] <- 3
train$cFunctional[train$Functional %in% c("Mod") | is.na(train$Functional)] <- 2
train$cFunctional[train$Functional %in% c("Min1", "Min2")] <- 1
train$cFunctional[train$Functional %in% c("Typ")] <- 0
summarize(group_by(train, cFunctional), mean(SalePrice, na.rm=T))

summarize(group_by(train, GarageCond), mean(SalePrice, na.rm=T))
train$cGarageCond[train$GarageCond == "Ex"] <- 5
train$cGarageCond[train$GarageCond == "Gd"] <- 4
train$cGarageCond[train$GarageCond == "TA"] <- 3
train$cGarageCond[train$GarageCond == "Fa"] <- 2
train$cGarageCond[train$GarageCond == "Po"] <- 1
train$cGarageCond[is.na(train$GarageCond)] <- 0
summarize(group_by(train, cGarageCond), mean(SalePrice, na.rm=T))

summarize(group_by(train, GarageFinish), mean(SalePrice, na.rm=T))
train$cGarageFinish[train$GarageFinish %in% c("Fin", "RFn")] <- 1
train$cGarageFinish[!train$GarageFinish %in% c("Fin", "RFn")] <- 0
summarize(group_by(train, cGarageFinish), mean(SalePrice, na.rm=T))

summarize(group_by(train, GarageQual), mean(SalePrice, na.rm=T))
train$cGarageQual[train$GarageQual == "Ex"] <- 5
train$cGarageQual[train$GarageQual == "Gd"] <- 4
train$cGarageQual[train$GarageQual == "TA"] <- 3
train$cGarageQual[train$GarageQual == "Fa"] <- 2
train$cGarageQual[train$GarageQual == "Po"] <- 1
train$cGarageQual[is.na(train$GarageQual)] <- 0
summarize(group_by(train, cGarageQual), mean(SalePrice, na.rm=T))

summarize(group_by(train, GarageType), mean(SalePrice, na.rm=T))
train$cGarageType[train$GarageType %in% c("Attchd", "BuiltIn")] <- 1
train$cGarageType[!train$GarageType %in% c("Attchd", "BuiltIn")] <- 0
summarize(group_by(train, cGarageType), mean(SalePrice, na.rm=T))

summarize(group_by(train, Heating), mean(SalePrice, na.rm=T))
train$cHeating[train$Heating %in% c("GasA", "GasW")] <- 1
train$cHeating[!train$Heating %in% c("GasA", "GasW")] <- 0
summarize(group_by(train, cHeating), mean(SalePrice, na.rm=T))

summarize(group_by(train, HeatingQC), mean(SalePrice, na.rm=T))
train$cHeatingQC[train$HeatingQC == "Ex"] <- 5
train$cHeatingQC[train$HeatingQC == "Gd"] <- 4
train$cHeatingQC[train$HeatingQC == "TA"] <- 3
train$cHeatingQC[train$HeatingQC == "Fa"] <- 2
train$cHeatingQC[train$HeatingQC == "Po"] <- 1
summarize(group_by(train, cHeatingQC), mean(SalePrice, na.rm=T))

summarize(group_by(train, KitchenQual), mean(SalePrice, na.rm=T))
train$cKitchenQual[train$KitchenQual == "Ex"] <- 5
train$cKitchenQual[train$KitchenQual == "Gd"] <- 4
train$cKitchenQual[train$KitchenQual == "TA"] <- 3
train$cKitchenQual[train$KitchenQual == "Fa"] <- 2
train$cKitchenQual[train$KitchenQual == "Po"] <- 1
train$cKitchenQual[is.na(train$KitchenQual)] <- 3
summarize(group_by(train, cKitchenQual), mean(SalePrice, na.rm=T))

table(train$LandContour)
train$cLandContour[train$LandContour == "Lvl"] <- 1
train$cLandContour[train$LandContour != "Lvl"] <- 0
table(train$cLandContour)

table(train$LandSlope)
train$cLandSlope[train$LandSlope == "Gtl"] <- 1
train$cLandSlope[train$LandSlope != "Gtl"] <- 0
table(train$cLandSlope)

summarize(group_by(train, LotConfig), mean(SalePrice, na.rm=T))
train$cLotConfig[train$LotConfig %in% c("CulDSac", "FR3")] <- 1
train$cLotConfig[!train$LotConfig %in% c("CulDSac", "FR3")] <- 0
summarize(group_by(train, cLotConfig), mean(SalePrice, na.rm=T))

table(train$LotShape)
train$cLotShape[train$LotShape == "Reg"] <- 1
train$cLotShape[train$LotShape != "Reg"] <- 0
table(train$cLotShape)

summarize(group_by(train, MasVnrType), mean(SalePrice, na.rm=T))
train$cMasVnrType[train$MasVnrType %in% c("Stone", "BrkFace") | is.na(train$MasVnrType)] <- 1
train$cMasVnrType[!train$MasVnrType %in% c("Stone", "BrkFace") & !is.na(train$MasVnrType)] <- 0
summarize(group_by(train, cMasVnrType), mean(SalePrice, na.rm=T))

summarize(group_by(train, MiscFeature), mean(SalePrice, na.rm=T))
train$cMiscFeature[train$MiscFeature %in% c("TenC")] <- 1
train$cMiscFeature[!train$MiscFeature %in% c("TenC")] <- 0
summarize(group_by(train, cMiscFeature), mean(SalePrice, na.rm=T))                  

summarize(group_by(train, MSSubClass), mean(SalePrice, na.rm=T))
train$cMSSubClass[train$MSSubClass %in% c("20", "60", "120")] <- 1
train$cMSSubClass[!train$MSSubClass %in% c("20", "60", "120")] <- 0
summarize(group_by(train, cMSSubClass), mean(SalePrice, na.rm=T))

summarize(group_by(train, MSZoning), mean(SalePrice, na.rm=T))
train$cMSZoning[train$MSZoning %in% c("FV")] <- 4
train$cMSZoning[train$MSZoning %in% c("RL","RP")] <- 3
train$cMSZoning[train$MSZoning %in% c("RH","RM")] <- 2
train$cMSZoning[train$MSZoning %in% c("C (all)","I")] <- 1
train$cMSZoning[is.na(train$MSZoning)] <- 2
summarize(group_by(train, cMSZoning), mean(SalePrice, na.rm=T))

summarize(group_by(train, PavedDrive), mean(SalePrice, na.rm=T))
train$paved_drive[train$PavedDrive == "Y"] <- 1
train$paved_drive[!train$PavedDrive != "Y"] <- 0
train$paved_drive[is.na(train$paved_drive)] <- 0
summarize(group_by(train, cPavedDrive), mean(SalePrice, na.rm=T))

summarize(group_by(train, PoolQC), mean(SalePrice, na.rm=T))
train$cPoolQC[train$PoolQC %in% c("Ex")] <- 1
train$cPoolQC[!train$PoolQC %in% c("Ex")] <- 0
summarize(group_by(train, cPoolQC), mean(SalePrice, na.rm=T))

summarize(group_by(train, RoofMatl), mean(SalePrice, na.rm=T))
train$cRoofMatl[train$RoofMatl %in% c("Membran", "WdShake", "WdShngl")] <- 1
train$cRoofMatl[!train$RoofMatl %in% c("Membran", "WdShake", "WdShngl")] <- 0
summarize(group_by(train, cRoofMatl), mean(SalePrice, na.rm=T))

summarize(group_by(train, RoofStyle),mean(SalePrice, na.rm=T))
train$cRoofStyle[train$RoofStyle %in% c("Hip", "Shed")] <- 1
train$cRoofStyle[!train$RoofStyle %in% c("Hip", "Shed")] <- 0
summarize(group_by(train, cRoofStyle),mean(SalePrice, na.rm=T))

summarize(group_by(train, SaleCondition), mean(SalePrice, na.rm=T))
train$cSaleCondition[train$SaleCondition %in% c("Partial")] <- 4
train$cSaleCondition[train$SaleCondition %in% c("Normal", "Alloca")] <- 3
train$cSaleCondition[train$SaleCondition %in% c("Family","Abnorml")] <- 2
train$cSaleCondition[train$SaleCondition %in% c("AdjLand")] <- 1
summarize(group_by(train, cSaleCondition), mean(SalePrice, na.rm=T))

summarize(group_by(train, SaleType), mean(SalePrice, na.rm=T))
train$cSaleType[train$SaleType %in% c("New", "Con")] <- 5
train$cSaleType[train$SaleType %in% c("CWD", "ConLI")] <- 4
train$cSaleType[train$SaleType %in% c("WD", "VWD", "NA")] <- 3
train$cSaleType[train$SaleType %in% c("COD", "ConLw", "ConLD")] <- 2
train$cSaleType[train$SaleType %in% c("Oth")] <- 1
summarize(group_by(train, cSaleType), mean(SalePrice, na.rm=T))

table(train$Street)
train$cStreet[train$Street == "Pave"] <- 1
train$cStreet[train$Street != "Pave"] <- 0
table(train$cStreet)

table(train$Utilities)
train$cUtilities[train$Utilities == "AllPub"] <- 1
train$cUtilities[train$Utilities != "AllPub"] <- 0
table(train$cUtilities)

summarize(group_by(train, Neighborhood), mean(SalePrice, na.rm=T))
train$cNeighborhood[train$Neighborhood %in% c("NoRidge", "NridgHt", "StoneBr")] <- 1
train$cNeighborhood[!train$Neighborhood %in% c("NoRidge", "NridgHt", "StoneBr")] <- 0
summarize(group_by(train, cNeighborhood), mean(SalePrice, na.rm=T))

summarize(group_by(train, Exterior1st), mean(SalePrice, na.rm=T))
train$cExterior1st[train$Exterior1st %in% c("ImStucc", "Stone", "CemntBd", "VinylSd", "BrkFace")] <- 2
train$cExterior1st[train$Exterior1st %in% c("Plywood", "HdBoard", "Stucco", "WdShing", "Wd Sdng", "MetalSd")] <- 1
train$cExterior1st[train$Exterior1st %in% c("AsbShng", "CBlock", "AsphShn", "BrkComm") | is.na(train$Exterior1st)] <- 0
summarize(group_by(train, cExterior1st), mean(SalePrice, na.rm=T))

summarize(group_by(train, Exterior2nd), mean(SalePrice, na.rm=T))
train$cExterior2nd[train$Exterior2nd %in% c("Other", "ImStucc", "CmentBd", "VinylSd", "BrkFace")] <- 2
train$cExterior2nd[!train$Exterior2nd %in% c("Other", "ImStucc", "CmentBd", "VinylSd", "BrkFace")] <- 1
summarize(group_by(train, cExterior2nd), mean(SalePrice, na.rm=T))

summarize(group_by(train, HouseStyle), mean(SalePrice, na.rm=T))
train$cHouseStyle[train$HouseStyle %in% c("2.5Fin")] <- 220000/100000
train$cHouseStyle[train$HouseStyle %in% c("2Story")] <- 210051/100000
train$cHouseStyle[train$HouseStyle %in% c("1Story")] <- 175985/100000
train$cHouseStyle[train$HouseStyle %in% c("SLvl")] <- 166703/100000
train$cHouseStyle[train$HouseStyle %in% c("2.5Unf")] <- 157354/100000
train$cHouseStyle[train$HouseStyle %in% c("1.5Fin")] <- 143116/100000
train$cHouseStyle[train$HouseStyle %in% c("SFoyer")] <- 135074/100000
train$cHouseStyle[train$HouseStyle %in% c("1.5Unf")] <- 110150/100000
summarize(group_by(train, cHouseStyle), mean(SalePrice, na.rm=T))

# Normalize year sold
table(train$YrSold)
train$YrSold <- (2010 - train$YrSold)
table(train$YrSold)

# Clean up missing values 
train$LotFrontage[is.na(train$LotFrontage)] <- (train$LotArea * 0.0078)
train$GarageYrBlt[is.na(train$GarageYrBlt)] <- train$YearBuilt
train$MasVnrArea[is.na(train$MasVnrArea)] <- 0
train$LotFrontage[is.na(train$LotFrontage)] <- 0
train$BsmtFinSF1[is.na(train$BsmtFinSF1)] <- 0
train$BsmtFinSF2[is.na(train$BsmtFinSF2)] <- 0
train$BsmtUnfSF[is.na(train$BsmtUnfSF)] <- 0
train$TotalBsmtSF[is.na(train$TotalBsmtSF)] <- 0
train$BsmtFullBath[is.na(train$BsmtFullBath)] <- 0
train$BsmtHalfBath[is.na(train$BsmtHalfBath)] <- 0
train$GarageCars[is.na(train$GarageCars)] <- 0
train$GarageArea[is.na(train$GarageArea)] <- 0

# Create new correlated variables
train$BRBR <- log(((train$FullBath + train$HalfBath)+1) / (1+train$BedroomAbvGr))
train$GLARooms <- log(1+(train$GrLivArea / train$TotRmsAbvGrd))
train$GQGC <- log(1+(train$garqual * train$GarageCars))
train$GRGR <- log(1+(train$GrLivArea / mean(train$GrLivArea), na.rm=T))
train$OQEC <- log(1+(train$OverallQual * train$exterior_cond2))
train$OQFB <- log(1+(train$OverallQual * train$FullBath))
train$OQGLA <- log(1+(train$OverallQual * train$GrLivArea))
train$OQTBSF <-	log(1+(train$OverallQual * train$TotalBsmtSF))
train$OQYB <- log(1+(train$OverallQual * train$YearBuilt))
train$OQYR <- log(1+(train$OverallQual * train$YearRemodAdd))

# Take logs of continuous variables
train$logSalePrice <- log(1+train$SalePrice)
train$logX1stFlrSF <- log(1+train$X1stFlrSF)
train$logX2ndFlrSF <- log(1+train$X2ndFlrSF)
train$logX3SsnPorch <- log(1+train$X3SsnPorch)
train$logBsmtFinSF1 <- log(1+train$BsmtFinSF1)
train$logBsmtFinSF2 <- log(1+train$BsmtFinSF2)
train$logBsmtUnfSF <- log(1+train$BsmtUnfSF)
train$logEnclosedPorch <- log(1+train$EnclosedPorch)
train$logGarageArea <- log(1+train$GarageArea)
train$logGrLivArea <- log(1+train$GrLivArea)
train$logLotArea <- log(1+train$LotArea)
train$logLotFrontage <- log(1+train$LotFrontage)
train$logLowQualFinSF <- log(1+train$LowQualFinSF)
train$logMasVnrArea <- log(1+train$MasVnrArea)
train$logMiscVal <- log(1+train$MiscVal)
train$logOpenPorchSF <- log(1+train$OpenPorchSF)
train$logPoolArea <- log(1+train$PoolArea)
train$logScreenPorch <- log(1+train$ScreenPorch)
train$logTotalBsmtSF <- log(1+train$ScreenPorch)
train$logWoodDeckSF <- log(1+train$WoodDeckSF)

# Delete variables that are not needed
train$Street <- NULL
train$LotShape <- NULL
train$LandContour <- NULL
train$Utilities <- NULL
train$LotConfig <- NULL
train$LandSlope <- NULL
train$Neighborhood <- NULL
train$Condition1 <- NULL
train$Condition2 <- NULL
train$BldgType <- NULL
train$HouseStyle <- NULL
train$RoofStyle <- NULL
train$RoofMatl <- NULL
train$Exterior1st <- NULL
train$Exterior2nd <- NULL
train$MasVnrType <- NULL
train$ExterQual <- NULL
train$ExterCond <- NULL
train$Foundation <- NULL
train$BsmtQual <- NULL
train$BsmtCond <- NULL
train$BsmtExposure <- NULL
train$BsmtFinType1 <- NULL
train$BsmtFinType2 <- NULL
train$Heating <- NULL
train$HeatingQC <- NULL
train$CentralAir <- NULL
train$Electrical <- NULL
train$KitchenQual <- NULL
train$FireplaceQu <- NULL
train$GarageType <- NULL
train$GarageFinish <- NULL
train$GarageQual <- NULL
train$GarageCond <- NULL
train$PavedDrive <- NULL
train$Functional <- NULL
train$PoolQC <- NULL
train$Fence <- NULL
train$MiscFeature <- NULL
train$SaleType <- NULL
train$SaleCondition <- NULL
train$MSZoning <- NULL
train$Alley <- NULL

names(train)
datatable(head(train, n=20),options = list(scrollX = TRUE))






