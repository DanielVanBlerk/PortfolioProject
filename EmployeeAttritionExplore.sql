#Attrition count by age:
SELECT COUNT(Age)
FROM BusinessAttrition
WHERE (Age >= 20 AND Age <= 29) AND (Attrition = 'Yes');
#20 - 29 age count is 81
SELECT COUNT(Age)
FROM BusinessAttrition
WHERE (Age >= 30 AND Age <= 39) AND (Attrition = 'Yes');
#30 - 39 age count is 89
SELECT COUNT(Age)
FROM BusinessAttrition
WHERE (Age >= 40 AND Age <= 49) AND (Attrition = 'Yes');
#40 - 49 age count is 35
SELECT COUNT(Age)
FROM BusinessAttrition
WHERE (Age >= 50 AND Age <= 59) AND (Attrition = 'Yes');
#50 - 59 age count is 23
#Therefore 30 - 39 age group displays highest level of attrition

#Attrition of high performing employees with no promotion for past 4 years or more
SELECT Attrition, YearsSinceLastPromotion
FROM BusinessAttrition
WHERE PerformanceRating = (SELECT MAX(PerformanceRating) FROM BusinessAttrition)
AND YearsSinceLastPromotion >= 4
ORDER BY Attrition DESC, YearsSinceLastPromotion DESC;
#Of the high performing employees, four individuals contributed to the attrition count
#Lowest number of years since promotion of these four individuals was 4 years, maximum was 10 years, and the mode amount was 6 years

#Attrition % of Data Set
SELECT COUNT(*)
FROM BusinessAttrition
WHERE Attrition = 'Yes';
#238 Employees left the business
SELECT (238/1472)*100;
#16,17% of data set left the business

#Impact of Education Level on Attrition
SELECT Education, COUNT(Education)
FROM BusinessAttrition
GROUP BY Education;
#Level 1:171, Level 2:283, Level 3: 572, Level 4:398, Level 5:48 
SELECT Education, COUNT(Education)
FROM BusinessAttrition
WHERE Attrition = 'Yes'
GROUP BY Education;
#Level 1: 31 (18,13% Level 1), Level 2: 45 (15,9% of Level 2), Level 3: 99 (17,31% of Level 3), Level 4: 58 (14,57% of Level 4), Level 5: 5 (10,42% of Level 5)
#Education level 3 showed the highest attrition count, while Level 1 showed the highest attrition %

#Impact of Education Field on Attrition
SELECT EducationField, COUNT(EducationField)
FROM BusinessAttrition
GROUP BY EducationField;
#Life Sciences: 608, Medical: 464, Marketing: 159, Technical Degree: 132, HR: 27, Other: 82
SELECT EducationField, COUNT(EducationField)
FROM BusinessAttrition
WHERE Attrition = 'Yes'
GROUP BY EducationField;
#Life Sciences: 90(14,8%), Medical: 63(13,58%), Marketing: 35(22%), Technical Degree: 32(24,24%), HR: 7(25,93%), Other: 11(13,41%)
#Life Sciences shows the highest attrition count, while Technical Degree shows the highest attrition %

#Maximum Salaries per Department below a 13% salary hike:
SELECT Department,
	MAX(MonthlyIncome)
FROM BusinessAttrition
WHERE PercentSalaryHike < 13
GROUP BY Department
ORDER BY MAX(MonthlyIncome) DESC;
#R&D: 9980, Sales: 9924, HR: 6410

#Attrition by Department
SELECT Department, COUNT(Department)
FROM BusinessAttrition
GROUP BY Department;
#R&D: 962, Sales: 447, HR: 63
SELECT Department, COUNT(Department)
FROM BusinessAttrition
WHERE Attrition = 'Yes'
GROUP BY Department;
#R&D: 133(13,83%), Sales: 93(20,8%), HR: 12(19%)
#R&D showed highest attrition count, while Sales had the highest attrition %
#On the surface level would seem that the maximum salary below a 13% salary hike does not have an influence on attrition by department. Should investigate if data visaulisations could uncover any underlying information.

#Attrition by Job Role
SELECT JobRole, COUNT(JobRole)
FROM BusinessAttrition
GROUP BY JobRole;
#Sales Exec: 327, Research Scientist: 293, Lab Tech: 259, Manufac Director: 145, Healthcare Rep: 131, Manager: 102, Sales Rep: 83, Research Director: 80, HR: 52
SELECT JobRole, COUNT(JobRole)
FROM BusinessAttrition
WHERE Attrition = 'Yes'
GROUP BY JobRole;
#Sales Exec: 58(17,74%), Research Scientist: 47(16,04%), Lab Tech: 62(23,94%), Manufac Director: 10(6,9%), Healthcare Rep: 9(6,87%), Manager: 5(4,9%), Sales Rep: 33(40%), Research Director: 2(2,5%), HR: 12(23,08%)
#Lab Tech showed the highest attrition count, while Sales Rep displayed the highest attrition count.

#Impact of Distance From Home on Attrition
SELECT DistanceFromHome, COUNT(DistanceFromHome)
FROM BusinessAttrition
WHERE Attrition = 'Yes'
GROUP BY DistanceFromHome;
#DistanceFrom Home = 2 is the mode at a count of 28, followed closely by DistanceFromHome = 1 at a count of 27
#DistanceFromHome = 29 displayed a count of 5, 29 is the furthest distance in the data set
#Those closer to home display a higher attrition count than those further away, would need to implement data visualiations to identify any further patterns.alter










