ods trace on;

*Inputting Data;
data housing;
	infile "~/STAT448/Final Project/train.csv" dsd firstobs = 2 missover;
	input Id MSSubClass MSZoning $ LotFrontage LotArea Street $
	Alley $ LotShape $ LandContour $ Utilities $ LotConfig $ LandSlope $ 
	Neighborhood $ Condition1 $ Condition2 $ BldgType $ HouseStyle $ 
	OverallQual OverallCond YearBuilt YearRemodAdd RoofStyle $ 
	RoofMatl $ Exterior1st $ Exterior2nd $ MasVnrType $ MasVnrArea 
	ExterQual $ ExterCond $ Foundation $ BsmtQual $ BsmtCond $ BsmtExposure $
	BsmtFinType1 $ BsmtFinSF1 BsmtFinType2 $ BsmtFinSF2 BsmtUnfSF
	TotalBsmtSF Heating $ HeatingQC $ CentralAir $ Electrical $ FirstFlrSF 
	SecondFlrSF LowQualFinSF GrLivArea BsmtFullBath BsmtHalfBath 
	FullBath HalfBath BedroomAbvGr KitchenAbvGr KitchenQual $ 
	TotRmsAbvGr Functional $ Fireplaces FireplaceQu $ GarageType $ 
	GarageYrBlt GarageFinish $ GarageCars GarageArea GarageQual $ 
	GarageCond $ PavedDrive $ WoodDeckSF OpenPorchSF EnclosedPorch 
	ThreeSsnPorch ScreenPorch PoolArea PoolQC $ Fence $ MiscFeature $ 
	MiscVal MoSold YrSold SaleType $ SaleCondition $ SalePrice;
run;

*Logistic Regression;
*Original Logistic Regression with both continuous and categorical predictors;
proc logistic data = housing desc plots=influence(unpack);
	class MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
	Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle 
	RoofMatl Exterior1st Exterior2nd MasVnrType MasVnrArea 
	ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure
	BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual 
	Functional FireplaceQu GarageType GarageFinish GarageQual
	GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
	model CentralAir = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
	Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle 
	RoofMatl Exterior1st Exterior2nd MasVnrType MasVnrArea 
	ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure
	BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual 
	Functional FireplaceQu GarageType GarageFinish GarageQual
	GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
	output out = diags cbar = cbar;
	ods select CBarPlot;
run;

* 2 attempts at improving CBarplot for original logistic regression model;
proc logistic data = diags desc plots=influence(unpack);
	class MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
	Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle 
	RoofMatl Exterior1st Exterior2nd MasVnrType MasVnrArea 
	ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure
	BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual 
	Functional FireplaceQu GarageType GarageFinish GarageQual
	GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
	model CentralAir = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
	Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle 
	RoofMatl Exterior1st Exterior2nd MasVnrType MasVnrArea 
	ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure
	BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual 
	Functional FireplaceQu GarageType GarageFinish GarageQual
	GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
	where cbar< 2000000;
	output out = diags1 cbar = cbar1;
	ods select CBarPlot;
run;

proc logistic data = diags1 desc plots=influence(unpack);
	class MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
	Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle 
	RoofMatl Exterior1st Exterior2nd MasVnrType MasVnrArea 
	ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure
	BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual 
	Functional FireplaceQu GarageType GarageFinish GarageQual
	GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
	model CentralAir = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
	Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle 
	RoofMatl Exterior1st Exterior2nd MasVnrType MasVnrArea 
	ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure
	BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual 
	Functional FireplaceQu GarageType GarageFinish GarageQual
	GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
	where cbar1<500000;
	ods select CBarPlot;
run;

*Logistic model with only continuous predictors;
proc logistic data = housing desc plots=influence(unpack);
	model CentralAir = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice;
	output out = diags2 cbar = cbar2;
	ods select CBarPlot ParameterEstimates OddsRatios GlobalTests;
run;

* 2 attempts at improving CBarplot for logistic regression model with only continuous predictors;
proc logistic data = diags2 desc plots=influence(unpack);
	model CentralAir = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice;
   	where cbar2 < 2;
	output out = diags3 cbar = cbar3;
	ods select CBarPlot;
run;

proc logistic data = diags3 desc plots=influence(unpack);
	class MSZoning Street Alley LotShape LandContour Utilities LotConfig LandSlope
	Neighborhood Condition1 Condition2 BldgType HouseStyle RoofStyle 
	RoofMatl Exterior1st Exterior2nd MasVnrType MasVnrArea 
	ExterQual ExterCond Foundation BsmtQual BsmtCond BsmtExposure
	BsmtFinType1 BsmtFinType2 Heating HeatingQC CentralAir Electrical KitchenQual 
	Functional FireplaceQu GarageType GarageFinish GarageQual
	GarageCond PavedDrive PoolQC Fence MiscFeature SaleType SaleCondition;
	model CentralAir = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
    EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice;
   	where cbar3 < 2;
	ods select CBarPlot;
run;

*Stepwise selection for Logistic regression model with only continuous predictors;
proc logistic data = housing desc;
	model CentralAir = MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice / selection=stepwise;
	ods select ModelBuildingSummary;
run;

*Final logistic regression model;
proc logistic data = housing desc plots=influence(unpack);
	model CentralAir = YearBuilt OverallCond Fireplaces GarageYrBlt MSSubClass OpenPorchSF TotalBsmtSF 
	GarageArea SalePrice;
	ods select FitStatistics OddsRatios CBarPlot;
run;




*Discriminant Analysis;
*Discriminant analysis with all continuous variables;
proc discrim data = housing pool = test crossvalidate manova;
	class CentralAir;
	var MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice;
  	priors proportional;
  	ods select ChiSq MultStat ClassifiedCrossVal ErrorCrossVal;
run;

*Stepwise selection;
proc stepdisc data = housing sle = .05 sls = .05;
   	class CentralAir;
   	var MSSubClass LotFrontage LotArea OverallQual OverallCond YearBuilt YearRemodAdd 
   	BsmtFinSF1 BsmtFinSF2 BsmtUnfSF TotalBsmtSF FirstFlrSF SecondFlrSF LowQualFinSF 
   	GrLivArea BsmtFullBath BsmtHalfBath FullBath HalfBath BedroomAbvGr KitchenAbvGr 
   	TotRmsAbvGr Fireplaces GarageYrBlt GarageCars GarageArea WoodDeckSF OpenPorchSF 
   	EnclosedPorch ThreeSsnPorch ScreenPorch PoolArea MiscVal MoSold YrSold SalePrice;
	ods select Summary;
run;

*Discriminant analysis with selected variables;
proc discrim data = housing pool = test crossvalidate manova;
	class CentralAir;
	var YearBuilt OverallCond KitchenAbvGr Fireplaces OpenPorchSF MSSubClass GarageYrBlt 
	GarageCars BedroomAbvGr FullBath;
  	priors proportional;
  	ods select ChiSq MultStat ClassifiedCrossVal ErrorCrossVal;
run;

*Discriminant analysis with selected variables which also had partial r-squared values greater than 0.05;
proc discrim data = housing pool = test crossvalidate manova;
	class CentralAir;
	var YearBuilt OverallCond;
  	priors proportional;
  	ods select ChiSq MultStat ClassifiedCrossVal ErrorCrossVal;
run;