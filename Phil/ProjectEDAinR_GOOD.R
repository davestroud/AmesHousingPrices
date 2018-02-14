
train <- read.csv("train.csv", stringsAsFactors=FALSE)
test <- read.csv("test.csv", stringsAsFactors=FALSE)

str(train)
str(test)

    
# #Outlier removal
# train <- train [!(house$GrLivArea > 4000),]

test$SalePrice <- 0
house <- rbind(train,test)
str(house)
names(house)

# library(DT)
# datatable(head(house, n=20),options = list(scrollX = TRUE))

# library(VIM)
# aggr(house, prop = F, numbers = T)
apply(is.na(house),2,sum)

library(dplyr)
summarize(group_by(house, Alley), mean(SalePrice, na.rm=T))
house$cAlley[house$Alley %in% c("Grvl")] <- 1
house$cAlley[!house$Alley %in% c("Grvl")] <- 0
summarize(group_by(house, cAlley), mean(SalePrice, na.rm=T))

table(house$BldgType)
house$cBldgType[house$BldgType %in% c("1Fam", "TwnhsE")] <- 1
house$cBldgType[!house$BldgType %in% c("1Fam", "TwnhsE")] <- 0
table(house$cBldgType)

summarize(group_by(house, BsmtCond), mean(SalePrice, na.rm=T))
house$cBsmtCond[house$BsmtCond == "Ex"] <- 5
house$cBsmtCond[house$BsmtCond == "Gd"] <- 4
house$cBsmtCond[house$BsmtCond == "TA"] <- 3
house$cBsmtCond[house$BsmtCond == "Fa"] <- 2
house$cBsmtCond[is.na(house$BsmtCond)] <- 1
house$cBsmtCond[house$BsmtCond == "Po"] <- 0
summarize(group_by(house, cBsmtCond), mean(SalePrice, na.rm=T))

summarize(group_by(house, BsmtExposure), mean(SalePrice, na.rm=T))
house$cBsmtExposure[house$BsmtExposure == "Gd"] <- 3
house$cBsmtExposure[house$BsmtExposure == "Av"] <- 2
house$cBsmtExposure[house$BsmtExposure == "Mn"] <- 1
house$cBsmtExposure[house$BsmtExposure == "No"] <- 0
house$cBsmtExposure[is.na(house$BsmtExposure)] <- 0
summarize(group_by(house, cBsmtExposure), mean(SalePrice, na.rm=T))

summarize(group_by(house, BsmtFinType1), mean(SalePrice, na.rm=T))
house$cBsmtFinType1[house$BsmtFinType1 == "GLQ"] <- 5
house$cBsmtFinType1[house$BsmtFinType1 == "Unf"] <- 4
house$cBsmtFinType1[house$BsmtFinType1 == "ALQ"] <- 3
house$cBsmtFinType1[house$BsmtFinType1 %in% c("BLQ", "Rec", "LwQ")] <- 2
house$cBsmtFinType1[is.na(house$BsmtFinType1)] <- 1
summarize(group_by(house, cBsmtFinType1), mean(SalePrice, na.rm=T))

summarize(group_by(house, BsmtFinType2), mean(SalePrice, na.rm=T))
house$cBsmtFinType2[house$BsmtFinType2 == "GLQ"] <- 6
house$cBsmtFinType2[house$BsmtFinType2 == "Unf"] <- 5
house$cBsmtFinType2[house$BsmtFinType2 == "ALQ"] <- 4
house$cBsmtFinType2[house$BsmtFinType2 %in% c("Rec", "LwQ")] <- 3
house$cBsmtFinType2[house$BsmtFinType2 == "BLQ"] <- 2
house$cBsmtFinType2[is.na(house$BsmtFinType2)] <- 1
summarize(group_by(house, cBsmtFinType2), mean(SalePrice, na.rm=T))

summarize(group_by(house, BsmtQual), mean(SalePrice, na.rm=T))
house$cBsmtQual[house$BsmtQual == "Ex"] <- 5
house$cBsmtQual[house$BsmtQual == "Gd"] <- 4
house$cBsmtQual[house$BsmtQual == "TA"] <- 3
house$cBsmtQual[house$BsmtQual == "Fa"] <- 2
house$cBsmtQual[house$BsmtQual == "Po"] <- 1
house$cBsmtQual[is.na(house$BsmtQual)] <- 0
summarize(group_by(house, cBsmtQual), mean(SalePrice, na.rm=T))

