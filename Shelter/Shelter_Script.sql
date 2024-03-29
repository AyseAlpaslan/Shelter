USE [master]
GO
/****** Object:  Database [Shelter_Project]    Script Date: 27.12.2022 19:12:49 ******/
CREATE DATABASE [Shelter_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shelter_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shelter_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shelter_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Shelter_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shelter_Project] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shelter_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shelter_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shelter_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shelter_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shelter_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shelter_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shelter_Project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Shelter_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shelter_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shelter_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shelter_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shelter_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shelter_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shelter_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shelter_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shelter_Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Shelter_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shelter_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shelter_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shelter_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shelter_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shelter_Project] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Shelter_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shelter_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Shelter_Project] SET  MULTI_USER 
GO
ALTER DATABASE [Shelter_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shelter_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shelter_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shelter_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shelter_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shelter_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Shelter_Project] SET QUERY_STORE = OFF
GO
USE [Shelter_Project]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 27.12.2022 19:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnimalParents]    Script Date: 27.12.2022 19:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnimalParents](
	[ParentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentName] [nvarchar](max) NULL,
	[ParentSurname] [nvarchar](max) NULL,
	[ParentJob] [nvarchar](max) NULL,
	[ParentAge] [int] NOT NULL,
	[ParentPhone] [nvarchar](max) NULL,
 CONSTRAINT [PK_AnimalParents] PRIMARY KEY CLUSTERED 
(
	[ParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Animals]    Script Date: 27.12.2022 19:12:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Animals](
	[AnimalID] [int] IDENTITY(1,1) NOT NULL,
	[AnimalType] [nvarchar](max) NULL,
	[AnimalGender] [nvarchar](max) NULL,
	[AnimalAge] [int] NOT NULL,
	[ParentID] [int] NOT NULL,
	[AnimalParentsParentID] [int] NULL,
 CONSTRAINT [PK_Animals] PRIMARY KEY CLUSTERED 
(
	[AnimalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221227134353_CreateDb', N'3.1.8')
GO
SET IDENTITY_INSERT [dbo].[AnimalParents] ON 

INSERT [dbo].[AnimalParents] ([ParentID], [ParentName], [ParentSurname], [ParentJob], [ParentAge], [ParentPhone]) VALUES (1, N'Ayşe', N'Alpaslan', N'Civil Engineer', 25, N'0534 254 68 50')
SET IDENTITY_INSERT [dbo].[AnimalParents] OFF
GO
SET IDENTITY_INSERT [dbo].[Animals] ON 

INSERT [dbo].[Animals] ([AnimalID], [AnimalType], [AnimalGender], [AnimalAge], [ParentID], [AnimalParentsParentID]) VALUES (1, N'Kedi', N'Scottish', 3, 1, NULL)
SET IDENTITY_INSERT [dbo].[Animals] OFF
GO
/****** Object:  Index [IX_Animals_AnimalParentsParentID]    Script Date: 27.12.2022 19:12:49 ******/
CREATE NONCLUSTERED INDEX [IX_Animals_AnimalParentsParentID] ON [dbo].[Animals]
(
	[AnimalParentsParentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Animals]  WITH CHECK ADD  CONSTRAINT [FK_Animals_AnimalParents_AnimalParentsParentID] FOREIGN KEY([AnimalParentsParentID])
REFERENCES [dbo].[AnimalParents] ([ParentID])
GO
ALTER TABLE [dbo].[Animals] CHECK CONSTRAINT [FK_Animals_AnimalParents_AnimalParentsParentID]
GO
USE [master]
GO
ALTER DATABASE [Shelter_Project] SET  READ_WRITE 
GO
