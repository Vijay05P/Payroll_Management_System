-- PAYROLL MANAGEMENT SYSTEM
-- create database
create database payroll_management;
-- use database 
use payroll_management;
-- create table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);
--
CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    JobTitle VARCHAR(100) NOT NULL,
    MinSalary DECIMAL(10,2),
    MaxSalary DECIMAL(10,2)
);
-- 
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(20),
    HireDate DATE NOT NULL,
    DepartmentID INT,
    JobID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)ON DELETE SET NULL,
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID)ON DELETE SET NULL
);
-- 
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmployeeID INT NOT NULL,
    BasicSalary DECIMAL(10,2) NOT NULL,
    OvertimePay DECIMAL(10,2) DEFAULT 0,
    Deductions DECIMAL(10,2) DEFAULT 0,
    Taxes DECIMAL(10,2) DEFAULT 0,
    NetSalary DECIMAL(10,2) NOT NULL,
    PayDate DATE NOT NULL,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)ON DELETE CASCADE
);
-- 
CREATE TABLE Deductions (
    DeductionID INT PRIMARY KEY,
    PayrollID INT NOT NULL,
    DeductionType VARCHAR(100),
    Amount DECIMAL(10,2),
    FOREIGN KEY (PayrollID) REFERENCES Payroll(PayrollID)ON DELETE CASCADE
);
--
CREATE TABLE Taxes (
    TaxID INT PRIMARY KEY,
    PayrollID INT NOT NULL,
    TaxType VARCHAR(100),
    Amount DECIMAL(10,2),
    FOREIGN KEY (PayrollID) REFERENCES Payroll(PayrollID)ON DELETE CASCADE
);
-- 
CREATE TABLE Overtime (
    OvertimeID INT PRIMARY KEY,
    PayrollID INT NOT NULL,
    Hours INT,
    Rate DECIMAL(10,2),
    Date DATE,
    FOREIGN KEY (PayrollID) REFERENCES Payroll(PayrollID)ON DELETE CASCADE
);
-- 
CREATE TABLE PaymentHistory (
    PaymentID INT PRIMARY KEY,
    PayrollID INT NOT NULL,
    Amount DECIMAL(10,2),
    Method VARCHAR(50),
    PaymentDate DATE,
    FOREIGN KEY (PayrollID) REFERENCES Payroll(PayrollID)ON DELETE CASCADE
);

-- insert values

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'Software Development'),
(2, 'Human Resources'),
(3, 'Finance'),
(4, 'Marketing'),
(5, 'Operations');

-- 
INSERT INTO Jobs (JobID, JobTitle, MinSalary, MaxSalary) VALUES
(1, 'Software Engineer', 40000, 80000),
(2, 'HR Executive', 30000, 60000),
(3, 'Accountant', 35000, 65000),
(4, 'Marketing Specialist', 32000, 70000),
(5, 'Operations Manager', 45000, 85000);

--
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, HireDate, DepartmentID, JobID) VALUES
(1, 'Arun', 'Kumar', 'arun1@company.com', '9000000001', '2025-03-01', 1, 1),
(2, 'Divya', 'Sharma', 'divya@company.com', '9000000002', '2025-03-01', 2, 2),
(3, 'Rahul', 'Verma', 'rahul@company.com', '9000000003', '2025-03-01', 3, 3),
(4, 'Sneha', 'Patel', 'sneha@company.com', '9000000004', '2025-03-01', 4, 4),
(5, 'Karthik', 'Rao', 'karthik@company.com', '9000000005', '2025-03-01', 5, 5),
(6, 'Priya', 'Iyer', 'priya@company.com', '9000000006', '2025-03-01', 1, 1),
(7, 'Ramesh', 'Naik', 'ramesh@company.com', '9000000007', '2025-03-01', 2, 2),
(8, 'Meena', 'Joshi', 'meena@company.com', '9000000008', '2025-03-01', 3, 3),
(9, 'Vikram', 'Singh', 'vikram@company.com', '9000000009', '2025-03-01', 4, 4),
(10, 'Anjali', 'Menon', 'anjali@company.com', '9000000010', '2025-03-01', 5, 5),
(11, 'Ajay', 'Mishra', 'ajay@company.com', '9000000011', '2025-03-01', 1, 1),
(12, 'Pooja', 'Reddy', 'pooja@company.com', '9000000012', '2025-03-01', 2, 2),
(13, 'Suresh', 'Babu', 'suresh@company.com', '9000000013', '2025-03-01', 3, 3),
(14, 'Lakshmi', 'Krishnan', 'lakshmi@company.com', '9000000014', '2025-03-01', 4, 4),
(15, 'Raj', 'Kapoor', 'raj@company.com', '9000000015', '2025-03-01', 5, 5),
(16, 'Neha', 'Singhania', 'neha@company.com', '9000000016', '2025-03-01', 1, 1),
(17, 'Deepak', 'Jain', 'deepak@company.com', '9000000017', '2025-03-01', 2, 2),
(18, 'Aishwarya', 'Das', 'aish@company.com', '9000000018', '2025-03-01', 3, 3),
(19, 'Manoj', 'Yadav', 'manoj@company.com', '9000000019', '2025-03-01', 4, 4),
(20, 'Geetha', 'Srinivasan', 'geetha@company.com', '9000000020', '2025-03-01', 5, 5);