summarize(group_by(house, CentralAir), mean(SalePrice, na.rm=T))
house$cCentralAir[house$CentralAir == "Y"] <- 1
house$cCentralAir[house$CentralAir == "N"] <- 0
summarize(group_by(house, cCentralAir), mean(SalePrice, na.rm=T))

table(house$Condition1)
house$Condition1[house$Condition1 %in% c("PosA", "PosN")] <- 1
house$Condition1[!house$Condition1 %in% c("PosA", "PosN")] <- 0
table(house$cCondition1)

table(house$Condition2)
house$cCondition2 [house$Condition2 %in% c("PosA", "PosN")] <- 1
house$cCondition2 [!house$Condition2 %in% c("PosA", "PosN")] <- 0
table(house$cCondition2)

summarize(group_by(house, Electrical), mean(SalePrice, na.rm=T))
house$cElectrical[house$Electrical == "SBrkr" | is.na(house$Electrical)] <- 1
house$cElectrical[!house$Electrical == "SBrkr" & !is.na(house$Electrical)] <- 0
summarize(group_by(house, cElectrical), mean(SalePrice, na.rm=T))

summarize(group_by(house, ExterCond), mean(SalePrice, na.rm=T))
house$cExterCond[house$ExterCond == "Ex"] <- 5
house$cExterCond[house$ExterCond == "Gd"] <- 4
house$cExterCond[house$ExterCond == "TA"] <- 3
house$cExterCond[house$ExterCond == "Fa"] <- 2
house$cExterCond[house$ExterCond == "Po"] <- 1
summarize(group_by(house, cExterCond), mean(SalePrice, na.rm=T))

summarize(group_by(house, ExterQual), mean(SalePrice, na.rm=T))
house$cExterQual[house$ExterQual == "Ex"] <- 5
house$cExterQual[house$ExterQual == "Gd"] <- 4
house$cExterQual[house$ExterQual == "TA"] <- 3
house$cExterQual[house$ExterQual == "Fa"] <- 2
house$cExterQual[house$ExterQual == "Po"] <- 1
summarize(group_by(house, cExterQual), mean(SalePrice, na.rm=T))

summarize(group_by(house, Fence), mean(SalePrice, na.rm=T))
house$cFence[house$Fence %in% c("GdPrv", "GdWo")] <- 2
house$cFence[house$Fence %in% c("MnPrv", "MnWw")] <- 1
house$cFence[is.na(house$Fence)] <- 0
summarize(group_by(house, cFence), mean(SalePrice, na.rm=T))

summarize(group_by(house, FireplaceQu), mean(SalePrice, na.rm=T))
house$cFireplaceQu[house$FireplaceQu == "Ex"] <- 5
house$cFireplaceQu[house$FireplaceQu == "Gd"] <- 4
house$cFireplaceQu[house$FireplaceQu == "TA"] <- 3
house$cFireplaceQu[house$FireplaceQu == "Fa"] <- 2
house$cFireplaceQu[house$FireplaceQu == "Po"] <- 1
house$cFireplaceQu[is.na(house$FireplaceQu)] <- 0
summarize(group_by(house, cFireplaceQu), mean(SalePrice, na.rm=T))

summarize(group_by(house, Foundation), mean(SalePrice, na.rm=T))
house$cFoundation[house$Foundation == "PConc"] <- 1
house$cFoundation[house$Foundation != "PConc"] <- 0
summarize(group_by(house, cFoundation), mean(SalePrice, na.rm=T))

summarize(group_by(house, Functional), mean(SalePrice, na.rm=T))
house$cFunctional[house$Functional %in% c("Sal")] <- 6
house$cFunctional[house$Functional %in% c("Sev")] <- 5
house$cFunctional[house$Functional %in% c("Maj2")] <- 4
house$cFunctional[house$Functional %in% c("Maj1")] <- 3
house$cFunctional[house$Functional %in% c("Mod") | is.na(house$Functional)] <- 2
house$cFunctional[house$Functional %in% c("Min1", "Min2")] <- 1
house$cFunctional[house$Functional %in% c("Typ")] <- 0
summarize(group_by(house, cFunctional), mean(SalePrice, na.rm=T))

