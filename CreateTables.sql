
-- Table: Employee
CREATE TABLE Employee (
    Id int  NOT NULL IDENTITY(1, 1),
    EmployeeId varchar(10)  NOT NULL,
    Name varchar(255)  NOT NULL,
    Gender varchar(10)  NOT NULL,
    Mobile bigint  NOT NULL,
    Email varchar(255)  NOT NULL,
    DOB date  NOT NULL,
    DOJ date  NOT NULL,
    DOQ date  NOT NULL,
    Address varchar(255)  NOT NULL,
    BloodType varchar(5)  NOT NULL,
    IsManager char(1)  NOT NULL,
    CONSTRAINT Employee_pk PRIMARY KEY  (EmployeeId)
);

drop table [dbo].[Employee]