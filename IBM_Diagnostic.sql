-- Diagnostic Analysis
-- Investigating the root Causes for the Employees to leave the company.

-- 1)Poor Hike -- 200 Leaving -- 200/237 -- 84%
Select count(*)Attrition_Count from A where attrition='yes' and Salary_Hike='Poor_Hike(<20)'; -- 200
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)PoorHike_Attrition_Percentage;
-- Q1) Why Poor Hiked people leaving the Company
-- Poor Hiked People of Age Group Middle and Old Leaving the company around 121/200 -- 60%
Select count(*)Employees_Attriated from A where attrition='Yes' and Salary_Hike='Poor_Hike(<20)' and Age_Category in('Middle_Age(30-50)','Old(>50)'); -- Poor hike overtime attrition 104
Select round((Select count(*)Employees_Attriated from A where attrition='Yes' and Salary_Hike='Poor_Hike(<20)' and Age_Category in('Middle_Age(30-50)','Old(>50)'))/(Select count(*)Attrition_Count from A where attrition='yes' and Salary_Hike='Poor_Hike(<20)')*100,2)Attrition_Percentage;-- 60.50%
-- Poor Hike People of Whom are working overtime are leaving the Company 104/200 -- 52%
Select count(*)Employees_Attriated from A where attrition='Yes' and Salary_Hike='Poor_Hike(<20)' and Overtime='Y'; -- Poor hike overtime attrition 104
Select round((Select count(*)Employees_Attriated from A where attrition='Yes' and Salary_Hike='Poor_Hike(<20)' and Overtime='Y')/(Select count(*)Attrition_Count from A where attrition='yes' and Salary_Hike='Poor_Hike(<20)')*100,2)Attrition_Percentage;-- 52.00%

-- 2)Why Overtime People Are Leaving the Company
-- Number of People leaving the Company due to overtime -- 127 -- 53%
Select * from A where attrition='Yes' and Overtime='Y';
Select count(*) from A where attrition='Yes' and Overtime='Y'; -- 127 around 53%
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Overtime='Y')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)OverTime_Attrition_Percentage; -- 53.59

-- OverTime People who are poorly hiked were Leaving the company around 81% of the total attriation due to overtime
Select * from A where attrition='Yes' and Overtime='Y' and Salary_Hike='Poor_Hike(<20)';
Select count(*)Employees_Attriated from A where attrition='Yes' and Overtime='Y' and Salary_Hike='Poor_Hike(<20)'; -- 104
-- OverTime People whoose Job level is Basic were Leaving the company around 85% of the total attriation due to overtime
Select * from A where attrition='Yes' and Overtime='Y' and Job_Level_Index='Basic(<=2)';
Select count(*) Employees_Attriated from A where attrition='Yes' and Overtime='Y' and Job_Level_Index='Basic(<=2)'; -- 108

-- Q3)Why the department of Research and Development are Leaving the company -- 133 around 56%
Select count(*)Employees_Attriated from A where attrition='Yes' and Department='Research & Development'; -- 133
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Department='Research & Development')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)ResearchDevelopmentDepartment_Attrition_Percentage; -- 56.12

-- Employees of Research and Development and Job Level Basic are leaving the company out of people who left in this department whose number is 116 -87%
Select count(*)Employees_Attriated from A where attrition='Yes' and Department='Research & Development' and Job_Level_Index='Basic(<=2)';
-- Employees of Research and Development and Hike Poorly are leaving the company out of people who left in this department whose number is 107 -80%
Select count(*)Employees_Attriated from A where attrition='Yes' and Department='Research & Development' and Salary_Hike='Poor_Hike(<20)';

