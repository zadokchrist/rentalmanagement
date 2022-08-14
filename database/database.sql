USE [master]
GO
/****** Object:  Database [RealEstateManagementDb]    Script Date: 14/08/2022 18:42:28 ******/
CREATE DATABASE [RealEstateManagementDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RealEstateManagementDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RealEstateManagementDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RealEstateManagementDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\RealEstateManagementDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [RealEstateManagementDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RealEstateManagementDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RealEstateManagementDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RealEstateManagementDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RealEstateManagementDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RealEstateManagementDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RealEstateManagementDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RealEstateManagementDb] SET  MULTI_USER 
GO
ALTER DATABASE [RealEstateManagementDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RealEstateManagementDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RealEstateManagementDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RealEstateManagementDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RealEstateManagementDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RealEstateManagementDb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RealEstateManagementDb] SET QUERY_STORE = OFF
GO
USE [RealEstateManagementDb]
GO
/****** Object:  Table [dbo].[Applicant]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applicant](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[CustomerName] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[BlockNumber] [varchar](50) NULL,
	[ApartmentNumber] [varchar](50) NULL,
	[GoogleMapLoc] [varchar](max) NULL,
	[Status] [varchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[ApplicationId] [varchar](max) NULL,
	[ApplicationPath] [varchar](max) NULL,
	[Assigned] [bit] NULL,
	[Nationality] [varchar](50) NULL,
	[Street] [varchar](50) NULL,
	[Parish] [varchar](50) NULL,
	[Subdivision] [varchar](50) NULL,
	[LC1Zone] [varchar](50) NULL,
	[Village] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationAssignment]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationAssignment](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[ApplicationId] [varchar](50) NULL,
	[FromDepartment] [varchar](50) NULL,
	[ToDepartment] [varchar](50) NULL,
	[ReasonEscalated] [varchar](max) NULL,
	[Status] [varchar](50) NULL,
	[AssignedBy] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationStatus]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationStatus](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[StatusCode] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[Description] [varchar](max) NULL,
	[StatusFrom] [varchar](50) NULL,
	[StatusTo] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuditTrail]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditTrail](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Action] [varchar](max) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Complaint_Sub_Category]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Complaint_Sub_Category](
	[SubCategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [bigint] NULL,
	[SubCategoryName] [varchar](50) NULL,
	[Status] [bit] NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComplaintCategory]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComplaintCategory](
	[CategoryId] [bigint] IDENTITY(1,1) NOT NULL,
	[Category] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[Package] [varchar](50) NULL,
	[StreetName] [varchar](50) NULL,
	[StreetNumber] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[County] [varchar](50) NULL,
	[Active] [bit] NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerTransaction]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerTransaction](
	[Recordid] [bigint] IDENTITY(1,1) NOT NULL,
	[TranRef] [varchar](50) NULL,
	[Amount] [money] NULL,
	[RecordDate] [datetime] NULL,
	[Narration] [varchar](max) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobCard]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCard](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[TicketId] [varchar](50) NULL,
	[JobType] [varchar](50) NULL,
	[OppArea] [varchar](50) NULL,
	[Branch] [varchar](50) NULL,
	[Territory] [varchar](50) NULL,
	[SubTerritory] [varchar](50) NULL,
	[AssetCategory] [varchar](50) NULL,
	[AssetDescription] [varchar](max) NULL,
	[AssetLocation] [varchar](50) NULL,
	[AssetReference] [varchar](50) NULL,
	[JobCategory] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[AssetType] [varchar](50) NULL,
	[MeterType] [varchar](50) NULL,
	[MeterNumber] [varchar](50) NULL,
	[MeterReading] [varchar](50) NULL,
	[Ycordinates] [varchar](50) NULL,
	[Xcordinates] [varchar](50) NULL,
	[BlockMapRef] [varchar](50) NULL,
	[JobCardNo] [varbinary](50) NULL,
	[RecordDate] [datetime] NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobMaterials]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobMaterials](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ticketid] [varchar](50) NULL,
	[MaterialType] [varchar](50) NULL,
	[Size] [varchar](50) NULL,
	[Quantity] [varchar](50) NULL,
	[IsRequired] [bit] NULL,
	[Cost] [money] NULL,
	[Remark] [varchar](max) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LandLord]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LandLord](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[TelContact] [varchar](50) NULL,
	[CreationDate] [datetime] NULL,
	[Active] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewApplication]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewApplication](
	[Recordid] [bigint] IDENTITY(1,1) NOT NULL,
	[Fname] [varchar](50) NULL,
	[Lname] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[Dob] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[SubCounty] [varchar](50) NULL,
	[Lc1] [varchar](50) NULL,
	[Village] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Nationality] [varchar](50) NULL,
	[Parish] [varchar](50) NULL,
	[ApartmentNo] [varchar](50) NULL,
	[CustomerTel] [varchar](50) NULL,
	[CustomerEmail] [varchar](50) NULL,
	[IdNumber] [varchar](50) NULL,
	[ApplicationId] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemErrors]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemErrors](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Method] [varchar](50) NULL,
	[ExceptionLevel] [varchar](50) NULL,
	[Exception] [varchar](max) NULL,
	[LoggedBy] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemUsers]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemUsers](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](50) NULL,
	[Username] [varchar](50) NULL,
	[UserEmail] [varchar](50) NULL,
	[UserCompany] [varchar](50) NULL,
	[UserRole] [varchar](50) NULL,
	[Active] [bit] NULL,
	[RecordedBy] [varchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[UserPassword] [varchar](max) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Section] [varchar](50) NULL,
	[Designation] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ticket]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ticket](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[ComplaintType] [varchar](max) NULL,
	[CustRef] [varchar](max) NULL,
	[CustName] [varchar](max) NULL,
	[ComplaintSource] [varchar](max) NULL,
	[ComplaintCategory] [varchar](max) NULL,
	[CompSubCategory] [varchar](max) NULL,
	[CustPhone] [varchar](max) NULL,
	[email_id] [varchar](max) NULL,
	[prioprity] [varchar](max) NULL,
	[ticket_id] [varchar](max) NULL,
	[status] [varchar](max) NULL,
	[admin_remark] [varchar](max) NULL,
	[posting_date] [datetime] NULL,
	[admin_remark_date] [datetime] NULL,
	[TicketDetails] [varchar](max) NULL,
	[BranchName] [varchar](max) NULL,
	[AreaName] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketAssignment]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketAssignment](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[AssignedTo] [varchar](50) NULL,
	[TicketId] [varchar](50) NULL,
	[Narration] [varchar](max) NULL,
	[AssignedDate] [datetime] NULL,
	[Status] [varchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TicketResolution]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TicketResolution](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[Ticket_id] [varchar](50) NULL,
	[Status] [varchar](50) NULL,
	[ResolutionDetails] [varchar](max) NULL,
	[EscalatedTo] [varchar](50) NULL,
	[RecordedBy] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDepartments]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDepartments](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
	[DepartmentEmail] [varchar](50) NULL,
	[RecordedBy] [varchar](50) NULL,
	[RecordDate] [datetime] NULL,
	[Status] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSections]    Script Date: 14/08/2022 18:42:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSections](
	[RecordId] [bigint] IDENTITY(1,1) NOT NULL,
	[SectionName] [varchar](50) NULL,
	[DepartmentId] [varchar](50) NULL,
	[RecordDate] [datetime] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AuditTrail] ON 
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (1, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:32:18.440' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (2, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:32:54.850' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (3, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:33:51.917' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (4, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T00:33:51.920' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (5, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:39:10.213' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (6, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T00:39:10.223' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (7, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:59:56.890' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (8, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T00:59:56.900' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (9, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T01:17:26.193' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (10, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T01:17:26.200' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (11, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T01:36:32.853' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (12, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T01:36:32.860' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (13, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T02:01:26.400' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (14, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T02:01:26.477' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (15, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T02:48:11.840' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (16, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T02:48:12.347' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (17, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T02:50:33.010' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (18, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T02:50:33.017' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (19, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:16:13.387' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (20, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T00:16:37.443' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (21, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:17:04.863' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (23, NULL, N'Attempted to log into the system', CAST(N'2021-12-31T00:46:39.400' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (24, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T00:46:39.413' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (86, NULL, N'Quarried user details', CAST(N'2022-01-05T07:10:50.780' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (87, NULL, N'Queried successfully user details', CAST(N'2022-01-05T07:10:53.793' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (88, NULL, N'Quarried user details', CAST(N'2022-01-05T07:12:53.133' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (89, NULL, N'Queried successfully user details', CAST(N'2022-01-05T07:12:53.913' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (90, NULL, N'Quarried user details', CAST(N'2022-01-05T07:13:48.260' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (91, NULL, N'Queried successfully user details', CAST(N'2022-01-05T07:13:49.623' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (92, N'domony@tracecorpsolutions.com', N'Quarried user details', CAST(N'2022-01-05T07:13:57.393' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (93, NULL, N'Queried successfully user details', CAST(N'2022-01-05T07:14:00.273' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (94, NULL, N'Attempted to log into the system', CAST(N'2022-01-05T07:16:16.077' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (95, NULL, N'Logged into the system successfully', CAST(N'2022-01-05T07:16:17.943' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (96, NULL, N'Quarried user details', CAST(N'2022-01-05T07:18:24.710' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (97, NULL, N'Queried successfully user details', CAST(N'2022-01-05T07:18:25.520' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (98, N'domony@tracecorpsolutions.com', N'Quarried user details', CAST(N'2022-01-05T07:18:29.973' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (99, NULL, N'Queried successfully user details', CAST(N'2022-01-05T07:18:31.833' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (102, NULL, N'Attempted to log into the system', CAST(N'2022-01-05T09:54:43.210' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (103, NULL, N'Logged into the system successfully', CAST(N'2022-01-05T09:54:43.420' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (133, NULL, N'Attempted to log into the system', CAST(N'2022-01-11T10:03:07.510' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (134, NULL, N'Logged into the system successfully', CAST(N'2022-01-11T10:03:09.627' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (135, NULL, N'Attempted to log into the system', CAST(N'2022-01-11T13:33:15.243' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (136, NULL, N'Logged into the system successfully', CAST(N'2022-01-11T13:33:16.280' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (137, NULL, N'Attempted to log into the system', CAST(N'2022-01-11T13:40:49.563' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (138, NULL, N'Logged into the system successfully', CAST(N'2022-01-11T13:40:51.860' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (139, NULL, N'Attempted to log into the system', CAST(N'2022-01-11T13:45:10.803' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (140, NULL, N'Logged into the system successfully', CAST(N'2022-01-11T13:45:12.967' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (141, NULL, N'Attempted to log into the system', CAST(N'2022-01-11T13:49:05.777' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (142, NULL, N'Logged into the system successfully', CAST(N'2022-01-11T13:49:08.397' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (143, NULL, N'Attempted to log into the system', CAST(N'2022-01-11T14:11:13.700' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (144, NULL, N'Logged into the system successfully', CAST(N'2022-01-11T14:11:15.937' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (174, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T09:51:08.307' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (175, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T09:51:08.337' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (184, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T12:28:35.227' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (185, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T12:28:37.310' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (192, NULL, N'Attempted to log into the system', CAST(N'2022-01-15T15:56:59.630' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (193, NULL, N'Logged into the system successfully', CAST(N'2022-01-15T15:57:01.070' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (194, NULL, N'Attempted to log into the system', CAST(N'2022-01-15T16:11:54.877' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (195, NULL, N'Logged into the system successfully', CAST(N'2022-01-15T16:11:56.870' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (207, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T18:47:10.407' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (208, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T18:47:51.160' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (209, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T18:47:51.970' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (210, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T18:56:52.377' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (211, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T18:56:54.043' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (212, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T19:07:01.633' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (213, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T19:07:03.240' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (214, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T19:08:22.130' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (215, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T19:08:25.573' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (216, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T19:45:53.043' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (217, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T19:46:02.883' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (218, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T19:46:13.850' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (219, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T19:46:14.450' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (242, NULL, N'Attempted to log into the system', CAST(N'2022-01-18T09:50:51.027' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (243, NULL, N'Logged into the system successfully', CAST(N'2022-01-18T09:50:51.040' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (244, N'info@tracecorpsolutions.com', N'registered user  with username : info@tracecorpsolutions.com and email : info@tracecorpsolutions.com', CAST(N'2022-01-18T09:55:19.240' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (245, NULL, N'Quarried user details', CAST(N'2022-01-18T09:55:56.007' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (246, NULL, N'Queried successfully user details', CAST(N'2022-01-18T09:55:56.020' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (301, NULL, N'Attempted to log into the system', CAST(N'2022-01-29T17:24:53.510' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (302, NULL, N'Logged into the system successfully', CAST(N'2022-01-29T17:24:56.750' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (303, NULL, N'Quarried user details', CAST(N'2022-01-29T17:25:08.280' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (304, NULL, N'Queried successfully user details', CAST(N'2022-01-29T17:25:08.790' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (305, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T08:38:39.450' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (306, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T08:38:41.923' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (307, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T08:50:35.987' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (308, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T08:50:37.367' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (309, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T08:51:10.150' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (310, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T08:51:11.497' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (311, NULL, N'Quarried user details', CAST(N'2022-02-01T08:51:25.397' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (312, NULL, N'Queried successfully user details', CAST(N'2022-02-01T08:51:26.057' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (313, N'ngobizadokchrist@gmail.com', N'Quarried user details', CAST(N'2022-02-01T08:51:28.560' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (314, NULL, N'Queried successfully user details', CAST(N'2022-02-01T08:51:29.687' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (315, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:01:16.007' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (316, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:01:17.580' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (317, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:07:48.273' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (318, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:07:48.303' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (319, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:13:16.573' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (320, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:14:52.580' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (321, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:16:34.850' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (322, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:17:04.970' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (323, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:17:21.753' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (324, N'tunjinuga@yahoo.co.uk', N'registered user  with username : tunjinuga@yahoo.co.uk and email : tunjinuga@yahoo.co.uk', CAST(N'2022-02-01T09:17:25.453' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (325, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:18:05.890' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (326, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:18:16.850' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (327, NULL, N'Quarried user details', CAST(N'2022-02-01T09:18:36.740' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (328, NULL, N'Queried successfully user details', CAST(N'2022-02-01T09:18:36.753' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (329, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:19:11.933' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (330, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:19:26.180' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (331, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:19:40.250' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (332, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:19:54.753' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (333, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:20:54.170' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (334, NULL, N'Activated User : tunjinuga@yahoo.co.uk', CAST(N'2022-02-01T09:21:00.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (335, NULL, N'Quarried user details', CAST(N'2022-02-01T09:21:02.613' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (336, NULL, N'Queried successfully user details', CAST(N'2022-02-01T09:21:02.630' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (337, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:21:05.933' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (338, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:21:07.710' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (339, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:21:44.960' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (340, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:22:00.333' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (341, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:22:00.350' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (342, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:22:24.843' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (22, NULL, N'Logged into the system successfully', CAST(N'2021-12-31T00:17:06.353' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (25, NULL, N'Attempted to log into the system', CAST(N'2022-01-03T05:53:16.570' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (26, NULL, N'Logged into the system successfully', CAST(N'2022-01-03T05:53:16.590' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (27, NULL, N'Quarried user details', CAST(N'2022-01-03T05:55:07.593' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (28, NULL, N'Queried successfully user details', CAST(N'2022-01-03T05:55:07.787' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (29, NULL, N'Attempted to log into the system', CAST(N'2022-01-03T10:02:01.577' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (30, NULL, N'Logged into the system successfully', CAST(N'2022-01-03T10:02:01.607' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (31, N'omony.david8@gmail.com', N'registered user  with username : omony.david8@gmail.com and email : omony.david8@gmail.com', CAST(N'2022-01-03T10:06:57.890' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (32, NULL, N'Quarried user details', CAST(N'2022-01-03T10:07:35.750' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (33, NULL, N'Queried successfully user details', CAST(N'2022-01-03T10:07:35.763' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (34, NULL, N'Activated User : omony.david8@gmail.com', CAST(N'2022-01-03T10:07:44.013' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (35, NULL, N'Quarried user details', CAST(N'2022-01-03T10:07:44.553' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (36, NULL, N'Queried successfully user details', CAST(N'2022-01-03T10:07:44.553' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (37, N'domony@tracecorpsolutions.com', N'registered user  with username : domony@tracecorpsolutions.com and email : domony@tracecorpsolutions.com', CAST(N'2022-01-03T10:10:29.043' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (38, NULL, N'Quarried user details', CAST(N'2022-01-03T10:10:45.153' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (39, NULL, N'Queried successfully user details', CAST(N'2022-01-03T10:10:45.170' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (40, NULL, N'Activated User : domony@tracecorpsolutions.com', CAST(N'2022-01-03T10:10:48.650' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (41, NULL, N'Quarried user details', CAST(N'2022-01-03T10:10:49.113' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (42, NULL, N'Queried successfully user details', CAST(N'2022-01-03T10:10:49.113' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (43, NULL, N'Attempted to log into the system', CAST(N'2022-01-03T13:03:17.113' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (44, NULL, N'Logged into the system successfully', CAST(N'2022-01-03T13:03:17.310' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (45, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T05:47:09.407' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (46, NULL, N'Logged into the system successfully', CAST(N'2022-01-04T05:47:09.437' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (47, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T05:47:54.573' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (48, NULL, N'Logged into the system successfully', CAST(N'2022-01-04T05:47:54.587' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (49, N'bongominhenry8@gmail.com', N'registered user  with username : bongominhenry8@gmail.com and email : bongominhenry8@gmail.com', CAST(N'2022-01-04T05:52:51.047' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (50, NULL, N'Quarried user details', CAST(N'2022-01-04T05:55:16.083' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (51, NULL, N'Queried successfully user details', CAST(N'2022-01-04T05:55:16.100' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (52, NULL, N'Activated User : bongominhenry8@gmail.com', CAST(N'2022-01-04T05:56:59.180' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (53, NULL, N'Quarried user details', CAST(N'2022-01-04T05:57:00.590' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (54, NULL, N'Queried successfully user details', CAST(N'2022-01-04T05:57:00.590' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (55, NULL, N'Deactivated User : domony@tracecorpsolutions.com', CAST(N'2022-01-04T05:57:13.123' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (56, NULL, N'Quarried user details', CAST(N'2022-01-04T05:57:13.590' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (57, NULL, N'Queried successfully user details', CAST(N'2022-01-04T05:57:13.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (58, N'domony@tracecorpsolutions.com', N'Quarried user details', CAST(N'2022-01-04T05:58:16.110' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (59, NULL, N'Queried successfully user details', CAST(N'2022-01-04T05:58:16.693' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (60, N'domony@tracecorpsolutions.com', N'Quarried user details', CAST(N'2022-01-04T05:58:45.483' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (61, NULL, N'Queried successfully user details', CAST(N'2022-01-04T05:58:45.500' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (62, N'domony@tracecorpsolutions.com', N'Updated User details user  with username : domony@tracecorpsolutions.com and email : domony@tracecorpsolutions.com', CAST(N'2022-01-04T06:00:22.460' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (63, NULL, N'Quarried user details', CAST(N'2022-01-04T06:00:34.490' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (64, NULL, N'Queried successfully user details', CAST(N'2022-01-04T06:00:34.507' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (65, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T06:01:58.837' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (66, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T06:02:13.070' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (67, NULL, N'Logged into the system successfully', CAST(N'2022-01-04T06:02:13.083' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (68, NULL, N'Quarried user details', CAST(N'2022-01-04T06:02:36.157' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (69, NULL, N'Queried successfully user details', CAST(N'2022-01-04T06:02:36.170' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (70, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T07:13:37.497' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (71, NULL, N'Logged into the system successfully', CAST(N'2022-01-04T07:13:37.513' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (72, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T11:06:08.567' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (73, NULL, N'Logged into the system successfully', CAST(N'2022-01-04T11:06:10.740' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (74, NULL, N'Quarried user details', CAST(N'2022-01-04T11:14:08.643' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (75, NULL, N'Queried successfully user details', CAST(N'2022-01-04T11:14:09.653' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (76, NULL, N'Quarried user details', CAST(N'2022-01-04T11:15:31.337' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (77, NULL, N'Queried successfully user details', CAST(N'2022-01-04T11:15:32.010' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (78, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T11:52:41.527' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (79, NULL, N'Logged into the system successfully', CAST(N'2022-01-04T11:52:41.737' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (80, NULL, N'Attempted to log into the system', CAST(N'2022-01-04T12:16:37.463' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (81, NULL, N'Logged into the system successfully', CAST(N'2022-01-04T12:16:39.550' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (176, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T10:02:56.927' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (177, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T10:02:59.567' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (178, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T10:05:23.027' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (179, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T10:05:24.150' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (180, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T10:07:06.933' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (181, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T10:07:08.223' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (182, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T10:08:36.333' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (183, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T10:08:37.503' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (278, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T11:24:25.807' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (279, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T11:24:27.893' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (280, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T11:32:04.123' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (281, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T11:32:06.230' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (282, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T11:39:37.723' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (283, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T11:39:39.853' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (284, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T11:41:10.297' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (285, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T11:41:12.147' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (286, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T11:42:15.493' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (287, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T11:42:17.653' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (290, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T11:47:41.473' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (291, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T11:47:44.190' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (292, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T13:38:10.863' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (293, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T13:38:20.550' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (294, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T13:38:21.323' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (343, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:22:32.060' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (344, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:23:20.720' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (345, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:23:20.737' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (346, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:23:34.057' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (347, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:23:34.070' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (348, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:24:40.957' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (349, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:25:24.650' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (350, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:25:24.680' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (351, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:25:35.137' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (352, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:25:35.137' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (353, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:25:39.800' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (354, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:25:42.067' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (355, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:25:43.190' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (356, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:25:43.207' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (357, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:26:07.363' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (358, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:26:07.377' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (359, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:26:45.637' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (360, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:26:45.650' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (361, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:27:55.250' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (362, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:28:02.060' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (363, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:28:18.117' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (364, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:28:48.577' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (365, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:28:48.590' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (366, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:29:32.000' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (367, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:29:32.000' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (368, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:31:59.677' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (369, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:32:10.317' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (370, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:32:10.330' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (371, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:33:44.600' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (372, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:33:44.617' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (373, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:33:44.647' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (374, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:33:44.647' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (375, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:33:54.847' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (376, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:33:54.860' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (82, NULL, N'Attempted to log into the system', CAST(N'2022-01-05T06:48:34.457' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (83, NULL, N'Logged into the system successfully', CAST(N'2022-01-05T06:48:37.230' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (84, NULL, N'Attempted to log into the system', CAST(N'2022-01-05T06:55:10.383' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (85, NULL, N'Logged into the system successfully', CAST(N'2022-01-05T06:55:14.493' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (100, NULL, N'Attempted to log into the system', CAST(N'2022-01-05T07:28:31.267' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (101, NULL, N'Logged into the system successfully', CAST(N'2022-01-05T07:28:31.297' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (104, NULL, N'Attempted to log into the system', CAST(N'2022-01-06T08:56:12.203' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (105, NULL, N'Logged into the system successfully', CAST(N'2022-01-06T08:56:12.223' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (106, NULL, N'Attempted to log into the system', CAST(N'2022-01-06T09:18:01.780' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (107, NULL, N'Logged into the system successfully', CAST(N'2022-01-06T09:18:02.063' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (108, NULL, N'Attempted to log into the system', CAST(N'2022-01-06T09:46:38.370' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (109, NULL, N'Logged into the system successfully', CAST(N'2022-01-06T09:46:38.383' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (110, NULL, N'Quarried user details', CAST(N'2022-01-06T09:55:37.110' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (111, NULL, N'Queried successfully user details', CAST(N'2022-01-06T09:55:37.123' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (112, N'jeandave2552@gmail.com', N'registered user  with username : jeandave2552@gmail.com and email : jeandave2552@gmail.com', CAST(N'2022-01-06T09:57:41.760' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (113, NULL, N'Quarried user details', CAST(N'2022-01-06T09:58:28.813' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (114, NULL, N'Queried successfully user details', CAST(N'2022-01-06T09:58:28.830' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (115, NULL, N'Activated User : jeandave2552@gmail.com', CAST(N'2022-01-06T09:58:41.430' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (116, NULL, N'Quarried user details', CAST(N'2022-01-06T09:58:42.313' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (117, NULL, N'Queried successfully user details', CAST(N'2022-01-06T09:58:42.313' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (118, NULL, N'Attempted to log into the system', CAST(N'2022-01-06T10:03:14.350' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (119, NULL, N'Logged into the system successfully', CAST(N'2022-01-06T10:03:14.363' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (120, NULL, N'Attempted to log into the system', CAST(N'2022-01-10T06:47:50.220' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (121, NULL, N'Logged into the system successfully', CAST(N'2022-01-10T06:47:50.807' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (122, NULL, N'Quarried user details', CAST(N'2022-01-10T06:48:03.660' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (123, NULL, N'Queried successfully user details', CAST(N'2022-01-10T06:48:03.673' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (124, NULL, N'Attempted to log into the system', CAST(N'2022-01-10T13:13:29.200' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (125, NULL, N'Logged into the system successfully', CAST(N'2022-01-10T13:13:29.230' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (126, NULL, N'Quarried user details', CAST(N'2022-01-10T13:18:44.710' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (127, NULL, N'Queried successfully user details', CAST(N'2022-01-10T13:18:44.727' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (128, N'jeandave2552@gmail.com', N'Quarried user details', CAST(N'2022-01-10T13:19:34.240' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (129, NULL, N'Queried successfully user details', CAST(N'2022-01-10T13:19:34.870' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (130, N'jeandave2552@gmail.com', N'Updated User details user  with username : jeandave2552@gmail.com and email : jeandave2552@gmail.com', CAST(N'2022-01-10T13:20:39.760' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (131, NULL, N'Quarried user details', CAST(N'2022-01-10T13:20:51.447' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (132, NULL, N'Queried successfully user details', CAST(N'2022-01-10T13:20:51.460' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (145, NULL, N'Attempted to log into the system', CAST(N'2022-01-12T05:30:13.550' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (146, NULL, N'Logged into the system successfully', CAST(N'2022-01-12T05:30:13.750' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (147, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T04:41:23.177' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (148, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T04:41:23.207' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (149, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T05:11:24.437' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (150, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T05:11:24.453' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (151, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T05:40:41.063' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (152, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T05:40:41.080' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (153, N'pasianut@gmail.com', N'registered user  with username : pasianut@gmail.com and email : pasianut@gmail.com', CAST(N'2022-01-13T05:42:45.190' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (154, NULL, N'Quarried user details', CAST(N'2022-01-13T05:43:06.053' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (155, NULL, N'Queried successfully user details', CAST(N'2022-01-13T05:43:06.070' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (156, NULL, N'Activated User : pasianut@gmail.com', CAST(N'2022-01-13T05:43:28.913' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (157, NULL, N'Quarried user details', CAST(N'2022-01-13T05:43:29.470' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (158, NULL, N'Queried successfully user details', CAST(N'2022-01-13T05:43:29.483' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (159, N'pasianut@gmail.com', N'Quarried user details', CAST(N'2022-01-13T05:44:04.450' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (160, NULL, N'Queried successfully user details', CAST(N'2022-01-13T05:44:04.643' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (161, N'pasianut@gmail.com', N'Updated User details user  with username : pasianut@gmail.com and email : pasianut@gmail.com', CAST(N'2022-01-13T05:45:57.400' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (162, NULL, N'Quarried user details', CAST(N'2022-01-13T05:46:07.910' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (163, NULL, N'Queried successfully user details', CAST(N'2022-01-13T05:46:07.920' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (164, NULL, N'Quarried user details', CAST(N'2022-01-13T06:05:33.540' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (165, NULL, N'Queried successfully user details', CAST(N'2022-01-13T06:05:33.553' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (166, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T06:06:20.730' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (167, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T06:06:20.730' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (168, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T06:45:06.470' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (169, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T06:45:06.490' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (170, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T08:35:36.620' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (171, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T08:35:38.810' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (172, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T08:59:39.053' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (173, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T08:59:39.823' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (186, NULL, N'Attempted to log into the system', CAST(N'2022-01-13T12:46:36.537' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (187, NULL, N'Logged into the system successfully', CAST(N'2022-01-13T12:46:38.397' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (188, NULL, N'Attempted to log into the system', CAST(N'2022-01-15T14:27:49.833' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (189, NULL, N'Logged into the system successfully', CAST(N'2022-01-15T14:27:51.783' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (190, NULL, N'Attempted to log into the system', CAST(N'2022-01-15T14:35:08.573' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (191, NULL, N'Logged into the system successfully', CAST(N'2022-01-15T14:35:10.503' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (196, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T16:57:33.773' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (197, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T16:57:35.527' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (198, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T17:08:08.770' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (199, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T17:08:22.980' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (200, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T17:08:23.593' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (201, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T17:10:18.923' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (202, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T17:10:21.370' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (203, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T17:20:34.737' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (204, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T17:20:36.747' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (205, NULL, N'Attempted to log into the system', CAST(N'2022-01-16T17:51:36.933' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (206, NULL, N'Logged into the system successfully', CAST(N'2022-01-16T17:51:39.857' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (220, NULL, N'Attempted to log into the system', CAST(N'2022-01-17T11:37:48.963' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (221, NULL, N'Logged into the system successfully', CAST(N'2022-01-17T11:37:48.980' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (222, NULL, N'Quarried user details', CAST(N'2022-01-17T11:38:39.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (223, NULL, N'Queried successfully user details', CAST(N'2022-01-17T11:38:39.620' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (224, N'ngobizadokchrist@gmail.com', N'Quarried user details', CAST(N'2022-01-17T11:38:48.950' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (225, NULL, N'Queried successfully user details', CAST(N'2022-01-17T11:38:49.160' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (226, NULL, N'Attempted to log into the system', CAST(N'2022-01-18T05:22:05.533' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (227, NULL, N'Logged into the system successfully', CAST(N'2022-01-18T05:22:05.553' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (228, NULL, N'Quarried user details', CAST(N'2022-01-18T05:23:28.860' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (229, NULL, N'Queried successfully user details', CAST(N'2022-01-18T05:23:28.880' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (230, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-01-18T05:23:44.703' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (231, NULL, N'Queried successfully user details', CAST(N'2022-01-18T05:23:45.303' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (232, NULL, N'Quarried user details', CAST(N'2022-01-18T05:24:52.473' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (233, NULL, N'Queried successfully user details', CAST(N'2022-01-18T05:24:52.490' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (234, NULL, N'Attempted to log into the system', CAST(N'2022-01-18T05:39:40.147' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (235, NULL, N'Logged into the system successfully', CAST(N'2022-01-18T05:39:40.160' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (236, NULL, N'Attempted to log into the system', CAST(N'2022-01-18T09:14:54.787' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (237, NULL, N'Logged into the system successfully', CAST(N'2022-01-18T09:14:54.817' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (238, NULL, N'Quarried user details', CAST(N'2022-01-18T09:15:16.990' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (239, NULL, N'Queried successfully user details', CAST(N'2022-01-18T09:15:17.007' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (240, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-01-18T09:15:28.567' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (241, NULL, N'Queried successfully user details', CAST(N'2022-01-18T09:15:28.820' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (247, NULL, N'Quarried user details', CAST(N'2022-01-18T09:59:32.247' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (248, NULL, N'Queried successfully user details', CAST(N'2022-01-18T09:59:32.263' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (249, NULL, N'Activated User : info@tracecorpsolutions.com', CAST(N'2022-01-18T10:10:41.340' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (250, NULL, N'Quarried user details', CAST(N'2022-01-18T10:10:42.643' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (251, NULL, N'Queried successfully user details', CAST(N'2022-01-18T10:10:42.660' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (252, NULL, N'Quarried user details', CAST(N'2022-01-18T10:11:01.770' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (253, NULL, N'Queried successfully user details', CAST(N'2022-01-18T10:11:01.783' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (254, NULL, N'Attempted to log into the system', CAST(N'2022-01-18T11:24:11.600' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (255, NULL, N'Logged into the system successfully', CAST(N'2022-01-18T11:24:11.637' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (377, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:33:56.360' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (378, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:33:56.360' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (379, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:34:23.330' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (380, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:34:23.347' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (381, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:34:55.057' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (256, NULL, N'Attempted to log into the system', CAST(N'2022-01-19T07:45:06.993' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (257, NULL, N'Logged into the system successfully', CAST(N'2022-01-19T07:45:07.007' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (258, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T06:55:31.203' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (259, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T06:55:33.723' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (260, NULL, N'Quarried user details', CAST(N'2022-01-20T06:56:03.123' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (261, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:56:03.993' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (262, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-01-20T06:56:08.330' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (263, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:56:10.533' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (264, NULL, N'Quarried user details', CAST(N'2022-01-20T06:57:00.680' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (265, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:57:01.520' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (266, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-01-20T06:57:04.207' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (267, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:57:05.290' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (268, NULL, N'Quarried user details', CAST(N'2022-01-20T06:57:19.777' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (269, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:57:20.683' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (270, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-01-20T06:57:25.957' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (271, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:57:26.720' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (272, NULL, N'Quarried user details', CAST(N'2022-01-20T06:59:33.847' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (273, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:59:35.030' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (274, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-01-20T06:59:40.040' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (275, NULL, N'Queried successfully user details', CAST(N'2022-01-20T06:59:40.807' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (276, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-01-20T07:00:01.027' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (277, NULL, N'Queried successfully user details', CAST(N'2022-01-20T07:00:02.227' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (295, NULL, N'Attempted to log into the system', CAST(N'2022-01-21T05:03:45.890' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (296, NULL, N'Logged into the system successfully', CAST(N'2022-01-21T05:03:45.937' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (297, NULL, N'Quarried user details', CAST(N'2022-01-21T05:06:47.753' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (298, NULL, N'Queried successfully user details', CAST(N'2022-01-21T05:06:47.947' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (299, N'jeandave2552@gmail.com', N'Quarried user details', CAST(N'2022-01-21T05:07:13.553' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (300, NULL, N'Queried successfully user details', CAST(N'2022-01-21T05:07:25.087' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (382, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:35:17.150' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (383, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:35:17.167' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (384, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:36:24.863' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (385, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:36:26.243' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (386, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:36:31.027' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (393, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:39:51.263' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (394, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:39:52.657' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (395, NULL, N'Quarried user details', CAST(N'2022-02-01T09:40:12.593' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (396, NULL, N'Queried successfully user details', CAST(N'2022-02-01T09:40:13.253' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (399, N'bongominhenry8@gmail.com', N'Quarried user details', CAST(N'2022-02-01T09:40:16.013' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (400, NULL, N'Queried successfully user details', CAST(N'2022-02-01T09:40:17.317' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (407, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:47:53.050' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (408, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:47:53.933' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (409, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:47:56.783' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (410, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:49:42.143' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (411, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:52:27.340' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (412, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:52:29.890' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (413, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:52:45.700' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (414, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:52:45.713' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (417, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:54:04.750' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (418, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:54:58.000' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (419, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:54:58.030' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (420, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:55:29.990' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (421, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:56:19.773' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (422, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:56:19.787' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (423, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:56:53.307' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (424, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:56:53.320' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (425, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:57:01.287' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (426, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:57:01.287' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (427, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:57:30.910' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (428, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:57:40.210' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (429, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:57:44.637' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (430, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:57:44.650' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (431, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:58:14.323' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (432, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:59:00.327' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (433, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:59:55.420' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (434, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T10:00:14.187' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (435, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T10:00:14.200' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (436, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T10:03:50.670' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (437, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T10:03:50.680' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (438, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T10:05:46.813' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (439, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T10:05:46.830' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (442, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T10:28:31.993' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (443, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T10:28:32.007' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (444, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T10:36:48.507' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (445, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T10:36:49.273' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (448, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T08:11:10.423' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (449, NULL, N'Logged into the system successfully', CAST(N'2022-02-02T08:11:12.987' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (450, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T11:33:15.090' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (451, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T11:33:24.463' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (452, NULL, N'Logged into the system successfully', CAST(N'2022-02-02T11:33:25.383' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (453, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T12:01:14.743' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (454, NULL, N'Logged into the system successfully', CAST(N'2022-02-02T12:01:16.273' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (455, NULL, N'Quarried user details', CAST(N'2022-02-02T12:01:28.977' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (456, NULL, N'Queried successfully user details', CAST(N'2022-02-02T12:01:29.427' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (457, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T12:01:34.527' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (458, NULL, N'Queried successfully user details', CAST(N'2022-02-02T12:01:36.177' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (459, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T12:03:45.297' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (460, NULL, N'Queried successfully user details', CAST(N'2022-02-02T12:03:46.527' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (461, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T12:05:24.133' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (462, NULL, N'Queried successfully user details', CAST(N'2022-02-02T12:05:24.943' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (465, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T13:09:03.967' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (466, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:09:04.627' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (483, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T13:34:48.160' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (484, NULL, N'Logged into the system successfully', CAST(N'2022-02-02T13:34:49.840' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (485, NULL, N'Quarried user details', CAST(N'2022-02-02T13:34:56.290' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (486, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:34:56.817' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (487, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T13:35:03.040' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (488, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:35:04.870' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (489, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T13:50:24.540' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (490, NULL, N'Logged into the system successfully', CAST(N'2022-02-02T13:50:26.130' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (508, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T11:13:59.960' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (509, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T11:14:01.910' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (510, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T12:05:30.760' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (511, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T12:05:32.680' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (518, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T09:04:27.257' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (519, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T09:04:27.287' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (520, NULL, N'Quarried user details', CAST(N'2022-02-04T09:16:37.940' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (521, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:16:37.940' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (522, NULL, N'Quarried user details', CAST(N'2022-02-04T09:17:47.720' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (523, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:17:47.737' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (524, NULL, N'Quarried user details', CAST(N'2022-02-04T09:21:09.817' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (525, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:21:09.830' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (526, NULL, N'Deactivated User : tunjinuga@yahoo.co.uk', CAST(N'2022-02-04T09:32:31.087' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (527, NULL, N'Quarried user details', CAST(N'2022-02-04T09:32:32.810' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (528, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:32:32.827' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (529, NULL, N'Activated User : tunjinuga@yahoo.co.uk', CAST(N'2022-02-04T09:33:07.703' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (530, NULL, N'Quarried user details', CAST(N'2022-02-04T09:33:08.907' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (531, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:33:08.930' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (532, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-04T09:57:33.897' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (533, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:57:34.240' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (534, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-04T09:58:29.410' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (535, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:58:29.427' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (288, NULL, N'Attempted to log into the system', CAST(N'2022-01-20T11:46:25.963' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (289, NULL, N'Logged into the system successfully', CAST(N'2022-01-20T11:46:28.110' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (536, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T09:59:21.790' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (537, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T09:59:21.807' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (538, NULL, N'Quarried user details', CAST(N'2022-02-04T09:59:39.250' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (539, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:59:39.267' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (540, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-04T09:59:48.100' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (541, NULL, N'Queried successfully user details', CAST(N'2022-02-04T09:59:48.100' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (542, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:04:43.337' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (543, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:04:50.760' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (544, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:04:51.437' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (555, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:44:24.083' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (556, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:44:25.237' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (561, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:45:39.217' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (562, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:45:40.673' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (563, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:47:00.983' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (564, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:47:02.317' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (565, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:48:40.223' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (566, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:48:41.813' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (567, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:52:07.040' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (568, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:52:08.657' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (573, NULL, N'Attempted to log into the system', CAST(N'2022-02-05T17:07:08.303' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (574, NULL, N'Logged into the system successfully', CAST(N'2022-02-05T17:07:08.500' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (575, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T11:30:15.760' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (576, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T11:30:17.347' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (577, NULL, N'Quarried user details', CAST(N'2022-02-06T11:34:57.957' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (578, NULL, N'Queried successfully user details', CAST(N'2022-02-06T11:34:58.590' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (596, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T13:07:34.480' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (597, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T13:07:34.797' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (611, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T13:39:12.110' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (612, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T13:39:13.550' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (613, NULL, N'Quarried user details', CAST(N'2022-02-06T13:47:37.640' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (614, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:47:38.300' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (615, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T13:47:43.233' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (616, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:47:44.663' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (617, N'tunjinuga@yahoo.co.uk', N'Updated User details user  with username : tunjinuga@yahoo.co.uk and email : tunjinuga@yahoo.co.uk', CAST(N'2022-02-06T13:48:03.903' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (618, NULL, N'Quarried user details', CAST(N'2022-02-06T13:48:07.890' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (619, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:48:08.457' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (620, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T13:48:34.773' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (621, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:48:35.270' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (622, NULL, N'Quarried user details', CAST(N'2022-02-06T13:48:41.553' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (623, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:48:42.273' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (624, NULL, N'Quarried user details', CAST(N'2022-02-06T13:50:16.490' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (625, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:50:17.103' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (628, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T16:07:55.493' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (629, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T16:07:56.033' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (634, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T17:38:03.317' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (635, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T17:38:03.330' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (636, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T18:07:02.303' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (637, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T18:07:02.333' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (640, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T18:45:52.893' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (641, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T18:45:54.753' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (642, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T19:09:38.133' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (643, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T19:09:40.473' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (644, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T20:03:21.673' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (645, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T20:03:22.230' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (646, NULL, N'Attempted to log into the system', CAST(N'2022-02-07T09:22:27.073' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (647, NULL, N'Logged into the system successfully', CAST(N'2022-02-07T09:22:27.087' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (648, NULL, N'Attempted to log into the system', CAST(N'2022-02-07T09:31:47.897' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (649, NULL, N'Logged into the system successfully', CAST(N'2022-02-07T09:31:47.910' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (652, NULL, N'Quarried user details', CAST(N'2022-02-07T09:35:02.160' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (653, NULL, N'Queried successfully user details', CAST(N'2022-02-07T09:35:02.177' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (654, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-07T09:36:31.037' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (655, NULL, N'Queried successfully user details', CAST(N'2022-02-07T09:36:31.680' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (656, NULL, N'Quarried user details', CAST(N'2022-02-07T09:36:43.500' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (657, NULL, N'Queried successfully user details', CAST(N'2022-02-07T09:36:43.517' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (658, N'tunjinuga@yahoo.co.uk', N'Reset User Password for : tunjinuga@yahoo.co.uk', CAST(N'2022-02-07T09:37:01.997' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (659, NULL, N'Quarried user details', CAST(N'2022-02-07T09:37:04.050' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (660, NULL, N'Queried successfully user details', CAST(N'2022-02-07T09:37:04.067' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (661, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T14:37:35.730' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (662, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T14:37:35.760' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (663, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T15:31:39.027' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (664, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T15:31:39.057' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (665, NULL, N'Quarried user details', CAST(N'2022-02-08T15:36:30.193' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (666, NULL, N'Queried successfully user details', CAST(N'2022-02-08T15:36:30.207' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (667, NULL, N'Quarried user details', CAST(N'2022-02-08T15:41:02.217' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (668, NULL, N'Queried successfully user details', CAST(N'2022-02-08T15:41:02.217' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (669, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-08T15:47:33.417' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (670, NULL, N'Queried successfully user details', CAST(N'2022-02-08T15:47:34.257' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (671, N'tunjinuga@yahoo.co.uk', N'Updated User details user  with username : tunjinuga@yahoo.co.uk and email : tunjinuga@yahoo.co.uk', CAST(N'2022-02-08T15:47:52.887' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (672, NULL, N'Quarried user details', CAST(N'2022-02-08T15:48:09.083' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (673, NULL, N'Queried successfully user details', CAST(N'2022-02-08T15:48:09.117' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (674, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-08T15:50:23.547' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (675, NULL, N'Queried successfully user details', CAST(N'2022-02-08T15:50:23.563' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (676, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T17:43:42.120' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (677, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T17:43:42.150' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (678, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T19:46:43.617' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (679, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T19:46:43.633' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (682, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T21:22:14.773' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (683, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T21:22:14.790' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (684, NULL, N'Quarried user details', CAST(N'2022-02-08T21:25:15.277' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (685, NULL, N'Queried successfully user details', CAST(N'2022-02-08T21:25:15.287' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (697, NULL, N'Attempted to log into the system', CAST(N'2022-02-09T11:11:43.577' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (698, NULL, N'Logged into the system successfully', CAST(N'2022-02-09T11:11:43.593' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (699, NULL, N'Attempted to log into the system', CAST(N'2022-02-09T11:32:37.430' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (700, NULL, N'Logged into the system successfully', CAST(N'2022-02-09T11:32:37.430' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (701, NULL, N'Quarried user details', CAST(N'2022-02-09T11:36:47.587' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (702, NULL, N'Queried successfully user details', CAST(N'2022-02-09T11:36:47.600' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (703, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-09T11:39:28.087' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (704, NULL, N'Queried successfully user details', CAST(N'2022-02-09T11:39:28.297' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (705, N'tunjinuga@yahoo.co.uk', N'Updated User details user  with username : tunjinuga@yahoo.co.uk and email : tunjinuga@yahoo.co.uk', CAST(N'2022-02-09T11:41:13.437' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (706, NULL, N'Quarried user details', CAST(N'2022-02-09T11:42:37.387' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (707, NULL, N'Queried successfully user details', CAST(N'2022-02-09T11:42:37.400' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (708, NULL, N'Quarried user details', CAST(N'2022-02-09T11:44:25.043' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (709, NULL, N'Queried successfully user details', CAST(N'2022-02-09T11:44:25.057' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (710, NULL, N'Attempted to log into the system', CAST(N'2022-02-09T15:12:12.427' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (711, NULL, N'Logged into the system successfully', CAST(N'2022-02-09T15:12:12.443' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (714, NULL, N'Attempted to log into the system', CAST(N'2022-02-10T12:37:23.543' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (715, NULL, N'Logged into the system successfully', CAST(N'2022-02-10T12:37:23.577' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (716, NULL, N'Attempted to log into the system', CAST(N'2022-02-10T12:39:30.047' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (717, NULL, N'Logged into the system successfully', CAST(N'2022-02-10T12:39:30.077' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (718, NULL, N'Quarried user details', CAST(N'2022-02-10T12:42:41.507' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (719, NULL, N'Queried successfully user details', CAST(N'2022-02-10T12:42:41.523' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (720, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-10T12:44:25.940' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (721, NULL, N'Queried successfully user details', CAST(N'2022-02-10T12:44:26.270' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (722, NULL, N'Quarried user details', CAST(N'2022-02-10T12:47:42.453' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (723, NULL, N'Queried successfully user details', CAST(N'2022-02-10T12:47:42.470' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (738, NULL, N'Attempted to log into the system', CAST(N'2022-02-22T09:06:49.730' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (387, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:36:55.253' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (388, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:36:55.267' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (389, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:37:32.137' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (390, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:37:32.153' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (391, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:37:37.463' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (392, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:37:37.477' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (397, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:40:15.037' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (398, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:40:15.053' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (401, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:42:34.943' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (402, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:42:42.337' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (403, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:43:16.690' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (404, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:43:16.700' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (405, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:43:37.253' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (406, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:43:37.267' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (415, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T09:53:29.633' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (416, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T09:53:31.510' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (440, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T10:24:26.863' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (441, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T10:24:27.627' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (463, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T12:17:23.790' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (464, NULL, N'Queried successfully user details', CAST(N'2022-02-02T12:17:25.573' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (493, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T08:35:14.773' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (494, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T08:35:16.657' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (495, NULL, N'Quarried user details', CAST(N'2022-02-03T08:38:36.897' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (496, NULL, N'Queried successfully user details', CAST(N'2022-02-03T08:38:37.527' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (497, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T08:54:24.060' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (498, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T08:54:25.403' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (499, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T08:57:55.367' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (500, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T08:57:56.777' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (504, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T09:51:12.367' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (505, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T09:51:14.003' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (512, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T13:03:24.267' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (513, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T13:03:25.090' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (514, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T13:31:03.717' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (515, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T13:31:04.407' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (516, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T13:39:06.133' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (517, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T13:39:08.050' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (590, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T12:59:58.390' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (591, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T12:59:59.937' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (592, NULL, N'Quarried user details', CAST(N'2022-02-06T13:00:18.717' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (593, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:00:19.407' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (594, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T13:00:24.520' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (595, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:00:25.930' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (632, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T17:09:57.407' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (633, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T17:09:57.990' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (650, NULL, N'Attempted to log into the system', CAST(N'2022-02-07T09:32:42.660' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (651, NULL, N'Logged into the system successfully', CAST(N'2022-02-07T09:32:44.297' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (680, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T21:03:08.853' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (681, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T21:03:09.073' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (686, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T21:46:36.520' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (687, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T21:46:36.720' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (688, NULL, N'Attempted to log into the system', CAST(N'2022-02-08T21:50:58.020' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (689, NULL, N'Logged into the system successfully', CAST(N'2022-02-08T21:50:58.050' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (690, N'kenji@gmail.com', N'registered user  with username : kenji@gmail.com and email : kenji@gmail.com', CAST(N'2022-02-08T21:52:52.007' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (691, NULL, N'Quarried user details', CAST(N'2022-02-08T21:53:05.880' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (692, NULL, N'Queried successfully user details', CAST(N'2022-02-08T21:53:05.890' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (693, NULL, N'Attempted to log into the system', CAST(N'2022-02-09T07:58:17.660' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (694, NULL, N'Logged into the system successfully', CAST(N'2022-02-09T07:58:18.123' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (695, NULL, N'Attempted to log into the system', CAST(N'2022-02-09T09:50:43.237' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (696, NULL, N'Logged into the system successfully', CAST(N'2022-02-09T09:50:43.253' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (712, NULL, N'Attempted to log into the system', CAST(N'2022-02-09T15:45:38.353' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (713, NULL, N'Logged into the system successfully', CAST(N'2022-02-09T15:45:38.383' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (739, NULL, N'Logged into the system successfully', CAST(N'2022-02-22T09:06:50.613' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (746, NULL, N'Attempted to log into the system', CAST(N'2022-03-01T08:33:54.983' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (747, NULL, N'Logged into the system successfully', CAST(N'2022-03-01T08:33:56.530' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (748, NULL, N'Attempted to log into the system', CAST(N'2022-03-01T08:41:33.737' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (750, NULL, N'Attempted to log into the system', CAST(N'2022-03-09T07:43:17.677' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (751, NULL, N'Logged into the system successfully', CAST(N'2022-03-09T07:43:17.690' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (752, NULL, N'Attempted to log into the system', CAST(N'2022-03-09T09:04:58.393' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (753, NULL, N'Logged into the system successfully', CAST(N'2022-03-09T09:04:58.393' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (754, NULL, N'Attempted to log into the system', CAST(N'2022-03-09T09:43:42.060' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (755, NULL, N'Logged into the system successfully', CAST(N'2022-03-09T09:43:42.073' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (756, NULL, N'Attempted to log into the system', CAST(N'2022-03-09T10:29:19.693' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (757, NULL, N'Logged into the system successfully', CAST(N'2022-03-09T10:29:19.693' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (758, NULL, N'Attempted to log into the system', CAST(N'2022-03-09T11:14:46.257' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (759, NULL, N'Logged into the system successfully', CAST(N'2022-03-09T11:14:46.270' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (760, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T06:00:56.113' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (761, NULL, N'Logged into the system successfully', CAST(N'2022-03-10T06:00:56.120' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (762, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T06:49:45.017' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (763, NULL, N'Logged into the system successfully', CAST(N'2022-03-10T06:49:45.017' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (764, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T11:41:27.127' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (765, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T11:50:57.303' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (766, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T12:23:17.847' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (767, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T12:23:32.070' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (768, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T12:27:58.517' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (769, NULL, N'Attempted to log into the system', CAST(N'2022-03-10T13:05:35.910' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (770, NULL, N'Attempted to log into the system', CAST(N'2022-03-14T05:44:46.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (771, NULL, N'Logged into the system successfully', CAST(N'2022-03-14T05:44:46.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (772, NULL, N'Attempted to log into the system', CAST(N'2022-03-15T06:17:04.017' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (773, NULL, N'Logged into the system successfully', CAST(N'2022-03-15T06:17:04.017' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (774, NULL, N'Quarried user details', CAST(N'2022-03-15T06:17:21.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (775, NULL, N'Queried successfully user details', CAST(N'2022-03-15T06:17:21.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (776, N'tunjinuga@yahoo.co.uk', N'Reset User Password for : tunjinuga@yahoo.co.uk', CAST(N'2022-03-15T06:17:32.570' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (777, NULL, N'Quarried user details', CAST(N'2022-03-15T06:17:33.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (778, NULL, N'Queried successfully user details', CAST(N'2022-03-15T06:17:33.603' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (779, NULL, N'Attempted to log into the system', CAST(N'2022-03-17T09:24:32.510' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (784, NULL, N'Attempted to log into the system', CAST(N'2022-03-25T15:09:31.940' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (785, NULL, N'Logged into the system successfully', CAST(N'2022-03-25T15:09:31.940' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (786, NULL, N'Attempted to log into the system', CAST(N'2022-04-06T10:27:01.083' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (787, NULL, N'Attempted to log into the system', CAST(N'2022-04-06T11:37:30.630' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (788, NULL, N'Attempted to log into the system', CAST(N'2022-04-06T11:39:25.483' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (789, NULL, N'Logged into the system successfully', CAST(N'2022-04-06T11:39:25.487' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (790, NULL, N'Attempted to log into the system', CAST(N'2022-05-06T06:24:34.557' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (791, NULL, N'Logged into the system successfully', CAST(N'2022-05-06T06:24:34.570' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (792, NULL, N'Attempted to log into the system', CAST(N'2022-05-06T10:27:19.867' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (793, NULL, N'Logged into the system successfully', CAST(N'2022-05-06T10:27:20.617' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (796, NULL, N'Attempted to log into the system', CAST(N'2022-08-08T12:48:35.010' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (797, NULL, N'Logged into the system successfully', CAST(N'2022-08-08T12:48:37.637' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (446, NULL, N'Attempted to log into the system', CAST(N'2022-02-01T10:46:02.340' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (447, NULL, N'Logged into the system successfully', CAST(N'2022-02-01T10:46:02.357' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (467, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T13:09:43.837' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (468, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T13:09:52.297' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (469, NULL, N'Logged into the system successfully', CAST(N'2022-02-02T13:09:52.853' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (470, NULL, N'Quarried user details', CAST(N'2022-02-02T13:09:57.427' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (471, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:09:58.043' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (472, N'ngobizadokchrist@gmail.com', N'Quarried user details', CAST(N'2022-02-02T13:10:08.447' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (473, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:10:09.500' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (474, NULL, N'Quarried user details', CAST(N'2022-02-02T13:16:14.483' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (475, NULL, N'Attempted to log into the system', CAST(N'2022-02-02T13:16:52.360' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (476, NULL, N'Logged into the system successfully', CAST(N'2022-02-02T13:16:53.710' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (477, NULL, N'Quarried user details', CAST(N'2022-02-02T13:16:57.713' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (478, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:16:58.313' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (479, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T13:17:00.610' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (480, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:17:01.990' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (481, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-02T13:18:37.973' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (482, NULL, N'Queried successfully user details', CAST(N'2022-02-02T13:18:38.573' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (491, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T07:49:17.083' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (492, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T07:49:18.937' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (501, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T09:14:11.060' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (502, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T09:14:25.387' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (503, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T09:14:26.207' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (506, NULL, N'Attempted to log into the system', CAST(N'2022-02-03T10:37:34.757' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (507, NULL, N'Logged into the system successfully', CAST(N'2022-02-03T10:37:37.157' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (545, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:11:30.363' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (546, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:11:31.533' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (547, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:32:09.260' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (548, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:32:10.057' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (549, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:39:51.517' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (550, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:39:52.957' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (551, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:42:26.630' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (552, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:42:27.907' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (553, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T14:43:46.357' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (554, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T14:43:46.387' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (557, NULL, N'Quarried user details', CAST(N'2022-02-04T14:44:27.457' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (558, NULL, N'Queried successfully user details', CAST(N'2022-02-04T14:44:27.653' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (559, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-04T14:44:42.967' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (560, NULL, N'Queried successfully user details', CAST(N'2022-02-04T14:44:43.207' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (569, NULL, N'Attempted to log into the system', CAST(N'2022-02-04T15:07:17.880' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (570, NULL, N'Logged into the system successfully', CAST(N'2022-02-04T15:07:18.083' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (571, NULL, N'Quarried user details', CAST(N'2022-02-04T15:26:25.423' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (572, NULL, N'Queried successfully user details', CAST(N'2022-02-04T15:26:25.423' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (579, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T12:13:04.833' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (580, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T12:13:10.023' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (581, NULL, N'Quarried user details', CAST(N'2022-02-06T12:13:37.787' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (582, NULL, N'Queried successfully user details', CAST(N'2022-02-06T12:13:38.463' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (583, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T12:14:18.390' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (584, NULL, N'Queried successfully user details', CAST(N'2022-02-06T12:14:20.507' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (585, N'tunjinuga@yahoo.co.uk', N'Updated User details user  with username : tunjinuga@yahoo.co.uk and email : tunjinuga@yahoo.co.uk', CAST(N'2022-02-06T12:15:16.447' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (586, NULL, N'Quarried user details', CAST(N'2022-02-06T12:15:19.707' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (587, NULL, N'Queried successfully user details', CAST(N'2022-02-06T12:15:20.327' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (588, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T12:15:28.353' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (589, NULL, N'Queried successfully user details', CAST(N'2022-02-06T12:15:28.997' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (598, NULL, N'Quarried user details', CAST(N'2022-02-06T13:20:53.157' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (599, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T13:29:17.730' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (600, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T13:29:19.097' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (601, NULL, N'Quarried user details', CAST(N'2022-02-06T13:29:59.883' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (602, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:30:00.510' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (603, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T13:30:04.067' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (604, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:30:05.430' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (605, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T13:31:37.653' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (606, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:31:38.193' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (607, NULL, N'Quarried user details', CAST(N'2022-02-06T13:31:58.893' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (608, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:31:59.433' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (609, N'tunjinuga@yahoo.co.uk', N'Quarried user details', CAST(N'2022-02-06T13:32:02.900' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (610, NULL, N'Queried successfully user details', CAST(N'2022-02-06T13:32:03.453' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (626, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T14:14:14.463' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (627, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T14:14:14.483' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (630, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T16:45:20.967' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (631, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T16:45:22.287' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (638, NULL, N'Attempted to log into the system', CAST(N'2022-02-06T18:30:22.123' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (639, NULL, N'Logged into the system successfully', CAST(N'2022-02-06T18:30:23.863' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (794, NULL, N'Attempted to log into the system', CAST(N'2022-05-15T08:07:33.537' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (724, NULL, N'Attempted to log into the system', CAST(N'2022-02-15T06:40:28.317' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (725, NULL, N'Logged into the system successfully', CAST(N'2022-02-15T06:40:31.257' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (726, NULL, N'Attempted to log into the system', CAST(N'2022-02-15T06:45:10.327' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (727, NULL, N'Logged into the system successfully', CAST(N'2022-02-15T06:45:12.063' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (728, NULL, N'Attempted to log into the system', CAST(N'2022-02-15T06:54:38.563' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (729, NULL, N'Logged into the system successfully', CAST(N'2022-02-15T06:54:38.593' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (730, NULL, N'Attempted to log into the system', CAST(N'2022-02-15T08:33:27.360' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (731, NULL, N'Logged into the system successfully', CAST(N'2022-02-15T08:33:27.377' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (732, NULL, N'Attempted to log into the system', CAST(N'2022-02-15T08:38:59.790' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (733, NULL, N'Logged into the system successfully', CAST(N'2022-02-15T08:38:59.807' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (734, NULL, N'Attempted to log into the system', CAST(N'2022-02-15T08:39:54.750' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (735, NULL, N'Logged into the system successfully', CAST(N'2022-02-15T08:39:54.767' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (736, NULL, N'Attempted to log into the system', CAST(N'2022-02-15T09:03:40.323' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (737, NULL, N'Logged into the system successfully', CAST(N'2022-02-15T09:03:40.340' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (749, NULL, N'Logged into the system successfully', CAST(N'2022-03-01T08:41:33.750' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (795, NULL, N'Attempted to log into the system', CAST(N'2022-07-06T15:38:04.613' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (740, NULL, N'Attempted to log into the system', CAST(N'2022-02-23T07:13:41.023' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (741, NULL, N'Logged into the system successfully', CAST(N'2022-02-23T07:13:41.037' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (742, NULL, N'Attempted to log into the system', CAST(N'2022-02-23T07:13:41.413' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (743, NULL, N'Logged into the system successfully', CAST(N'2022-02-23T07:13:41.413' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (744, NULL, N'Quarried user details', CAST(N'2022-02-23T07:14:24.523' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (745, NULL, N'Queried successfully user details', CAST(N'2022-02-23T07:14:24.537' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (780, NULL, N'Attempted to log into the system', CAST(N'2022-03-25T14:07:27.337' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (781, NULL, N'Logged into the system successfully', CAST(N'2022-03-25T14:07:27.350' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (782, NULL, N'Attempted to log into the system', CAST(N'2022-03-25T14:08:10.280' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (783, NULL, N'Logged into the system successfully', CAST(N'2022-03-25T14:08:10.280' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (798, NULL, N'Attempted to log into the system', CAST(N'2022-08-09T11:27:08.250' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (799, NULL, N'Logged into the system successfully', CAST(N'2022-08-09T11:27:08.780' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (800, NULL, N'Attempted to log into the system', CAST(N'2022-08-14T16:55:58.423' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (801, NULL, N'Attempted to log into the system', CAST(N'2022-08-14T16:55:58.423' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (803, NULL, N'Logged into the system successfully', CAST(N'2022-08-14T16:55:59.897' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (802, NULL, N'Logged into the system successfully', CAST(N'2022-08-14T16:55:59.897' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (804, NULL, N'Attempted to log into the system', CAST(N'2022-08-14T17:54:41.663' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (805, NULL, N'Logged into the system successfully', CAST(N'2022-08-14T17:54:41.710' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (806, NULL, N'Attempted to log into the system', CAST(N'2022-08-14T18:08:04.020' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (807, NULL, N'Logged into the system successfully', CAST(N'2022-08-14T18:08:04.030' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (808, NULL, N'Attempted to log into the system', CAST(N'2022-08-14T18:09:55.010' AS DateTime))
GO
INSERT [dbo].[AuditTrail] ([RecordId], [Username], [Action], [RecordDate]) VALUES (809, NULL, N'Logged into the system successfully', CAST(N'2022-08-14T18:09:55.023' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[AuditTrail] OFF
GO
SET IDENTITY_INSERT [dbo].[Complaint_Sub_Category] ON 
GO
INSERT [dbo].[Complaint_Sub_Category] ([SubCategoryId], [CategoryId], [SubCategoryName], [Status], [RecordDate]) VALUES (1, 2, N'Burst Pipes', 1, CAST(N'2022-01-03T10:26:42.200' AS DateTime))
GO
INSERT [dbo].[Complaint_Sub_Category] ([SubCategoryId], [CategoryId], [SubCategoryName], [Status], [RecordDate]) VALUES (2, 2, N'Stolen Meters', 1, CAST(N'2022-01-03T10:27:08.530' AS DateTime))
GO
INSERT [dbo].[Complaint_Sub_Category] ([SubCategoryId], [CategoryId], [SubCategoryName], [Status], [RecordDate]) VALUES (3, 1, N'Over Billing', 1, CAST(N'2022-01-03T10:28:35.960' AS DateTime))
GO
INSERT [dbo].[Complaint_Sub_Category] ([SubCategoryId], [CategoryId], [SubCategoryName], [Status], [RecordDate]) VALUES (4, 1, N'Un-reflected Payment', 1, CAST(N'2022-01-03T10:29:28.670' AS DateTime))
GO
INSERT [dbo].[Complaint_Sub_Category] ([SubCategoryId], [CategoryId], [SubCategoryName], [Status], [RecordDate]) VALUES (5, 2, N'Leakages', 1, CAST(N'2022-02-01T09:25:57.500' AS DateTime))
GO
INSERT [dbo].[Complaint_Sub_Category] ([SubCategoryId], [CategoryId], [SubCategoryName], [Status], [RecordDate]) VALUES (6, 1, N'Deactivation of account', 1, CAST(N'2022-02-07T09:49:54.437' AS DateTime))
GO
INSERT [dbo].[Complaint_Sub_Category] ([SubCategoryId], [CategoryId], [SubCategoryName], [Status], [RecordDate]) VALUES (7, 2, N'Buried Meter', 1, CAST(N'2022-02-08T18:04:28.137' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Complaint_Sub_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[ComplaintCategory] ON 
GO
INSERT [dbo].[ComplaintCategory] ([CategoryId], [Category], [RecordDate]) VALUES (1, N'Commercial', CAST(N'2022-01-03T10:25:22.213' AS DateTime))
GO
INSERT [dbo].[ComplaintCategory] ([CategoryId], [Category], [RecordDate]) VALUES (2, N'Technical', CAST(N'2022-01-03T10:25:41.900' AS DateTime))
GO
INSERT [dbo].[ComplaintCategory] ([CategoryId], [Category], [RecordDate]) VALUES (3, N'Other Category', CAST(N'2022-01-04T06:10:43.987' AS DateTime))
GO
INSERT [dbo].[ComplaintCategory] ([CategoryId], [Category], [RecordDate]) VALUES (4, N'Technical Category', CAST(N'2022-02-08T16:08:33.450' AS DateTime))
GO
INSERT [dbo].[ComplaintCategory] ([CategoryId], [Category], [RecordDate]) VALUES (5, N'New Category', CAST(N'2022-02-08T16:08:33.960' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ComplaintCategory] OFF
GO
SET IDENTITY_INSERT [dbo].[JobCard] ON 
GO
INSERT [dbo].[JobCard] ([RecordId], [TicketId], [JobType], [OppArea], [Branch], [Territory], [SubTerritory], [AssetCategory], [AssetDescription], [AssetLocation], [AssetReference], [JobCategory], [Address], [AssetType], [MeterType], [MeterNumber], [MeterReading], [Ycordinates], [Xcordinates], [BlockMapRef], [JobCardNo], [RecordDate], [Status]) VALUES (1, N'20220401/AB/IB/18', N'Static and Mobile Plant type', N'1', NULL, NULL, NULL, N'Static', NULL, N'abeokuta', N'sas', NULL, NULL, N'Electrical', NULL, NULL, NULL, N'asd', N'sds', N'asd', NULL, CAST(N'2022-02-04T14:40:41.360' AS DateTime), N'Pending')
GO
SET IDENTITY_INSERT [dbo].[JobCard] OFF
GO
SET IDENTITY_INSERT [dbo].[JobMaterials] ON 
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (1, N'20221116/AB/IJ/11', N'sad', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:40:01.970' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (2, N'20221116/AB/IJ/11', N'test', N'test', N'test', 0, NULL, NULL, CAST(N'2022-02-03T13:40:15.960' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (3, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:41:01.857' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (4, N'20221116/AB/IJ/11', N'sd', N'sd', N'sa', 0, NULL, NULL, CAST(N'2022-02-03T13:41:53.383' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (5, N'20221116/AB/IJ/11', N'as', N'sad', N'as', 0, NULL, NULL, CAST(N'2022-02-03T13:42:47.517' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (6, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:43:43.063' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (7, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:44:28.887' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (8, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:45:18.750' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (9, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:45:39.987' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (10, N'20221116/AB/IJ/11', N'as', N'asd', N'as', 0, NULL, NULL, CAST(N'2022-02-03T13:46:43.257' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (11, N'20221116/AB/IJ/11', N'as', N'asd', N'as', 0, NULL, NULL, CAST(N'2022-02-03T13:46:46.527' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (12, N'20221116/AB/IJ/11', N'wasda', N'sad', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:54:23.593' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (13, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:57:34.800' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (14, N'20221116/AB/IJ/11', N'sad', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:58:43.423' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (15, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T13:59:36.960' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (16, N'20221116/AB/IJ/11', N'qwe', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T14:12:34.590' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (17, N'20221116/AB/IJ/11', N'asd', N'asd', N'asd', 0, NULL, NULL, CAST(N'2022-02-03T14:13:31.997' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (18, N'20220401/AB/IB/18', N'sds', N'sd', N'ss', 1, NULL, NULL, CAST(N'2022-02-04T14:05:55.367' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (19, N'20220401/AB/IB/18', N'sds', N'asd', N'2', 1, NULL, NULL, CAST(N'2022-02-04T14:06:08.867' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (20, N'20220401/AB/IB/18', N'sds', N'sd', N'2', 1, NULL, NULL, CAST(N'2022-02-04T14:07:23.373' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (21, N'20220401/AB/IB/18', N'sds', N'2', N'2', 1, NULL, NULL, CAST(N'2022-02-04T14:07:31.667' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (22, N'20220401/AB/IB/18', N'', N'2', N'2', 1, NULL, NULL, CAST(N'2022-02-04T14:33:01.640' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (23, N'20220401/AB/IB/18', N'sds', N'2', N'2', 1, NULL, NULL, CAST(N'2022-02-04T14:33:05.097' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (24, N'20220401/AB/IB/18', N'sds', N'2', N'2', 1, NULL, NULL, CAST(N'2022-02-04T14:34:14.363' AS DateTime))
GO
INSERT [dbo].[JobMaterials] ([RecordId], [Ticketid], [MaterialType], [Size], [Quantity], [IsRequired], [Cost], [Remark], [RecordDate]) VALUES (25, N'20220401/AB/IB/18', N'sds', N'2', N'2', 1, NULL, NULL, CAST(N'2022-02-04T14:34:25.537' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[JobMaterials] OFF
GO
SET IDENTITY_INSERT [dbo].[LandLord] ON 
GO
INSERT [dbo].[LandLord] ([RecordId], [Name], [Email], [TelContact], [CreationDate], [Active]) VALUES (1, N'Daniel Ngobi', N'ngobidaniel04@gmail.com', N'0779226226', CAST(N'2022-08-14T18:03:59.680' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[LandLord] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemErrors] ON 
GO
INSERT [dbo].[SystemErrors] ([Id], [Method], [ExceptionLevel], [Exception], [LoggedBy], [RecordDate]) VALUES (1, N'RegisterUser', N'UserProcessor', N'The number of parameters does not match number of values for stored procedure.', N'CRM', CAST(N'2022-02-06T13:32:41.270' AS DateTime))
GO
INSERT [dbo].[SystemErrors] ([Id], [Method], [ExceptionLevel], [Exception], [LoggedBy], [RecordDate]) VALUES (2, N'SendEmail', N'UserProcessor', N'The SMTP server requires a secure connection or the client was not authenticated. The server response was: 5.7.0 Authentication Required. Learn more at', N'YassakoPortal', CAST(N'2022-03-15T06:17:33.277' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[SystemErrors] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemUsers] ON 
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (1, N'Daniel Ngobi', N'ngobizadokchrist@gmail.com', N'ngobizadokchrist@gmail.com', NULL, N'1', 1, NULL, CAST(N'2021-12-31T00:02:18.090' AS DateTime), N'c06db68e819be6ec3d26c6038d8e8d1f', NULL, NULL, NULL)
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (2, N'Omony David', N'omony.david8@gmail.com', N'omony.david8@gmail.com', NULL, N'2', 1, NULL, CAST(N'2022-01-03T10:06:57.873' AS DateTime), N'00324c81d5c1f1281fe4910157a59957', NULL, NULL, NULL)
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (3, N'Kiwanuka Hilda Omony', N'domony@tracecorpsolutions.com', N'domony@tracecorpsolutions.com', NULL, N'3', 0, NULL, CAST(N'2022-01-03T10:10:29.030' AS DateTime), N'a12ea185bf806d3809dff1012493c9c3', NULL, NULL, NULL)
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (4, N'Bongomin Henry', N'bongominhenry8@gmail.com', N'bongominhenry8@gmail.com', NULL, N'2', 1, NULL, CAST(N'2022-01-04T05:52:51.033' AS DateTime), N'05a9adcffda8b3c7a53b29364e61b3cd', NULL, NULL, NULL)
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (7, N'Omony David', N'info@tracecorpsolutions.com', N'info@tracecorpsolutions.com', NULL, N'5', 1, NULL, CAST(N'2022-01-18T09:55:19.227' AS DateTime), N'057f092425c5804047ccea7853903896', NULL, NULL, NULL)
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (8, N'Adenuga Adetunji ', N'tunjinuga@yahoo.co.uk', N'tunjinuga@yahoo.co.uk', NULL, N'1', 1, NULL, CAST(N'2022-02-01T09:17:25.453' AS DateTime), N'a72c1a7ed069a9c0352b8f20451abab6', NULL, N'0', N'test')
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (9, N'Omony Kenji', N'kenji@gmail.com', N'kenji@gmail.com', NULL, N'5', 0, NULL, CAST(N'2022-02-08T21:52:52.007' AS DateTime), N'45b12909dd4b089103ff7c265d457e0e', NULL, N'5', NULL)
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (5, N'Jeans Dave', N'jeandave2552@gmail.com', N'jeandave2552@gmail.com', NULL, N'3', 1, NULL, CAST(N'2022-01-06T09:57:41.760' AS DateTime), N'9af4ee9cc4ecf41a61dd688572569853', NULL, NULL, NULL)
GO
INSERT [dbo].[SystemUsers] ([Id], [FullName], [Username], [UserEmail], [UserCompany], [UserRole], [Active], [RecordedBy], [RecordDate], [UserPassword], [PhoneNumber], [Section], [Designation]) VALUES (6, N'Patricia Nyakwera . E', N'pasianut@gmail.com', N'pasianut@gmail.com', NULL, N'3', 1, NULL, CAST(N'2022-01-13T05:42:45.190' AS DateTime), N'1ef770159d527cf477f3e09d76db68ee', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[SystemUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[ticket] ON 
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (1, N'None Registered', N'', N'Taiwo Makinde', N'Phone Call', N'2', N'1', N'+2346789456234', N'omony.david8@gmail.com', N'High', N'OGSWC-1', N'RESOLVED', N'Attached a technical personnel to attend to this matter as soon as possible', CAST(N'2022-01-03T10:34:10.153' AS DateTime), CAST(N'2022-01-04T07:36:23.400' AS DateTime), N'The is a big burst along Abeokuta rd next  to First Bank', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (2, N'None Registered', N'', N'Nyakato Moreen', N'Phone Call', N'2', N'1', N'+2346789456255', N'info@2mlconsulting.com', N'High', N'OGSWC-2', N'PENDING', NULL, CAST(N'2022-01-04T07:15:36.883' AS DateTime), CAST(N'2022-01-04T07:15:36.883' AS DateTime), N'There is a burst along Ibara Road', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (3, N'None Registered', N'', N'Diana Kateeba Kaganzi', N'In Person', N'1', N'3', N'+234808674534', N'info@tracecorpsolutionss.com', N'High', N'OGSWC-3', N'PENDING', NULL, CAST(N'2022-01-10T13:31:56.277' AS DateTime), CAST(N'2022-01-10T13:31:56.277' AS DateTime), N'The charge of the Bill was too high ', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (4, N'None Registered', N'', N'Peter Mukuru', N'Twitter', N'2', N'1', N'+234567123456', N'pmukuru@tracecorpsolutions.com', N'High', N'OGSWC-4', N'RESOLVED', N'Technical team was alerted in time and issue resolved', CAST(N'2022-01-12T06:07:36.140' AS DateTime), CAST(N'2022-01-12T06:11:15.850' AS DateTime), N'There is a huge burst on one of the corporations main pipes along Ibara Avenue ', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (5, N'None Registered', N'', N'Henry Bongomin Marvin', N'Phone Call', N'2', N'1', N'+23456789040404', N'bongominhenry8@gmail.com', N'High', N'OGSWC-5', N'RESOLVED', N'A team has been sent to the location stated and confirm that this issue has been resolved', CAST(N'2022-01-13T05:56:21.280' AS DateTime), CAST(N'2022-01-13T06:00:38.263' AS DateTime), N'There is currently a burst on one of your main pipes along Ibara rd', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (6, N'None Registered', N'', N'daniel test', N'Facebook', N'2', N'1', N'+256779226226', N'ngobidaniel04@gmail.com', N'High', N'YYYY1015/AB/IB6', N'PENDING', NULL, CAST(N'2022-01-15T16:10:30.620' AS DateTime), CAST(N'2022-01-15T16:10:30.620' AS DateTime), N'test', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (7, N'None Registered', N'', N'daniel test', N'Facebook', N'2', N'1', N'+256779226226', N'ngobidaniel04@gmail.com', N'High', N'YYYY1015/AB/IB7', N'ESCALATED', N'this needs to be addressed', CAST(N'2022-01-15T16:10:35.540' AS DateTime), CAST(N'2022-02-03T08:37:49.513' AS DateTime), N'test', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (8, N'None Registered', N'', N'daniel test', N'Facebook', N'2', N'1', N'+256779226226', N'ngobidaniel04@gmail.com', N'High', N'20221215/AB/AD8', N'PENDING', NULL, CAST(N'2022-01-15T16:12:57.877' AS DateTime), CAST(N'2022-01-15T16:12:57.877' AS DateTime), N'test', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (10, N'None Registered', N'', N'daniel test1', N'Facebook', N'1', N'3', N'test', N'ngobizadokchrist@gmail.com', N'High', N'20220916/AB/AD/10', N'RESOLVED', N'This issue has been resolved', CAST(N'2022-01-16T17:09:21.743' AS DateTime), CAST(N'2022-03-09T11:16:26.850' AS DateTime), N'asdasdasdas', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (11, N'None Registered', N'', N'daniel test2', N'Facebook', N'2', N'1', N'0703139709', N'ngobizadokchrist@gmail.com', N'High', N'20221116/AB/IJ/11', N'PENDING', NULL, CAST(N'2022-01-16T17:11:10.827' AS DateTime), CAST(N'2022-01-16T17:11:10.827' AS DateTime), N'asdasdas', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (12, N'None Registered', N'', N'daniel test4', N'Facebook', N'1', N'3', N'+256703139709', N'ngobizadokchrist@gmail.com', N'Medium', N'20222116/AB/OL/12', N'RESOLVED', N'ticket resolved', CAST(N'2022-01-16T17:21:21.987' AS DateTime), CAST(N'2022-01-16T17:21:47.127' AS DateTime), N'asdadasd', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (14, N'None Registered', N'', N'Martha Lukabwe', N'In Person', N'2', N'1', N'0705895816', N'omony.david8@gmail.com', N'High', N'20223118/AB/EL/14', N'RESOLVED', N'Team has been sent on ground to fix issue ', CAST(N'2022-01-18T05:31:57.680' AS DateTime), CAST(N'2022-01-18T05:34:07.653' AS DateTime), N'Burst infront of my home', N'Elega', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (15, N'None Registered', N'', N'EMEKA IGWE', N'WhatsApp', N'1', N'3', N'+23474563425266', N'omony.david8@gmail.com', N'High', N'20224118/AB/AD/15', N'ESCALATED', N'To investigate meter efficiency ', CAST(N'2022-01-18T05:41:21.210' AS DateTime), CAST(N'2022-01-18T05:59:32.410' AS DateTime), N'Billed amount higher than expected', N'Adatan', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (16, N'Registered', N'21310015', N'Sunday Oladimeji Olawale', N'Phone Call', N'1', N'4', N'0806-245-8964', N'Sunday@gmail.com', N'High', N'20222318/AB/IB/16', N'ESCALATED', N'Bank connectivity failure', CAST(N'2022-01-18T10:23:22.337' AS DateTime), CAST(N'2022-01-18T10:26:15.393' AS DateTime), N'Payment made has not reflected for over a week', N'Ibara', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (9, N'None Registered', N'', N'daniel test', N'Facebook', N'2', N'1', N'+256779226226', N'ngobidaniel04@gmail.com', N'High', N'20221515/AB/IB/9', N'PENDING', NULL, CAST(N'2022-01-15T16:15:19.237' AS DateTime), CAST(N'2022-01-15T16:15:19.237' AS DateTime), N'test last', NULL, NULL)
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (17, N'None Registered', N'', N'Karungi Joanne', N'Phone Call', N'2', N'1', N'0705895816', N'joannekarungi@gmail.com', N'High', N'20223421/AB/IB/17', N'ESCALATED', N'Kindly go to location and fix matter as soon as possible', CAST(N'2022-01-21T05:34:08.103' AS DateTime), CAST(N'2022-01-21T05:35:04.590' AS DateTime), N'The is a burst at a connection point to my house', N'Ibara', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (19, N'None Registered', N'', N'daniel test', N'Letter', N'2', N'1', N'+256779226226', N'ngobidaniel04@gmail.com', N'High', N'20223603/AB/IB/19', N'PENDING', NULL, CAST(N'2022-02-03T08:36:30.673' AS DateTime), CAST(N'2022-02-03T08:36:30.673' AS DateTime), N'burst', N'Ibara', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (20, N'Registered', N'213/87/59/29', N'Jamiu Ojo ', N'Facebook', N'1', N'3', N'+256703139709', N'ngobizadokchrist@gmail.com', N'High', N'20223406/AB/AD/20', N'ESCALATED', N'this ticket needs to be handled urgently', CAST(N'2022-02-06T18:34:35.057' AS DateTime), CAST(N'2022-02-06T18:35:15.467' AS DateTime), N'over billed', N'Adatan', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (21, N'Registered', N'21314204', N'Adebayo David', N'Phone Call', N'2', N'5', N'0705895816', N'omony.david8@gmail.com', N'High', N'20221608/AB/IB/21', N'RESOLVED', N'A technical team that was near by  the area was alerted and issue resolved immediately', CAST(N'2022-02-08T22:16:39.563' AS DateTime), CAST(N'2022-02-09T08:22:22.270' AS DateTime), N'There is a leakage on the pipe besides my house', N'Ibara', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (13, N'None Registered', N'', N'daniel test6', N'Facebook', N'1', N'3', N'+256703139709', N'ngobizadokchrist@gmail.com', N'High', N'20224916/AB/AD/13', N'PENDING', NULL, CAST(N'2022-01-16T18:49:17.920' AS DateTime), CAST(N'2022-01-16T18:49:17.920' AS DateTime), N'sfasdasd', N'Adatan', N'Abeokuta')
GO
INSERT [dbo].[ticket] ([id], [ComplaintType], [CustRef], [CustName], [ComplaintSource], [ComplaintCategory], [CompSubCategory], [CustPhone], [email_id], [prioprity], [ticket_id], [status], [admin_remark], [posting_date], [admin_remark_date], [TicketDetails], [BranchName], [AreaName]) VALUES (18, N'None Registered', N'', N'Omony David Adebayo', N'Phone Call', N'2', N'5', N'09024562727', N'ngobidaniel04@gmail.com', N'High', N'20220401/AB/IB/18', N'ESCALATED', N'Escalated', CAST(N'2022-02-01T10:04:47.700' AS DateTime), CAST(N'2022-03-10T06:01:50.147' AS DateTime), N'There is a major burst at one of your main Pipes', N'Ibara', N'Abeokuta')
GO
SET IDENTITY_INSERT [dbo].[ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[TicketResolution] ON 
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (1, N'OGSWC-1', N'RESOLVED', N'Attached a technical personnel to attend to this matter as soon as possible', N'N/A', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-04T07:36:23.580' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (2, N'OGSWC-4', N'RESOLVED', N'Technical team was alerted in time and issue resolved', N'N/A', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-12T06:11:15.850' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (3, N'OGSWC-5', N'RESOLVED', N'A team has been sent to the location stated and confirm that this issue has been resolved', N'N/A', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-13T06:00:38.263' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (4, N'20222116/AB/OL/12', N'RESOLVED', N'ticket resolved', N'N/A', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-16T17:21:47.127' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (5, N'20223118/AB/EL/14', N'RESOLVED', N'Team has been sent on ground to fix issue ', N'N/A', N'Daniel Ngobi', CAST(N'2022-01-18T05:34:07.653' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (6, N'20224118/AB/AD/15', N'ESCALATED', N'Investigate meter', N'4', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-18T05:42:58.327' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (7, N'20224118/AB/AD/15', N'ESCALATED', N'To investigate meter efficiency ', N'4', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-18T05:59:32.423' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (8, N'20222318/AB/IB/16', N'ESCALATED', N'Bank connectivity failure', N'5', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-18T10:26:15.407' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (9, N'20223421/AB/IB/17', N'ESCALATED', N'Kindly go to location and fix matter as soon as possible', N'4', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-21T05:35:04.590' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (10, N'20220401/AB/IB/18', N'ESCALATED', N'investigate and identify source of leaks ', N'4', N'ngobizadokchrist@gmail.com', CAST(N'2022-02-01T10:19:33.697' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (11, N'20220401/AB/IB/18', N'ESCALATED', N'Investigate and Identify source of the leakage', N'4', N'ngobizadokchrist@gmail.com', CAST(N'2022-02-01T10:20:21.853' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (12, N'20220401/AB/IB/18', N'ESCALATED', N'Investigate further and work on this issue as soon as possible', N'4', N'ngobizadokchrist@gmail.com', CAST(N'2022-02-01T10:59:54.017' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (14, N'20223406/AB/AD/20', N'ESCALATED', N'this ticket needs to be handled urgently', N'5', N'ngobizadokchrist@gmail.com', CAST(N'2022-02-06T18:35:15.467' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (15, N'20220401/AB/IB/18', N'ESCALATED', N'', NULL, N'ngobizadokchrist@gmail.com', CAST(N'2022-02-06T20:23:32.177' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (17, N'20220916/AB/AD/10', N'RESOLVED', N'This issue has been resolved', N'N/A', N'Daniel Ngobi', CAST(N'2022-03-09T11:16:26.850' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (18, N'20220401/AB/IB/18', N'ESCALATED', N'Escalated', N'Commercial', N'ngobizadokchrist@gmail.com', CAST(N'2022-03-10T06:01:50.160' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (13, N'YYYY1015/AB/IB7', N'ESCALATED', N'this needs to be addressed', N'2', N'ngobizadokchrist@gmail.com', CAST(N'2022-02-03T08:37:49.513' AS DateTime))
GO
INSERT [dbo].[TicketResolution] ([RecordId], [Ticket_id], [Status], [ResolutionDetails], [EscalatedTo], [RecordedBy], [RecordDate]) VALUES (16, N'20221608/AB/IB/21', N'RESOLVED', N'A technical team that was near by  the area was alerted and issue resolved immediately', N'N/A', N'Daniel Ngobi', CAST(N'2022-02-09T08:22:22.273' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TicketResolution] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDepartments] ON 
GO
INSERT [dbo].[UserDepartments] ([RecordId], [DepartmentName], [DepartmentEmail], [RecordedBy], [RecordDate], [Status]) VALUES (1, N'Administrator', N'Administrator', NULL, CAST(N'2021-12-31T00:02:45.837' AS DateTime), 1)
GO
INSERT [dbo].[UserDepartments] ([RecordId], [DepartmentName], [DepartmentEmail], [RecordedBy], [RecordDate], [Status]) VALUES (2, N'Field officers', N'domony@tracecorpsolutions.com', N'ngobizadokchrist@gmail.com', CAST(N'2022-01-03T06:04:28.410' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[UserDepartments] OFF
GO
SET IDENTITY_INSERT [dbo].[UserSections] ON 
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (1, N'Section A', N'2', CAST(N'2022-01-20T11:32:42.403' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (2, N'Section BD', N'2', CAST(N'2022-01-20T11:48:28.873' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (3, N'Billing ', N'5', CAST(N'2022-01-21T05:11:16.163' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (4, N'Customer Care', N'5', CAST(N'2022-01-21T05:12:07.253' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (5, N'Revenue', N'5', CAST(N'2022-01-21T05:14:06.797' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (6, N'Test Quality', N'2', CAST(N'2022-02-01T08:44:05.463' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (7, N'Revenue Collections', N'5', CAST(N'2022-02-01T09:29:57.397' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (8, N'Quality', N'2', CAST(N'2022-02-04T14:53:43.463' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (9, N'test', N'2', CAST(N'2022-02-06T13:52:12.423' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (10, N'test 2', N'1', CAST(N'2022-02-06T14:02:48.590' AS DateTime))
GO
INSERT [dbo].[UserSections] ([RecordId], [SectionName], [DepartmentId], [RecordDate]) VALUES (11, N'Chemicals', N'3', CAST(N'2022-02-08T20:02:02.840' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserSections] OFF
GO
ALTER TABLE [dbo].[Applicant] ADD  CONSTRAINT [DF_Applicant_Status]  DEFAULT ('PENDING CONNECTION FEE') FOR [Status]
GO
ALTER TABLE [dbo].[Applicant] ADD  CONSTRAINT [DF_Applicant_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[Applicant] ADD  CONSTRAINT [DF_Applicant_Assigned]  DEFAULT ((0)) FOR [Assigned]
GO
ALTER TABLE [dbo].[ApplicationAssignment] ADD  CONSTRAINT [DF_ApplicationAssignment_Status]  DEFAULT ('PENDING') FOR [Status]
GO
ALTER TABLE [dbo].[ApplicationAssignment] ADD  CONSTRAINT [DF_ApplicationAssignment_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[ApplicationStatus] ADD  CONSTRAINT [DF_ApplicationStatus_RecordDate_1]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[AuditTrail] ADD  CONSTRAINT [DF_AuditTrail_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[Complaint_Sub_Category] ADD  CONSTRAINT [DF_Complaint_Sub_Category_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[Complaint_Sub_Category] ADD  CONSTRAINT [DF_Complaint_Sub_Category_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[ComplaintCategory] ADD  CONSTRAINT [DF_ComplaintCategory_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[CustomerTransaction] ADD  CONSTRAINT [DF_CustomerTransaction_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[CustomerTransaction] ADD  CONSTRAINT [DF_CustomerTransaction_Status]  DEFAULT ('PENDING') FOR [Status]
GO
ALTER TABLE [dbo].[JobCard] ADD  CONSTRAINT [DF_JobCard_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[JobCard] ADD  CONSTRAINT [DF_JobCard_Status]  DEFAULT ('Pending') FOR [Status]
GO
ALTER TABLE [dbo].[JobMaterials] ADD  CONSTRAINT [DF_JobMaterials_IsRequired]  DEFAULT ((0)) FOR [IsRequired]
GO
ALTER TABLE [dbo].[JobMaterials] ADD  CONSTRAINT [DF_JobMaterials_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[LandLord] ADD  CONSTRAINT [DF_LandLord_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[LandLord] ADD  CONSTRAINT [DF_LandLord_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[NewApplication] ADD  CONSTRAINT [DF_NewApplication_Status]  DEFAULT ((1)) FOR [Status]
GO
ALTER TABLE [dbo].[NewApplication] ADD  CONSTRAINT [DF_NewApplication_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[SystemErrors] ADD  CONSTRAINT [DF_SystemErrors_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[SystemUsers] ADD  CONSTRAINT [DF_SystemUsers_Active]  DEFAULT ((0)) FOR [Active]
GO
ALTER TABLE [dbo].[SystemUsers] ADD  CONSTRAINT [DF_SystemUsers_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF_ticket_status]  DEFAULT ('PENDING') FOR [status]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF_ticket_posting_date]  DEFAULT (getdate()) FOR [posting_date]
GO
ALTER TABLE [dbo].[ticket] ADD  CONSTRAINT [DF_ticket_admin_remark_date]  DEFAULT (getdate()) FOR [admin_remark_date]
GO
ALTER TABLE [dbo].[TicketAssignment] ADD  CONSTRAINT [DF_TicketAssignment_AssignedDate]  DEFAULT (getdate()) FOR [AssignedDate]
GO
ALTER TABLE [dbo].[TicketAssignment] ADD  CONSTRAINT [DF_TicketAssignment_Status]  DEFAULT ('PENDING') FOR [Status]
GO
ALTER TABLE [dbo].[TicketResolution] ADD  CONSTRAINT [DF_TicketResolution_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[UserDepartments] ADD  CONSTRAINT [DF_UserDepartments_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
ALTER TABLE [dbo].[UserDepartments] ADD  CONSTRAINT [DF_UserDepartments_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[UserSections] ADD  CONSTRAINT [DF_UserSections_RecordDate]  DEFAULT (getdate()) FOR [RecordDate]
GO
/****** Object:  StoredProcedure [dbo].[ActivateDeactivateDepartment]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[ActivateDeactivateDepartment]
@departmentid varchar(50),
@status bit
as
Update UserDepartments set Status=@status where RecordId=@departmentid
GO
/****** Object:  StoredProcedure [dbo].[AddLandlord]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AddLandlord]
@name varchar(50),
@email varchar(50),
@tel varchar(50)
as
INSERT INTO [dbo].[LandLord]
           ([Name]
           ,[Email]
           ,[TelContact]
           ,[Active])
     VALUES
           (@name
           ,@email
           ,@tel
           ,1)
GO
/****** Object:  StoredProcedure [dbo].[AddMaterialsPurchased]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddMaterialsPurchased]
@materialType varchar(50),
@size varchar(50),
@qty varchar(50),
@ticketid varchar(50),
@cost money
as
begin
INSERT INTO [dbo].[JobMaterials]
           ([Ticketid]
           ,[MaterialType]
           ,[Size]
           ,[Quantity]
		   ,[Cost])
     VALUES
           (@ticketid
           ,@materialType
           ,@size
           ,@qty
		   ,@cost)

SELECT * FROM JobMaterials where Ticketid=@ticketid and IsRequired=0
end
GO
/****** Object:  StoredProcedure [dbo].[AddRequiredMaterials]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AddRequiredMaterials]
@materialType varchar(50),
@size varchar(50),
@qty varchar(50),
@ticketid varchar(50)
as
begin
INSERT INTO [dbo].[JobMaterials]
           ([Ticketid]
           ,[MaterialType]
           ,[Size]
           ,[Quantity]
		   ,IsRequired)
     VALUES
           (@ticketid
           ,@materialType
           ,@size
           ,@qty
		   ,1)

SELECT * FROM JobMaterials where Ticketid=@ticketid and IsRequired=1
end
GO
/****** Object:  StoredProcedure [dbo].[AssignApplication]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[AssignApplication]
@applicationId varchar(50),
@fromDepart varchar(50),
@toDepart varchar(50),
@reason varchar(max),
@status varchar(50),
@assignedby varchar(50)
as
BEGIN
INSERT INTO [dbo].[ApplicationAssignment]
           ([ApplicationId]
           ,[FromDepartment]
           ,[ToDepartment]
           ,[ReasonEscalated]
           ,[Status]
           ,[AssignedBy])
     VALUES
           (@applicationId
           ,@fromDepart
           ,@toDepart
           ,@reason
           ,@status
           ,@assignedby)

		   update NewApplication set Status=@toDepart where ApplicationId=@applicationId
END
GO
/****** Object:  StoredProcedure [dbo].[AssignTicket]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[AssignTicket]
@ticket_id varchar(50),
@assignedTo varchar(50),
@narration varchar(max)
as
INSERT INTO [dbo].[TicketAssignment]
           ([AssignedTo]
           ,[TicketId]
           ,[Narration])
     VALUES
           (@assignedTo
           ,@ticket_id
           ,@narration)
GO
/****** Object:  StoredProcedure [dbo].[CreateJobCard]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CreateJobCard]
@ticketId varchar(50),
@jobType varchar(50),
@oppArea varchar(50),
@branch varchar(50),
@territory varchar(50),
@subTerritory varchar(50),
@assetCategory varchar(50),
@assetDescription varchar(max),
@assetLocation varchar(50),
@assetReference varchar(50),
@jobCategory varchar(50),
@address varchar(50),
@assetType varchar(50),
@ycordinates varchar(50),
@xcordinates varchar(50),
@blockMapRef varchar(50)
as
INSERT INTO [dbo].[JobCard]
           ([TicketId]
           ,[JobType]
           ,[OppArea]
           ,[Branch]
           ,[Territory]
           ,[SubTerritory]
           ,[AssetCategory]
           ,[AssetDescription]
           ,[AssetLocation]
           ,[AssetReference]
           ,[JobCategory]
           ,[Address]
           ,[AssetType]
           ,[Ycordinates]
           ,[Xcordinates]
           ,[BlockMapRef])
     VALUES
           (@ticketId
           ,@jobType
           ,@oppArea
           ,@branch
           ,@territory
           ,@subTerritory
           ,@assetCategory
           ,@assetDescription
           ,@assetLocation
           ,@assetReference
           ,@jobCategory
           ,@address
           ,@assetType
           ,@ycordinates
           ,@xcordinates
           ,@blockMapRef)
GO
/****** Object:  StoredProcedure [dbo].[CreateSystemUser]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CreateSystemUser]
@Fullname varchar(50),
@Username varchar(50),
@UserEmail varchar(50),
@UserCompany varchar(50),
@UserRole varchar(50),
@RecordedBy varchar(50),
@UserPassword varchar(max),
@PhoneNumber varchar(50),
@section varchar(50)
as
INSERT INTO [dbo].[SystemUsers]
           ([FullName]
           ,[Username]
           ,[UserEmail]
           ,[UserCompany]
           ,[UserRole]
           ,[RecordedBy]
		   ,[UserPassword]
		   ,[PhoneNumber]
		   ,[Section])
     VALUES
           (@Fullname,@Username,@UserEmail,@UserCompany,@UserRole,@RecordedBy,@UserPassword,@PhoneNumber,@section)
GO
/****** Object:  StoredProcedure [dbo].[CreateUserDepartment]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[CreateUserDepartment]
@departmentName varchar(50),
@recordedby varchar(50),
@departmentemail varchar(50)
as
INSERT INTO [dbo].[UserDepartments]
           ([DepartmentName]
           ,[RecordedBy]
		   ,[DepartmentEmail])
     VALUES
           (@departmentName
           ,@recordedby
		   ,@departmentemail)
GO
/****** Object:  StoredProcedure [dbo].[CreateUserSection]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[CreateUserSection]
@departmentid varchar(50),
@sectionname varchar(50)
as
insert into UserSections (SectionName,DepartmentId) values
(@sectionname,@departmentid)
GO
/****** Object:  StoredProcedure [dbo].[DeactivateActivateUser]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[DeactivateActivateUser]
@UserName varchar(50),
@Active bit
as
Update SystemUsers set Active=@Active where Username=@UserName
GO
/****** Object:  StoredProcedure [dbo].[EscalateTicket]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[EscalateTicket]
@ticket_id varchar(50),
@adminremark varchar(max),
@EscalatedTo varchar(50),
@resolvedby varchar(50)
as
BEGIN
update ticket set admin_remark_date=GETDATE(),admin_remark=@adminremark,Status='ESCALATED' where ticket_id=@ticket_id
INSERT INTO [dbo].[TicketResolution]
           ([Ticket_id]
           ,[Status]
           ,[ResolutionDetails]
           ,[EscalatedTo]
           ,[RecordedBy])
     VALUES
           (@ticket_id
           ,'ESCALATED'
           ,@adminremark
           ,@EscalatedTo
           ,@resolvedby)
		   END
GO
/****** Object:  StoredProcedure [dbo].[GetApplications]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetApplications]
as
SELECT NA.[Recordid]
      ,[Fname]
      ,[Lname]
      ,[Gender]
      ,[Dob]
      ,[District]
      ,[SubCounty]
      ,[Lc1]
      ,[Village]
      ,[City]
      ,[Nationality]
      ,[Parish]
      ,[ApartmentNo]
      ,[CustomerTel]
      ,[CustomerEmail]
      ,[IdNumber]
      ,[ApplicationId]
      ,Ast.[Status]
      ,NA.[RecordDate]

  FROM [dbo].[NewApplication] NA with(nolock) inner join ApplicationStatus Ast with(nolock) on NA.Status=Ast.StatusCode
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsAssigments]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetApplicationsAssigments]
@applicationId varchar(50),
@status varchar(50)
as
select * from ApplicationAssignment with(nolock) where 
((ApplicationId=@applicationId) or @applicationId='')
and
((Status=@status)or (@status=''))
GO
/****** Object:  StoredProcedure [dbo].[GetApplicationsById]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetApplicationsById]
@Applicationid varchar(50)
as
SELECT *
  FROM [dbo].[NewApplication] with (nolock) where ApplicationId=@Applicationid
GO
/****** Object:  StoredProcedure [dbo].[GetAuditReport]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[GetAuditReport]
as
select * from AuditTrail
GO
/****** Object:  StoredProcedure [dbo].[GetComplaintCategories]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetComplaintCategories]
as
SELECT [CategoryId]
      ,[Category]
      ,[RecordDate]
  FROM [dbo].[ComplaintCategory]
GO
/****** Object:  StoredProcedure [dbo].[GetComplaintCategoriesById]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetComplaintCategoriesById]
@categoryid varchar(50)
as
SELECT [CategoryId]
      ,[Category]
      ,[RecordDate]
  FROM [dbo].[ComplaintCategory] where CategoryId=@categoryid
GO
/****** Object:  StoredProcedure [dbo].[GetComplaintSubCategories]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetComplaintSubCategories]
as
select * from Complaint_Sub_Category SubCate inner join ComplaintCategory CompCate on SubCate.CategoryId=CompCate.CategoryId
GO
/****** Object:  StoredProcedure [dbo].[GetComplaintSubCategoriesByCategoryId]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetComplaintSubCategoriesByCategoryId]
@categoryid varchar(50)
as
select * from Complaint_Sub_Category SubCate inner join ComplaintCategory CompCate on SubCate.CategoryId=CompCate.CategoryId
where SubCate.CategoryId=@categoryid
GO
/****** Object:  StoredProcedure [dbo].[GetComplaintSubCategoriesById]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetComplaintSubCategoriesById]
@subcategoryid varchar(50)
as
select * from Complaint_Sub_Category SubCate inner join ComplaintCategory CompCate on SubCate.CategoryId=CompCate.CategoryId where SubCategoryId=@subcategoryid
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerByEmail]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 create proc [dbo].[GetCustomerByEmail]
  @Email varchar(50)
  as
  select * from NewApplication with(nolock) where CustomerEmail=@Email
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerTransactionsByEmail]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetCustomerTransactionsByEmail]
@CustomerEmail varchar(50)
as
SELECT [Recordid]
      ,[TranRef]
      ,[Amount]
      ,[RecordDate]
      ,[Narration]
      ,[CustomerEmail]
      ,[Status]
  FROM [dbo].[CustomerTransaction] --where CustomerEmail=@CustomerEmail
GO
/****** Object:  StoredProcedure [dbo].[GetJobCards]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetJobCards]
as
SET NOCOUNT ON;
select * from JobCard with(nolock)

GO
/****** Object:  StoredProcedure [dbo].[GetLandlords]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[GetLandlords]
as
select * from [dbo].[LandLord]
GO
/****** Object:  StoredProcedure [dbo].[GetSystemUsersByUsername]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetSystemUsersByUsername]
@Username varchar(50)
as
SET NOCOUNT ON;
SELECT [Id]
      ,[FullName]
      ,[Username]
      ,[UserEmail]
      ,[UserCompany]
	  ,D.DepartmentName AS UserDepartment
      ,D.RecordId as [UserRole]
      ,[Active]
      ,U.[RecordedBy]
      ,U.[RecordDate]
      ,[UserPassword]
	  ,[Designation]
      ,[PhoneNumber]
	  ,[SectionName]
	  ,S.RecordId as SectionId
  FROM [dbo].[SystemUsers] U left join UserDepartments D on U.UserRole=D.RecordId 
  left join UserSections S on U.Section=S.DepartmentId where Username=@Username

GO
/****** Object:  StoredProcedure [dbo].[GetTicketById]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTicketById]
@ticket_id varchar(50)
as
select T.ticket_id
      ,T.[ComplaintType]
      ,T.[CustRef]
      ,T.[CustName]
      ,T.[ComplaintSource]
      ,C.Category AS ComplaintCategory
      ,SC.SubCategoryName AS CompSubCategory
      ,T.[CustPhone]
      ,T.[email_id]
      ,T.[prioprity]
      ,T.[ticket_id]
      ,T.[status]
      ,T.[admin_remark]
      ,T.[posting_date]
	  ,t.TicketDetails
	  ,BranchName
	  ,AreaName
      ,T.[admin_remark_date]
      ,T.[TicketDetails] from ticket as T with(nolock)
inner join ComplaintCategory  as C on T.ComplaintCategory=C.CategoryId 
inner join  Complaint_Sub_Category SC on T.CompSubCategory=SC.SubCategoryId where T.ticket_id=@ticket_id

GO
/****** Object:  StoredProcedure [dbo].[GetTicketResolutionDetails]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTicketResolutionDetails]
@Ticket_id varchar(50)
as
SELECT [RecordId]
      ,[Ticket_id]
      ,[Status]
      ,[ResolutionDetails]
      ,[EscalatedTo]
      ,[RecordedBy]
      ,[RecordDate]
  FROM [dbo].[TicketResolution] where Ticket_id=@Ticket_id

GO
/****** Object:  StoredProcedure [dbo].[GetTickets]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetTickets]
as
select T.ticket_id
      ,T.[ComplaintType]
      ,T.[CustRef]
      ,T.[CustName]
      ,T.[ComplaintSource]
      ,C.Category AS ComplaintCategory
      ,SC.SubCategoryName AS CompSubCategory
	  ,C.CategoryId
      ,T.[CustPhone]
      ,T.[email_id]
      ,T.[prioprity]
      ,T.[ticket_id]
      ,T.[status]
      ,T.[admin_remark]
      ,T.[posting_date]
      ,T.[admin_remark_date]
	  ,T.BranchName
	  ,T.AreaName
      ,T.[TicketDetails] from ticket as T with(nolock)
inner join ComplaintCategory  as C on T.ComplaintCategory=C.CategoryId 
inner join  Complaint_Sub_Category SC on T.CompSubCategory=SC.SubCategoryId
GO
/****** Object:  StoredProcedure [dbo].[GetUserDepartments]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserDepartments]
@status varchar(50)
as
SELECT [RecordId]
      ,[DepartmentName]
	  ,[DepartmentEmail]
      ,[RecordedBy]
      ,[RecordDate]
	  ,[Status]
  FROM [dbo].[UserDepartments] where ((Status=@status) or(@status=''))

GO
/****** Object:  StoredProcedure [dbo].[GetUserDepartmentsById]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserDepartmentsById]
@departmentid varchar(50)
as
SELECT [RecordId]
      ,[DepartmentName]
	  ,[DepartmentEmail]
      ,[RecordedBy]
      ,[RecordDate]
	  ,[Status]
  FROM [dbo].[UserDepartments] where RecordId=@departmentid

GO
/****** Object:  StoredProcedure [dbo].[GetUserDetailsByEmail]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserDetailsByEmail]
@UserEmail varchar(50)
as
SELECT [Id]
      ,[FullName]
      ,[Username]
      ,[UserEmail]
      ,[UserCompany]
	  ,D.DepartmentName AS UserDepartment
      ,D.RecordId as [UserRole]
      ,[Active]
      ,U.[RecordedBy]
      ,U.[RecordDate]
      ,[UserPassword]
      ,[PhoneNumber]
	  ,[Section]
  FROM [dbo].[SystemUsers] U inner join UserDepartments D on U.UserRole=D.RecordId where UserEmail=@UserEmail
GO
/****** Object:  StoredProcedure [dbo].[GetUSers]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUSers]
as
SELECT [Id]
      ,[FullName]
      ,[Username]
      ,[UserEmail]
      ,[UserCompany]
	  ,D.DepartmentName AS UserDepartment
      ,D.RecordId as [UserRole]
      ,[Active]
      ,U.[RecordedBy]
      ,U.[RecordDate]
      ,[UserPassword]
      ,[PhoneNumber]
  FROM [dbo].[SystemUsers] U inner join UserDepartments D on U.UserRole=D.RecordId
GO
/****** Object:  StoredProcedure [dbo].[GetUserSection]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserSection]
as
SET NOCOUNT ON;
select Us.RecordId,SectionName,Ud.DepartmentName,Us.RecordDate from UserSections Us left join UserDepartments Ud on Us.DepartmentId=Ud.RecordId
GO
/****** Object:  StoredProcedure [dbo].[GetUserSectionsByDepartid]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserSectionsByDepartid]
@departid varchar(50)
as
SET NOCOUNT ON;
select * from UserSections where DepartmentId=@departid
GO
/****** Object:  StoredProcedure [dbo].[GetUserSectionsByid]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[GetUserSectionsByid]
@sectionid varchar(50)
as
SET NOCOUNT ON;
select * from UserSections where RecordId=@sectionid
GO
/****** Object:  StoredProcedure [dbo].[InsertAudittrail]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertAudittrail]
@Username varchar(50),
@Action varchar(max)
as
INSERT INTO [dbo].[AuditTrail]
           ([Username]
           ,[Action])
     VALUES
           (@Username
           ,@Action)
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomerTrans]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[InsertCustomerTrans]
@tranRef varchar(50),
@amount money,
@narration varchar(max),
@customerEmail varchar(50),
@status varchar(50)
as
INSERT INTO [dbo].[CustomerTransaction]
           ([TranRef]
           ,[Amount]
           ,[Narration]
           ,[CustomerEmail]
           ,[Status])
     VALUES
           (@tranRef
           ,@amount
           ,@narration
           ,@customerEmail
           ,@status)
GO
/****** Object:  StoredProcedure [dbo].[InsertTicket]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[InsertTicket]
@complainantType varchar(max),
@custRef varchar(max),
@custName varchar(max),
@complaintSource varchar(max),
@complaintCategory varchar(max),
@complaintSubCategory varchar(max),
@custContact varchar(max),
@email_id varchar(max),
@prioprity varchar(max),
@ticketDetails varchar(max),
@branchcode varchar(max),
@areacode varchar(max),
@datestring varchar(max),
@areaName varchar(max),
@branchName varchar(max)
as
BEGIN try
BEGIN Transaction InsertTicket

INSERT INTO [dbo].[ticket]
           ([ComplaintType]
           ,[CustRef]
           ,[CustName]
           ,[ComplaintSource]
           ,[ComplaintCategory]
           ,[CompSubCategory]
           ,[CustPhone]
           ,[email_id]
           ,[prioprity]
		   ,[TicketDetails]
		   ,[BranchName]
		   ,[AreaName])
     VALUES
           (@complainantType
           ,@custRef
           ,@custName
           ,@complaintSource
           ,@ComplaintCategory
           ,@complaintSubCategory
           ,@custContact
           ,@email_id
           ,@prioprity
		   ,@ticketDetails
		   ,@branchName
		   ,@areaName)
	DECLARE @ident bigint
	SET @ident = @@Identity
	update ticket set ticket_id=@datestring+'/'+@areacode+'/'+@branchcode+'/'+convert(varchar,@ident) where id=@ident
	select ticket_id from ticket where id=@ident
	commit Transaction InsertTicket
END Try
BEGIN Catch
ROLLBACK Transaction InsertTicket
  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END Catch

GO
/****** Object:  StoredProcedure [dbo].[LogSystemError]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[LogSystemError]
@method varchar(50),
@Level varchar(50),
@error varchar(max),
@loggedby varchar(50)
as
INSERT INTO [dbo].[SystemErrors]
           ([Method]
           ,[ExceptionLevel]
           ,[Exception]
           ,[LoggedBy])
     VALUES
           (@method,@Level,@error,@loggedby)
GO
/****** Object:  StoredProcedure [dbo].[RecordApplication]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[RecordApplication]
@firstName varchar(50),
@lastName varchar(50),
@gender varchar(50),
@dOB varchar(50),
@district varchar(50),
@subcountyDivision varchar(50),
@lC1 varchar(50),
@village varchar(50),
@city varchar(50),
@nationality varchar(50),
@parish varchar(50),
@apartmentNumber varchar(50),
@customerTel varchar(50),
@customerEmail varchar(50),
@idNumber varchar(50)
as
BEGIN try
BEGIN Transaction NewApplication
INSERT INTO [dbo].[NewApplication]
           ([Fname]
           ,[Lname]
           ,[Gender]
           ,[Dob]
           ,[District]
           ,[SubCounty]
           ,[Lc1]
           ,[Village]
           ,[City]
           ,[Nationality]
           ,[Parish]
           ,[ApartmentNo]
           ,[CustomerTel]
           ,[CustomerEmail]
           ,[IdNumber])
     VALUES
           (@firstName
           ,@lastName
           ,@gender
           ,@dOB
           ,@district
           ,@subcountyDivision
           ,@lC1
           ,@village
           ,@city
           ,@nationality
           ,@parish
           ,@apartmentNumber
           ,@customerTel
           ,@customerEmail
           ,@idNumber)

		   DECLARE @ident bigint
		SET @ident = @@Identity
	update NewApplication set ApplicationId='LIQUID'+'-'+convert(varchar,@ident) where RecordId=@ident
	select ApplicationId from NewApplication where RecordId=@ident
		commit Transaction NewApplication
END Try
BEGIN Catch
ROLLBACK Transaction NewApplication
  DECLARE
   @ErMessage NVARCHAR(2048),
   @ErSeverity INT,
   @ErState INT
 
 SELECT
   @ErMessage = ERROR_MESSAGE(),
   @ErSeverity = ERROR_SEVERITY(),
   @ErState = ERROR_STATE()
 
 RAISERROR (@ErMessage,
             @ErSeverity,
             @ErState )
END Catch

GO
/****** Object:  StoredProcedure [dbo].[RegisterComplaintCategory]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RegisterComplaintCategory]
@category varchar(50)
as
INSERT INTO [dbo].[ComplaintCategory]
           ([Category])
     VALUES
           (@category)
GO
/****** Object:  StoredProcedure [dbo].[RegisterComplaintSubCategory]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[RegisterComplaintSubCategory]
@categoryid int,
@SubCategoryName varchar(50)
as
INSERT INTO [dbo].[Complaint_Sub_Category]
           ([CategoryId]
           ,[SubCategoryName])
     VALUES
           (@categoryid
           ,@SubCategoryName)
GO
/****** Object:  StoredProcedure [dbo].[Resolveticket]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Resolveticket]
@ticket_id varchar(50),
@adminremark varchar(max),
@resolvedby varchar(50)
as
update ticket set admin_remark_date=GETDATE(),admin_remark=@adminremark,Status='RESOLVED' where ticket_id=@ticket_id
INSERT INTO [dbo].[TicketResolution]
           ([Ticket_id]
           ,[Status]
           ,[ResolutionDetails]
           ,[EscalatedTo]
           ,[RecordedBy])
     VALUES
           (@ticket_id
           ,'RESOLVED'
           ,@adminremark
           ,'N/A'
           ,@resolvedby)
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationPath]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateApplicationPath]
@path varchar(max),
@applicationid  varchar(max)
as
update Applicant set ApplicationPath=@path where ApplicationId=@applicationid
GO
/****** Object:  StoredProcedure [dbo].[UpdateApplicationStatus]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateApplicationStatus]
@recordId bigint,
@status varchar(50)
as
Update Applicant set Status=@status where RecordId=@recordId
GO
/****** Object:  StoredProcedure [dbo].[UpdateComplaintCategory]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateComplaintCategory]
@category varchar(50),
@categoryid varchar(50)
as
update ComplaintCategory set Category=@category where CategoryId=@categoryid
GO
/****** Object:  StoredProcedure [dbo].[UpdateComplaintSubCategory]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateComplaintSubCategory]
@subcategoryid varchar(50),
@subCategoryName varchar(50)
as
update Complaint_Sub_Category set SubCategoryName=@subCategoryName where SubCategoryId=@subcategoryid
GO
/****** Object:  StoredProcedure [dbo].[UpdateNewPwd]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateNewPwd]
@UserName varchar(50),
@NewPwd varchar(max)
as
Update SystemUsers set UserPassword=@NewPwd where Username=@UserName
GO
/****** Object:  StoredProcedure [dbo].[UpdateSystemUser]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateSystemUser]
@fullName varchar(50),
@username varchar(50),
@userEmail varchar(50),
@userCompany varchar(50),
@userrole varchar(50),
@recodedBy varchar(50),
@phoneNumber varchar(50),
@sectionid varchar(50),
@designation varchar(50)
as
Update SystemUsers set FullName=@fullName, UserEmail=@userEmail,UserRole=@userCompany,Section=@sectionid,Designation=@designation where Username=@username

GO
/****** Object:  StoredProcedure [dbo].[UpdateTicketStatus]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateTicketStatus]
@ticket_id varchar(50),
@status varchar(50)
as
update ticket set Status=@status where ticket_id=@ticket_id

GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDepartment]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[UpdateUserDepartment]
@departmentid varchar(50),
@departmentname varchar(50),
@deparmentEmail varchar(50)
as

update UserDepartments set DepartmentName=@departmentname,DepartmentEmail=@deparmentEmail where RecordId=@departmentid
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserSection]    Script Date: 14/08/2022 18:42:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[UpdateUserSection]
@sectionid varchar(50),
@sectionname varchar(50)
as
Update UserSections set SectionName=@sectionname  where RecordId=@sectionid
GO
USE [master]
GO
ALTER DATABASE [RealEstateManagementDb] SET  READ_WRITE 
GO
