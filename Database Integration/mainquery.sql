-- Creating tables for USGasStorage
CREATE TABLE USGasStorage (
     Weekly_Date DATE NOT NULL,
     Weekly_Ending_Stocks_of_Gasoline DEC NOT NULL,
     PRIMARY KEY (Weekly_Date)
);
SELECT * FROM USGasStorage;

UPDATE USGasStorage
SET Weekly_Date = Weekly_Date - 4;
SELECT * FROM USGasStorage;


-- Creating tables for SP500
CREATE TABLE SP500 (
     Daily_Date DATE NOT NULL,
     GSPC_Open DEC NOT NULL,
	 GSPC_High DEC NOT NULL,
	 GSPC_Low DEC NOT NULL,
	 GSPC_Close DEC NOT NULL,
	 GSPC_Volume Numeric NOT NULL,
	 GSPC_Adjusted DEC NOT NULL,
     PRIMARY KEY (Daily_Date)
);
SELECT * FROM SP500;


-- Creating tables for USRegularGasPrice
CREATE TABLE USRegularGasPrice (
     Weekly_Date DATE NOT NULL,
     Weekly_Regular_Retail_Gasoline_Prices DEC NOT NULL,
     PRIMARY KEY (Weekly_Date)
);
SELECT * FROM USRegularGasPrice;


-- Joining USRegularGasPrice and USGasStorage tables
SELECT USRegularGasPrice.weekly_date, USGasStorage.weekly_ending_stocks_of_gasoline, USRegularGasPrice.weekly_regular_retail_gasoline_prices
INTO GasData
FROM USGasStorage
INNER JOIN USRegularGasPrice ON
USRegularGasPrice.weekly_date = USGasStorage.weekly_date;

SELECT * FROM GasData;

-- Joining Gasdata and Stockdata tables
SELECT GasData.weekly_date, GasData.weekly_ending_stocks_of_gasoline, GasData.weekly_regular_retail_gasoline_prices,
	SP500.daily_date, 
	SP500.gspc_open, 
	SP500.gspc_high, 
	SP500.gspc_low,
	SP500.gspc_close, 
	SP500.gspc_volume, 
	SP500.gspc_adjusted
INTO DraftData
FROM SP500
INNER JOIN GasData ON
GasData.weekly_date = SP500.daily_date;

SELECT * FROM DraftData;

-- Creating tables for oilcompanies stockdata
CREATE TABLE OilCompaniesStockdata (
     Weekly_Date DATE NOT NULL,
     XOM DEC NOT NULL,
	 CVX DEC NOT NULL,
     PRIMARY KEY (Weekly_Date)
);
SELECT * FROM OilCompaniesStockdata;

-- Joining Draftdata and oilcompanies stcok tables
SELECT DraftData.weekly_date, DraftData.weekly_ending_stocks_of_gasoline, DraftData.weekly_regular_retail_gasoline_prices,
	DraftData.gspc_open, DraftData.gspc_high, DraftData.gspc_low, DraftData.gspc_close, DraftData.gspc_volume, DraftData.gspc_adjusted,
	OilCompaniesStockdata.xom, 
	OilCompaniesStockdata.cvx
INTO FinalMainData
FROM OilCompaniesStockdata
INNER JOIN DraftData ON
DraftData.weekly_date = OilCompaniesStockdata.weekly_date;
SELECT * FROM FinalMainData;
