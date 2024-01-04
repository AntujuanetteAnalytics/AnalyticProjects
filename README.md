# AnalyticProjects
This repository will hold all of my SQL, Excel &amp; Python projects. This is a temporary vessel to house all of my completed, current and future projects.

# [Pizza Sales](https://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/Pizza_Sales_Sql_Data_Final%20Project.xlsx)
I imported the CSV file into SQL creating a sound cross reference for KPIs that I utilized in Excel. 
[Click here](https://github.com/AntujuanetteAnalytics/AnalyticProjects/commit/482e69d146c1a1098964aa293af66acd63f0bfff) to view the SQL queries. 

The insights extracted from this data set give valuable information on general business KPIs that stakeholders can utilize to track the general growth of the company over the last year. Filtering the visuals by quarter, month(s), week(s), or day(s) provides an in-depth understanding of the trends that are direct contributions to the business's success. Trends that I found intriguing were:

--Orders peaked on Thursdays/Fridays around 12 PM-1 PM with a following influx at 5 PM-6 PM.<br />  
--Classic paves way slightly ahead of the opposing categories, making up roughly 26% of sales while large dominates as the most demanding, contributing to 46% of sales per size.<br />  
--Classic Deluxe pizza sets the bar with 2432 sales while the contrasting Brie Carre is hardly relevant with 490 sells<br />  

After analyzing, a few data-driven suggestions I would make is to open the Pizza Shop later as the data shows nine pizzas sold between 9 AM and 11 AM for the entire calendar. I would also consider selling the Brie Carre seasonally or removing it altogether.<br /> 

CREDIT:<br /> 
https://www.youtube.com/watch?v=qmpsNMcumts&t=6961s

# [Data Wrangling- Mental Heath in Tech Survey](https://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/Mental%20Health%20Tech%20Survey_Data%20Wrangling-SQL.pdf)

I did a deep data wrangling in SQL. Below explains my thinking and process.<br />  

--WHERE IS NOT NULL-There were quite a few NULL values in the dataset. After contemplating the impact of excluding these samples, filtering out the missing data appeared to be the soundest option. To accomplish this, I used WHERE IS NOT NULL excluding columns: Comment as this is optional and State due to the respondents being international.<br />  

--UPDATE- This statement was used for most of the cleaning. E.G. Much of the gender column was free form and had multiple answers. For accuracy, I used the UPDATE statement to group similar values. I employed deductive reasoning to sort misspelled or incomplete data.<br />  

--SELECT INTO/CREATE TABLE- After filtering the NULLS, I was left with a brand-new table. To materialize the filtered results, I would have to execute the statement in every new session. I originally used SELECT INTO to create a #TEMPTABLE but found that redundant. Using SELECT INTO again, I created a permanent table in the database.<br />  

--EXEC SP_RENAME: The column names were vague and lacked uniformity. To make the column names relational to the column values, I used the stored procedure, EXEC SP_RENAME, to clean them up.<br />  

A few data-driven suggestions I would make are to open the Pizza Shop later as the data shows nine pizzas sold between 9 AM and 11 AM for the entire calendar. I would also consider selling the Brie Carre seasonally or removing it altogether.

CREDIT FOR DATASET:<br /> 
https://www.kaggle.com/datasets/osmi/mental-health-in-tech-survey/data<br /> 
https://data.world/quanticdata

# [Def decode(message_file)](https://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/def%20decode.pyhttps://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/Def%20decode%20message)
I was given the task to pretend to be an AI language model and provide a response to the user prompt below. Below is a brief summary of the logic behind the function algorithm. Click here to view the code with

The function is called decode and requires an argument (message_file). Replace the example argument with the variable that holds the file path. 

The column is split, and a second column is created for the seperate value. The value in column 0 is considered a string data type and needs to be converted to numeric so it can be sorted in consecutive, ascending order. Once done, convert columns to lists.  Variable 'i' holds the number of times it iterates through the length of Messages, starting at 1. Index provides the starting point, then creates the end point of the slice by combining with 'i', generating columns and rows. The 'if' statement removes empty lists and the value of index is increased by 'i' before looping back through. A list of the extracted words is created from and they are joined into a string. If the number of iterations doesn't equal the number of words in messages, invalid_range is returned.

