SELECT * FROM gasprice_factors;

SELECT * FROM "Gas_Price";

-- Joining GasPrice and Gaspricefactors tables
SELECT gasprice_factors."DATE", gasprice_factors."gasoline U.S. refinery production", gasprice_factors."Saudi Production Change Crude oil", gasprice_factors.gasoline_net_imports, "Gas_Price"."Quaterly_Regular_Retail_Gasoline_Prices" 
INTO summary_gasoline_price_factors
FROM gasprice_factors
INNER JOIN "Gas_Price" ON
gasprice_factors."DATE" = "Gas_Price"."DATE"

SELECT * FROM summary_gasoline_price_factors;