summarize(group_by(house, GarageCond), mean(SalePrice, na.rm=T))
house$cGarageCond[house$GarageCond == "Ex"] <- 5
house$cGarageCond[house$GarageCond == "Gd"] <- 4
house$cGarageCond[house$GarageCond == "TA"] <- 3
house$cGarageCond[house$GarageCond == "Fa"] <- 2
house$cGarageCond[house$GarageCond == "Po"] <- 1
house$cGarageCond[is.na(house$GarageCond)] <- 0
summarize(group_by(house, cGarageCond), mean(SalePrice, na.rm=T))

summarize(group_by(house, GarageFinish), mean(SalePrice, na.rm=T))
house$cGarageFinish[house$GarageFinish %in% c("Fin", "RFn")] <- 1
house$cGarageFinish[!house$GarageFinish %in% c("Fin", "RFn")] <- 0
summarize(group_by(house, cGarageFinish), mean(SalePrice, na.rm=T))

summarize(group_by(house, GarageQual), mean(SalePrice, na.rm=T))
house$cGarageQual[house$GarageQual == "Ex"] <- 5
house$cGarageQual[house$GarageQual == "Gd"] <- 4
house$cGarageQual[house$GarageQual == "TA"] <- 3
house$cGarageQual[house$GarageQual == "Fa"] <- 2
house$cGarageQual[house$GarageQual == "Po"] <- 1
house$cGarageQual[is.na(house$GarageQual)] <- 0
summarize(group_by(house, cGarageQual), mean(SalePrice, na.rm=T))

summarize(group_by(house, GarageType), mean(SalePrice, na.rm=T))
house$cGarageType[house$GarageType %in% c("Attchd", "BuiltIn")] <- 1
house$cGarageType[!house$GarageType %in% c("Attchd", "BuiltIn")] <- 0
summarize(group_by(house, cGarageType), mean(SalePrice, na.rm=T))

summarize(group_by(house, Heating), mean(SalePrice, na.rm=T))
house$cHeating[house$Heating %in% c("GasA", "GasW")] <- 1
house$cHeating[!house$Heating %in% c("GasA", "GasW")] <- 0
summarize(group_by(house, cHeating), mean(SalePrice, na.rm=T))

summarize(group_by(house, HeatingQC), mean(SalePrice, na.rm=T))
house$cHeatingQC[house$HeatingQC == "Ex"] <- 5
house$cHeatingQC[house$HeatingQC == "Gd"] <- 4
house$cHeatingQC[house$HeatingQC == "TA"] <- 3
house$cHeatingQC[house$HeatingQC == "Fa"] <- 2
house$cHeatingQC[house$HeatingQC == "Po"] <- 1
summarize(group_by(house, cHeatingQC), mean(SalePrice, na.rm=T))

summarize(group_by(house, KitchenQual), mean(SalePrice, na.rm=T))
house$cKitchenQual[house$KitchenQual == "Ex"] <- 5
house$cKitchenQual[house$KitchenQual == "Gd"] <- 4
house$cKitchenQual[house$KitchenQual == "TA"] <- 3
house$cKitchenQual[house$KitchenQual == "Fa"] <- 2
house$cKitchenQual[house$KitchenQual == "Po"] <- 1
house$cKitchenQual[is.na(house$KitchenQual)] <- 3
summarize(group_by(house, cKitchenQual), mean(SalePrice, na.rm=T))
                   
table(house$LandContour)
house$cLandContour[house$LandContour == "Lvl"] <- 1
house$cLandContour[house$LandContour != "Lvl"] <- 0
table(house$cLandContour)

table(house$LandSlope)
house$cLandSlope[house$LandSlope == "Gtl"] <- 1
house$cLandSlope[house$LandSlope != "Gtl"] <- 0
table(house$cLandSlope)

summarize(group_by(house, LotConfig), mean(SalePrice, na.rm=T))
house$cLotConfig[house$LotConfig %in% c("CulDSac", "FR3")] <- 1
house$cLotConfig[!house$LotConfig %in% c("CulDSac", "FR3")] <- 0
summarize(group_by(house, cLotConfig), mean(SalePrice, na.rm=T))

