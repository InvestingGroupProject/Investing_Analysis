# Capstone Project

Our team is meeting three times per week and communicating through slack to complete this capstone project. 

# Stock & Gas Analysis

### Overview 

Our group came together with a shared interest in stocks. After discussing several options for our project, we decided it'd be interesting to see if there are any correlations between stocks and the high gas prices we all experienced in the last few months. 

For our **data source**, we will be combining S&P 500 index data from Yahoo with weekly gas price data from EIA using sql. 

   1. Stock: GSPC Weekly Stock Data, CVX and XOM Daily Stock Price Open (Source: [Yahoo Finance](https://finance.yahoo.com/))

   2. Gas: Weekly US Regular All Formula Price, Weekly U.S. Ending Stocks of Total Gasoline (Source: [EIA](https://www.eia.gov/petroleum/gasdiesel/))

   3. Final Data Source: [Gas & Stocks](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20Integration/static_data/ExportingMainData_Gas_Stocks.csv)
   
      [SQL Query to get final data source](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/mainquery.sql)
  
In addition to understanding if there are any correlations between stock and gas prices, we also set out to see if the data could tell us:

   1. How the stock market, specifically S&P500, has changed in the last 5 years
   2. What drives petroleum product prices; and
   4. If we could predict gas or stock price behavior

### Machine Learning Model
   
As mentioned. our data comes from a local database (csv file). It has 9 columns and 1,180 rows. The 9 different columns are Week, Gasoline Stock Price, GSPC Open price, GSPC High price, GSPC Low price, GSPC Volumen, GSPC Adjusted and finally Gas Price. 

<p align="center" width="100%">
    <img width="90%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/local%20database.png">

The first step in building our ML model was to clean up the data. We did this by:
   1. Removing records that had invalid or null values from the raw data. This resulted in 1,068 rows (vs. 1,180)
   2. Formatting the weeks from date values to numerical values in order to use this within our model. Most of the data type is Float64 except for Gasoline Stock Price which is Int64.

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

**The prediction vs. Actual**
  
<p align="Left" width="40%">
    <img width="40%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/Gradient_Boosting_prediction_pic.png">
    
To further find strong correlation in our data, we performed a Decision tree and random forest model with ensemble method such as gradient boosting. Before we were able to do this, we needed to transform our data into a classfication type by adding 6 additional columns where 2 of them contain binary data (0s and 1s). We then defined our feature set by setting X to include Gasoline stock Price, GSPC Open, GSPC High, GSPC Low, GSPC Close, Stock Perc Change and Stock Change. Finally, we defined our target vector which includes the Gas change column only. 
   
The data was split into Train and Test sets with random state of 1, scaled and fitted. For the Gradient Booster we created a classifier object with different learning rates. Then fitted and scored the model and the resulted in the following accuracy scores for each learning rate  

**Learning Rate**
   
      Learning rate:  0.05
      Accuracy score (training): 0.647
      Accuracy score (validation): 0.569

      Learning rate:  0.1
      Accuracy score (training): 0.687
      Accuracy score (validation): 0.584

      Learning rate:  0.25
      Accuracy score (training): 0.768
      Accuracy score (validation): 0.610

      Learning rate:  0.5
      Accuracy score (training): 0.800
      Accuracy score (validation): 0.588

      Learning rate:  0.75
      Accuracy score (training): 0.816
      Accuracy score (validation): 0.569

      Learning rate:  1
      Accuracy score (training): 0.828
      Accuracy score (validation): 0.524

The Confusion Matrix provided the following results

<p align="center" width="50%">
    <img width="50%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/Confusion_matrix_results.png">
    
    
 Finally, the Classification Report provided the following results
 
 <p align="center" width="50%">
    <img width="50%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/classification_report.png">
 
**Current Results**: Our original model choice was a linear regression since our data fitted a regression type rather than a classification type. However, this did not indicate that our data had a strong correlation and we needed to use different methods to reduce bias and variance. By changing our data to a classificatin type, we are able to use ensemble methods with decision tree and random forest to help boost the accuracy of the models and be able to show that our data has a strong correlation. Some of the limitations we found by the classification report is that our data has an accuracy score of 59% which is low and we will try to improve it in our next phase. 

### Database Integration

Below is a sample of the data structure we initially used in R

<p align="center" width="100%">
    <img width="95%" src="https://user-images.githubusercontent.com/103073631/188508795-952d7bf3-6d6d-4a98-9be9-7baca3896e2b.png">

<p align="center" width="100%">
    <img width="85%" src="https://user-images.githubusercontent.com/103073631/188508905-40854408-540b-4a74-b555-6334a2fc5ff0.png">

Below are the tables created through a sql query that resulted in the ***Final Data Source: [Gas & Stocks](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20Integration/static_data/ExportingMainData_Gas_Stocks.csv)*** through [successfull importing and exporting](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20Integration/DatabaseTablesIMGs/Importing%20and%20Exporting.png)

<p align="center" width="100%">
    <img width="60%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database%20Integration/DatabaseTablesIMGs/Tables.png">
    
       Database Integration Table using for Machine Learning and Simple Linear regression R analysis

<p align="center" width="100%">
    <img width="95%" src="https://user-images.githubusercontent.com/103073631/188518704-95e1a338-12cc-4b15-884c-4483ba553e16.png">

### Dashboard

[Stock & Gas Price Google Storyboard](https://docs.google.com/presentation/d/1g-wiozkn8TRJa1SklJrCTKV2E0PoE5pEpq2GHLDPEtY/edit?usp=sharing)

We will be creating a [Tableau Dashboard](https://public.tableau.com/app/profile/monica1331/viz/StockandGasAnalysis/Story1?publish=yes). Some of the interactive elements include filters by year (for both gas & stock overview) as well as the various graphs we will be replicating from R and ML.

