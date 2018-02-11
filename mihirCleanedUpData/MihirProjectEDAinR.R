train <- read.csv("train.csv", stringsAsFactors=FALSE)
test <- read.csv("test.csv", stringsAsFactors=FALSE)

#add SalePrice column to test set
test$SalePrice <- NA

#add column
train$IsTrainSet <- TRUE
test$IsTrainSet <- FALSE

#combine the sets
full <- rbind(train, test)

names(full)

library(DT)
datatable(head(full, n=20),options = list(scrollX = TRUE))

library(VIM)
aggr(full, prop = F, numbers = T)

apply(is.na(full),2,sum)

#Outlier removal
full <- full [!(full$GrLivArea > 4000),]

library(dplyr)
summarize(group_by(full, cAlley), mean(SalePrice, na.rm=T))
full$cAlley[full$Alley %in% c("Pave")] <- 1
full$cAlley[!full$Alley %in% c("Pave")] <- 0
summarize(group_by(full, cAlley), mean(SalePrice, na.rm=T))

table(full$BldgType)
full$cBldgType[full$BldgType %in% c("1Fam", "TwnhsE")] <- 1
full$cBldgType[!full$BldgType %in% c("1Fam", "TwnhsE")] <- 0
table(full$cBldgType)

summarize(group_by(full, BsmtCond), mean(SalePrice, na.rm=T))
full$cBsmtCond[full$BsmtCond == "Ex"] <- 5
full$cBsmtCond[full$BsmtCond == "Gd"] <- 4
full$cBsmtCond[full$BsmtCond == "TA"] <- 3
full$cBsmtCond[full$BsmtCond == "Fa"] <- 2
full$cBsmtCond[is.na(full$BsmtCond)] <- 1
full$cBsmtCond[full$BsmtCond == "Po"] <- 0
summarize(group_by(full, cBsmtCond), mean(SalePrice, na.rm=T))

summarize(group_by(full, BsmtExposure), mean(SalePrice, na.rm=T))
full$cBsmtExposure[full$BsmtExposure == "Gd"] <- 3
full$cBsmtExposure[full$BsmtExposure == "Av"] <- 2
full$cBsmtExposure[full$BsmtExposure == "Mn"] <- 1
full$cBsmtExposure[full$BsmtExposure == "No"] <- 0
full$cBsmtExposure[is.na(full$BsmtExposure)] <- 0
summarize(group_by(full, cBsmtExposure), mean(SalePrice, na.rm=T))

summarize(group_by(full, BsmtFinType1), mean(SalePrice, na.rm=T))
full$cBsmtFinType1[full$BsmtFinType1 == "GLQ"] <- 5
full$cBsmtFinType1[full$BsmtFinType1 == "Unf"] <- 4
full$cBsmtFinType1[full$BsmtFinType1 == "ALQ"] <- 3
full$cBsmtFinType1[full$BsmtFinType1 %in% c("BLQ", "Rec", "LwQ")] <- 2
full$cBsmtFinType1[is.na(full$BsmtFinType1)] <- 1
summarize(group_by(full, cBsmtFinType1), mean(SalePrice, na.rm=T))

summarize(group_by(full, BsmtFinType2), mean(SalePrice, na.rm=T))
full$cBsmtFinType2[full$BsmtFinType2 == "GLQ"] <- 6
full$cBsmtFinType2[full$BsmtFinType2 == "Unf"] <- 5
full$cBsmtFinType2[full$BsmtFinType2 == "ALQ"] <- 4
full$cBsmtFinType2[full$BsmtFinType2 %in% c("Rec", "LwQ")] <- 3
full$cBsmtFinType2[full$BsmtFinType2 == "BLQ"] <- 2
full$cBsmtFinType2[is.na(full$BsmtFinType2)] <- 1
summarize(group_by(full, cBsmtFinType2), mean(SalePrice, na.rm=T))

summarize(group_by(full, BsmtQual), mean(SalePrice, na.rm=T))
full$cBsmtQual[full$BsmtQual == "Ex"] <- 5
full$cBsmtQual[full$BsmtQual == "Gd"] <- 4
full$cBsmtQual[full$BsmtQual == "TA"] <- 3
full$cBsmtQual[full$BsmtQual == "Fa"] <- 2
full$cBsmtQual[full$BsmtQual == "Po"] <- 1
full$cBsmtQual[is.na(full$BsmtQual)] <- 0
summarize(group_by(full, cBsmtQual), mean(SalePrice, na.rm=T))

