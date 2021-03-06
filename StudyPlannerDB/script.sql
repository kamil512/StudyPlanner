USE [master]
GO
/****** Object:  Database [StudyPlanner]    Script Date: 2016-07-17 17:00:19 ******/
CREATE DATABASE [StudyPlanner]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StudyPlanner', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudyPlanner.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudyPlanner_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\StudyPlanner_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [StudyPlanner] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudyPlanner].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudyPlanner] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudyPlanner] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudyPlanner] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudyPlanner] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudyPlanner] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudyPlanner] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudyPlanner] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudyPlanner] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudyPlanner] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudyPlanner] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudyPlanner] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudyPlanner] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudyPlanner] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudyPlanner] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudyPlanner] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudyPlanner] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StudyPlanner] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudyPlanner] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudyPlanner] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudyPlanner] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudyPlanner] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudyPlanner] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudyPlanner] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudyPlanner] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [StudyPlanner] SET  MULTI_USER 
GO
ALTER DATABASE [StudyPlanner] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudyPlanner] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StudyPlanner] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StudyPlanner] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [StudyPlanner]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 2016-07-17 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuthorOfBook]    Script Date: 2016-07-17 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthorOfBook](
	[BookId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Priority] [int] NOT NULL,
	[UserId] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book]    Script Date: 2016-07-17 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Book](
	[BookId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[Released] [date] NOT NULL,
	[Pages] [int] NOT NULL,
	[CoverImageData] [varbinary](max) NULL,
	[CoverImageMimeType] [nvarchar](50) NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 2016-07-17 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[PublisherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 2016-07-17 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[SectionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[BookId] [int] NOT NULL,
	[StartPageNumber] [int] NOT NULL,
	[EndPageNumber] [int] NOT NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[SectionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Training]    Script Date: 2016-07-17 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Training](
	[TrainingId] [int] IDENTITY(1,1) NOT NULL,
	[SectionId] [int] NOT NULL,
	[AddedDate] [date] NOT NULL,
	[CompletedDate] [date] NULL,
	[UserId] [int] NULL,
 CONSTRAINT [PK_Sections2] PRIMARY KEY CLUSTERED 
(
	[TrainingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 2016-07-17 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Salt] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Author]  WITH CHECK ADD  CONSTRAINT [FK_Author_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Author] CHECK CONSTRAINT [FK_Author_User]
GO
ALTER TABLE [dbo].[AuthorOfBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorOfBook_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([AuthorId])
GO
ALTER TABLE [dbo].[AuthorOfBook] CHECK CONSTRAINT [FK_AuthorOfBook_Author]
GO
ALTER TABLE [dbo].[AuthorOfBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorOfBook_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[AuthorOfBook] CHECK CONSTRAINT [FK_AuthorOfBook_Book]
GO
ALTER TABLE [dbo].[AuthorOfBook]  WITH CHECK ADD  CONSTRAINT [FK_AuthorOfBook_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[AuthorOfBook] CHECK CONSTRAINT [FK_AuthorOfBook_User]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Publisher] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publisher] ([PublisherId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Publisher]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_User]
GO
ALTER TABLE [dbo].[Publisher]  WITH CHECK ADD  CONSTRAINT [FK_Publisher_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Publisher] CHECK CONSTRAINT [FK_Publisher_User]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([BookId])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Book]
GO
ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_User]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [FK_Training_Section] FOREIGN KEY([SectionId])
REFERENCES [dbo].[Section] ([SectionId])
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [FK_Training_Section]
GO
ALTER TABLE [dbo].[Training]  WITH CHECK ADD  CONSTRAINT [FK_Training_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[Training] CHECK CONSTRAINT [FK_Training_User]
GO
USE [master]
GO
ALTER DATABASE [StudyPlanner] SET  READ_WRITE 
GO
