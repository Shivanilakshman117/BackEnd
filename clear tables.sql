delete from [dbo].[Designation_History]
delete from [dbo].[Employee]
delete from [dbo].[EmployeeLeaveAvaliability]
delete from [dbo].[Managers]
delete from [dbo].[ReportingAuthority]
delete from [dbo].[User]

DBCC CHECKIDENT (Employee, RESEED, 0);
GO

DBCC CHECKIDENT (Designation_History, RESEED, 0);
GO

DBCC CHECKIDENT (EmployeeLeaveAvaliability, RESEED, 0);
GO

DBCC CHECKIDENT (ReportingAuthority, RESEED, 0);
GO


