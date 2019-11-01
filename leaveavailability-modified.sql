USE [Psiog]
GO
/****** Object:  StoredProcedure [dbo].[SetUpEmployeeLeaveAvailability]    Script Date: 01-11-2019 16:16:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[SetUpEmployeeLeaveAvailability] @MOJ int, @EmployeeId varchar(10)
as
insert into [dbo].[EmployeeLeaveAvaliability](EmployeeId,LeaveTypeId,AllocatedDays,AvailedDays)
values(@EmployeeId,1,@MOJ-13,0),(@EmployeeId,2,@MOJ-13,0),(@EmployeeId,3,@MOJ-13,0)