--
INSERT INTO Payroll (PayrollID, EmployeeID, BasicSalary, OvertimePay, Deductions, Taxes, NetSalary, PayDate) VALUES
(1, 1, 60000, 2000, 1000, 3000, 58000, '2025-03-31'),
(2, 2, 45000, 1000, 800, 2000, 43200, '2025-03-31'),
(3, 3, 50000, 0, 1500, 2500, 46000, '2025-03-31'),
(4, 4, 48000, 500, 1000, 2200, 45300, '2025-03-31'),
(5, 5, 55000, 0, 1200, 2400, 51400, '2025-03-31'),
(6, 6, 62000, 1500, 1100, 2600, 59900, '2025-03-31'),
(7, 7, 46000, 800, 700, 2000, 44100, '2025-03-31'),
(8, 8, 51000, 0, 1300, 2300, 47400, '2025-03-31'),
(9, 9, 49000, 1000, 1000, 2100, 46900, '2025-03-31'),
(10, 10, 57000, 0, 1200, 2500, 53300, '2025-03-31'),
(11, 11, 60000, 1800, 900, 2700, 58200, '2025-03-31'),
(12, 12, 44000, 900, 700, 1900, 42300, '2025-03-31'),
(13, 13, 49000, 0, 1300, 2100, 45600, '2025-03-31'),
(14, 14, 47000, 600, 800, 2000, 44800, '2025-03-31'),
(15, 15, 56000, 0, 1000, 2400, 52600, '2025-03-31'),
(16, 16, 63000, 0, 1200, 2700, 59100, '2025-03-31'),
(17, 17, 45000, 1000, 900, 1900, 44100, '2025-03-31'),
(18, 18, 50000, 0, 1400, 2200, 46400, '2025-03-31'),
(19, 19, 48000, 800, 1000, 2100, 45800, '2025-03-31'),
(20, 20, 54000, 0, 1100, 2300, 50600, '2025-03-31');

--
INSERT INTO Deductions (DeductionID, PayrollID, DeductionType, Amount) VALUES
(1, 1, 'Loan EMI', 1000),
(2, 2, 'Late Fine', 800),
(3, 3, 'Leave', 1500),
(4, 4, 'Loan EMI', 1000),
(5, 5, 'Late Fine', 1200),
(6, 6, 'Loan EMI', 1100),
(7, 7, 'Leave', 700),
(8, 8, 'Loan EMI', 1300),
(9, 9, 'Late Fine', 1000),
(10, 10, 'Leave', 1200),
(11, 11, 'Loan EMI', 900),
(12, 12, 'Leave', 700),
(13, 13, 'Late Fine', 1300),
(14, 14, 'Loan EMI', 800),
(15, 15, 'Leave', 1000),
(16, 16, 'Loan EMI', 1200),
(17, 17, 'Late Fine', 900),
(18, 18, 'Leave', 1400),
(19, 19, 'Loan EMI', 1000),
(20, 20, 'Late Fine', 1100);

