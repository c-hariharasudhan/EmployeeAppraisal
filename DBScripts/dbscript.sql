USE [master]
GO
/****** Object:  Database [Payroll]    Script Date: 1/24/2021 10:23:33 PM ******/
CREATE DATABASE [Payroll]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Payroll', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Payroll.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Payroll_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Payroll_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Payroll] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Payroll].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Payroll] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Payroll] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Payroll] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Payroll] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Payroll] SET ARITHABORT OFF 
GO
ALTER DATABASE [Payroll] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Payroll] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Payroll] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Payroll] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Payroll] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Payroll] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Payroll] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Payroll] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Payroll] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Payroll] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Payroll] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Payroll] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Payroll] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Payroll] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Payroll] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Payroll] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Payroll] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Payroll] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Payroll] SET  MULTI_USER 
GO
ALTER DATABASE [Payroll] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Payroll] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Payroll] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Payroll] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Payroll] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Payroll] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Payroll] SET QUERY_STORE = OFF
GO
USE [Payroll]
GO
/****** Object:  Table [dbo].[Appraisal]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appraisal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[RatingId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Increment] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Appraisal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentPayComponent]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentPayComponent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[ComponentId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_DepartmentPayComponent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Dob] [date] NOT NULL,
	[Doj] [date] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeAppraisal]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeAppraisal](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[AppraisalId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeAppraisal] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmployeeSalary]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeSalary](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[GradeId] [int] NOT NULL,
	[Basic] [decimal](18, 0) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_EmployeeDepartment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Grade]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Grade](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GradeName] [varchar](50) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Grade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayComponent]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayComponent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Value] [decimal](18, 0) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_PayComponent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 1/24/2021 10:23:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RatingValue] [nvarchar](10) NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Rank] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appraisal] ADD  CONSTRAINT [DF_Appraisal_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DF_Department_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[DepartmentPayComponent] ADD  CONSTRAINT [DF_DepartmentPayComponent_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[EmployeeAppraisal] ADD  CONSTRAINT [DF_EmployeeAppraisal_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[EmployeeSalary] ADD  CONSTRAINT [DF_EmployeeDepartment_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Grade] ADD  CONSTRAINT [DF_Grade_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[PayComponent] ADD  CONSTRAINT [DF_PayComponent_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Rating] ADD  CONSTRAINT [DF_Rating_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Appraisal]  WITH CHECK ADD  CONSTRAINT [FK_Appraisal_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Appraisal] CHECK CONSTRAINT [FK_Appraisal_Department]
GO
ALTER TABLE [dbo].[Appraisal]  WITH CHECK ADD  CONSTRAINT [FK_Appraisal_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
GO
ALTER TABLE [dbo].[Appraisal] CHECK CONSTRAINT [FK_Appraisal_Grade]
GO
ALTER TABLE [dbo].[Appraisal]  WITH CHECK ADD  CONSTRAINT [FK_Appraisal_Rating] FOREIGN KEY([RatingId])
REFERENCES [dbo].[Rating] ([Id])
GO
ALTER TABLE [dbo].[Appraisal] CHECK CONSTRAINT [FK_Appraisal_Rating]
GO
ALTER TABLE [dbo].[DepartmentPayComponent]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentPayComponent_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[DepartmentPayComponent] CHECK CONSTRAINT [FK_DepartmentPayComponent_Department]
GO
ALTER TABLE [dbo].[DepartmentPayComponent]  WITH CHECK ADD  CONSTRAINT [FK_DepartmentPayComponent_PayComponent] FOREIGN KEY([ComponentId])
REFERENCES [dbo].[PayComponent] ([Id])
GO
ALTER TABLE [dbo].[DepartmentPayComponent] CHECK CONSTRAINT [FK_DepartmentPayComponent_PayComponent]
GO
ALTER TABLE [dbo].[EmployeeAppraisal]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAppraisal_Appraisal] FOREIGN KEY([AppraisalId])
REFERENCES [dbo].[Appraisal] ([Id])
GO
ALTER TABLE [dbo].[EmployeeAppraisal] CHECK CONSTRAINT [FK_EmployeeAppraisal_Appraisal]
GO
ALTER TABLE [dbo].[EmployeeAppraisal]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeAppraisal_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeAppraisal] CHECK CONSTRAINT [FK_EmployeeAppraisal_Employee]
GO
ALTER TABLE [dbo].[EmployeeSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalary_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[EmployeeSalary] CHECK CONSTRAINT [FK_EmployeeSalary_Department]
GO
ALTER TABLE [dbo].[EmployeeSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalary_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[EmployeeSalary] CHECK CONSTRAINT [FK_EmployeeSalary_Employee]
GO
ALTER TABLE [dbo].[EmployeeSalary]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeSalary_Grade] FOREIGN KEY([GradeId])
REFERENCES [dbo].[Grade] ([Id])
GO
ALTER TABLE [dbo].[EmployeeSalary] CHECK CONSTRAINT [FK_EmployeeSalary_Grade]
GO
ALTER TABLE [dbo].[Grade]  WITH CHECK ADD  CONSTRAINT [FK_Grade_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Grade] CHECK CONSTRAINT [FK_Grade_Department]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_Rating_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_Rating_Department]
GO
USE [master]
GO
ALTER DATABASE [Payroll] SET  READ_WRITE 
GO
