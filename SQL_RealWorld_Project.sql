use HRDatabase
--This is finding table name----
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';
------ 1. Preview Data--------
---show first 10 rows to explore the table-----
select TOP 10 * from HRDataset_v14;

----- 2. Department-wise Employee count-----
/*count of employees in each department */
select Department, COUNT(*) AS Total_Employees
From HRDataset_v14
Group By Department;

---- 3.Average salery by department----
/* average salery per department */
select Department,AVG(Salary) AS Avg_Salary
From HRDataset_v14
Group By Department;

---- 4.Employees Earning More Than Company Average----
/*Employees earning above average salary*/
SELECT *
FROM HRDataset_v14
WHERE Salary > (
    SELECT AVG(Salary) FROM HRDataset_v14
);

----- 5. Rank Employees by Salary in Each Department----
-- Rank employees by salary within each department---
SELECT Employee_Name, Department, Salary,
       RANK() OVER (PARTITION BY Department ORDER BY Salary DESC) AS DeptRank
FROM HRDataset_v14;


--- 6. Gender-wise Employee Count----
-- Count of male and female employees----
SELECT Sex, COUNT(*) AS Total_Employees
FROM HRDataset_v14
GROUP BY Sex;


----7. Find Departments with Highest Attrition ---
-- Count employees who have left (Attrition = 'Yes') by department----
SELECT Department, COUNT(*) AS Attrition_Count
FROM HRDataset_v14
GROUP BY Department
ORDER BY Attrition_Count DESC;


---- 8. List Top 5 Highest Paid Employees---
SELECT TOP 5 Employee_Name, Salary, Department
FROM HRDataset_v14
ORDER BY Salary DESC;

---9.-- Create a view to use in multiple reports
SELECT Department, COUNT(*) AS Attrition_Count
FROM HRDataset_v14
GROUP BY Department;