-- 
INSERT INTO Taxes (TaxID, PayrollID, TaxType, Amount) VALUES
(1, 1, 'Income Tax', 3000),
(2, 2, 'Income Tax', 2000),
(3, 3, 'Income Tax', 2500),
(4, 4, 'Income Tax', 2200),
(5, 5, 'Income Tax', 2400),
(6, 6, 'Income Tax', 2600),
(7, 7, 'Income Tax', 2000),
(8, 8, 'Income Tax', 2300),
(9, 9, 'Income Tax', 2100),
(10, 10, 'Income Tax', 2500),
(11, 11, 'Income Tax', 2700),
(12, 12, 'Income Tax', 1900),
(13, 13, 'Income Tax', 2100),
(14, 14, 'Income Tax', 2000),
(15, 15, 'Income Tax', 2400),
(16, 16, 'Income Tax', 2700),
(17, 17, 'Income Tax', 1900),
(18, 18, 'Income Tax', 2200),
(19, 19, 'Income Tax', 2100),
(20, 20, 'Income Tax', 2300);

-- 
INSERT INTO Overtime (OvertimeID, PayrollID, Hours, Rate, Date) VALUES
(1, 1, 10, 200, '2025-03-29'),
(2, 2, 5, 200, '2025-03-28'),
(3, 4, 2, 250, '2025-03-28'),
(4, 6, 6, 250, '2025-03-27'),
(5, 7, 4, 200, '2025-03-27'),
(6, 9, 5, 200, '2025-03-29'),
(7, 11, 9, 200, '2025-03-28'),
(8, 12, 3, 300, '2025-03-28'),
(9, 14, 2, 300, '2025-03-29'),
(10, 17, 5, 200, '2025-03-29'),
(11, 19, 4, 200, '2025-03-27'),
(12, 3, 0, 0, '2025-03-27'),
(13, 5, 0, 0, '2025-03-27'),
(14, 8, 0, 0, '2025-03-27'),
(15, 10, 0, 0, '2025-03-27'),
(16, 13, 0, 0, '2025-03-27'),
(17, 15, 0, 0, '2025-03-27'),
(18, 16, 0, 0, '2025-03-27'),
(19, 18, 0, 0, '2025-03-27'),
(20, 20, 0, 0, '2025-03-27');

-- 
INSERT INTO PaymentHistory (PaymentID, PayrollID, Amount, Method, PaymentDate) VALUES
(1, 1, 58000, 'Bank Transfer', '2025-04-01'),
(2, 2, 43200, 'Bank Transfer', '2025-04-01'),
(3, 3, 46000, 'Bank Transfer', '2025-04-01'),
(4, 4, 45300, 'Cash', '2025-04-01'),
(5, 5, 51400, 'Bank Transfer', '2025-04-01'),
(6, 6, 59900, 'Cheque', '2025-04-01'),
(7, 7, 44100, 'Bank Transfer', '2025-04-01'),
(8, 8, 47400, 'Bank Transfer', '2025-04-01'),
(9, 9, 46900, 'Cash', '2025-04-01'),
(10, 10, 53300, 'Bank Transfer', '2025-04-01'),
(11, 11, 58200, 'Bank Transfer', '2025-04-01'),
(12, 12, 42300, 'Bank Transfer', '2025-04-01'),
(13, 13, 45600, 'Cheque', '2025-04-01'),
(14, 14, 44800, 'Bank Transfer', '2025-04-01'),
(15, 15, 52600, 'Bank Transfer', '2025-04-01'),
(16, 16, 59100, 'Bank Transfer', '2025-04-01'),
(17, 17, 44100, 'Bank Transfer', '2025-04-01'),
(18, 18, 46400, 'Bank Transfer', '2025-04-01'),
(19, 19, 45800, 'Bank Transfer', '2025-04-01'),
(20, 20, 50600, 'Cash', '2025-04-01');

-- display the employees details with department and jobrole
CREATE VIEW EmployeeDetails AS
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Email,
    d.DepartmentName,
    j.JobTitle,
    j.MinSalary,
    j.MaxSalary
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
JOIN Jobs j ON e.JobID = j.JobID
order by e.Employeeid;
-- 
select * from employeedetails;


