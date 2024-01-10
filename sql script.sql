﻿USE [master]
GO
/****** Object:  Database [StudentDB]    Script Date: 08-01-2024 19:43:37 ******/
CREATE DATABASE [StudentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\StudentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [StudentDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StudentDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StudentDB', N'ON'
GO
ALTER DATABASE [StudentDB] SET QUERY_STORE = OFF
GO
USE [StudentDB]
GO
/****** Object:  Table [dbo].[Student_Table]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student_Table](
	[Student_Name] [varchar](50) NOT NULL,
	[Student_DOB] [date] NOT NULL,
	[Student_Age] [int] NOT NULL,
	[Student_Gender] [varchar](50) NOT NULL,
	[Student_Mobile] [int] NOT NULL,
	[Student_Address] [varchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Student_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Student_ID] PRIMARY KEY CLUSTERED 
(
	[Student_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student_Table] ON 

INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'yash', CAST(N'2001-11-20' AS Date), 22, N'male', 232332, N'Airoli', 0, 1)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'vipin', CAST(N'2001-11-20' AS Date), 22, N'male', 1221212, N'Kalyan', 0, 2)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'ash', CAST(N'2002-02-21' AS Date), 22, N'male', 2232, N'thane', 0, 3)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'akash', CAST(N'2003-12-11' AS Date), 22, N'male', 323222323, N'Vashi', 0, 4)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'sachin', CAST(N'2002-02-21' AS Date), 24, N'male', 557788664, N'mumbai', 0, 5)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'abhya', CAST(N'2012-06-02' AS Date), 21, N'male', 664488330, N'badlapur', 0, 6)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'omkar', CAST(N'2001-11-08' AS Date), 22, N'MALE', 886644003, N'Airoli', 0, 7)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'Rohan', CAST(N'2002-02-26' AS Date), 21, N'male', 994400224, N'Thane', 1, 8)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'Adarsh', CAST(N'1999-12-09' AS Date), 23, N'male', 996644332, N'Mulund', 1, 9)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'Omkar', CAST(N'2001-04-18' AS Date), 22, N'Male', 886655443, N'Airoli', 1, 10)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'Rushikesh', CAST(N'2001-11-05' AS Date), 22, N'Male', 668899442, N'Bhandup', 1, 11)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'Swapnil', CAST(N'1996-10-12' AS Date), 26, N'Male', 112233445, N'abcdef', 1, 12)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'Dungya', CAST(N'2012-12-12' AS Date), 18, N'Male', 112233445, N'Dombiwali', 0, 13)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'Anish', CAST(N'2024-01-13' AS Date), 1, N'Male', 223344556, N'Airoli', 1, 15)
INSERT [dbo].[Student_Table] ([Student_Name], [Student_DOB], [Student_Age], [Student_Gender], [Student_Mobile], [Student_Address], [IsDeleted], [Student_ID]) VALUES (N'guddu', CAST(N'2003-11-12' AS Date), 8, N'Male', 112233445, N'VidyaVihar', 1, 16)
SET IDENTITY_INSERT [dbo].[Student_Table] OFF
GO
ALTER TABLE [dbo].[Student_Table] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
/****** Object:  StoredProcedure [dbo].[FilterStudents]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON

GO
/****** Object:  StoredProcedure [dbo].[Pagination]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Pagination]
    @PageSize INT,
    @PageNumber INT
AS
BEGIN
    SELECT * FROM Student_Table
    ORDER BY Student_Name
    OFFSET (@PageSize * (@PageNumber - 1)) ROWS FETCH NEXT @PageSize ROWS ONLY;

    SELECT COUNT(*) FROM Student_Table;
END
GO
/****** Object:  StoredProcedure [dbo].[RestoreData]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RestoreData]
 @Student_ID INT
 AS
BEGIN
    UPDATE Student_Table
    SET IsDeleted = 1
    WHERE Student_ID = @Student_ID;
END
GO
/****** Object:  StoredProcedure [dbo].[SoftDelete]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[SoftDelete]
AS begin
Select * from Student_Table
Where IsDeleted = 0;
End
GO
/****** Object:  StoredProcedure [dbo].[StudentAdd]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StudentAdd]

@Student_Name varchar(50),
@Student_DOB date,
@Student_Age int,
@Student_Gender varchar(50),
@Student_Mobile int,
@Student_Address varchar(50),
@IsDeleted bit

AS
BEGIN

INSERT INTO Student_Table(Student_Name,Student_DOB,Student_Age,Student_Gender,Student_Mobile,Student_Address,IsDeleted)
VALUES(@Student_Name,@Student_DOB,@Student_Age,@Student_Gender,@Student_Mobile,@Student_Address,@IsDeleted )
End 






GO
/****** Object:  StoredProcedure [dbo].[StudentDelete]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StudentDelete]
@Student_ID int

as
begin
UPDATE Student_Table
    SET IsDeleted = 0
    WHERE Student_ID = @Student_ID;
End 






GO
/****** Object:  StoredProcedure [dbo].[StudentUpdate]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StudentUpdate]
@Student_ID int,
    @Student_Name varchar(50),
    @Student_DOB date,
    @Student_Age int,
    @Student_Gender varchar(50),
    @Student_Mobile int,
    @Student_Address varchar(50),
	@IsDeleted bit
	

AS
BEGIN
UPDATE Student_Table
 SET
Student_Name =  @Student_Name,
Student_DOB =  @Student_DOB,
 Student_Age = @Student_Age,
 Student_Gender = @Student_Gender,
 Student_Mobile = @Student_Mobile,
Student_Address =  @Student_Address,
IsDeleted = @IsDeleted
WHERE Student_ID = @Student_ID

End 






GO
/****** Object:  StoredProcedure [dbo].[StudentView]    Script Date: 08-01-2024 19:43:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[StudentView]


AS
begin 
SET NOCOUNT ON;	
 Select * from Student_Table where IsDeleted=1;
End 






GO
USE [master]
GO
ALTER DATABASE [StudentDB] SET  READ_WRITE 
GO
