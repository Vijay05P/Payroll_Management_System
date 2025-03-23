**PAYROLL MANAGEMENT SYSTEM** (PMS)

**Objective**:
To automate and manage employee salary-related data including payroll, taxes, deductions, overtime, and payment history using SQL.

**Database**:  
                MySQL
 
 Core Modules & Tables:
- **Departments** – Stores department names  
- **Jobs** – Job roles with salary ranges  
- **Employees** – Personal & job info (linked to department and job)  
- **Payroll** – Salary breakdown (basic, deductions, taxes, net)  
- **Deductions** – Loan, leave, etc.  
- **Taxes** – Tax amounts per employee  
- **Overtime** – Tracks extra hours and rate  
- **PaymentHistory** – Stores payment records  

📌 **20 Employees**, **5 Departments**, **5 Job Roles**, with complete payroll and overtime data.

---
 **Views**:
- **EmployeeDetails** – Full employee info with department & job  
- **MonthlyPayroll** – Monthly salary details  
- **EmployeeSalarySummary** – Basic salary, deductions & net pay  
- **PayrollDetails** – Overtime and tax breakdown

---
**Stored Procedures**:

- 🔹 **insert_value** – Add a new employee  
- 🔹 **payment_history** – View salary payment history  
- 🔹 **update_salary** – Change basic salary  
- 🔹 **payment_methodtype** – Display payment methods (Online/Offline)  
- 🔹 **higest_salary** – Show top highest-paid employees  
- 🔹 **GetEmployeesWithNoOvertime** – List employees without overtime for a given month & year
