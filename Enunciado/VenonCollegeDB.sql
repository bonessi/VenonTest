USE [VenonCollege]
GO
/****** Object:  Database [VenonCollege]    Script Date: 02/05/2016 10:07:05 p.m. ******/
CREATE DATABASE [VenonCollege]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'VenonCollege', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\VenonCollege.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VenonCollege_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS2014\MSSQL\DATA\VenonCollege_log.ldf' , SIZE = 1600KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VenonCollege] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VenonCollege].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VenonCollege] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [VenonCollege] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [VenonCollege] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [VenonCollege] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [VenonCollege] SET ARITHABORT OFF 
GO
ALTER DATABASE [VenonCollege] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [VenonCollege] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [VenonCollege] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [VenonCollege] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [VenonCollege] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [VenonCollege] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [VenonCollege] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [VenonCollege] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [VenonCollege] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [VenonCollege] SET  DISABLE_BROKER 
GO
ALTER DATABASE [VenonCollege] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [VenonCollege] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [VenonCollege] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [VenonCollege] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [VenonCollege] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [VenonCollege] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [VenonCollege] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [VenonCollege] SET RECOVERY FULL 
GO
ALTER DATABASE [VenonCollege] SET  MULTI_USER 
GO
ALTER DATABASE [VenonCollege] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [VenonCollege] SET DB_CHAINING OFF 
GO
ALTER DATABASE [VenonCollege] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [VenonCollege] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [VenonCollege] SET DELAYED_DURABILITY = DISABLED 
GO
USE [VenonCollege]
GO
/****** Object:  User [venon]    Script Date: 02/05/2016 10:07:05 p.m. ******/
CREATE USER [venon] FOR LOGIN [venon] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [ALLUS\Administrador]    Script Date: 02/05/2016 10:07:05 p.m. ******/
CREATE USER [ALLUS\Administrador] FOR LOGIN [ALLUS\Administrador] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [venon]
GO
ALTER ROLE [db_owner] ADD MEMBER [ALLUS\Administrador]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Credits] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_dbo.Course] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseInstructor]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseInstructor](
	[CourseID] [int] NOT NULL,
	[InstructorID] [int] NOT NULL,
 CONSTRAINT [PK_dbo.CourseInstructor] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Budget] [money] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[InstructorID] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_dbo.Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Enrollment]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Enrollment](
	[EnrollmentID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[EnrollmentDate] [datetime] NOT NULL,
	[Grade] [int] NOT NULL,
 CONSTRAINT [PK_Enrollment_] PRIMARY KEY CLUSTERED 
(
	[EnrollmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[HireDate] [datetime] NULL,
	[Discriminator] [nvarchar](128) NOT NULL DEFAULT ('Instructor'),
 CONSTRAINT [PK_dbo.Person] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1045, N'Calculus', 4, 3)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (1050, N'Chemistry', 3, 4)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2021, N'Composition', 3, 2)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (2042, N'Literature', 4, 2)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (3141, N'Trigonometry', 4, 3)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4022, N'Microeconomics', 3, 5)
GO
INSERT [dbo].[Course] ([CourseID], [Title], [Credits], [DepartmentID]) VALUES (4041, N'Macroeconomics', 3, 5)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2021, 9)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (2042, 9)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1045, 10)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1050, 11)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (3141, 11)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (1050, 12)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4022, 13)
GO
INSERT [dbo].[CourseInstructor] ([CourseID], [InstructorID]) VALUES (4041, 13)
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (2, N'English', 350000.0000, CAST(N'2007-09-01 00:00:00.000' AS DateTime), 9)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (3, N'Mathematics', 100000.0000, CAST(N'2007-09-01 00:00:00.000' AS DateTime), 12)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (4, N'Engineering', 350000.0000, CAST(N'2007-09-01 00:00:00.000' AS DateTime), 11)
GO
INSERT [dbo].[Department] ([DepartmentID], [Name], [Budget], [StartDate], [InstructorID]) VALUES (5, N'Economics', 100000.0000, CAST(N'2007-09-01 00:00:00.000' AS DateTime), 12)
GO
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Enrollment] ON 

GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [EnrollmentDate], [Grade]) VALUES (2, 1045, 5, CAST(N'2016-04-13 00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [EnrollmentDate], [Grade]) VALUES (4, 2021, 5, CAST(N'2016-04-17 00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [EnrollmentDate], [Grade]) VALUES (5, 4041, 1, CAST(N'2016-04-17 00:00:00.000' AS DateTime), 4)
GO
INSERT [dbo].[Enrollment] ([EnrollmentID], [CourseID], [StudentID], [EnrollmentDate], [Grade]) VALUES (7, 2021, 2, CAST(N'2016-04-05 00:00:00.000' AS DateTime), 5)
GO
SET IDENTITY_INSERT [dbo].[Enrollment] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (1, N'Alexander', N'Jason', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (2, N'Alonso', N'Carlos', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (3, N'Anandre', N'Arturo', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (4, N'Barz', N'Gabriel', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (5, N'Lee', N'Ang', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (6, N'Morton', N'Peggy', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (7, N'Norman', N'Pauline', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (8, N'Olivetto', N'Nino', NULL, N'Student')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (9, N'Abercrombie', N'Kim', CAST(N'1995-03-11 00:00:00.000' AS DateTime), N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (10, N'Fakhouri', N'Fadi', CAST(N'2002-07-06 00:00:00.000' AS DateTime), N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (11, N'Harui', N'Roger', CAST(N'1998-07-01 00:00:00.000' AS DateTime), N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (12, N'Kapoor', N'Candace', CAST(N'2001-01-15 00:00:00.000' AS DateTime), N'Instructor')
GO
INSERT [dbo].[Person] ([ID], [LastName], [FirstName], [HireDate], [Discriminator]) VALUES (13, N'Zheng', N'Roger', CAST(N'2004-02-12 00:00:00.000' AS DateTime), N'Instructor')
GO
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
/****** Object:  Index [IX_DepartmentID]    Script Date: 02/05/2016 10:07:05 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_DepartmentID] ON [dbo].[Course]
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CourseID]    Script Date: 02/05/2016 10:07:05 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_CourseID] ON [dbo].[CourseInstructor]
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 02/05/2016 10:07:05 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[CourseInstructor]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_InstructorID]    Script Date: 02/05/2016 10:07:05 p.m. ******/
CREATE NONCLUSTERED INDEX [IX_InstructorID] ON [dbo].[Department]
(
	[InstructorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Course_dbo.Department_DepartmentID] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_dbo.Course_dbo.Department_DepartmentID]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CourseInstructor_dbo.Course_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Course] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_dbo.CourseInstructor_dbo.Course_CourseID]
GO
ALTER TABLE [dbo].[CourseInstructor]  WITH CHECK ADD  CONSTRAINT [FK_dbo.CourseInstructor_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseInstructor] CHECK CONSTRAINT [FK_dbo.CourseInstructor_dbo.Instructor_InstructorID]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Department_dbo.Instructor_InstructorID] FOREIGN KEY([InstructorID])
REFERENCES [dbo].[Person] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_dbo.Department_dbo.Instructor_InstructorID]
GO
/****** Object:  StoredProcedure [dbo].[Department_Delete]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Department_Delete]
    @DepartmentID [int],
    @RowVersion_Original [rowversion]
AS
BEGIN
    DELETE [dbo].[Department]
    WHERE (([DepartmentID] = @DepartmentID) AND (([RowVersion] = @RowVersion_Original) OR ([RowVersion] IS NULL AND @RowVersion_Original IS NULL)))
END

GO
/****** Object:  StoredProcedure [dbo].[Department_Insert]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Department_Insert]
    @Name [nvarchar](50),
    @Budget [money],
    @StartDate [datetime],
    @InstructorID [int]
AS
BEGIN
    INSERT [dbo].[Department]([Name], [Budget], [StartDate], [InstructorID])
    VALUES (@Name, @Budget, @StartDate, @InstructorID)
    
    DECLARE @DepartmentID int
    SELECT @DepartmentID = [DepartmentID]
    FROM [dbo].[Department]
    WHERE @@ROWCOUNT > 0 AND [DepartmentID] = scope_identity()
    
    SELECT t0.[DepartmentID], t0.[RowVersion]
    FROM [dbo].[Department] AS t0
    WHERE @@ROWCOUNT > 0 AND t0.[DepartmentID] = @DepartmentID
END

GO
/****** Object:  StoredProcedure [dbo].[Department_Update]    Script Date: 02/05/2016 10:07:05 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Department_Update]
    @DepartmentID [int],
    @Name [nvarchar](50),
    @Budget [money],
    @StartDate [datetime],
    @InstructorID [int],
    @RowVersion_Original [rowversion]
AS
BEGIN
    UPDATE [dbo].[Department]
    SET [Name] = @Name, [Budget] = @Budget, [StartDate] = @StartDate, [InstructorID] = @InstructorID
    WHERE (([DepartmentID] = @DepartmentID) AND (([RowVersion] = @RowVersion_Original) OR ([RowVersion] IS NULL AND @RowVersion_Original IS NULL)))
    
    SELECT t0.[RowVersion]
    FROM [dbo].[Department] AS t0
    WHERE @@ROWCOUNT > 0 AND t0.[DepartmentID] = @DepartmentID
END

GO
USE [master]
GO
ALTER DATABASE [VenonCollege] SET  READ_WRITE 
GO