summarize(group_by(full, CentralAir), mean(SalePrice, na.rm=T))
full$cCentralAir[full$CentralAir == "Y"] <- 1
full$cCentralAir[full$CentralAir == "N"] <- 0
summarize(group_by(full, cCentralAir), mean(SalePrice, na.rm=T))

table(full$Condition1)
full$Condition1[full$Condition1 %in% c("PosA", "PosN")] <- 1
full$Condition1[!full$Condition1 %in% c("PosA", "PosN")] <- 0
table(full$cCondition1)

table(full$Condition2)
full$cCondition2 [full$Condition2 %in% c("PosA", "PosN")] <- 1
full$cCondition2 [!full$Condition2 %in% c("PosA", "PosN")] <- 0
table(full$cCondition2)

summarize(group_by(full, Electrical), mean(SalePrice, na.rm=T))
full$cElectrical[full$Electrical == "SBrkr" | is.na(full$Electrical)] <- 1
full$cElectrical[!full$Electrical == "SBrkr" & !is.na(full$Electrical)] <- 0
summarize(group_by(full, cElectrical), mean(SalePrice, na.rm=T))

summarize(group_by(full, ExterCond), mean(SalePrice, na.rm=T))
full$cExterCond[full$ExterCond == "Ex"] <- 5
full$cExterCond[full$ExterCond == "Gd"] <- 4
full$cExterCond[full$ExterCond == "TA"] <- 3
full$cExterCond[full$ExterCond == "Fa"] <- 2
full$cExterCond[full$ExterCond == "Po"] <- 1
summarize(group_by(full, cExterCond), mean(SalePrice, na.rm=T))

summarize(group_by(full, ExterQual), mean(SalePrice, na.rm=T))
full$cExterQual[full$ExterQual == "Ex"] <- 5
full$cExterQual[full$ExterQual == "Gd"] <- 4
full$cExterQual[full$ExterQual == "TA"] <- 3
full$cExterQual[full$ExterQual == "Fa"] <- 2
full$cExterQual[full$ExterQual == "Po"] <- 1
summarize(group_by(full, cExterQual), mean(SalePrice, na.rm=T))

summarize(group_by(full, Fence), mean(SalePrice, na.rm=T))
full$cFence[full$Fence %in% c("GdPrv", "GdWo")] <- 2
full$cFence[full$Fence %in% c("MnPrv", "MnWw")] <- 1
full$cFence[is.na(full$Fence)] <- 0
summarize(group_by(full, cFence), mean(SalePrice, na.rm=T))

summarize(group_by(full, FireplaceQu), mean(SalePrice, na.rm=T))
full$cFireplaceQu[full$FireplaceQu == "Ex"] <- 5
full$cFireplaceQu[full$FireplaceQu == "Gd"] <- 4
full$cFireplaceQu[full$FireplaceQu == "TA"] <- 3
full$cFireplaceQu[full$FireplaceQu == "Fa"] <- 2
full$cFireplaceQu[full$FireplaceQu == "Po"] <- 1
full$cFireplaceQu[is.na(full$FireplaceQu)] <- 0
summarize(group_by(full, cFireplaceQu), mean(SalePrice, na.rm=T))

summarize(group_by(full, Foundation), mean(SalePrice, na.rm=T))
full$cFoundation[full$Foundation == "PConc"] <- 1
full$cFoundation[full$Foundation != "PConc"] <- 0
summarize(group_by(full, cFoundation), mean(SalePrice, na.rm=T))

summarize(group_by(full, Functional), mean(SalePrice, na.rm=T))
full$cFunctional[full$Functional %in% c("Sal")] <- 6
full$cFunctional[full$Functional %in% c("Sev")] <- 5
full$cFunctional[full$Functional %in% c("Maj2")] <- 4
full$cFunctional[full$Functional %in% c("Maj1")] <- 3
full$cFunctional[full$Functional %in% c("Mod") | is.na(full$Functional)] <- 2
full$cFunctional[full$Functional %in% c("Min1", "Min2")] <- 1
full$cFunctional[full$Functional %in% c("Typ")] <- 0
summarize(group_by(full, cFunctional), mean(SalePrice, na.rm=T))

