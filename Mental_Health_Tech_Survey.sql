--DATA WRANGLING AND CLEANING—
	*CHECKED FOR DUPLICATES = 0

--ANALYZE EACH COLUMN--

SELECT DISTINCT column FROM survey

--FILTERING OUT NULLS --
    Note-Left out columns:
        'comment' due to optional  
        'state' due to codependency of other column values 

SELECT * FROM survey
WHERE 
Timestamp IS NOT NULL
AND Age IS NOT NULL
AND Gender IS NOT NULL
AND Country IS NOT NULL
AND self_employed IS NOT NULL
AND family_history IS NOT NULL
AND treatment IS NOT NULL
AND work_interfere IS NOT NULL
AND no_employees IS NOT NULL
AND remote_work IS NOT NULL
AND tech_company IS NOT NULL
AND benefits IS NOT NULL
AND care_options IS NOT NULL
AND wellness_program IS NOT NULL
AND seek_help IS NOT NULL
AND anonymity IS NOT NULL
AND leave IS NOT NULL
AND mental_health_consequence IS NOT NULL
AND phys_health_consequence IS NOT NULL
AND coworkers IS NOT NULL
AND supervisor IS NOT NULL
AND mental_health_interview IS NOT NULL
AND phys_health_interview IS NOT NULL
AND mental_vs_physical IS NOT NULL
AND obs_consequence IS NOT NULL

# --CREATING #TEMPTABLE—

SELECT * INTO #NoNull_Survey FROM survey
WHERE Timestamp IS NOT NULL
AND Age IS NOT NULL
AND Gender IS NOT NULL
AND Country IS NOT NULL
AND self_employed IS NOT NULL
AND family_history IS NOT NULL
AND treatment IS NOT NULL
AND work_interfere IS NOT NULL
AND no_employees IS NOT NULL
AND remote_work IS NOT NULL
AND tech_company IS NOT NULL
AND benefits IS NOT NULL
AND care_options IS NOT NULL
AND wellness_program IS NOT NULL
AND seek_help IS NOT NULL
AND anonymity IS NOT NULL
AND leave IS NOT NULL
AND mental_health_consequence IS NOT NULL
AND phys_health_consequence IS NOT NULL
AND coworkers IS NOT NULL
AND supervisor IS NOT NULL
AND mental_health_interview IS NOT NULL
AND phys_health_interview IS NOT NULL
AND mental_vs_physical IS NOT NULL
AND obs_consequence IS NOT NULL

--CREATING NEW TABLE FROM #TEMPTABLE—

SELECT * INTO TechSurvey FROM #NoNull_Survey  

--FILTERING NON-TECH COMPANY ANSWERS--

SELECT DISTINCT COUNT(Tech_Company) 
FROM TechSurvey
GROUP BY tech_company
HAVING tech_company = 'No'

SELECT * FROM
TechSurvey 
WHERE tech_company = 'YES'

--DELETING INVALID AGES--
SELECT DISTINCT TOP 5 AGE
FROM TechSurvey
ORDER BY Age DESC

SELECT DISTINCT TOP 5 AGE
FROM TechSurvey
ORDER BY Age ASC
DELETE FROM TechSurvey
WHERE AGE > 72 AND AGE < 18

--UPDATING VALUES TO CREATE UNIFORMITY—

UPDATE TechSurvey
  SET [no_employees] = '5-26'
  WHERE [no_employees] = '25-JUN'

UPDATE TechSurvey
  SET [comments] = 'N/A'
  WHERE [comments] IS NULL

UPDATE TechSurvey
  SET [state] = 'N/A'
  WHERE [state] IS NULL

UPDATE TechSurvey
  SET [no_employees] = 'Male'
  WHERE [no_employees] = 'M'

UPDATE TechSurvey
  SET [no_employees] = 'Female'
  WHERE [no_employees] = 'Female (cis)'
  
UPDATE TechSurvey
  SET [no_employees] = 'Other'
  WHERE [no_employees] = 'non-binary'

# --CHANGING COLUMN NAMES FOR BETTER COMPRHENSION AND UNIFORMITY--

EXEC sp_rename 'TechSurvey.state'

# Credit:
[Mental Health in Tech Survey (kaggle.com)](https://www.kaggle.com/datasets/osmi/mental-health-in-tech-survey/data)
[Mental Health in Tech Survey - dataset by quanticdata | data.world](https://data.world/quanticdata/mental-health-in-tech-survey)