--  to display the employee monthly payroll
CREATE VIEW MonthlyPayroll AS
SELECT 
    p.PayrollID,
    e.FirstName,
    e.LastName,
    p.BasicSalary,
    p.OvertimePay,
    p.Deductions,
    p.Taxes,
    p.NetSalary,
    p.PayDate
FROM Payroll p
JOIN Employees e ON p.EmployeeID = e.EmployeeID;

select * from monthlypayroll; 

-- View to list employee salary summary (basic, deductions, net salary)
CREATE VIEW EmployeeSalarySummary AS
SELECT 
    p.PayrollID, e.EmployeeID, e.FirstName, e.LastName,
    p.BasicSalary, p.Deductions, p.NetSalary
FROM Payroll p
JOIN Employees e ON p.EmployeeID = e.EmployeeID;

select * from EmployeeSalarySummary;

--  View to show payroll with overtime and tax details.
CREATE VIEW PayrollDetails AS
SELECT 
	e.EmployeeID, e.FirstName, e.LastName,
    p.BasicSalary, p.OvertimePay, p.Taxes, p.NetSalary,p.deductions
FROM Payroll p
JOIN Employees e ON p.EmployeeID = e.EmployeeID;


select * from PayrollDetails;

-- stored procedure
-- insert the value of employees table
delimiter $$
create procedure insert_value(
in emp_id int,
in fname varchar(45),
in lname varchar(45),
in email varchar(45),
in phone int(15),
in hdate date,
in depid int,
in jid int )
begin
insert into employees(EmployeeID,FirstName,LastName,Email,Phone,HireDate,DepartmentID,JobID)
values (emp_id,fname,lname,email,phone.hdate,depid,jid);
select * from employees 
where EmployeeID=emp_id;
end $$
delimiter ;

-- Retrieve all payment history of a particular employee
delimiter $$
create procedure payment_history(
in emp_id int)
begin
SELECT ph.*
FROM PaymentHistory ph
JOIN Payroll p ON ph.PayrollID = p.PayrollID
WHERE p.EmployeeID in (emp_id);
end $$
delimiter ; 

call payment_history(3);

-- Update the basic salary of EmployeeID in the Payroll table
delimiter $$
create procedure update_salary( 
in basicsalary int,
in emp_id int)
begin 
UPDATE Payroll
SET BasicSalary = basicsalary
WHERE EmployeeID = emp_id;
select * from payroll
where EmployeeID=emp_id;
end $$

delimiter ;
call update_salary(60000,1);

-- Show payment method type in readable form
DELIMITER //

CREATE PROCEDURE payment_methodtype(IN paymentMethod VARCHAR(50))
BEGIN
    SELECT 
        PaymentID,
        Amount,
        Method,
        CASE Method
            WHEN 'Bank Transfer' THEN 'Online'
            WHEN 'Cheque' THEN 'Offline'
            WHEN 'Cash' THEN 'Offline'
            ELSE 'Unknown'
        END AS PaymentType 
    FROM PaymentHistory
    WHERE Method = paymentMethod;
END //

DELIMITER ;

call payment_methodtype('cash');

--  Top highest paid employees
delimiter $$
create procedure higest_salary(in ranking int)
begin
SELECT * FROM (
    SELECT 
        EmployeeID,
        NetSalary,
        RANK() OVER (ORDER BY NetSalary DESC) AS RankSalary
    FROM Payroll
) AS RankedSalaries
WHERE RankSalary <= ranking;
end $$
delimiter ;

 call higest_salary(5);
 

-- Retrieve Employees with No Overtime

DELIMITER $$
CREATE PROCEDURE GetEmployeesWithNoOvertime(
    IN month INT,
    IN year INT
)
BEGIN
    SELECT 
        e.EmployeeID,
        e.FirstName,
        e.LastName
    FROM Employees e
    WHERE e.EmployeeID NOT IN (
        SELECT DISTINCT p.EmployeeID
        FROM Overtime o
        JOIN Payroll p ON o.PayrollID = p.PayrollID
        WHERE MONTH(o.Date) = month AND YEAR(o.Date) = year
    );
END $$
DELIMITER ;

-- Example usage:
CALL GetEmployeesWithNoOvertime(3, 2025);
 
