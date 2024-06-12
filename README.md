# AnalyticProjects
This repository will hold all of my SQL, Excel &amp; Python projects. This is a temporary vessel to house all of my completed, current, and future projects.

# [Pizza Sales (SQL & Excel Dashboard)](https://github.com/AntujuanetteAnalytics/AnalyticProjects/commit/482e69d146c1a1098964aa293af66acd63f0bfff) 
I imported the CSV file into SQL, creating a sound cross reference for KPIs that I utilized in Excel.

The insights extracted from this data set give valuable information on general business KPIs that stakeholders can utilize to track the general growth of the company over the last year. Filtering the visuals by quarter, month(s), week(s), or day(s) provides an in-depth understanding of the trends that are direct contributions to the business's success. Trends that I found intriguing were:

--Orders peaked on Thursdays/Fridays around 12 PM-1 PM with a following influx at 5 PM-6 PM.<br />  
--Classic paves way slightly ahead of the opposing categories, making up roughly 26% of sales, while large dominates as the most demanding, contributing to 46% of sales per size.<br />  
--Classic Deluxe pizza sets the bar with 2432 sales while the contrasting Brie Carre is hardly relevant with 490 sales <br />  

After analyzing, a few data-driven suggestions I would make is to open the Pizza Shop later, as the data shows nine pizzas sold between 9 AM and 11 AM for the entire calendar. I would also consider selling the Brie Carre seasonally or removing it altogether.<br /> 

CREDIT:<br /> 
https://www.youtube.com/watch?v=qmpsNMcumts&t=6961s

# [Mental Health in Tech Survey(SQL)](https://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/Mental_Health_Tech_Survey.sql)

I did a deep data wrangling in SQL. to view SQL code. Below explains my thinking and process.<br />  

--WHERE IS NOT NULL-There were quite a few NULL values in the dataset. After contemplating the impact of excluding these samples, filtering out the missing data appeared to be the soundest option. To accomplish this, I used WHERE IS NOT NULL excluding columns: Comment as this is optional and State due to the respondents being international.<br />  

--UPDATE- This statement was used for most of the cleaning. For example, much of the gender column was free-form and had multiple answers. For accuracy, I used the UPDATE statement to group similar values. I employed deductive reasoning to sort misspelled or incomplete data.<br />  

--SELECT INTO/CREATE TABLE- After filtering the NULLS, I was left with a brand-new table. To materialize the filtered results, I would have to execute the statement in every new session. I originally used SELECT INTO to create a #TEMPTABLE but found that redundant. Using SELECT INTO again, I created a permanent table in the database.<br />  

--EXEC SP_RENAME: The column names were vague and lacked uniformity. To make the column names relative to the column values, I used the stored procedure, EXEC SP_RENAME, to clean them up.<br />  

CREDIT FOR DATASET:<br /> 
https://www.kaggle.com/datasets/osmi/mental-health-in-tech-survey/data<br /> 
https://data.world/quanticdata

# [Decoder(Python)](https://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/def%20decode.pyhttps://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/Def%20decode%20message)
I was tasked with pretending to be an AI language model and responding to the user prompt below. Below is a brief summary of the logic behind the function algorithm.

The function is called decode and requires an argument (message_file). Replace the example argument with the variable that holds the file path. 

The column is split, and a second column is created for the separate value. The value in column 0 is considered a string data type and needs to be converted to numeric to be sorted in consecutive, ascending order. Once done, convert columns to lists.  Variable 'i' holds the number of times it iterates through the length of Messages, starting at 1. Index provides the starting point, then creates the endpoint of the slice by combining with 'i', generating columns and rows. The 'if' statement removes empty lists, and the index value is increased by 'i' before being looped back through. A list of the extracted words is created and joined into a string. If the number of iterations doesn't equal the number of words in messages, invalid_range is returned.

# [Standard Deviation Function(Python)](https://github.com/AntujuanetteAnalytics/AnalyticProjects/blob/main/Standard_Deviation_Function.py)
I wanted to create a function that returns the standard deviation quickly, regardless of the number of values. This is a simple yet effective project. I utilized Matpltlib and NumPy libraries. 