summarize(group_by(full, GarageCond), mean(SalePrice, na.rm=T))
full$cGarageCond[full$GarageCond == "Ex"] <- 5
full$cGarageCond[full$GarageCond == "Gd"] <- 4
full$cGarageCond[full$GarageCond == "TA"] <- 3
full$cGarageCond[full$GarageCond == "Fa"] <- 2
full$cGarageCond[full$GarageCond == "Po"] <- 1
full$cGarageCond[is.na(full$GarageCond)] <- 0
summarize(group_by(full, cGarageCond), mean(SalePrice, na.rm=T))

summarize(group_by(full, GarageFinish), mean(SalePrice, na.rm=T))
full$cGarageFinish[full$GarageFinish %in% c("Fin", "RFn")] <- 1
full$cGarageFinish[!full$GarageFinish %in% c("Fin", "RFn")] <- 0
summarize(group_by(full, cGarageFinish), mean(SalePrice, na.rm=T))

summarize(group_by(full, GarageQual), mean(SalePrice, na.rm=T))
full$cGarageQual[full$GarageQual == "Ex"] <- 5
full$cGarageQual[full$GarageQual == "Gd"] <- 4
full$cGarageQual[full$GarageQual == "TA"] <- 3
full$cGarageQual[full$GarageQual == "Fa"] <- 2
full$cGarageQual[full$GarageQual == "Po"] <- 1
full$cGarageQual[is.na(full$GarageQual)] <- 0
summarize(group_by(full, cGarageQual), mean(SalePrice, na.rm=T))

summarize(group_by(full, GarageType), mean(SalePrice, na.rm=T))
full$cGarageType[full$GarageType %in% c("Attchd", "BuiltIn")] <- 1
full$cGarageType[!full$GarageType %in% c("Attchd", "BuiltIn")] <- 0
summarize(group_by(full, cGarageType), mean(SalePrice, na.rm=T))

summarize(group_by(full, Heating), mean(SalePrice, na.rm=T))
full$cHeating[full$Heating %in% c("GasA", "GasW")] <- 1
full$cHeating[!full$Heating %in% c("GasA", "GasW")] <- 0
summarize(group_by(full, cHeating), mean(SalePrice, na.rm=T))

summarize(group_by(full, HeatingQC), mean(SalePrice, na.rm=T))
full$cHeatingQC[full$HeatingQC == "Ex"] <- 5
full$cHeatingQC[full$HeatingQC == "Gd"] <- 4
full$cHeatingQC[full$HeatingQC == "TA"] <- 3
full$cHeatingQC[full$HeatingQC == "Fa"] <- 2
full$cHeatingQC[full$HeatingQC == "Po"] <- 1
summarize(group_by(full, cHeatingQC), mean(SalePrice, na.rm=T))

summarize(group_by(full, KitchenQual), mean(SalePrice, na.rm=T))
full$cKitchenQual[full$KitchenQual == "Ex"] <- 5
full$cKitchenQual[full$KitchenQual == "Gd"] <- 4
full$cKitchenQual[full$KitchenQual == "TA"] <- 3
full$cKitchenQual[full$KitchenQual == "Fa"] <- 2
full$cKitchenQual[full$KitchenQual == "Po"] <- 1
full$cKitchenQual[is.na(full$KitchenQual)] <- 3
summarize(group_by(full, cKitchenQual), mean(SalePrice, na.rm=T))

table(full$LandContour)
full$cLandContour[full$LandContour == "Lvl"] <- 1
full$cLandContour[full$LandContour != "Lvl"] <- 0
table(full$cLandContour)

table(full$LandSlope)
full$cLandSlope[full$LandSlope == "Gtl"] <- 1
full$cLandSlope[full$LandSlope != "Gtl"] <- 0
table(full$cLandSlope)

summarize(group_by(full, LotConfig), mean(SalePrice, na.rm=T))
full$cLotConfig[full$LotConfig %in% c("CulDSac", "FR3")] <- 1
full$cLotConfig[!full$LotConfig %in% c("CulDSac", "FR3")] <- 0
summarize(group_by(full, cLotConfig), mean(SalePrice, na.rm=T))

table(full$LotShape)
full$cLotShape[full$LotShape == "Reg"] <- 1
full$cLotShape[full$LotShape != "Reg"] <- 0
table(full$cLotShape)