table(house$LotShape)
house$cLotShape[house$LotShape == "Reg"] <- 1
house$cLotShape[house$LotShape != "Reg"] <- 0
table(house$cLotShape)

summarize(group_by(house, MasVnrType), mean(SalePrice, na.rm=T))
house$cMasVnrType[house$MasVnrType %in% c("Stone", "BrkFace") | is.na(house$MasVnrType)] <- 1
house$cMasVnrType[!house$MasVnrType %in% c("Stone", "BrkFace") & !is.na(house$MasVnrType)] <- 0
summarize(group_by(house, cMasVnrType), mean(SalePrice, na.rm=T))
                   
summarize(group_by(house, MiscFeature), mean(SalePrice, na.rm=T))
house$cMiscFeature[house$MiscFeature %in% c("TenC")] <- 1
house$cMiscFeature[!house$MiscFeature %in% c("TenC")] <- 0
summarize(group_by(house, cMiscFeature), mean(SalePrice, na.rm=T))                  

summarize(group_by(house, MSSubClass), mean(SalePrice, na.rm=T))
house$cMSSubClass[house$MSSubClass %in% c("20", "60", "120")] <- 1
house$cMSSubClass[!house$MSSubClass %in% c("20", "60", "120")] <- 0
summarize(group_by(house, cMSSubClass), mean(SalePrice, na.rm=T))

summarize(group_by(house, MSZoning), mean(SalePrice, na.rm=T))
house$cMSZoning[house$MSZoning %in% c("FV")] <- 4
house$cMSZoning[house$MSZoning %in% c("RL","RP")] <- 3
house$cMSZoning[house$MSZoning %in% c("RH","RM")] <- 2
house$cMSZoning[house$MSZoning %in% c("C (all)","I")] <- 1
house$cMSZoning[is.na(house$MSZoning)] <- 2
summarize(group_by(house, cMSZoning), mean(SalePrice, na.rm=T))

summarize(group_by(house, PavedDrive), mean(SalePrice, na.rm=T))
house$cPavedDrive[house$PavedDrive == "Y"] <- 1
house$cPavedDrive[house$PavedDrive != "Y"] <- 0
summarize(group_by(house, cPavedDrive), mean(SalePrice, na.rm=T))

summarize(group_by(house, PoolQC), mean(SalePrice, na.rm=T))
house$cPoolQC[house$PoolQC %in% c("Ex")] <- 1
house$cPoolQC[!house$PoolQC %in% c("Ex")] <- 0
summarize(group_by(house, cPoolQC), mean(SalePrice, na.rm=T))
                  
summarize(group_by(house, RoofMatl), mean(SalePrice, na.rm=T))
house$cRoofMatl[house$RoofMatl %in% c("Membran", "WdShake", "WdShngl")] <- 1
house$cRoofMatl[!house$RoofMatl %in% c("Membran", "WdShake", "WdShngl")] <- 0
summarize(group_by(house, cRoofMatl), mean(SalePrice, na.rm=T))

summarize(group_by(house, RoofStyle),mean(SalePrice, na.rm=T))
house$cRoofStyle[house$RoofStyle %in% c("Hip", "Shed")] <- 1
house$cRoofStyle[!house$RoofStyle %in% c("Hip", "Shed")] <- 0
summarize(group_by(house, cRoofStyle),mean(SalePrice, na.rm=T))
                   
summarize(group_by(house, SaleCondition), mean(SalePrice, na.rm=T))
house$cSaleCondition[house$SaleCondition %in% c("Partial")] <- 4
house$cSaleCondition[house$SaleCondition %in% c("Normal", "Alloca")] <- 3
house$cSaleCondition[house$SaleCondition %in% c("Family","Abnorml")] <- 2
house$cSaleCondition[house$SaleCondition %in% c("AdjLand")] <- 1
summarize(group_by(house, cSaleCondition), mean(SalePrice, na.rm=T))

