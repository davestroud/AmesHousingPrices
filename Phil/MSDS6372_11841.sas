proc import datafile='/home/pbedwards0/Phil/house1.csv'
out=house dbms=csv replace; 
getnames=yes; 
run;   


/* We ended up addressing a few more last minute outliers and also stacking terms here  */ 
data house_out;
set house;
if GrLivArea>4000 AND logSalePrice>1 then delete;
if GrLivArea=5642 then delete;
if GrLivArea=4676 then delete;
if LotArea=159000 then delete;
if LotArea=215245 then delete;
if LotArea=164660 then delete;
if LotArea=115149 then delete;
if TotalBsmtSF=6110 then delete;
sqOverallCond=OverallCond**2;
sqGarageCars=GarageCars**2;
sqYearBuilt=logLotArea**2;
stot=(logGrLivArea+cFunctional)**2;
ctot=(logGrLivArea+cFunctional)**3;
run;

/* Stepwise Selection Test Code
proc glmselect data=house_out;
model logSalePrice = 
OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2  BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr 
KitchenAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch 
X3SsnPorch MiscVal MoSold YrSold cAlley cBldgType cBsmtCond cBsmtExposure cBsmtFinType1 cBsmtFinType2 cBsmtQual cCentralAir 
cCondition1 cCondition2 cElectrical cExterCond cExterQual cFence cFireplaceQu cFoundation cFunctional 
cGarageCond cGarageFinish cGarageQual cGarageType cHeating cHeatingQC cKitchenQual cLandContour cLandSlope 
cLotConfig cLotShape cMasVnrType cMiscFeature cMSSubClass cMSZoning cPavedDrive cPoolQC cRoofMatl cRoofStyle 
cSaleCondition cSaleType cStreet cUtilities cNeighborhood cExterior1st cExterior2nd cHouseStyle 
logX3SsnPorch logBsmtFinSF1 logBsmtFinSF2 logBsmtUnfSF X1stFlrSF
logEnclosedPorch logGarageArea logGrLivArea logLotArea logLotFrontage logLowQualFinSF logMasVnrArea 
logMiscVal logOpenPorchSF logPoolArea logScreenPorch logTotalBsmtSF logWoodDeckSF
BRBR GLARooms GQGC OQEC OQFB OQGLA OQTBSF OQYB OQYR GRGR sqOverallCond sqGarageCars
/selection=stepwise(stop=CV select=CP choose = adjrsq) cvmethod = random(5) stats=adjrsq;
run;

*/


/* Backward  Selection Test Code
proc glmselect data=house_out;
model logSalePrice = 
logX1stFlrSF logX2ndFlrSF logX3SsnPorch logBsmtFinSF1 logBsmtFinSF2 logBsmtUnfSF logEnclosedPorch
logGarageArea logGrLivArea logLotArea logLotFrontage logLowQualFinSF logMasVnrArea logMiscVal logOpenPorchSF logPoolArea
logScreenPorch logTotalBsmtSF logWoodDeckSF OverallQual OverallCond YearBuilt YearRemodAdd BsmtFullBath 
BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr TotRmsAbvGrd Fireplaces GarageYrBlt GarageCars MoSold YrSold 
cAlley cBldgType cBsmtCond cBsmtExposure cBsmtFinType1 cBsmtFinType2 cBsmtQual cCentralAir cCondition1 cCondition2 
cElectrical cExterCond cExterQual cFence cFireplaceQu cFoundation cFunctional cGarageCond cGarageFinish cGarageQual 
cGarageType cHeating cHeatingQC cKitchenQual cLandContour cLandSlope cLotConfig cLotShape cMasVnrType
cMiscFeature cMSSubClass cMSZoning cPavedDrive cPoolQC cRoofMatl cRoofStyle cSaleCondition
cSaleType cStreet  cUtilities BRBR GLARooms GQGC OQEC OQFB OQGLA OQTBSF OQYB OQYR GRGR 
cNeighborhood cExterior1st cExterior2nd cHouseStyle sqOverallCond sqGarageCars
/ selection=backward include=15 stats=press;
RUN;
*/


