# group by is used to group rows that have same values in a specific column. an 
# aggregate(ie. mean max count etc) function can then be performed on. if u are not performing 
# an aggregate funtion, the selected coulmn needs to much the group by column.
select avg(age)
from  employee_demographics group by first_name;

select occupation, salary
from employee_salary group by occupation, salary;

select occupation, avg(salary)
from employee_salary group by occupation;
select gender, first_name, avg(age), max(age), count(age)
from employee_demographics group by gender, first_name;
#order by sort the result in asceding or descending way.
select *
from employee_salary order by first_name;

select *
from employee_demographics order by gender, age desc;

select gender, avg(`age`) as av
from employee_demographics group by gender order by av desc