summarize(group_by(house, SaleType), mean(SalePrice, na.rm=T))
house$cSaleType[house$SaleType %in% c("New", "Con")] <- 5
house$cSaleType[house$SaleType %in% c("CWD", "ConLI")] <- 4
house$cSaleType[house$SaleType %in% c("WD", "VWD", "NA")] <- 3
house$cSaleType[house$SaleType %in% c("COD", "ConLw", "ConLD")] <- 2
house$cSaleType[house$SaleType %in% c("Oth")] <- 1
house$cSaleType[is.na(house$SaleType)] <- 0
summarize(group_by(house, cSaleType), mean(SalePrice, na.rm=T))

table(house$Street)
house$cStreet[house$Street == "Pave"] <- 1
house$cStreet[house$Street != "Pave"] <- 0
table(house$cStreet)
                   
table(house$Utilities)
house$cUtilities[house$Utilities == "AllPub"] <- 1
house$cUtilities[house$Utilities != "AllPub"] <- 0
house$cUtilities[is.na(house$Utilities)] <- 0
table(house$cUtilities)
                
summarize(group_by(house, Neighborhood), mean(SalePrice, na.rm=T))
house$cNeighborhood[house$Neighborhood %in% c("NoRidge", "NridgHt", "StoneBr")] <- 1
house$cNeighborhood[!house$Neighborhood %in% c("NoRidge", "NridgHt", "StoneBr")] <- 0
summarize(group_by(house, cNeighborhood), mean(SalePrice, na.rm=T))
               
summarize(group_by(house, Exterior1st), mean(SalePrice, na.rm=T))
house$cExterior1st[house$Exterior1st %in% c("ImStucc", "Stone", "CemntBd", "VinylSd", "BrkFace")] <- 2
house$cExterior1st[house$Exterior1st %in% c("Plywood", "HdBoard", "Stucco", "WdShing", "Wd Sdng", "MetalSd")] <- 1
house$cExterior1st[house$Exterior1st %in% c("AsbShng", "CBlock", "AsphShn", "BrkComm") | is.na(house$Exterior1st)] <- 0
summarize(group_by(house, cExterior1st), mean(SalePrice, na.rm=T))
            
summarize(group_by(house, Exterior2nd), mean(SalePrice, na.rm=T))
house$cExterior2nd[house$Exterior2nd %in% c("Other", "ImStucc", "CmentBd", "VinylSd", "BrkFace")] <- 2
house$cExterior2nd[!house$Exterior2nd %in% c("Other", "ImStucc", "CmentBd", "VinylSd", "BrkFace")] <- 1
summarize(group_by(house, cExterior2nd), mean(SalePrice, na.rm=T))

summarize(group_by(house, HouseStyle), mean(SalePrice, na.rm=T))
house$cHouseStyle[house$HouseStyle %in% c("2.5Fin")] <- 220000/100000
house$cHouseStyle[house$HouseStyle %in% c("2Story")] <- 210051/100000
house$cHouseStyle[house$HouseStyle %in% c("1Story")] <- 175985/100000
house$cHouseStyle[house$HouseStyle %in% c("SLvl")] <- 166703/100000
house$cHouseStyle[house$HouseStyle %in% c("2.5Unf")] <- 157354/100000
house$cHouseStyle[house$HouseStyle %in% c("1.5Fin")] <- 143116/100000
house$cHouseStyle[house$HouseStyle %in% c("SFoyer")] <- 135074/100000
house$cHouseStyle[house$HouseStyle %in% c("1.5Unf")] <- 110150/100000
summarize(group_by(house, cHouseStyle), mean(SalePrice, na.rm=T))

# Normalize year sold
house$YrSold <- (2010 - house$YrSold)

# Clean up missing values 
house$LotFrontage[is.na(house$LotFrontage)] <- (house$LotArea * 0.0078)
house$GarageYrBlt[is.na(house$GarageYrBlt)] <- house$YearBuilt
house$MasVnrArea[is.na(house$MasVnrArea)] <- 0
house$LotFrontage[is.na(house$LotFrontage)] <- 0
house$BsmtFinSF1[is.na(house$BsmtFinSF1)] <- 0
house$BsmtFinSF2[is.na(house$BsmtFinSF2)] <- 0
house$BsmtUnfSF[is.na(house$BsmtUnfSF)] <- 0
house$TotalBsmtSF[is.na(house$TotalBsmtSF)] <- 0
house$BsmtFullBath[is.na(house$BsmtFullBath)] <- 0
house$BsmtHalfBath[is.na(house$BsmtHalfBath)] <- 0
house$GarageCars[is.na(house$GarageCars)] <- 0
house$GarageArea[is.na(house$GarageArea)] <- 0
                   
