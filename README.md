# Stock & Gas Analysis

### Overview 

Our group came together with a shared interest in stocks. After discussing several options for our project, we decided it'd be interesting to see if there are any correlations between stocks and the high gas prices we all experienced in the last few months. 

For our **data source**, we will be combining S&P 500 index data from Yahoo with weekly gas price data from EIA using sql. 

   1. S&P 500 Index from [Yahoo Finance](https://finance.yahoo.com/))

   2. Gas Prices from [EIA](https://www.eia.gov/petroleum/gasdiesel/))

   3. Final Data Source: [PostgresSQL Query to get final data source](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/mainquery.sql)

### Machine Learning Model
   
Our data comes from a local database (csv file). It has 9 columns and 1,180 rows. The 9 different columns are Week, Gasoline Stock Price, GSPC Open price, GSPC High price, GSPC Low price, GSPC Volume, GSPC Adjusted and finally Gas Price. 

The first step in building our ML model was to clean up the data. We did this by:
   1. Removing records that had invalid or null values from the raw data. This resulted in 1,068 rows (vs. 1,180)
   2. Formatting the weeks from date values to numerical values to use this within our model. Most of the data type is Float64 except for Gasoline Stock Price which is Int64.

***Data Types: Multivariate***

Our independent variable is the Stock Prices and our Y variable is the Gas Prices. 

<p align="center" width="100%">
    <img width="88%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Table_image.png">

**Models**

For the first model, we selected GSPC Close price as our x label and Gas Price as our Y label and created a scatter plot to see how the data behaved. The Scatter Plot below indicates some sort of correlation; however, we also see some data clustered in one area. This made us realize that in order to get more accurate results, we needed to incorporate different models.

<p align="center" width="100%">
    <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Graph_1.png">
    

For the second model, we created a Scikit-learn and performed the linear regression on the 9 columns. Then fit the data into the model. Using Scikit-Learn to perform a Linear Regression test for 1,068 values, we get a Slope of 0.00025558 and a Y-intercept = 2.0820572529674304. The slope indicates the steepness of a line and the intercept indicates the location where it intersects an axis. The slope and the intercept define the linear relationship between two variables, and can be used to estimate an average rate of change. The greater the magnitude of the slope, the steeper the line and the greater the rate of change which means one variable is dependent of the other. In this case our line lacks steepness. Like the first model, we found that more models are needed to test correlation and find a better prediction.



<p align="center" width="100%">
    <img width="60%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Graph_2.png">
      
We then created a predicted Y values based on X values and plotted the results for a best fit line. The slope was 0.00025558 and the y-intercept was 2.0820572529674304. 



Further test where necessary for the Linear Regression Model. Therefore we split the data into train and test data (80/20). 

<p align="center" width="100%">
   <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Week%203%20-%20%20Nadia/training_set_linear_regression.png">





<p align="center" width="100%">
   <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Week%203%20-%20%20Nadia/test_set_linear_regression.png">
   
   
   
   More testing was necessary.
   We did a prediction error for the Linear Regression Model that resulted in an R2 = 0.093
   
   
   <p align="center" width="100%">
   <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Week%203%20-%20%20Nadia/prediction_error_for_Linear_Regression.jpg">
   
   Then a Residual for Linear Regression Model was also generated with a RMSE or mean squared error of 0.7671114762339721. The Root Mean Square Error (RMSE) is the standard deviation of the residuals (prediction errors).
   
   
   <p align="center" width="100%">
   <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Week%203%20-%20%20Nadia/residuals_for_Linear_Regression.jpg">
      
   
   I was also able to compare the Linear Regression Model with a Polynomial Regression model with df =5 with a RMSE of 0.6459460141795336 which is better than the one for the Linear Regression
   
   
    <p align="center" width="100%">
   <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Week%203%20-%20%20Nadia/Polynomial_regression_df5.png">


 the Price on the TEST DATA
 
 
  <p align="center" width="100%">
   <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Week%203%20-%20%20Nadia/Price_actual_vs_prediction.png">
   
   
   
Predicting a new result with Linear Regression
lr.predict([[1505.97]])  Result: [2.47487911]
The actual number is 1.503

Predicting a new result with Polymonial Regression
pol_reg.predict(poly_reg.fit_transform([[1505.97]]))  Result: [2.81717812]


They're both close to the mean for the weekly gas price which is 2.538233


# Classification Model


The Data was also converted into a classification model using the percentage change between the new and old price of gas and stocks where if there was a decrease it will be indicated with a 0 and an increase with a 1.

We used Ensemble methods and Gradient Boosting to complete this part.

**The prediction vs. Actual**
  
<p align="Left" width="40%">
    <img width="40%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/Gradient_Boosting_prediction_pic.png">
    
To further find strong correlation in our data, we performed a Decision tree and random forest model with ensemble method such as gradient boosting. Before we were able to do this, we needed to transform our data into a classification type by adding 6 additional columns where 2 of them contain binary data (0s and 1s). We then defined our feature set by setting X to include Gasoline stock Price, GSPC Open, GSPC High, GSPC Low, GSPC Close, Stock Perc Change and Stock Change. Finally, we defined our target vector which includes the Gas change column only. 
   
The data was split into Train and Test sets with random state of 1, scaled and fitted. For the Gradient Booster we created a classifier object with different learning rates. Then fitted and scored the model and the resulted in the following accuracy scores for each learning rate  

**Learning Rate**
   
      Learning rate:  0.05
Accuracy score (training): 0.667
Accuracy score (validation): 0.596

Learning rate:  0.1
Accuracy score (training): 0.726
Accuracy score (validation): 0.615

Learning rate:  0.25
Accuracy score (training): 0.812
Accuracy score (validation): 0.620

Learning rate:  0.5
Accuracy score (training): 0.876
Accuracy score (validation): 0.648

Learning rate:  0.75
Accuracy score (training): 0.876
Accuracy score (validation): 0.643

Learning rate:  1
Accuracy score (training): 0.889
Accuracy score (validation): 0.643

The Confusion Matrix provided the following results

<p align="center" width="50%">
    <img width="50%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/Confusion_matrix_results.png">
     
 Finally, the Classification Report provided the following results
 
 <p align="center" width="50%">
    <img width="50%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/classification_report.png">
 
**Current Results**: Our original model choice was a linear regression since our data fitted a regression type rather than a classification type. However, this did not indicate that our data had a strong correlation and we needed to use different methods to reduce bias and variance. By changing our data to a classificatin type, we are able to use ensemble methods with decision tree and random forest to help boost the accuracy of the models and be able to show that our data has a strong correlation. Some of the limitations we found by the classification report is that our data has an accuracy score of 59% which is low and we will try to improve it in our next phase. 

**Results Update**: The gradient_boost model for the classification part of our model was updated and we were able to achieve an accuracy score of 65% which is a big improvememt. Perhaps our data needs new features in order for the accuracy to increase a lot more but it would be a great opportunity to continue working on as there is great potential to have a better prediction rate. 

### Database Integration

Below is an example of the data structure we started out with.

<p align="center" width="100%">
    <img width="90%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/main%20data_R%20analysis.png">

Below are the tables created through a sql query that resulted in the ***Final Data Source: [Gas & Stocks](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20Integration/static_data/ExportingMainData_Gas_Stocks.csv)*** through [successful importing and exporting](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20Integration/DatabaseTablesIMGs/Importing%20and%20Exporting.png)

<p align="center" width="100%">
    <img width="60%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20Integration/DatabaseTablesIMGs/Tables.png">
    
       Database Integration Table using for Machine Learning and Simple Linear regression R analysis

<p align="center" width="100%">
    <img width="95%" src="https://user-images.githubusercontent.com/103073631/188518704-95e1a338-12cc-4b15-884c-4483ba553e16.png">

And the code used to integrate our data source is outlined below:
<p align="center" width="100%">
    <img width="95%" src="https://user-images.githubusercontent.com/103073631/188805371-647e6f16-66a3-4eab-a585-2a6f00df19b2.png">

Further, we can confirm a successful [integration](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20R%20analysis/DatabaseIMGs/Exportingsummarytable.png), of three tables: [Gas Factor](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20R%20analysis/DatabaseIMGs/GasFactorsTable.png), [Gas Prices](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20R%20analysis/DatabaseIMGs/GasPriceTable.png) and a [Gas Summary Table](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20R%20analysis/DatabaseIMGs/Summary_gasoline_price_factors.png)

### Dashboard

[Stock & Gas Price Google Storyboard](https://docs.google.com/presentation/d/1g-wiozkn8TRJa1SklJrCTKV2E0PoE5pEpq2GHLDPEtY/edit?usp=sharing)

We will be creating a [Tableau Dashboard](https://public.tableau.com/app/profile/monica1331/viz/StockGasAnalysisCapstoneProject/Story1?publish=yes). Some of the interactive elements include filters by year (for both gas & stock overview) as well as the various graphs we will be replicating from R and ML.

