# Final Project: Group Capstone

**Group Number 4:** Claire D, John M. Nadiezhda H, Monica J

**Description of the communication protocols:** 
  - Communication thru Slack Channel - `investing-group-project`
  - Every Monday and Wednesday in-Class catch-up
  - Every Saturday Weekly catch-up meeting Google meeting or Zoom meeting

# Stock And Gas Analysis

### Presentation 

[Stock & Gas Price Google Slide Presentation](https://docs.google.com/presentation/d/1g-wiozkn8TRJa1SklJrCTKV2E0PoE5pEpq2GHLDPEtY/edit?usp=sharing) 

**Segment 1**
1. **Selected Topic:** Correlation between S&P 500 and Gas Prices
2. **Reason why we've selected our topic:** Our team was interested in analyzing stock data and after discussing different options, we decided it would be interesting to see if there is any correlation between stock and gas prices. Gas prices reached an all time high earlier in the year and we all felt the impact.
3. **Description of data source:** We will be combining S&P 500 index data from Yahoo with weekly gas price data from Kaggle and EIA 

   1. Stock: GSPC Weekly Stock Data, CVX and XOM Daily Stock Price Open (Source: [Yahoo Finance](https://finance.yahoo.com/))

   2. Gas: Weekly US Regular All Formula Price, Weekly U.S. Ending Stocks of Total Gasoline (Source: [EIA](https://www.eia.gov/petroleum/gasdiesel/))

   3. Final Data Source: [Gas & Stocks](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Gas%20and%20Stocks.csv)
  
4. **Questions we hope to answer:** In addition to understanding if there is a correlation between stock and gas prices, we would also like to use the data to answer the following questions:

   1. How has the stock market, specifically S&P500, changed in the last X years?
   2. What drives petroleum product prices? 
   4. Can we predict gas or stock price behavior? 

**Segment 2**

5. **Description of the data exploration phase of the project:**
6. **Description of the analays phase of the project:**

### Machine Learning Model

**Segment 1** 
   
   1. **Takes in data in from the provisional database:**  the local database was created by merging large sets of data in a time series table and we exported tables by cvs file to use for models.
   
   2. **Outputs label(s) for input data:** For the first part on the Machine learning section. We wil be using Supervised Machine Learning Linear Regression Model to test the correlation between the Gas Prices and Stock Prices.

Data Types: Multivariate

Our independent variable is the Stock Prices and our Y variable is the Gas Prices.

<p align="center" width="100%">
    <img width="88%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Table_image.png">

The Scatter Plot below indicates and it would be some sort of correlation, however we also see some data stuck in one area which can indicate more than one model here would be ideal in order to get the most accurate results.

<p align="center" width="100%">
    <img width="66%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Graph_1.png">

Using Scikit-Learn to perform a Linear Regression test for 1,068 values we get a Slope of 0.00025558 and a Y-intercept = 2.0820572529674304 The slope indicates the steepness of a line and the intercept indicates the location where it intersects an axis. The slope and the intercept define the linear relationship between two variables, and can be used to estimate an average rate of change. The greater the magnitude of the slope, the steeper the line and the greater the rate of change which means one variable is dependent of the other. In this case our line lack steepness in which case more than one model would be use to test correlation and find a better prediction.

<p align="center" width="100%">
    <img width="60%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Graph_2.png">

Second Model
Ensemble Methods

**Segment 2**
   
   1. Description of preliminary data preprocessing
   For our Machine Learning section, we combined data from Yahoo for the &P 500 index data with weekly gas price data from Kaggle and EIA.
   Our Initial data comes from csv file with 9 columns and 1,180 rows.
   The 9 different columns are Week, Gasoline Stock Price, GSPC Open price, GSPC High price, GSPC Low price, GSPC Volumen, GSPC Adjusted and finally Gas Price.
   Data Cleaning Step:
   We removed records that have invalid or null values from the raw data and ended with 1,068 rows. 
   We also formatted the weeks from date to numerical values to be able to use these data within our model. Most of the data type is Float64 and except for Gasoline Stock Price which is Int64.
   
   2. Description of preliminary feature engineering and preliminary feature selection, including their decision-making process
   We selected GSPC Close price to be our x label and Gas Price to be our Y label for a scatter plot where we can have an idea of how the data will behave. 
   Then we reshaped the data using (-1, 1). Then we created a code to run a linear regression model where we dropped Gas Price column and used it to create the Y label and the GSPC Close price for the X label. Created the model with Scikit-learn and perform the linear regression on the 9 columns. Then fit the data into the model. 
   The next step was to create predicted y values based on X values and plotted the results for a best fit line. The slope was 0.00025558 and the y-intercept was 2.0820572529674304. 
   To find strong correlation in our data we perform a Decision tree and random forest model with ensemble method such as gradient boosting. 
   Before we were able to do this we needed to transform our data into a classfication type by adding 6 additional columns where 2 of them contain binary data (0s and 1s). 
   We then defined our feature set by setting X to include Gasoline stock Price, GSPC Open, GSPC High, GSPC Low, GSPC Close, Stock Perc Change and Stock Change. 
   Then we defined our target vector which includes the Gas change column only. 

   3. Description of how data was split into training and testing sets
  The data was split into Train and Test sets with random state of 1, scaled and fitted. For the Gradient Booster we created a classifier object with different learning rates. Then fitted and scored the model and the resulted in the following accuracy scores for each learning rate
  
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


  
The prediction vs. Actual

  
<p align="Left" width="40%">
    <img width="40%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/Gradient_Boosting_prediction_pic.png">


The Confusion Matrix provided the following results


<p align="center" width="50%">
    <img width="50%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/Confusion_matrix_results.png">
    
    
 Finally, the Classification Report provided the following results
 
 
 <p align="center" width="50%">
    <img width="50%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/Nadiezhda-Hernandez/Week%202%20-%20Nadia/classification_report.png">
 
 
   4. Explanation of model choice, including limitations and benefits
Our initial model choice was a linear regression model since our data fitted a regression type rather than a classification type. However, this did not show our data had a strong correlation and we needed to use different methods to reduce bias and variance. By changing our data to a classificatin type we are able to use ensemble methods with decision tree and random forest to help boost the accuracy of the models and be able to show our data has a strong correlation. Some of the limitations we found by the classification report is that our data has an accuracy score of 59% which is low and we wil try to improve it in our next phase. 

 
### Database Integration

**Segment 1**

1. Sample data that mimics the expected final database structure or schema

<p align="center" width="100%">
    <img width="95%" src="https://user-images.githubusercontent.com/103073631/188508795-952d7bf3-6d6d-4a98-9be9-7baca3896e2b.png">


<p align="center" width="100%">
    <img width="50%" src="https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Database2.png">

2. **Draft machine learning module is connected to the provisional database:** We will use local database instead of AWS cloud database to create and merge table by time series, and we will export tables by cvs file to use for analysis and machine learning models.

**Segment 2**

1. Database stores static data for use during the project

2. Database interfaces with the project in some format (e.g., scraping updates the database, or database connects to the model)

3. Includes at least two tables (or collections, if using MongoDB)

4. Includes at least one join using the database language (not including any joins in Pandas)

5. Includes at least one connection string (using SQLAlchemy or PyMongo)

### Dashboard

**Segment 2** 

  1. Storyboard using [Tableau Dashboard](https://public.tableau.com/app/profile/monica1331/viz/StockandGasAnalysis/Story1?publish=yes)
  2. Description of interactive element(s) 