# Create new correlated variables
house$BRBR <- log(((house$FullBath + house$HalfBath)+1) / (1+house$BedroomAbvGr))
house$GLARooms <- log(1+(house$GrLivArea / house$TotRmsAbvGrd))
house$GQGC <- log(1+(house$cGarageQual * house$GarageCars))
house$GRGR <- log(1+(house$GrLivArea / mean(house$GrLivArea, na.rm=TRUE)))
house$OQEC <- log(1+(house$OverallQual * house$cExterCond))
house$OQFB <- log(1+(house$OverallQual * house$FullBath))
house$OQGLA <- log(1+(house$OverallQual * house$GrLivArea))
house$OQTBSF <-	log(1+(house$OverallQual * house$TotalBsmtSF))
house$OQYB <- log(1+(house$OverallQual * house$YearBuilt))
house$OQYR <- log(1+(house$OverallQual * house$YearRemodAdd))

# Take logs of continuous variables
house$logSalePrice <- log(1+house$SalePrice)
house$logX1stFlrSF <- log(1+house$X1stFlrSF)
house$logX2ndFlrSF <- log(1+house$X2ndFlrSF)
house$logX3SsnPorch <- log(1+house$X3SsnPorch)
house$logBsmtFinSF1 <- log(1+house$BsmtFinSF1)
house$logBsmtFinSF2 <- log(1+house$BsmtFinSF2)
house$logBsmtUnfSF <- log(1+house$BsmtUnfSF)
house$logEnclosedPorch <- log(1+house$EnclosedPorch)
house$logGarageArea <- log(1+house$GarageArea)
house$logGrLivArea <- log(1+house$GrLivArea)
house$logLotArea <- log(1+house$LotArea)
house$logLotFrontage <- log(1+house$LotFrontage)
house$logLowQualFinSF <- log(1+house$LowQualFinSF)
house$logMasVnrArea <- log(1+house$MasVnrArea)
house$logMiscVal <- log(1+house$MiscVal)
house$logOpenPorchSF <- log(1+house$OpenPorchSF)
house$logPoolArea <- log(1+house$PoolArea)
house$logScreenPorch <- log(1+house$ScreenPorch)
house$logTotalBsmtSF <- log(1+house$ScreenPorch)
house$logWoodDeckSF <- log(1+house$WoodDeckSF)

# Delete variables that are not needed
house$Street <- NULL
house$LotShape <- NULL
house$LandContour <- NULL
house$Utilities <- NULL
house$LotConfig <- NULL
house$LandSlope <- NULL
house$Neighborhood <- NULL
house$Condition1 <- NULL
house$Condition2 <- NULL
house$BldgType <- NULL
house$HouseStyle <- NULL
house$RoofStyle <- NULL
house$RoofMatl <- NULL
house$Exterior1st <- NULL
house$Exterior2nd <- NULL
house$MasVnrType <- NULL
house$ExterQual <- NULL
house$ExterCond <- NULL
house$Foundation <- NULL
house$BsmtQual <- NULL
house$BsmtCond <- NULL
house$BsmtExposure <- NULL
house$BsmtFinType1 <- NULL
house$BsmtFinType2 <- NULL
house$Heating <- NULL
house$HeatingQC <- NULL
house$CentralAir <- NULL
house$Electrical <- NULL
house$KitchenQual <- NULL
house$FireplaceQu <- NULL
house$GarageType <- NULL
house$GarageFinish <- NULL
house$GarageQual <- NULL
house$GarageCond <- NULL
house$PavedDrive <- NULL
house$Functional <- NULL
house$PoolQC <- NULL
house$Fence <- NULL
house$MiscFeature <- NULL
house$SaleType <- NULL
house$SaleCondition <- NULL
house$MSZoning <- NULL
house$Alley <- NULL

names(house)
datatable(head(house, n=20),options = list(scrollX = TRUE))


write.csv(house, file="house1.csv", row.names=F)



