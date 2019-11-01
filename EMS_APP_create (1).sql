-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2019-10-31 06:39:08.399

-- tables
-- Table: AttendanceTransaction
CREATE TABLE AttendanceTransaction (
    Id int  NOT NULL IDENTITY(1,1),
    EmployeeId varchar(10)  NOT NULL,
    Checkin datetime  NOT NULL,
    Checkout datetime  NOT NULL,
    Status varchar(255)  NOT NULL,
    CONSTRAINT AttendanceTransaction_pk PRIMARY KEY  (Id)
);

-- Table: Department
CREATE TABLE Department (
    Id int  NOT NULL IDENTITY(1,1),
    Name varchar(50)  NOT NULL,
    CONSTRAINT Department_pk PRIMARY KEY  (Id)
);

-- Table: Designation
CREATE TABLE Designation (
    Id int  NOT NULL IDENTITY(1,1),
    Name varchar(100)  NOT NULL,
    CONSTRAINT Designation_pk PRIMARY KEY  (Id)
);

-- Table: Designation_History
CREATE TABLE Designation_History (
    Id int  NOT NULL IDENTITY(1,1),
    EmployeeId varchar(10)  NOT NULL,
    DesignationId int  NOT NULL,
    DepartmentId int  NOT NULL,
    Date date  NOT NULL,
    CONSTRAINT Designation_History_pk PRIMARY KEY  (Id)
);

-- Table: Employee
CREATE TABLE Employee (
    Id int  NOT NULL IDENTITY(1,1),
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

-- Table: EmployeeLeaveAvaliability
CREATE TABLE EmployeeLeaveAvaliability (
    Id int  NOT NULL IDENTITY(1,1),
    EmployeeId varchar(10)  NOT NULL,
    LeaveTypeId int  NOT NULL,
    AllocatedDays decimal(4,2)  NOT NULL,
    AvailedDays decimal(4,2)  NOT NULL,
    CONSTRAINT EmployeeLeaveAvaliability_pk PRIMARY KEY  (Id)
);

-- Table: LeaveApplication
CREATE TABLE LeaveApplication (
    LeaveApplicationId int  NOT NULL IDENTITY(1,1),
    FromDate date  NOT NULL,
    ToDate date  NOT NULL,
    FromSession smallint  NOT NULL,
    ToSession smallint  NOT NULL,
    Reason varchar(255)  NOT NULL,
    Status varchar(10)  NOT NULL,
    EmployeeId varchar(10)  NOT NULL,
    LeaveId int  NOT NULL,
    CONSTRAINT LeaveApplication_pk PRIMARY KEY  (LeaveApplicationId)
);

-- Table: LeaveTypes
CREATE TABLE LeaveTypes (
    LeaveTypeId int  NOT NULL IDENTITY(1,1),
    Type varchar(20)  NOT NULL,
    MaxLeave decimal(4,2)  NOT NULL,
    CONSTRAINT LeaveTypes_pk PRIMARY KEY  (LeaveTypeId)
);

-- Table: Managers
CREATE TABLE Managers (
    Id int  NOT NULL IDENTITY(1,1),
    ManagerId varchar(10)  NOT NULL,
    CONSTRAINT Managers_pk PRIMARY KEY  (Id)
);

-- Table: ReportingAuthority
CREATE TABLE ReportingAuthority (
    Id int  NOT NULL IDENTITY(1,1),
    ReportingAuthorityId varchar(10)  NOT NULL,
    ManagerId int  NOT NULL,
    CONSTRAINT ReportingAuthority_pk PRIMARY KEY  (Id)
);

-- Table: User
CREATE TABLE "User" (
    Id int  NOT NULL IDENTITY(1,1),
    EmployeeId varchar(10)  NOT NULL,
    Password varchar(255)  NOT NULL,
    Role varchar(10)  NULL,
    SecurityQuestion varchar(255)  NULL,
    Answer varchar(255)  NULL,
    ResetCode varchar(max)  NULL,
    CONSTRAINT User_pk PRIMARY KEY  (Id)
);

-- foreign keys
-- Reference: AttendanceTransaction_Employee (table: AttendanceTransaction)
ALTER TABLE AttendanceTransaction ADD CONSTRAINT AttendanceTransaction_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee (EmployeeId);

-- Reference: EmployeeLeaveAvaliability_Employee (table: EmployeeLeaveAvaliability)
ALTER TABLE EmployeeLeaveAvaliability ADD CONSTRAINT EmployeeLeaveAvaliability_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee (EmployeeId);

-- Reference: EmployeeLeaveAvaliability_LeaveMaster (table: EmployeeLeaveAvaliability)
ALTER TABLE EmployeeLeaveAvaliability ADD CONSTRAINT EmployeeLeaveAvaliability_LeaveMaster
    FOREIGN KEY (LeaveTypeId)
    REFERENCES LeaveTypes (LeaveTypeId);

-- Reference: Employee_Designation_Department_Department (table: Designation_History)
ALTER TABLE Designation_History ADD CONSTRAINT Employee_Designation_Department_Department
    FOREIGN KEY (DepartmentId)
    REFERENCES Department (Id);

-- Reference: Employee_Designation_Department_Designation (table: Designation_History)
ALTER TABLE Designation_History ADD CONSTRAINT Employee_Designation_Department_Designation
    FOREIGN KEY (DesignationId)
    REFERENCES Designation (Id);

-- Reference: Employee_Designation_Department_Employee (table: Designation_History)
ALTER TABLE Designation_History ADD CONSTRAINT Employee_Designation_Department_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee (EmployeeId);

-- Reference: LeaveApplication_Employee (table: LeaveApplication)
ALTER TABLE LeaveApplication ADD CONSTRAINT LeaveApplication_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee (EmployeeId);

-- Reference: LeaveApplication_Leave (table: LeaveApplication)
ALTER TABLE LeaveApplication ADD CONSTRAINT LeaveApplication_Leave
    FOREIGN KEY (LeaveId)
    REFERENCES LeaveTypes (LeaveTypeId);

-- Reference: Managers_Employee (table: Managers)
ALTER TABLE Managers ADD CONSTRAINT Managers_Employee
    FOREIGN KEY (ManagerId)
    REFERENCES Employee (EmployeeId);

-- Reference: ReportingAuthority_Employee (table: ReportingAuthority)
ALTER TABLE ReportingAuthority ADD CONSTRAINT ReportingAuthority_Employee
    FOREIGN KEY (ReportingAuthorityId)
    REFERENCES Employee (EmployeeId);

-- Reference: ReportingAuthority_Managers (table: ReportingAuthority)
ALTER TABLE ReportingAuthority ADD CONSTRAINT ReportingAuthority_Managers
    FOREIGN KEY (ManagerId)
    REFERENCES Managers (Id);

-- Reference: User_Employee (table: User)
ALTER TABLE "User" ADD CONSTRAINT User_Employee
    FOREIGN KEY (EmployeeId)
    REFERENCES Employee (EmployeeId);

-- End of file.

