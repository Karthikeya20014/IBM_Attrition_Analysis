-- Creating a new Database
Create Database IBM_Attrition;

use IBM_Attrition;

-- Showing Tables
show tables;
-- Sample Data of a
Select * from a limit 5;

-- Basic Details of the Company Employees
-- Total Number of Employees.
Select count(*)Number_Of_Employees from A; -- 1470

-- Total Number of Employees who were attriated.
Select count(*)Attrited_Employees from A where attrition='Yes'; -- 237
-- Percentage of Employees Attrited -- 16.12% Attriated
Select round((count(case when attrition='Yes' then attrition end)/count(*))*100,2)Employee_Attrition_Percentage from A;

-- Investigating Who are mainly Leaving the Company
-- Who
-- Attrition by Age Category 
Select Age_Category,Count(Attrition)Attrition_Count from A where Attrition='Yes' group by Age_Category order by Count(Attrition) desc;
-- Attrition by Gender
Select Gender,Count(Attrition)Attrition_Count from A where Attrition='Yes' group by Gender order by Count(Attrition) desc; 
-- Attrition by Involvment Level
Select Involvment_Level,Count(Attrition)Attrition_Count from A where Attrition='Yes' group by Involvment_Level order by count(Attrition) desc;
-- Attrition by Job Level
Select Job_Level_Index,Count(Attrition)Attrition_Count from A where Attrition='Yes' group by Job_Level_Index order by Count(Attrition) desc;
-- Attrition by Department
Select Department,Count(Attrition)Attrition_Count from A where Attrition='Yes' group by Department order by Count(Attrition) desc;
-- Attrition by Company_Career_Duration
Select Company_Career_Duration,Count(Attrition)Attrition_Count from A where Attrition='Yes' group by Company_Career_Duration order by Count(Attrition) desc;

-- Investigating When they are leaving the Company
-- When
Select * from A limit 5;
-- Attrition by Role_Duration
Select Role_Duration,Count(Attrition)Attrition_Count from A where Attrition='Yes' group by Role_Duration order by Count(Attrition) desc;

-- Investigating Why they are leaving the Company
-- Why
-- Attrition by Distance from Office
Select * from A limit 5;
-- Attrition by Salary_Hike
Select Salary_Hike,count(Attrition)Attrition_Count from A where Attrition='Yes' group by Salary_Hike order by count(Attrition) desc;

-- Attrition by Overtime
Select OverTime,Count(Attrition)Attriction_Count from A where Attrition='Yes' group by OverTime order by Count(Attrition) desc;
-- Attrition by BuisnessTravel
Select BusinessTravel,Count(Attrition)Attrition_Count from A where attrition='Yes' group by BusinessTravel order by Count(Attrition) desc;