
ALTER DATABASE [AssignmentSP2024_Update] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssignmentSP2024_Update].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssignmentSP2024_Update] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET RECOVERY FULL 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET  MULTI_USER 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssignmentSP2024_Update] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssignmentSP2024_Update] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AssignmentSP2024_Update', N'ON'
GO
ALTER DATABASE [AssignmentSP2024_Update] SET QUERY_STORE = ON
GO
ALTER DATABASE [AssignmentSP2024_Update] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AssignmentSP2024_Update]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](150) NOT NULL,
	[displayname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attendence]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendence](
	[aid] [int] IDENTITY(1,1) NOT NULL,
	[leid] [int] NOT NULL,
	[sid] [int] NOT NULL,
	[description] [varchar](150) NOT NULL,
	[isPresent] [bit] NOT NULL,
	[capturedtime] [datetime] NOT NULL,
 CONSTRAINT [PK_Attendence] PRIMARY KEY CLUSTERED 
(
	[aid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[sid] [int] NOT NULL,
	[gid] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment] PRIMARY KEY CLUSTERED 
(
	[sid] ASC,
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](150) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecturer]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecturer](
	[lid] [int] NOT NULL,
	[lname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Lecturer] PRIMARY KEY CLUSTERED 
(
	[lid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lession]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lession](
	[leid] [int] IDENTITY(1,1) NOT NULL,
	[gid] [int] NOT NULL,
	[tid] [int] NOT NULL,
	[rid] [int] NOT NULL,
	[lid] [int] NOT NULL,
	[date] [date] NOT NULL,
	[isAttended] [bit] NOT NULL,
 CONSTRAINT [PK_Lession] PRIMARY KEY CLUSTERED 
(
	[leid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleid] [int] NOT NULL,
	[rolename] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Account]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Account](
	[username] [varchar](150) NOT NULL,
	[roleid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[roleid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role_Feature]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Feature](
	[roleid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_Role_Feature] PRIMARY KEY CLUSTERED 
(
	[roleid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[rid] [int] NOT NULL,
	[rname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_Room] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Score]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Score](
	[scid] [int] IDENTITY(1,1) NOT NULL,
	[score] [float] NULL,
	[sid] [int] NULL,
	[sctid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[scid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ScoreType]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScoreType](
	[sctid] [int] IDENTITY(1,1) NOT NULL,
	[sctname] [nvarchar](50) NULL,
	[sctpercent] [nvarchar](10) NULL,
	[subid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[sctid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[sid] [int] NOT NULL,
	[sname] [varchar](150) NOT NULL,
	[email] [varchar](150) NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGroup]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGroup](
	[gid] [int] NOT NULL,
	[gname] [varchar](150) NOT NULL,
	[subid] [int] NOT NULL,
	[lid] [int] NOT NULL,
 CONSTRAINT [PK_StudentGroup] PRIMARY KEY CLUSTERED 
(
	[gid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subid] [int] NOT NULL,
	[suname] [varchar](150) NOT NULL,
	[credit] [int] NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 7/12/2024 1:49:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[tid] [int] NOT NULL,
	[tname] [varchar](150) NOT NULL,
 CONSTRAINT [PK_TimeSlot] PRIMARY KEY CLUSTERED 
(
	[tid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'sonnt', N'123', N'Ngo Tung Son')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'student', N'123', N'Student A')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Student 1', N'123', N'Nguyen Van A')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Student 2', N'123', N'Nguyen Van B')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Student 3', N'123', N'Nguyen Van C')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Student 4', N'123', N'Nguyen Van D')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Student 5', N'123', N'Nguyen Van E')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Student 6', N'123', N'Nguyen Van F')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'Student 7', N'123', N'Nguyen Van G')
INSERT [dbo].[Account] ([username], [password], [displayname]) VALUES (N'thuyntt', N'123', N'Nguyen Thi Thu Thuy')
GO
SET IDENTITY_INSERT [dbo].[Attendence] ON 

INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1002, 2, 1, N'XXX', 1, CAST(N'2024-03-19T19:43:34.227' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1003, 2, 2, N'AA', 1, CAST(N'2024-03-01T11:47:43.963' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1004, 2, 3, N'XX', 1, CAST(N'2024-03-06T22:34:25.410' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (1005, 2, 4, N'GEGEGEEGEG', 1, CAST(N'2024-03-01T11:47:43.963' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2002, 3, 1, N'C', 0, CAST(N'2024-03-13T19:55:39.907' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2003, 3, 2, N'B', 1, CAST(N'2024-03-01T14:22:36.770' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2004, 3, 3, N'A', 1, CAST(N'2024-03-01T14:22:36.770' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2005, 3, 4, N'', 1, CAST(N'2024-03-07T21:29:35.043' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2006, 4, 1, N'', 1, CAST(N'2024-03-01T14:22:44.623' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2007, 4, 2, N'', 1, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2008, 4, 3, N'', 0, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2009, 4, 4, N'', 0, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2010, 4, 5, N'', 0, CAST(N'2024-03-01T14:22:44.627' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2026, 5, 1, N'', 0, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2027, 5, 2, N'X', 0, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2028, 5, 3, N'X', 0, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2029, 5, 4, N'X', 1, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2030, 5, 5, N'', 1, CAST(N'2024-03-01T14:23:30.030' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2033, 1003, 1, N'ABC', 0, CAST(N'2024-03-06T22:41:09.953' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2034, 1003, 2, N'', 0, CAST(N'2024-03-06T22:41:14.800' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2035, 1003, 3, N'', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2036, 1003, 4, N'', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2037, 1003, 5, N'', 1, CAST(N'2024-03-01T14:27:38.107' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2038, 1, 1, N'Stupidsss', 0, CAST(N'2024-03-20T00:04:40.337' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2039, 1, 2, N'Stupid', 1, CAST(N'2024-03-13T21:34:23.543' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2040, 1, 3, N'co mat', 1, CAST(N'2024-03-19T13:16:58.420' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2041, 1, 4, N'co mat', 1, CAST(N'2024-03-13T21:34:32.427' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2042, 1004, 1, N'', 0, CAST(N'2024-03-20T16:22:13.170' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2043, 1004, 2, N'', 1, CAST(N'2024-03-20T00:51:58.940' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2044, 1004, 3, N'', 1, CAST(N'2024-03-20T00:51:58.940' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2045, 1004, 4, N'di hoc muon', 1, CAST(N'2024-03-20T15:32:20.940' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2046, 1005, 1, N'duoc 5 sao', 1, CAST(N'2024-03-20T00:52:34.613' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2047, 1005, 2, N'1 sao', 1, CAST(N'2024-03-20T00:52:34.617' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2048, 1005, 3, N'3 sao', 1, CAST(N'2024-03-20T00:52:34.617' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2049, 1005, 4, N'7 sao', 1, CAST(N'2024-03-20T00:52:34.617' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2050, 1012, 1, N'good chop', 1, CAST(N'2024-03-20T01:23:53.410' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2051, 1012, 2, N'nice', 1, CAST(N'2024-03-20T01:23:53.410' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2052, 1012, 3, N'bad', 0, CAST(N'2024-03-20T01:23:53.410' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2053, 1012, 4, N'ok', 1, CAST(N'2024-03-20T01:23:53.410' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2054, 1012, 5, N'oh no', 0, CAST(N'2024-03-20T01:23:53.413' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2055, 1006, 1, N'', 1, CAST(N'2024-03-20T15:59:17.833' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2056, 1006, 2, N'', 0, CAST(N'2024-03-20T15:59:17.837' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2057, 1006, 3, N'', 0, CAST(N'2024-03-20T15:59:17.840' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2058, 1006, 4, N'', 1, CAST(N'2024-03-20T15:59:17.840' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2059, 1007, 1, N'', 1, CAST(N'2024-03-20T16:00:28.167' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2060, 1007, 2, N'', 0, CAST(N'2024-03-20T16:00:28.180' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2061, 1007, 3, N'', 0, CAST(N'2024-03-20T16:00:28.180' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2062, 1007, 4, N'', 0, CAST(N'2024-03-20T16:00:28.187' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2063, 1008, 1, N'qqqq', 0, CAST(N'2024-03-20T16:22:36.543' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2064, 1008, 2, N'', 1, CAST(N'2024-03-20T16:22:36.547' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2065, 1008, 3, N'', 0, CAST(N'2024-03-20T16:22:36.550' AS DateTime))
INSERT [dbo].[Attendence] ([aid], [leid], [sid], [description], [isPresent], [capturedtime]) VALUES (2066, 1008, 4, N'', 1, CAST(N'2024-03-20T16:22:36.550' AS DateTime))
SET IDENTITY_INSERT [dbo].[Attendence] OFF
GO
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (1, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (2, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 3)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (3, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 1)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (4, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 2)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (5, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (6, 5)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 4)
INSERT [dbo].[Enrollment] ([sid], [gid]) VALUES (7, 5)
GO
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (1, N'View Lecturer Timetable', N'/lecturer/timetable')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (2, N'Lecturer Take Attendance', N'/lecturer/att')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (3, N'Lecturer View Markreport', N'/lecturer/markreport')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (4, N'Lecturer View Present Report', N'/lecturer/presentreport')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (5, N'Student View Present Report', N'/student/presentreport')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (6, N'Student View Markreport', N'/student/markreport')
INSERT [dbo].[Feature] ([fid], [fname], [url]) VALUES (7, N'View Student Timetable', N'/student/timetable')
GO
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (1, N'sonnt')
INSERT [dbo].[Lecturer] ([lid], [lname]) VALUES (2, N'thuyntt')
GO
SET IDENTITY_INSERT [dbo].[Lession] ON 

INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1, 1, 1, 1, 1, CAST(N'2024-02-28' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (2, 1, 1, 1, 1, CAST(N'2024-03-01' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (3, 1, 1, 1, 1, CAST(N'2024-03-06' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (4, 2, 2, 1, 2, CAST(N'2024-02-28' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (5, 2, 2, 1, 2, CAST(N'2024-03-01' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1003, 2, 2, 2, 2, CAST(N'2024-03-02' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1004, 1, 1, 1, 1, CAST(N'2024-03-18' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1005, 1, 1, 1, 1, CAST(N'2024-03-19' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1006, 1, 1, 1, 1, CAST(N'2024-03-20' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1007, 1, 1, 1, 1, CAST(N'2024-03-21' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1008, 1, 1, 1, 1, CAST(N'2024-03-22' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1009, 1, 1, 1, 1, CAST(N'2024-03-23' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1010, 1, 1, 1, 1, CAST(N'2024-03-24' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1011, 1, 1, 1, 1, CAST(N'2024-03-25' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1012, 2, 2, 2, 2, CAST(N'2024-03-18' AS Date), 1)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1013, 2, 3, 2, 2, CAST(N'2024-03-19' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1014, 2, 3, 2, 2, CAST(N'2024-03-20' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1015, 3, 5, 2, 2, CAST(N'2024-03-20' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1016, 4, 3, 2, 2, CAST(N'2024-03-21' AS Date), 0)
INSERT [dbo].[Lession] ([leid], [gid], [tid], [rid], [lid], [date], [isAttended]) VALUES (1017, 5, 4, 1, 1, CAST(N'2024-03-22' AS Date), 0)
SET IDENTITY_INSERT [dbo].[Lession] OFF
GO
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (1, N'Lecturer')
INSERT [dbo].[Role] ([roleid], [rolename]) VALUES (2, N'Student')
GO
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'sonnt', 1)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student 1', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student 2', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student 3', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student 4', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student 5', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student 6', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'student 7', 2)
INSERT [dbo].[Role_Account] ([username], [roleid]) VALUES (N'thuyntt', 1)
GO
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 1)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 2)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 3)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (1, 4)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 5)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 6)
INSERT [dbo].[Role_Feature] ([roleid], [fid]) VALUES (2, 7)
GO
INSERT [dbo].[Room] ([rid], [rname]) VALUES (1, N'BE102')
INSERT [dbo].[Room] ([rid], [rname]) VALUES (2, N'DE112')
GO
SET IDENTITY_INSERT [dbo].[Score] ON 

INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636844, 2, 1, 7)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636845, 0.6, 1, 8)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636846, 10, 1, 9)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636847, 2, 1, 10)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636848, 3, 1, 11)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636849, 0, 1, 12)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636850, 0, 1, 13)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636851, 0, 2, 7)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636852, 0, 2, 8)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636853, 0, 2, 9)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636854, 0, 2, 10)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636855, 0, 2, 11)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636856, 0, 2, 12)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636857, 0, 2, 13)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636858, 0, 3, 7)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636859, 0, 3, 8)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636860, 0, 3, 9)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636861, 0, 3, 10)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636862, 0, 3, 11)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636863, 0, 3, 12)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636864, 0, 3, 13)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636865, 0, 4, 7)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636866, 0, 4, 8)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636867, 0, 4, 9)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636868, 0, 4, 10)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636869, 0, 4, 11)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636870, 0, 4, 12)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636871, 0, 4, 13)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636872, 0, 5, 7)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636873, 0, 5, 8)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636874, 0, 5, 9)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636875, 0, 5, 10)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636876, 0, 5, 11)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636877, 0, 5, 12)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636878, 0, 5, 13)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636991, 10, 1, 1)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636992, 10, 1, 2)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636993, 10, 1, 3)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636994, 10, 1, 4)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636995, 10, 1, 5)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636996, 10, 1, 6)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636997, 1, 1, 14)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636998, 4.5, 2, 1)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (636999, 6, 2, 2)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637000, 0, 2, 3)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637001, 7.8, 2, 4)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637002, 6, 2, 5)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637003, 8.6, 2, 6)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637004, 7, 2, 14)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637005, 0.3, 3, 1)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637006, 0, 3, 2)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637007, 0, 3, 3)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637008, 0, 3, 4)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637009, 0, 3, 5)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637010, 0, 3, 6)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637011, 0, 3, 14)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637012, 0, 4, 1)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637013, 0, 4, 2)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637014, 0, 4, 3)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637015, 0, 4, 4)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637016, 0, 4, 5)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637017, 0, 4, 6)
INSERT [dbo].[Score] ([scid], [score], [sid], [sctid]) VALUES (637018, 1, 4, 14)
SET IDENTITY_INSERT [dbo].[Score] OFF
GO
SET IDENTITY_INSERT [dbo].[ScoreType] ON 

INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (1, N'protest 1', N'5%', 1)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (2, N'protest 2', N'5%', 1)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (3, N'workshop1', N'5%', 1)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (4, N'workshop2', N'5%', 1)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (5, N'PraticalExam', N'20%', 1)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (6, N'FinalExam', N'20%', 1)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (7, N'Computer Project', N'15%', 2)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (8, N'Assignment 1', N'10%', 2)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (9, N'Assignment 2', N'10%', 2)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (10, N'Protest 1', N'10%', 2)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (11, N'Protest 2', N'10%', 2)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (12, N'Protest 3', N'10%', 2)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (13, N'Final Exam', N'35%', 2)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (14, N'Assignment', N'40%', 1)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (15, N'Participation', N'10%', 3)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (16, N'Progress test 1', N'10%', 3)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (17, N'Progress test 2', N'10%', 3)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (18, N'Mid-term test', N'30%', 3)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (19, N'FE: GVR', N'30%', 3)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (20, N'FE: Listening', N'10%', 3)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (21, N'Active learning', N'10%', 5)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (22, N'Exercise 1', N'5%', 5)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (23, N'Exercise 2', N'5%', 5)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (24, N'Presentation', N'10%', 5)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (25, N'Project', N'30%', 5)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (26, N'Final Exam', N'40%', 5)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (27, N'Theory Exam', N'60%', 6)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (28, N'Pratice Exam', N'40%', 6)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (29, N'Bonus', N'10%', 6)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (30, N'Lab 1', N'2%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (31, N'Lab 2', N'2%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (32, N'Lab 3', N'2%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (33, N'Lab 4', N'2%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (34, N'Lab 5', N'2%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (35, N'Progress Test 1', N'5%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (36, N'Progress Test 2', N'5%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (37, N'Assignment', N'20%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (38, N'Pratice Exam', N'30%', 4)
INSERT [dbo].[ScoreType] ([sctid], [sctname], [sctpercent], [subid]) VALUES (39, N'Final Exam', N'30%', 4)
SET IDENTITY_INSERT [dbo].[ScoreType] OFF
GO
INSERT [dbo].[Student] ([sid], [sname], [email]) VALUES (1, N'Student', N'minhnqhe176167@fpt.edu.vn')
INSERT [dbo].[Student] ([sid], [sname], [email]) VALUES (2, N'Student 2', N'linhntdhe172208@fpt.edu.vn')
INSERT [dbo].[Student] ([sid], [sname], [email]) VALUES (3, N'Student 3', N'cuonghvHE176362@fpt.edu.vn')
INSERT [dbo].[Student] ([sid], [sname], [email]) VALUES (4, N'Student 4', N'handgHE170064@fpt.edu.vn')
INSERT [dbo].[Student] ([sid], [sname], [email]) VALUES (5, N'Student 5', NULL)
INSERT [dbo].[Student] ([sid], [sname], [email]) VALUES (6, N'Student 6', NULL)
INSERT [dbo].[Student] ([sid], [sname], [email]) VALUES (7, N'Student 7', NULL)
GO
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (1, N'SE1818', 1, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (2, N'SE1818', 2, 2)
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (3, N'SE1818', 3, 2)
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (4, N'SE1818', 5, 1)
INSERT [dbo].[StudentGroup] ([gid], [gname], [subid], [lid]) VALUES (5, N'SE1818', 4, 1)
GO
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (1, N'PRJ301', 3)
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (2, N'MAS291', 3)
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (3, N'JPD123', 3)
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (4, N'DBI202', 3)
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (5, N'IOT102', 3)
INSERT [dbo].[Subject] ([subid], [suname], [credit]) VALUES (6, N'SWE201c', 3)
GO
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (1, N'Slot 1')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (2, N'Slot 2')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (3, N'Slot 3')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (4, N'Slot 4')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (5, N'Slot 5')
INSERT [dbo].[TimeSlot] ([tid], [tname]) VALUES (6, N'Slot 6')
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Lession1] FOREIGN KEY([leid])
REFERENCES [dbo].[Lession] ([leid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Lession1]
GO
ALTER TABLE [dbo].[Attendence]  WITH CHECK ADD  CONSTRAINT [FK_Attendence_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Attendence] CHECK CONSTRAINT [FK_Attendence_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_Student] FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_Student]
GO
ALTER TABLE [dbo].[Enrollment]  WITH CHECK ADD  CONSTRAINT [FK_Enrollment_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Enrollment] CHECK CONSTRAINT [FK_Enrollment_StudentGroup]
GO
ALTER TABLE [dbo].[Lecturer]  WITH CHECK ADD  CONSTRAINT [FK_Lecturer_Account] FOREIGN KEY([lname])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Lecturer] CHECK CONSTRAINT [FK_Lecturer_Account]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Lecturer]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_Room] FOREIGN KEY([rid])
REFERENCES [dbo].[Room] ([rid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_Room]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_StudentGroup] FOREIGN KEY([gid])
REFERENCES [dbo].[StudentGroup] ([gid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_StudentGroup]
GO
ALTER TABLE [dbo].[Lession]  WITH CHECK ADD  CONSTRAINT [FK_Lession_TimeSlot] FOREIGN KEY([tid])
REFERENCES [dbo].[TimeSlot] ([tid])
GO
ALTER TABLE [dbo].[Lession] CHECK CONSTRAINT [FK_Lession_TimeSlot]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Account]
GO
ALTER TABLE [dbo].[Role_Account]  WITH CHECK ADD  CONSTRAINT [FK_Role_Account_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[Role_Account] CHECK CONSTRAINT [FK_Role_Account_Role]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Feature]
GO
ALTER TABLE [dbo].[Role_Feature]  WITH CHECK ADD  CONSTRAINT [FK_Role_Feature_Role] FOREIGN KEY([roleid])
REFERENCES [dbo].[Role] ([roleid])
GO
ALTER TABLE [dbo].[Role_Feature] CHECK CONSTRAINT [FK_Role_Feature_Role]
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD FOREIGN KEY([sctid])
REFERENCES [dbo].[ScoreType] ([sctid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Score]  WITH CHECK ADD FOREIGN KEY([sid])
REFERENCES [dbo].[Student] ([sid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ScoreType]  WITH CHECK ADD FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account] FOREIGN KEY([sname])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Lecturer] FOREIGN KEY([lid])
REFERENCES [dbo].[Lecturer] ([lid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Lecturer]
GO
ALTER TABLE [dbo].[StudentGroup]  WITH CHECK ADD  CONSTRAINT [FK_StudentGroup_Subject] FOREIGN KEY([subid])
REFERENCES [dbo].[Subject] ([subid])
GO
ALTER TABLE [dbo].[StudentGroup] CHECK CONSTRAINT [FK_StudentGroup_Subject]
GO
USE [master]
GO
ALTER DATABASE [AssignmentSP2024_Update] SET  READ_WRITE 
GO