-- Q4)Why most of males getting attriated
-- No of Males Got Attriated -- 150
Select count(*)Attriation_Count from a where attrition='Yes' and Gender='M'; -- 150
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='M')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)Male_Attrition_Percentage; -- 63.29
-- Males Getting Attriated due to Poor hikes -- 128
Select count(*)Attriation_Count from A where attrition='Yes' and Gender='M' and Salary_Hike='Poor_Hike(<20)';-- 128
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='M' and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes' and Gender='M')*100,2)Male_PoorHike_Attrition; -- 85.33
-- Males Getting Attriated Due to Short Role Duration.
Select count(*)Attriation_Count from A where attrition='Yes' and Gender='M' and Role_Duration='Short(<=4)'; -- 119
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='M' and Role_Duration='Short(<=4)')/(Select count(*)Attrition_Count from A where attrition='yes' and Gender='M')*100,2)Male_ShortRole_Attrition; -- 79.33
-- Males Getting Attriated Due to Basic Job Level Index.
Select count(*)Attriation_Count from A where attrition='Yes' and Gender='M' and Job_Level_Index='Basic(<=2)'; -- 124
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='M' and Job_Level_Index='Basic(<=2)')/(Select count(*)Attrition_Count from A where attrition='yes' and Gender='M')*100,2)Male_JobLevel_Attrition; -- 79.33

-- Q5)Attriation for JobLevelBasic and Short duration in the Current Role
-- No of People Attriated whose Job Level in Basic -- 195
Select count(*)Attriation_Count from A where attrition='Yes' and Job_Level_Index='Basic(<=2)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Job_Level_Index='Basic(<=2)')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)BasicJobLevel_Attrition_Percentage; -- *2.28
-- No of People attriated at Basic Job Level and got Poor Hikes -- 162/195
Select count(*)Attriation_Count from A where attrition='Yes' and Job_Level_Index='Basic(<=2)' and Salary_Hike='Poor_Hike(<20)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Job_Level_Index='Basic(<=2)'and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes' and Job_Level_Index='Basic(<=2)')*100,2)BasicJobLevel_PoorHike_Percentage; -- 83.08

-- No of People Attriated whose duration in current role is short -- 183
Select count(*)Attriation_Count from A where attrition='Yes' and Role_Duration='Short(<=4)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Role_Duration='Short(<=4)')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)BasicJobLevel_Attrition_Percentage; -- *2.28

-- No of People attriated at Basic Job Level and got Poor Hikes -- 154/195
Select count(*)Attriation_Count from A where attrition='Yes' and Role_Duration='Short(<=4)' and Salary_Hike='Poor_Hike(<20)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Role_Duration='Short(<=4)'and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes' and Role_Duration='Short(<=4)')*100,2)ShortRole_PoorHike_Attrition; -- 84.15

-- No of People Attriated who are having Job Level Basic and Role Duration is Short -- 169/237
Select count(*)Attriation_Count from A where attrition='Yes' and Role_Duration='Short(<=4)' and Job_Level_Index='Basic(<=2)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Role_Duration='Short(<=4)'and Job_Level_Index='Basic(<=2)')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)BasicJobLevel_Attrition_Percentage; -- *2.28
-- No of People Attriated who are having Job Level Basic and Role Duration is Short and Hiked Poorly -- 142/169
Select count(*)Attriation_Count from A where attrition='Yes' and Salary_Hike='Poor_Hike(<20)'and  Role_Duration='Short(<=4)' and Job_Level_Index='Basic(<=2)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Role_Duration='Short(<=4)'and Job_Level_Index='Basic(<=2)'and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes' and Role_Duration='Short(<=4)'and Job_Level_Index='Basic(<=2)')*100,2)BasicJobShortDuration_PoorHike_Attrition; -- 84.02


-- Q6)Which Job Roles are getting attrited more
-- From Overall Job Roles 'Laboratory Technician','Sales Executive','Research Scientist' are accounting for the count of 166 for the attrition -- 166/237
Select count(*)Employees_Attrited from A where Attrition='Yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist'); -- 166
Select round((Select count(*)Attrition_Count from A where attrition='yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist'))/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)JobRole_Attrition_Percentage; -- 70.04
-- From the Above Job Roles who are attrited from the Company mostly due to Poor Hike around -- 135/166
Select count(*)Employees_Attrited from A where Attrition='Yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist') and Salary_Hike='Poor_Hike(<20)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist')and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist'))*100,2)JobRole_PoorHike_Attrition; -- 81.33
-- From the Above Job Roles who are attrited from the Company are maximum of Short Role Duration -- 130/166
Select count(*)Employees_Attrited from A where Attrition='Yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist') and Role_Duration='Short(<=4)';
Select round((Select count(*)Attrition_Count from A where attrition='yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist')and Role_Duration='Short(<=4)')/(Select count(*)Attrition_Count from A where attrition='yes' and JobRole in('Laboratory Technician','Sales Executive','Research Scientist'))*100,2)JobRole_ShortDuration_Attrition; -- 78.31