/*Forward Selection Test Code 
proc glmselect data=house_out;
model logSalePrice = 
OverallQual OverallCond YearBuilt YearRemodAdd MasVnrArea BsmtFinSF1 BsmtFinSF2  BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr 
KitchenAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF EnclosedPorch 
X3SsnPorch MiscVal MoSold YrSold cAlley cBldgType cBsmtCond cBsmtExposure cBsmtFinType1 cBsmtFinType2 cBsmtQual cCentralAir 
cCondition1 cCondition2 cElectrical cExterCond cExterQual cFence cFireplaceQu cFoundation cFunctional 
cGarageCond cGarageFinish cGarageQual cGarageType cHeating cHeatingQC cKitchenQual cLandContour cLandSlope 
cLotConfig cLotShape cMasVnrType cMiscFeature cMSSubClass cMSZoning cPavedDrive cPoolQC cRoofMatl cRoofStyle 
cSaleCondition cSaleType cStreet cUtilities cNeighborhood cExterior1st cExterior2nd cHouseStyle 
logX3SsnPorch logBsmtFinSF1 logBsmtFinSF2 logBsmtUnfSF X1stFlrSF
logEnclosedPorch logGarageArea logGrLivArea logLotArea logLotFrontage logLowQualFinSF logMasVnrArea 
logMiscVal logOpenPorchSF logPoolArea logScreenPorch logTotalBsmtSF logWoodDeckSF
BRBR GLARooms GQGC OQEC OQFB OQGLA OQTBSF OQYB OQYR GRGR sqOverallCond sqGarageCars
/selection=forward(stop=CV select=CP choose = adjrsq) cvmethod = split(300) stats=adjrsq;

*/

/* Model output code block. Cut paste variables from your testing output into the model below  */
proc glm data=house_out plots=all;
model logSalePrice = 
OverallQual OQYB|sqOverallCond OQYR|sqOverallCond OverallCond YearBuilt YearRemodAdd MasVnrArea OQYB|BsmtFinSF1 OQYR|BsmtFinSF1 BsmtFinSF2 BsmtFullBath KitchenAbvGr Fireplaces 
WoodDeckSF EnclosedPorch YrSold cBsmtExposure cBsmtQual cCentralAir OQYB|cExterCond cExterQual cFoundation cFunctional|cCentralAir 
cHeatingQC cKitchenQual cMSZoning cPavedDrive cSaleCondition cStreet cNeighborhood cExterior1st cExterior2nd logBsmtFinSF1 
logBsmtFinSF2 logBsmtUnfSF X1stFlrSF stot ctot logGarageArea logLotArea logLowQualFinSF logScreenPorch BRBR GQGC OQTBSF GRGR sqGarageCars
cExterior1st|MasVnrArea
/solution cli clparm; 
output out=results predicted=logpredict;
run;

/* !!!!!!! One problem we've noted is logpredict appends logpredict1 logpredict2 etc.. to the data table each time this is run  */ 
/* !!!!!!! This is an issues because in order for the automation below to work, it looks for logpredict only, so will only catch first run  */
/* !!!!!!! We caught this too late to clean the code, but the main workaround is anytime you want to run a new test, have to run ALL of the code */
/* !!!!!!! Basically have to push the run all button each time iwth nothing selected if you are trying to automate to final.csv output */


/* This preps the data for output by filling in the SalePrice with the predicted values from the proc glm command*/
/**** !!!!! YOU MUST RUN THE ENTIRE CODE OR THIS STEP WILL RECYCLE PREVIOUS PROC GLM OUTPUT  See note above !!!! ***/
data kaggle_out (KEEP=id SalePrice);
   set results;
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
outfile='/home/pbedwards0/Phil/final.csv'              /* <---- YOUR PATH HERE */
dbms=csv replace; 
delimiter=',';
run;




