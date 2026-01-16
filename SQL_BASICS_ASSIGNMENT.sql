-- Q1) create a new database and table for employees 
-- task  Create a new database named company_db and Create a table named employees with the following columns 
-- Answer --

create database company_db ;
use company_db ;


create table employees (
employee_id INT primary key ,
first_name varchar (50),
last_name varchar (50),
department varchar (50),
salary int ,
hire_date date );

-- Q2. Insert Data into Employees Table
-- Task: Insert the following sample records into employees the table.
-- Answer --

insert into employees ( employee_id , first_name , last_name , department , salary , hire_date )
values
(101 , 'Amit' , 'Sharma' , 'Hr' , 50000 , '2020-01-15'),
(102 ,'Riya' , 'Kapoor' , 'sales', 75000, '2019-03-22'),
(103 , 'Raj' , 'Mehta' , 'IT', 90000 , '2018-07-11'),
(104 , 'Neha' , 'Verma' ,'IT' , 85000 , '2021-09-01' ),
(105 , 'Arjun' , 'Singh' , 'Finance' , 60000 , '2022-02-10');


-- Q3 Display All Employee Records Sorted by Salary (Lowest to Highest)
-- Hint: Use the order by clause on the salary column.
-- Answer --

select * from employees 
order by salary asc ;

-- Q4) Show Employees Sorted by Department (A–Z) and Salary (High → Low)
-- Answer -- 

select * from employees
order by department asc , salary desc ;

-- Q5. List All Employees in the IT Department, Ordered by Hire Date (Newest First)
-- Answer--

select * from employees 
where department = 'IT' 
order by hire_date  desc ;

-- Q6. Create and Populate a Sales Table
-- Task: Create a table Sales to track sales data:
-- Answer-- 


create table sales (
sale_id int ,
customer_name varchar (50),
amount decimal (10,2),
sale_date date );

insert into sales ( sale_id , customer_name , amount , sale_date )
values 
(1 , 'Aditi' , 1500 , '2024-08-01'),
(2, 'Rohan' , 2200 , '2024-08-03'),
(3, 'Aditi' , 3500 , '2024-09-05'),
(4, 'Meena' , 2700 , '2024-09-15'),
(5, 'Rohan' , 4500 , '2024-09-25'); 

-- Q7. Display All Sales Records Sorted by Amount (Highest → Lowest)
-- Answer --

select * from sales 
order by amount desc ;

-- Q8. Show All Sales Made by Customer “Aditi"
-- Answer -- 

select * from sales 
where customer_name = 'Aditi' ;

/* 
Q9. What is the Difference Between a Primary Key and a Foreign Key
-- Answer : -
1) Primary key : A primary key uniquely identifies each record in a table. 
                It cannot contain NULL or duplicate values.
                
2) Foreign key  : A foreign key is a column that refers to the primary key in another table, 
                 creating a relationship between the two tables.
                 
Q10. What Are Constraints in SQL and Why Are They Used?
-- Answer : - Constraints in SQL are rules applied to table columns to enforce data integrity.
		  Common types of constraints : 
          PRIMARY KEY , FOREIGN KEY , NOT NULL , UNIQUE , CHECK , DEFAULT 
          
*/



