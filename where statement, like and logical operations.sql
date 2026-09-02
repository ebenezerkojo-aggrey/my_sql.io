# where statement is used to filter our rows of data while the select clause is used to 
# filter column data.alter
select *
from employee_salary where last_name='knope';
select *
from employee_salary;
#(e.g. =, <>, !=, <, >, <=, >=, LIKE, IN, BETWEEN, etc.)


select *
from employee_salary where salary != 50000;

select *
from employee_demographics where gender != 'female' and first_name='tom';

select *
from employee_demographics where birth_date >'1985-01-01';

#logical operator and, or, not
select *
from employee_demographics where birth_date >'1985-01-01' and gender = 'female';

select *
from employee_demographics where last_name ='perkins' or not gender !='female';

select *
from employee_salary where (first_name = 'jerry' and salary <=50000) or occupation != 'nurse';


#like statement is used to find a specific row with the help of special
# characters "%,_". with like statement you dont need to be exact.

select *
from employee_salary where last_name like '%pe%' or first_name like '__m';

select *
from employee_demographics where birth_date like '%25'


















