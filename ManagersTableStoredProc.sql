
CREATE Procedure SetUpProcess @EmployeeId varchar(10)
AS
insert into [dbo].[Managers] (ManagerId) values(@EmployeeId);
