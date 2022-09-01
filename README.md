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
3. **Description of data source**

   We will be combining S&P 500 index data from Yahoo with weekly gas price data from Kaggle and EIA 

   1. Stock: GSPC Weekly Stock Data, CVX and XOM Daily Stock Price Open           

   Source: [Yahoo Finance](https://finance.yahoo.com/)

   2. Gas: Weekly US Regular All Formula Price, Weekly U.S. Ending Stocks of Total Gasoline 

   Source: [EIA](https://www.eia.gov/petroleum/gasdiesel/)

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

![](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Table_image.png)


The Scatter Plot below indicates and it would be some sort of correlation, however we also see some data stuck in one area which can indicate more than one model here would be ideal in order to get the most accurate results.


![](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Graph_1.png)

Using Scikit-Learn to perform a Linear Regression test for 1,068 values we get a Slope of 0.00025558 and a Y-intercept = 2.0820572529674304 The slope indicates the steepness of a line and the intercept indicates the location where it intersects an axis. The slope and the intercept define the linear relationship between two variables, and can be used to estimate an average rate of change. The greater the magnitude of the slope, the steeper the line and the greater the rate of change which means one variable is dependent of the other. In this case our line lack steepness in which case more than one model would be use to test correlation and find a better prediction.


![](https://github.com/InvestingGroupProject/Stock_And_Gas_Analysis/blob/main/Resources/Graph_2.png)

Second Model
Ensemble Methods

**Segment 2**
   
   1. Description of preliminary data preprocessing
   2. Description of preliminary feature engineering and preliminary feature selection, including their decision-making process
   3. Description of how data was split into training and testing sets
   4. Explanation of model choice, including limitations and benefits

### Database Integration

**Segment 1**

1. Sample data that mimics the expected final database structure or schema

![image](https://user-images.githubusercontent.com/103073631/187094904-ad69213d-7c7e-4aeb-9f9c-1c0b5162be96.png)


![image](https://user-images.githubusercontent.com/103073631/187143985-7e34064a-570c-4a60-8bce-0dc01b367576.png)


2. Draft machine learning module is connected to the provisional database

- We will use local database instead of AWS cloud database to create and merge table by time series, and we will export tables by cvs file to use for analysis and machine learning models.

### Dashboard

**Segment 1**

We will be creating a Tableau Dashboard 

**Segment 2** 

  1. Storyboard on Google Slide(s): Description of the tool(s) that will be used to create final dashboard
  2. Description of interactive element(s)