summarize(group_by(full, MasVnrType), mean(SalePrice, na.rm=T))
full$cMasVnrType[full$MasVnrType %in% c("Stone", "BrkFace") | is.na(full$MasVnrType)] <- 1
full$cMasVnrType[!full$MasVnrType %in% c("Stone", "BrkFace") & !is.na(full$MasVnrType)] <- 0
summarize(group_by(full, cMasVnrType), mean(SalePrice, na.rm=T))

summarize(group_by(full, MiscFeature), mean(SalePrice, na.rm=T))
full$cMiscFeature[full$MiscFeature %in% c("TenC")] <- 1
full$cMiscFeature[!full$MiscFeature %in% c("TenC")] <- 0
summarize(group_by(full, cMiscFeature), mean(SalePrice, na.rm=T))

summarize(group_by(full, MSSubClass), mean(SalePrice, na.rm=T))
full$cMSSubClass[full$MSSubClass %in% c("20", "60", "120")] <- 1
full$cMSSubClass[!full$MSSubClass %in% c("20", "60", "120")] <- 0
summarize(group_by(full, cMSSubClass), mean(SalePrice, na.rm=T))

summarize(group_by(full, MSZoning), mean(SalePrice, na.rm=T))
full$cMSZoning[full$MSZoning %in% c("FV")] <- 4
full$cMSZoning[full$MSZoning %in% c("RL","RP")] <- 3
full$cMSZoning[full$MSZoning %in% c("RH","RM")] <- 2
full$cMSZoning[full$MSZoning %in% c("C (all)","I")] <- 1
full$cMSZoning[is.na(full$MSZoning)] <- 2
summarize(group_by(full, cMSZoning), mean(SalePrice, na.rm=T))

summarize(group_by(full, PavedDrive), mean(SalePrice, na.rm=T))
full$paved_drive[full$PavedDrive == "Y"] <- 1
full$paved_drive[!full$PavedDrive != "Y"] <- 0
full$paved_drive[is.na(full$paved_drive)] <- 0
summarize(group_by(full, cPavedDrive), mean(SalePrice, na.rm=T))

summarize(group_by(full, PoolQC), mean(SalePrice, na.rm=T))
full$cPoolQC[full$PoolQC %in% c("Ex")] <- 1
full$cPoolQC[!full$PoolQC %in% c("Ex")] <- 0
summarize(group_by(full, cPoolQC), mean(SalePrice, na.rm=T))

summarize(group_by(full, RoofMatl), mean(SalePrice, na.rm=T))
full$cRoofMatl[full$RoofMatl %in% c("Membran", "WdShake", "WdShngl")] <- 1
full$cRoofMatl[!full$RoofMatl %in% c("Membran", "WdShake", "WdShngl")] <- 0
summarize(group_by(full, cRoofMatl), mean(SalePrice, na.rm=T))

summarize(group_by(full, RoofStyle),mean(SalePrice, na.rm=T))
full$cRoofStyle[full$RoofStyle %in% c("Hip", "Shed")] <- 1
full$cRoofStyle[!full$RoofStyle %in% c("Hip", "Shed")] <- 0
summarize(group_by(full, cRoofStyle),mean(SalePrice, na.rm=T))

summarize(group_by(full, SaleCondition), mean(SalePrice, na.rm=T))
full$cSaleCondition[full$SaleCondition %in% c("Partial")] <- 4
full$cSaleCondition[full$SaleCondition %in% c("Normal", "Alloca")] <- 3
full$cSaleCondition[full$SaleCondition %in% c("Family","Abnorml")] <- 2
full$cSaleCondition[full$SaleCondition %in% c("AdjLand")] <- 1
summarize(group_by(full, cSaleCondition), mean(SalePrice, na.rm=T))

summarize(group_by(full, SaleType), mean(SalePrice, na.rm=T))
full$cSaleType[full$SaleType %in% c("New", "Con")] <- 5
full$cSaleType[full$SaleType %in% c("CWD", "ConLI")] <- 4
full$cSaleType[full$SaleType %in% c("WD", "VWD", "NA")] <- 3
full$cSaleType[full$SaleType %in% c("COD", "ConLw", "ConLD")] <- 2
full$cSaleType[full$SaleType %in% c("Oth")] <- 1
summarize(group_by(full, cSaleType), mean(SalePrice, na.rm=T))