-- Q7)Why The People Whose Marital Status was Single or Married Attriting the Company -- 204/237
Select count(*)Employees_Attrited from A where Attrition='Yes' and MaritalStatus in('Single','Married'); -- 204
Select round((Select count(*)Attrition_Count from A where attrition='yes' and MaritalStatus in('Single','Married'))/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)Female_Attrition_Percentage; -- 86.82
-- In the Marital Status where the People are Poorly Hike are leaving the Company of a Number 172 -- 172
Select * from A where Attrition='Yes' and MaritalStatus in('Single','Married') and Salary_Hike='Poor_Hike(<20)'; -- 172
Select round((Select count(*)Attrition_Count from A where attrition='yes' and MaritalStatus in('Single','Married')and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes' and MaritalStatus in('Single','Married'))*100,2)Marital_Poor_Hike; -- 84.31
-- In the Marital Status where the People of Short Role Duration are leaving the Company by a Number -- 155
Select * from A where Attrition='Yes' and MaritalStatus in('Single','Married') and Role_Duration='Short(<=4)'; -- 155
Select round((Select count(*)Attrition_Count from A where attrition='yes' and MaritalStatus in('Single','Married')and Role_Duration='Short(<=4)')/(Select count(*)Attrition_Count from A where attrition='yes' and MaritalStatus in('Single','Married'))*100,2)Marital_RoleDuration_Attrition; -- 75.98
-- In the Marital Status where the People of Job Level Basic are leaving the Company by a Number -- 167
Select * from A where Attrition='Yes' and MaritalStatus in('Single','Married') and Job_Level_Index='Basic(<=2)'; -- 155
Select round((Select count(*)Attrition_Count from A where attrition='yes' and MaritalStatus in('Single','Married')and Job_Level_Index='Basic(<=2)')/(Select count(*)Attrition_Count from A where attrition='yes' and MaritalStatus in('Single','Married'))*100,2)Marital_RoleDuration_Attrition; -- 75.98

-- Q8)Why Females are Getting attrited
-- Total Number of Female Employees Attrited -- 87
Select count(*)Employees_Attrited from A where Attrition='Yes' and Gender='F'; -- 87
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='F')/(Select count(*)Attrition_Count from A where attrition='yes')*100,2)Female_Attrition_Percentage; -- 36.71
-- Females Attrited due to Poor Hike --73
Select count(*)Employees_Attrited from A where Attrition='Yes' and Gender='F' and Salary_Hike='Poor_Hike(<20)'; -- 72
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='F' and Salary_Hike='Poor_Hike(<20)')/(Select count(*)Attrition_Count from A where attrition='yes' and Gender='F')*100,2)Female_PoorHike_Attrition; -- 82.76
-- Females Attrited Due to Job Dissatisfaction --48
Select count(*)Employees_Attrited from A where Attrition='Yes' and Gender='F' and Environment_Satisfaction_Category='Not_Satisfied(<3)'; -- 48
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='F' and Environment_Satisfaction_Category='Not_Satisfied(<3)')/(Select count(*)Attrition_Count from A where attrition='yes' and Gender='F')*100,2)Female_PoorHike_Attrition; -- 55.17
-- Females Attrited Due to OverTime --47
Select count(*)Employees_Attrited from A where Attrition='Yes' and Gender='F' and OverTime='Y'; -- 47
Select round((Select count(*)Attrition_Count from A where attrition='yes' and Gender='F' and OverTime='Y')/(Select count(*)Attrition_Count from A where attrition='yes' and Gender='F')*100,2)Female_OverTime_Attrition; -- 54.02
