USE [Psiog]
GO
/****** Object:  Table [dbo].[AttendanceTransaction]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](10) NOT NULL,
	[Checkin] [datetime] NOT NULL,
	[Checkout] [datetime] NOT NULL,
	[Status] [varchar](255) NOT NULL,
 CONSTRAINT [AttendanceTransaction_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [Department_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
 CONSTRAINT [Designation_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Designation_History]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation_History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](10) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [Designation_History_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[EmployeeId] [varchar](10) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Gender] [varchar](10) NOT NULL,
	[Mobile] [bigint] NULL,
	[Email] [varchar](255) NOT NULL,
	[DOB] [date] NOT NULL,
	[DOJ] [date] NOT NULL,
	[DOQ] [date] NULL,
	[Address] [varchar](255) NULL,
	[BloodType] [varchar](5) NOT NULL,
	[IsManager] [char](10) NOT NULL,
	[IsAdmin] [nchar](10) NULL,
 CONSTRAINT [Employee_pk] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeLeaveAvaliability]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeLeaveAvaliability](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](10) NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[AllocatedDays] [decimal](4, 2) NOT NULL,
	[AvailedDays] [decimal](4, 2) NOT NULL,
 CONSTRAINT [EmployeeLeaveAvaliability_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holidays]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holidays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Occasion] [varchar](50) NOT NULL,
	[Day] [varchar](10) NOT NULL,
	[Month] [varchar](10) NOT NULL,
	[Year] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK_Holidays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveApplication]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveApplication](
	[LeaveApplicationId] [int] IDENTITY(1,1) NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[FromSession] [smallint] NOT NULL,
	[ToSession] [smallint] NOT NULL,
	[Reason] [varchar](255) NOT NULL,
	[Status] [varchar](10) NOT NULL,
	[EmployeeId] [varchar](10) NOT NULL,
	[LeaveId] [int] NOT NULL,
	[SendTo] [varchar](10) NOT NULL,
	[CCTo] [varchar](10) NOT NULL,
 CONSTRAINT [LeaveApplication_pk] PRIMARY KEY CLUSTERED 
(
	[LeaveApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveTypes]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveTypes](
	[LeaveTypeId] [int] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NOT NULL,
	[MaxLeave] [decimal](4, 2) NOT NULL,
 CONSTRAINT [LeaveTypes_pk] PRIMARY KEY CLUSTERED 
(
	[LeaveTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Managers]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Managers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ManagerId] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Managers] PRIMARY KEY CLUSTERED 
(
	[ManagerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportingAuthority]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportingAuthority](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](10) NOT NULL,
	[ManagerId] [varchar](10) NOT NULL,
 CONSTRAINT [ReportingAuthority_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [varchar](10) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Role] [varchar](10) NULL,
	[SecurityQuestion] [varchar](255) NULL,
	[Answer] [varchar](255) NULL,
	[VerificationCode] [varchar](max) NULL,
 CONSTRAINT [User_pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[AttendanceTransaction]  WITH CHECK ADD  CONSTRAINT [AttendanceTransaction_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[AttendanceTransaction] CHECK CONSTRAINT [AttendanceTransaction_Employee]
GO
ALTER TABLE [dbo].[Designation_History]  WITH CHECK ADD  CONSTRAINT [Employee_Designation_Department_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Designation_History] CHECK CONSTRAINT [Employee_Designation_Department_Department]
GO
ALTER TABLE [dbo].[Designation_History]  WITH CHECK ADD  CONSTRAINT [Employee_Designation_Department_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designation] ([Id])
GO
ALTER TABLE [dbo].[Designation_History] CHECK CONSTRAINT [Employee_Designation_Department_Designation]
GO
ALTER TABLE [dbo].[Designation_History]  WITH CHECK ADD  CONSTRAINT [Employee_Designation_Department_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Designation_History] CHECK CONSTRAINT [Employee_Designation_Department_Employee]
GO
ALTER TABLE [dbo].[EmployeeLeaveAvaliability]  WITH CHECK ADD  CONSTRAINT [EmployeeLeaveAvaliability_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[EmployeeLeaveAvaliability] CHECK CONSTRAINT [EmployeeLeaveAvaliability_Employee]
GO
ALTER TABLE [dbo].[EmployeeLeaveAvaliability]  WITH CHECK ADD  CONSTRAINT [EmployeeLeaveAvaliability_LeaveMaster] FOREIGN KEY([LeaveTypeId])
REFERENCES [dbo].[LeaveTypes] ([LeaveTypeId])
GO
ALTER TABLE [dbo].[EmployeeLeaveAvaliability] CHECK CONSTRAINT [EmployeeLeaveAvaliability_LeaveMaster]
GO
ALTER TABLE [dbo].[LeaveApplication]  WITH CHECK ADD  CONSTRAINT [LeaveApplication_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[LeaveApplication] CHECK CONSTRAINT [LeaveApplication_Employee]
GO
ALTER TABLE [dbo].[LeaveApplication]  WITH CHECK ADD  CONSTRAINT [LeaveApplication_Leave] FOREIGN KEY([LeaveId])
REFERENCES [dbo].[LeaveTypes] ([LeaveTypeId])
GO
ALTER TABLE [dbo].[LeaveApplication] CHECK CONSTRAINT [LeaveApplication_Leave]
GO
ALTER TABLE [dbo].[Managers]  WITH CHECK ADD  CONSTRAINT [Managers_Employee] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[Managers] CHECK CONSTRAINT [Managers_Employee]
GO
ALTER TABLE [dbo].[ReportingAuthority]  WITH CHECK ADD  CONSTRAINT [FK_ReportingAuthority_Managers] FOREIGN KEY([ManagerId])
REFERENCES [dbo].[Managers] ([ManagerId])
GO
ALTER TABLE [dbo].[ReportingAuthority] CHECK CONSTRAINT [FK_ReportingAuthority_Managers]
GO
ALTER TABLE [dbo].[ReportingAuthority]  WITH CHECK ADD  CONSTRAINT [ReportingAuthority_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[ReportingAuthority] CHECK CONSTRAINT [ReportingAuthority_Employee]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [User_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([EmployeeId])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [User_Employee]
GO
/****** Object:  StoredProcedure [dbo].[ManagersSetUpProcess]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[ManagersSetUpProcess] @EmployeeId varchar(10)
AS
insert into [dbo].[Managers] (ManagerId) values(@EmployeeId);

GO
/****** Object:  StoredProcedure [dbo].[SetUpEmployeeLeaveAvailability]    Script Date: 14-11-2019 19:06:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[SetUpEmployeeLeaveAvailability] @MOJ int, @EmployeeId varchar(10)
as
insert into [dbo].[EmployeeLeaveAvaliability](EmployeeId,LeaveTypeId,AllocatedDays,AvailedDays)
values(@EmployeeId,1,13-@MOJ,0),(@EmployeeId,2,13-@MOJ,0),(@EmployeeId,3,13-@MOJ,0)
GO