table(full$Street)
full$cStreet[full$Street == "Pave"] <- 1
full$cStreet[full$Street != "Pave"] <- 0
table(full$cStreet)

table(full$Utilities)
full$cUtilities[full$Utilities == "AllPub"] <- 1
full$cUtilities[full$Utilities != "AllPub"] <- 0
table(full$cUtilities)

summarize(group_by(full, Neighborhood), mean(SalePrice, na.rm=T))
full$cNeighborhood[full$Neighborhood %in% c("NoRidge", "NridgHt", "StoneBr")] <- 1
full$cNeighborhood[!full$Neighborhood %in% c("NoRidge", "NridgHt", "StoneBr")] <- 0
summarize(group_by(full, cNeighborhood), mean(SalePrice, na.rm=T))

summarize(group_by(full, Exterior1st), mean(SalePrice, na.rm=T))
full$cExterior1st[full$Exterior1st %in% c("ImStucc", "Stone", "CemntBd", "VinylSd", "BrkFace")] <- 2
full$cExterior1st[full$Exterior1st %in% c("Plywood", "HdBoard", "Stucco", "WdShing", "Wd Sdng", "MetalSd")] <- 1
full$cExterior1st[full$Exterior1st %in% c("AsbShng", "CBlock", "AsphShn", "BrkComm") | is.na(full$Exterior1st)] <- 0
summarize(group_by(full, cExterior1st), mean(SalePrice, na.rm=T))

summarize(group_by(full, Exterior2nd), mean(SalePrice, na.rm=T))
full$cExterior2nd[full$Exterior2nd %in% c("Other", "ImStucc", "CmentBd", "VinylSd", "BrkFace")] <- 2
full$cExterior2nd[!full$Exterior2nd %in% c("Other", "ImStucc", "CmentBd", "VinylSd", "BrkFace")] <- 1
summarize(group_by(full, cExterior2nd), mean(SalePrice, na.rm=T))

summarize(group_by(full, HouseStyle), mean(SalePrice, na.rm=T))
full$cHouseStyle[full$HouseStyle %in% c("2.5Fin")] <- 220000/100000
full$cHouseStyle[full$HouseStyle %in% c("2Story")] <- 210051/100000
full$cHouseStyle[full$HouseStyle %in% c("1Story")] <- 175985/100000
full$cHouseStyle[full$HouseStyle %in% c("SLvl")] <- 166703/100000
full$cHouseStyle[full$HouseStyle %in% c("2.5Unf")] <- 157354/100000
full$cHouseStyle[full$HouseStyle %in% c("1.5Fin")] <- 143116/100000
full$cHouseStyle[full$HouseStyle %in% c("SFoyer")] <- 135074/100000
full$cHouseStyle[full$HouseStyle %in% c("1.5Unf")] <- 110150/100000
summarize(group_by(full, cHouseStyle), mean(SalePrice, na.rm=T))

# Normalize year sold
table(full$YrSold)
full$YrSold <- (2010 - full$YrSold)
table(full$YrSold)

# Clean up missing values
full$LotFrontage[is.na(full$LotFrontage)] <- (full$LotArea * 0.0078)
full$GarageYrBlt[is.na(full$GarageYrBlt)] <- full$YearBuilt
full$MasVnrArea[is.na(full$MasVnrArea)] <- 0
full$LotFrontage[is.na(full$LotFrontage)] <- 0
full$BsmtFinSF1[is.na(full$BsmtFinSF1)] <- 0
full$BsmtFinSF2[is.na(full$BsmtFinSF2)] <- 0
full$BsmtUnfSF[is.na(full$BsmtUnfSF)] <- 0
full$TotalBsmtSF[is.na(full$TotalBsmtSF)] <- 0
full$BsmtFullBath[is.na(full$BsmtFullBath)] <- 0
full$BsmtHalfBath[is.na(full$BsmtHalfBath)] <- 0
full$GarageCars[is.na(full$GarageCars)] <- 0
full$GarageArea[is.na(full$GarageArea)] <- 0

# Create new correlated variables
full$BRBR <- log(((full$FullBath + full$HalfBath)+1) / (1+full$BedroomAbvGr))
full$GLARooms <- log(1+(full$GrLivArea / full$TotRmsAbvGrd))
full$GQGC <- log(1+(full$garqual * full$GarageCars))
full$GRGR <- log(1+(full$GrLivArea / mean(full$GrLivArea)), na.rm=T)
full$OQEC <- log(1+(full$OverallQual * full$exterior_cond2))
full$OQFB <- log(1+(full$OverallQual * full$FullBath))
full$OQGLA <- log(1+(full$OverallQual * full$GrLivArea))
full$OQTBSF <-	log(1+(full$OverallQual * full$TotalBsmtSF))
full$OQYB <- log(1+(full$OverallQual * full$YearBuilt))
full$OQYR <- log(1+(full$OverallQual * full$YearRemodAdd))

# Take logs of continuous variables
full$logSalePrice <- log(1+full$SalePrice)
full$logX1stFlrSF <- log(1+full$X1stFlrSF)
full$logX2ndFlrSF <- log(1+full$X2ndFlrSF)
full$logX3SsnPorch <- log(1+full$X3SsnPorch)
full$logBsmtFinSF1 <- log(1+full$BsmtFinSF1)
full$logBsmtFinSF2 <- log(1+full$BsmtFinSF2)
full$logBsmtUnfSF <- log(1+full$BsmtUnfSF)
full$logEnclosedPorch <- log(1+full$EnclosedPorch)
full$logGarageArea <- log(1+full$GarageArea)
full$logGrLivArea <- log(1+full$GrLivArea)
full$logLotArea <- log(1+full$LotArea)
full$logLotFrontage <- log(1+full$LotFrontage)
full$logLowQualFinSF <- log(1+full$LowQualFinSF)
full$logMasVnrArea <- log(1+full$MasVnrArea)
full$logMiscVal <- log(1+full$MiscVal)
full$logOpenPorchSF <- log(1+full$OpenPorchSF)
full$logPoolArea <- log(1+full$PoolArea)
full$logScreenPorch <- log(1+full$ScreenPorch)
full$logTotalBsmtSF <- log(1+full$ScreenPorch)
full$logWoodDeckSF <- log(1+full$WoodDeckSF)

# Delete variables that are not needed
full$Street <- NULL
full$LotShape <- NULL
full$LandContour <- NULL
full$Utilities <- NULL
full$LotConfig <- NULL
full$LandSlope <- NULL
full$Neighborhood <- NULL
full$Condition1 <- NULL
full$Condition2 <- NULL
full$BldgType <- NULL
full$HouseStyle <- NULL
full$RoofStyle <- NULL
full$RoofMatl <- NULL
full$Exterior1st <- NULL
full$Exterior2nd <- NULL
full$MasVnrType <- NULL
full$ExterQual <- NULL
full$ExterCond <- NULL
full$Foundation <- NULL
full$BsmtQual <- NULL
full$BsmtCond <- NULL
full$BsmtExposure <- NULL
full$BsmtFinType1 <- NULL
full$BsmtFinType2 <- NULL
full$Heating <- NULL
full$HeatingQC <- NULL
full$CentralAir <- NULL
full$Electrical <- NULL
full$KitchenQual <- NULL
full$FireplaceQu <- NULL
full$GarageType <- NULL
full$GarageFinish <- NULL
full$GarageQual <- NULL
full$GarageCond <- NULL
full$PavedDrive <- NULL
full$Functional <- NULL
full$PoolQC <- NULL
full$Fence <- NULL
full$MiscFeature <- NULL
full$SaleType <- NULL
full$SaleCondition <- NULL
full$MSZoning <- NULL
full$Alley <- NULL

names(full)
datatable(head(full, n=20),options = list(scrollX = TRUE))

cleanFull <- full
cleanTest <- full[full$IsTrainSet == FALSE,]
cleanTrain <- full[full$IsTrainSet == TRUE,]

#remove IsTrainSetColumn
drops <- c("IsTrainSet")
cleanFull[, !(names(cleanFull) %in% drops)]
cleanTest[, !(names(cleanTest) %in% drops)]
cleanTrain[, !(names(cleanTrain) %in% drops)]

#output to csv
write.csv(cleanFull, "clean_full.csv", row.names = FALSE)
write.csv(cleanTest, "clean_test.csv", row.names = FALSE)
write.csv(cleanTrain, "clean_train.csv", row.names = FALSE)
