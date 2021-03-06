USE [master]
GO
/****** Object:  Database [TkSchoolNews]    Script Date: 11/22/2016 12:17:53 AM ******/
CREATE DATABASE [TkSchoolNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TkSchoolNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TkSchoolNews.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TkSchoolNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\TkSchoolNews_log.ldf' , SIZE = 12352KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TkSchoolNews] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TkSchoolNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TkSchoolNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TkSchoolNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TkSchoolNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TkSchoolNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TkSchoolNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [TkSchoolNews] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TkSchoolNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TkSchoolNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TkSchoolNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TkSchoolNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TkSchoolNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TkSchoolNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TkSchoolNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TkSchoolNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TkSchoolNews] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TkSchoolNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TkSchoolNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TkSchoolNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TkSchoolNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TkSchoolNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TkSchoolNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TkSchoolNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TkSchoolNews] SET RECOVERY FULL 
GO
ALTER DATABASE [TkSchoolNews] SET  MULTI_USER 
GO
ALTER DATABASE [TkSchoolNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TkSchoolNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TkSchoolNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TkSchoolNews] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [TkSchoolNews] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TkSchoolNews', N'ON'
GO
USE [TkSchoolNews]
GO
/****** Object:  FullTextCatalog [TKDatabaseFullTextCatalog]    Script Date: 11/22/2016 12:17:53 AM ******/
CREATE FULLTEXT CATALOG [TKDatabaseFullTextCatalog]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT

GO
/****** Object:  Table [dbo].[TblChart]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblChart](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[src1] [varchar](50) NULL,
	[src2] [varchar](50) NULL,
	[src3] [varchar](50) NULL,
	[src4] [varchar](50) NULL,
	[src5] [varchar](50) NULL,
	[Status] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblComment]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblComment](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Content] [ntext] NULL,
	[ParentId] [bigint] NULL,
	[NewsId] [bigint] NULL,
	[CreateDate] [datetime] NULL,
	[IsAd] [bit] NULL,
	[TimeVisit] [datetime] NULL,
	[UserQoute] [nvarchar](150) NULL,
	[Qoute] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblFile]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblFile](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Directory] [varchar](500) NULL,
	[Name] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[CreateUser] [nvarchar](500) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [nvarchar](500) NULL,
	[EditDate] [datetime] NULL,
	[SubName] [nvarchar](500) NULL,
 CONSTRAINT [PK_TblFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblFileNewsDraff]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblFileNewsDraff](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FileId] [bigint] NULL,
	[NewsId] [bigint] NULL,
	[CreateUser] [nvarchar](100) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [nvarchar](100) NULL,
	[EditDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblGallery]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblGallery](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[ImageUrl] [nvarchar](250) NULL,
	[GroupNewsId] [bigint] NULL,
	[CreateUser] [nvarchar](50) NULL,
	[Createdate] [datetime] NULL,
	[EditUser] [nvarchar](50) NULL,
	[EditDate] [datetime] NULL,
	[SubName] [nvarchar](150) NULL,
 CONSTRAINT [PK__TblGalle__3214EC07CE473C78] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblGroup]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblGroup](
	[GroupId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](250) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
 CONSTRAINT [PK__TblGroup__149AF36A7A79AFC4] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblGroupNews]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblGroupNews](
	[GroupNewsId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Status] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
	[Ord] [int] NULL,
	[ParentId] [bigint] NULL,
	[Path] [nvarchar](2000) NULL,
	[IsMenu] [bit] NULL,
	[IsHome] [bit] NULL,
	[UrlPath] [nvarchar](500) NULL,
	[NameEng] [nvarchar](250) NULL,
	[PathEng] [nvarchar](250) NULL,
	[UrlPathEng] [nvarchar](500) NULL,
	[Controller] [varchar](100) NULL,
	[Action] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupNewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblGroupRole]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TblGroupRole](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[GroupId] [bigint] NULL,
	[RoleId] [bigint] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblLog]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblLog](
	[LogId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[FromTime] [datetime] NULL,
	[ToTime] [datetime] NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblNewsDraff]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblNewsDraff](
	[NewsId] [bigint] IDENTITY(1,1) NOT NULL,
	[CodeNews] [bigint] NOT NULL,
	[GroupNewsId] [bigint] NULL,
	[Title] [nvarchar](500) NULL,
	[ShortContent] [nvarchar](1500) NULL,
	[Content] [ntext] NULL,
	[BigImage] [varchar](500) NULL,
	[SmaallImage] [varchar](500) NULL,
	[ReleaseUser] [varchar](50) NULL,
	[ReleaseDate] [datetime] NULL,
	[RelaseStatus] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
	[IsHome] [bit] NOT NULL CONSTRAINT [DF__TblNewsDr__IsHom__607251E5]  DEFAULT ('false'),
	[IsEvent] [bit] NOT NULL CONSTRAINT [DF__TblNewsDr__IsEve__6166761E]  DEFAULT ('false'),
	[Count] [int] NULL,
	[TitleEng] [nvarchar](500) NULL,
	[ShortContentEng] [nvarchar](1500) NULL,
	[ContentEng] [text] NULL,
	[IsWeek] [bit] NOT NULL CONSTRAINT [DF__TblNewsDr__IsWee__625A9A57]  DEFAULT ('false'),
	[Controller] [varchar](100) NULL,
	[Action] [varchar](100) NULL,
	[Metatitle] [varchar](150) NULL,
	[SubTitle] [nvarchar](500) NULL,
 CONSTRAINT [PK__TblNewsD__954EBDF388136B58] PRIMARY KEY CLUSTERED 
(
	[NewsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblRole]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblRole](
	[RoleId] [bigint] IDENTITY(1,1) NOT NULL,
	[Vie] [nvarchar](150) NULL,
	[Eng] [nvarchar](150) NULL,
	[Rus] [nvarchar](150) NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](250) NULL,
	[Controller] [varchar](50) NULL,
	[ConVie] [nvarchar](50) NULL,
	[ConEng] [nvarchar](50) NULL,
	[ConRus] [nvarchar](50) NULL,
	[Action] [varchar](50) NULL,
	[AcVie] [nvarchar](150) NULL,
	[AcEng] [nvarchar](150) NULL,
	[AcRus] [nvarchar](150) NULL,
	[Type] [varchar](10) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
 CONSTRAINT [PK__TblRole__8AFACE1A80DC0239] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblUnit]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblUnit](
	[UnitId] [varchar](10) NOT NULL,
	[Name] [varchar](250) NULL,
	[Phone] [varchar](30) NULL,
	[Fax] [varchar](30) NULL,
	[Email] [varchar](100) NULL,
	[Status] [bit] NULL,
	[Address] [nvarchar](250) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UnitId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblUser]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblUser](
	[Username] [varchar](50) NOT NULL,
	[IsUserAd] [bit] NULL,
	[Password] [nvarchar](150) NULL,
	[Name] [nvarchar](100) NULL,
	[Email] [varchar](100) NULL,
	[Phone] [varchar](30) NULL,
	[Mobile] [varchar](30) NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](250) NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblUserGroup]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblUserGroup](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[GroupId] [bigint] NULL,
	[Status] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblUserUnit]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TblUserUnit](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](50) NULL,
	[UnitId] [varchar](10) NULL,
	[Status] [bit] NULL,
	[CreateUser] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[EditUser] [varchar](50) NULL,
	[EditDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TblChart] ON 

INSERT [dbo].[TblChart] ([id], [src1], [src2], [src3], [src4], [src5], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (1, N'/Data/images/IMG_5008.JPG', N'/Data/images/IMG_5009.JPG', N'/Data/images/IMG_5035.JPG', N'/Data/images/S%C3%A2n%20Tr%C6%B0%E1%BB%9Dng.JPG', N'/Data/images/IMG_5022.JPG', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblChart] OFF
SET IDENTITY_INSERT [dbo].[TblComment] ON 

INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd], [TimeVisit], [UserQoute], [Qoute]) VALUES (222, N'gfghgfhghfhfhfgh', N'&lt;script&gt;alert(&quot;Hello! I am an alert box!&quot;);&lt;/script&gt;', NULL, 178, CAST(N'2016-11-05 00:04:12.987' AS DateTime), 0, CAST(N'2016-11-05 00:04:12.987' AS DateTime), NULL, NULL)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd], [TimeVisit], [UserQoute], [Qoute]) VALUES (223, N'dsfasdfgfdfgd', N'<br />
&lt;script&gt;alert(&quot;Hello! I am an alert box!&quot;);&lt;/script&gt;', NULL, 178, CAST(N'2016-11-05 00:04:40.120' AS DateTime), 0, CAST(N'2016-11-05 00:04:40.120' AS DateTime), N'gfghgfhghfhfhfgh', N'&lt;script&gt;alert(&quot;Hello! I am an alert box!&quot;);&lt;/script&gt;')
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd], [TimeVisit], [UserQoute], [Qoute]) VALUES (224, N'sfadfsad', N'fsadf', NULL, 210, CAST(N'2016-11-08 20:03:00.797' AS DateTime), 0, CAST(N'2016-11-08 20:03:00.797' AS DateTime), NULL, NULL)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd], [TimeVisit], [UserQoute], [Qoute]) VALUES (225, N'gfdgfgsfg', N'fgsdfgdfgs', NULL, 210, CAST(N'2016-11-08 20:03:39.867' AS DateTime), 0, CAST(N'2016-11-08 20:03:39.867' AS DateTime), N'sfadfsad', N'fsadf')
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd], [TimeVisit], [UserQoute], [Qoute]) VALUES (226, N'admin', N'fasdfasdfsdf', NULL, 210, CAST(N'2016-11-08 20:04:23.923' AS DateTime), 1, NULL, NULL, NULL)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd], [TimeVisit], [UserQoute], [Qoute]) VALUES (227, N'admin', N'fsdfasfasdfasdf', NULL, 210, CAST(N'2016-11-08 20:04:29.543' AS DateTime), 1, CAST(N'2016-11-08 20:04:29.543' AS DateTime), N'admin', N'fasdfasdfsdf')
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd], [TimeVisit], [UserQoute], [Qoute]) VALUES (228, N'admin', N'fasdfasd', NULL, 210, CAST(N'2016-11-08 20:04:37.513' AS DateTime), 1, CAST(N'2016-11-08 20:04:37.513' AS DateTime), N'admin', N'fsdfasfasdfasdf')
SET IDENTITY_INSERT [dbo].[TblComment] OFF
SET IDENTITY_INSERT [dbo].[TblGallery] ON 

INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (3, N'nhà chính', N'/Data/images/IMG_5011.JPG', NULL, N'hungph', CAST(N'2016-09-23 17:17:52.140' AS DateTime), NULL, NULL, N'nha chinh')
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (6, N'sân chào cờ', N'/Data/images/IMG_5011.JPG', NULL, N'hungph', CAST(N'2016-09-23 18:05:29.937' AS DateTime), NULL, NULL, N'san chao co')
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (7, N'nhà hiệu bộ', N'/Data/images/IMG_5035(1).JPG', NULL, N'hungph', CAST(N'2016-09-23 18:05:37.870' AS DateTime), NULL, NULL, N'nha hieu bo')
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (9, N'cổng trường', N'/Data/images/IMG_5009.JPG', NULL, N'admin', CAST(N'2016-09-23 19:02:48.793' AS DateTime), NULL, NULL, N'cong truong')
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (10, N'phòng tin học', N'/Data/images/IMG_5032.JPG', NULL, N'hungph', CAST(N'2016-09-26 14:25:54.167' AS DateTime), NULL, NULL, N'phong tin hoc')
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (11, N'sân thể dục', N'/Data/images/IMG_5022.JPG', NULL, N'hungph', CAST(N'2016-09-26 19:46:40.187' AS DateTime), NULL, NULL, N'san the duc')
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (16, N'bắp', N'/Data/images/image.jpeg', NULL, N'admin', CAST(N'2016-11-01 17:11:25.343' AS DateTime), NULL, NULL, N'bap')
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate], [SubName]) VALUES (19, N'wahthe fuck', N'/Data/images/IMG_5008.JPG', NULL, N'admin', CAST(N'2016-11-07 20:43:38.840' AS DateTime), NULL, NULL, N'wahthe fuck')
SET IDENTITY_INSERT [dbo].[TblGallery] OFF
SET IDENTITY_INSERT [dbo].[TblGroupNews] ON 

INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (1, N'TRANG CHỦ', 1, N'hunph', NULL, NULL, NULL, NULL, NULL, N'TRANG CHỦ', 0, 0, N'Home/Index', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (2, N'TRƯỜNG HỌC', 1, N'hunph', NULL, NULL, NULL, NULL, NULL, N'TRƯỜNG HỌC', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (3, N'LỊCH SỬ', 1, N'hungph', NULL, NULL, NULL, NULL, 2, N'TRƯỜNG HỌC/LỊCH SỬ', 0, 0, N'Home/History', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (4, N'THÀNH TÍCH', 1, N'hungph', NULL, NULL, NULL, NULL, 2, N'TRƯỜNG HỌC/THÀNH TÍCH', 0, 0, N'Home/Award', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (5, N'BAN GIÁM HIỆU', 1, N'hungph', NULL, NULL, NULL, NULL, 2, N'TRƯỜNG HỌC/BAN GIÁM HIỆU', 0, 0, N'Home/Administrators', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (6, N'HOẠT ĐỘNG', 1, N'hungph', NULL, NULL, NULL, NULL, 2, N'TRƯỜNG HỌC/HOẠT ĐỘNG', 0, 0, N'Home/Activities', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (7, N'GIÁO DỤC', 1, N'hungph', NULL, NULL, NULL, NULL, NULL, N'GIÁO DỤC', 0, 0, N'Home/education', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (8, N'CƠ SỞ VẬT CHẤT', 1, N'hungph', NULL, NULL, NULL, NULL, NULL, N'CƠ SỞ VẬT CHẤT', 0, 0, N'Home/Material', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (9, N'ĐỘI NGŨ GIÁO VIÊN', 1, N'hungph', NULL, NULL, NULL, NULL, NULL, N'ĐỘI NGŨ GIÁO VIÊN', 0, 0, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (10, N'TỔ KHOA HỌC TỰ NHIÊN', 1, N'hungph', NULL, NULL, NULL, NULL, 9, N'ĐỘI NGŨ GIÁO VIÊN/TỔ KHOA HỌC TỰ NHIÊN', 0, 0, N'Home/science', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (11, N'TỔ KHOA HỌC XÃ HỘI', 1, N'hungph', NULL, NULL, NULL, NULL, 9, N'ĐỘI NGŨ GIÁO VIÊN/TỔ KHOA HỌC XÃ HỘI', 0, 0, N'Home/Social', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (12, N'TỔ VĂN PHÒNG', 1, N'hungph', NULL, NULL, NULL, NULL, 9, N'ĐỘI NGŨ GIÁO VIÊN/TỔ VĂN PHÒNG', 0, 0, N'Home/Office', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (13, N'HỌC SINH TIÊU BIỂU', 1, N'hungph', NULL, NULL, NULL, NULL, NULL, N'HỌC SINH TIÊU BIỂU', 0, 0, N'Home/Student', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (14, N'TIN TỨC', 1, N'hungph', NULL, NULL, NULL, NULL, NULL, N'TIN TỨC', 0, 0, N'Home/News', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblGroupNews] ([GroupNewsId], [Name], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate], [Ord], [ParentId], [Path], [IsMenu], [IsHome], [UrlPath], [NameEng], [PathEng], [UrlPathEng], [Controller], [Action]) VALUES (15, N'LIÊN HỆ', 1, N'hungph', NULL, NULL, NULL, NULL, NULL, N'LIÊN HỆ', 0, 0, N'Home/Contact', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblGroupNews] OFF
SET IDENTITY_INSERT [dbo].[TblNewsDraff] ON 

INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (26, 0, 1, N'THÔNG ĐIỆP CỦA HIỆU TRƯỞNG', N'test', N'<img alt="" src="/Data/images/IMG_4998.JPG" style="height:133px; width:200px" /><br />
Trường Trung học cơ sở Thị trấn Tứ Kỳ l&agrave; nơi học tập của biết bao thế hệ học sinh từ thời kh&aacute;ng chiến chống Ph&aacute;p. Ng&agrave;y đầu th&agrave;nh lập, trường chỉ c&oacute; hai&nbsp;lớp với hơn 60 học sinh. Tuy cơ sở vật chất c&ograve;n kh&oacute; khăn nhưng thầy v&agrave; tr&ograve; vẫn lu&ocirc;n lu&ocirc;n cố gắng ho&agrave;n th&agrave;nh nhiệm vụ dạy v&agrave; học m&agrave; nh&agrave; nước v&agrave; nh&acirc;n d&acirc;n giao ph&oacute;. Trải qua 50 năm ph&aacute;t triển, Trường THCS Thị trấn Tứ Kỳ đ&atilde; trở th&agrave;nh l&aacute; cờ ti&ecirc;n phong trong phong tr&agrave;o gi&aacute;o dục của huyện Tứ Kỳ n&oacute;i ri&ecirc;ng v&agrave; tỉnh Hải Dương n&oacute;i chung. Ban gi&aacute;m hiệu, c&aacute;n bộ cũng như học sinh của trường đ&atilde; v&agrave; đang tham gia nhiều phong tr&agrave;o t&iacute;ch cực như:<br />
<br />
-<em>&nbsp;Trường học th&acirc;n thiện, học sinh t&iacute;ch cực.<br />
<br />
- N&oacute;i kh&ocirc;ng với ti&ecirc;u cực trong thi cử.<br />
<br />
- Học tập v&agrave; l&agrave;m theo tấm gương đạo đức Hồ Ch&iacute; Minh.</em><br />
<br />
Trong tương lai, thầy v&agrave; tr&ograve; Trường THCS Thị trấn Tứ Kỳ quyết t&acirc;m phấn đấu đạt được nhiều th&agrave;nh t&iacute;ch mới v&agrave; ph&aacute;t huy những điểm mạnh đồng thời hạn chế những yếu k&eacute;m c&ograve;n tồn tại<br />
<br />
Xin cảm ơn<br />
<br />
Phạm Xu&acirc;n Sang<br />
<br />
Hiệu trưởng Trường trung học cơ sở Thị trấn Tứ Kỳ', N'/Images/defaultimage.jpg', NULL, NULL, CAST(N'2016-10-28 20:47:20.727' AS DateTime), NULL, N'admin', CAST(N'2016-09-21 20:17:24.130' AS DateTime), NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'thong-diep-cua-hieu-truong', N'thong diep cua hieu truong')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (27, 0, 1, N'BAN GIÁM HIỆU', NULL, N'<table border="0" cellpadding="1" cellspacing="1" class="table">
	<tbody>
		<tr>
			<td style="text-align:center"><span style="color:#ff0000"><strong>HIỆU TRƯỞNG</strong></span></td>
			<td style="text-align:center"><strong><span style="color:#ff0000">HIỆU PH&Oacute;</span></strong></td>
			<td style="text-align:center"><strong><span style="color:#ff0000">CHỦ TỊCH C&Ocirc;NG ĐO&Agrave;N</span></strong></td>
		</tr>
		<tr>
			<td><img alt="" src="/Images/defaultimage.jpg" style="height:100%; width:100%" /></td>
			<td><img alt="" src="/Images/defaultimage.jpg" style="height:100%; width:100%" /></td>
			<td><img alt="" src="/Images/defaultimage.jpg" style="height:100%; width:100%" /></td>
		</tr>
	</tbody>
</table>
', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-21 20:36:38.230' AS DateTime), NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'BAN-GIAM-HIEU', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (28, 0, 3, N'LỊCH SỬ', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, CAST(N'2016-10-28 20:42:27.637' AS DateTime), NULL, N'admin', CAST(N'2016-09-21 22:02:22.790' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'lich-su', N'lich su')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (29, 0, 4, N'THÀNH TÍCH', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:02:36.850' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'THANH-TICH', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (30, 0, 5, N'BAN GIÁM HIỆU', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, CAST(N'2016-10-28 20:42:40.780' AS DateTime), NULL, N'admin', CAST(N'2016-09-21 22:02:56.530' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'BAN-GIAM-HIEU', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (31, 0, 6, N'HOẠT ĐỘNG', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:03:07.933' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'HOAT-DONG', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (32, 0, 7, N'GIÁO DỤC', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:51:26.233' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'GIAO-DUC', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (33, 0, 8, N'CƠ SỞ VẬT CHẤT', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:51:49.457' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'CO-SO-VAT-CHAT', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (35, 0, 11, N'TỔ KHOA HỌC XÃ HỘI', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:52:32.247' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'TO-KHOA-HOC-XA-HOI', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (36, 0, 12, N'TỔ VĂN PHÒNG', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:52:48.507' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'TO-VAN-PHONG', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (37, 0, 13, N'HỌC SINH TIÊU BIỂU', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:53:12.577' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'HOC-SINH-TIEU-BIEU', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (38, 0, 15, N'LIÊN HỆ', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:53:23.720' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'LIEN-HE', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (139, 0, 10, N'TỔ KHOA HỌC TỰ NHIÊN', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-26 20:15:34.200' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (178, 0, 14, N'Những công nghệ cũ Apple đã khai tử trên dòng MacBook Pro 2016', N'<a href="https://tinhte.vn/tags/macbook-pro/" title="">MacBook Pro</a>&nbsp;ra mắt với nhiều c&ocirc;ng nghệ v&agrave; t&iacute;nh năng phần cứng mới, nhưng điều n&agrave;y cũng c&oacute; nghĩa l&agrave; nhiều c&ocirc;ng nghệ cũ đ&atilde; bị bỏ đi khỏi chiếc m&aacute;y n&agrave;y. Ở thời gian đầu, n&oacute;i g&igrave; th&igrave; n&oacute;i chắc chắn việc kh&ocirc;ng c&ograve;n sử dụng những thứ như cổng USB truyền thống, khe thẻ nhớ SD hay cổng HDMI sẽ khiến ch&uacute;ng ta gặp kh&oacute; khăn. H&atilde;y xem thử những c&ocirc;ng nghệ n&agrave;o đ&atilde; bị&nbsp;<a href="https://tinhte.vn/tags/apple/" title="">Apple</a>&nbsp;khai tử khỏi d&ograve;ng&nbsp;<a href="https://tinhte.vn/tags/macbook/" title="">MacBook</a>&nbsp;Pro Late 2016 của m&igrave;nh nh&eacute;.', N'<a href="https://tinhte.vn/tags/macbook-pro/" title="">MacBook Pro</a>&nbsp;ra mắt với nhiều c&ocirc;ng nghệ v&agrave; t&iacute;nh năng phần cứng mới, nhưng điều n&agrave;y cũng c&oacute; nghĩa l&agrave; nhiều c&ocirc;ng nghệ cũ đ&atilde; bị bỏ đi khỏi chiếc m&aacute;y n&agrave;y. Ở thời gian đầu, n&oacute;i g&igrave; th&igrave; n&oacute;i chắc chắn việc kh&ocirc;ng c&ograve;n sử dụng những thứ như cổng USB truyền thống, khe thẻ nhớ SD hay cổng HDMI sẽ khiến ch&uacute;ng ta gặp kh&oacute; khăn. H&atilde;y xem thử những c&ocirc;ng nghệ n&agrave;o đ&atilde; bị&nbsp;<a href="https://tinhte.vn/tags/apple/" title="">Apple</a>&nbsp;khai tử khỏi d&ograve;ng&nbsp;<a href="https://tinhte.vn/tags/macbook/" title="">MacBook</a>&nbsp;Pro Late 2016 của m&igrave;nh nh&eacute;.<br />
<br />
<strong>Tr&aacute;i t&aacute;o ph&aacute;t s&aacute;ng</strong><br />
<br />
Từng l&agrave; biểu tượng của MacBook, từng l&agrave; niềm ki&ecirc;u h&atilde;nh của người d&ugrave;ng Mac, giờ đ&acirc;y tr&aacute;i t&aacute;o tr&ecirc;n d&ograve;ng MacBook Pro 2016 đ&atilde; kh&ocirc;ng c&ograve;n ph&aacute;t s&aacute;ng. Logo n&agrave;y chỉ đơn giản l&agrave; được mạ b&oacute;ng l&ecirc;n giống như MacBook 12&quot; hiện tại m&agrave; th&ocirc;i. C&oacute; người n&oacute;i rằng Apple kh&ocirc;ng c&ograve;n l&agrave;m t&aacute;o s&aacute;ng nữa l&agrave; v&igrave; m&agrave;n h&igrave;nh của thiết bị qu&aacute; mỏng, c&oacute; người n&oacute;i Apple l&agrave;m như vậy l&agrave; cho đồng bộ với iPhone iPad. Apple chưa từng c&ocirc;ng bố l&yacute; do ch&iacute;nh thức n&agrave;o cả...<br />
<br />
<strong>Cổng sạc&nbsp;<a href="https://tinhte.vn/tags/magsafe/" title="">MagSafe</a></strong><br />
<br />
Thật tiếc khi Apple đ&atilde; kh&ocirc;ng c&ograve;n sử dụng cổng sạc rất tuyệt vời n&agrave;y. MagSafe l&agrave; c&ocirc;ng nghệ đ&atilde; xuất hiện từ rất l&acirc;u tr&ecirc;n MacBook để cung cấp một c&aacute;ch sạc vừa nhanh, vừa nhẹ nh&agrave;ng: bạn đưa đầu c&aacute;p lại gần cổng sạc, hai ch&uacute;ng n&oacute; tự h&iacute;t v&agrave;o nhau bằng nam ch&acirc;m. Xong. Việc gỡ ra cũng rất nhẹ nh&agrave;ng, v&agrave; đặc biệt khi ai đ&oacute; đi ngang v&ocirc; t&igrave;nh quẹt phải d&acirc;y th&igrave; cũng kh&ocirc;ng k&eacute;o laptop rớt xuống đất theo. MagSafe đ&atilde; l&ecirc;n tới đời thứ 2 với thiết kế mỏng hơn v&agrave;o năm 2012.<br />
<br />
Nhưng tr&ecirc;n MacBook Pro 2016, Apple đ&atilde; chuyển sang d&ugrave;ng cổng&nbsp;<a href="https://tinhte.vn/tags/usb-c/" title="">USB-C</a>&nbsp;ho&agrave;n to&agrave;n. C&oacute; tới 4 cổng USB-C, cổng n&agrave;y cũng c&oacute; thể d&ugrave;ng để sạc cả, nhưng kh&ocirc;ng c&aacute;i n&agrave;o c&oacute; cơ chế h&iacute;t nam ch&acirc;m theo c&aacute;ch m&agrave; MagSafe hoạt động. Cũng dễ hiểu th&ocirc;i khi m&agrave; cổng USB-C y&ecirc;u cầu đầu đực phải cắm rất s&acirc;u v&agrave;o đầu c&aacute;i, kh&ocirc;ng thể nằm hờ b&ecirc;n ngo&agrave;i được. Bye bye MagSafe, anh sẽ rất nhớ em.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/10/3898921_Apple_macBook_Pro_cong_nghe_cu_2.jpg" style="height:100%; width:100%" /><br />
<br />
<strong>Cổng USB-A</strong><br />
<br />
MacBook Pro 2016 kh&ocirc;ng phải l&agrave; chiếc m&aacute;y t&iacute;nh đầu ti&ecirc;n chỉ x&agrave;i cổng USB-C. MacBook 12&quot; hồi năm ngo&aacute;i mới l&agrave; chiếc đầu ti&ecirc;n, sau đ&oacute; nhiều m&aacute;y Windows cũng đ&atilde; l&agrave;m theo. Điều n&agrave;y cũng đồng nghĩa với việc chia tay cổng USB-A truyền thống - ch&iacute;nh l&agrave; cổng USB m&agrave; ch&uacute;ng ta đ&atilde; rất quen thuộc v&agrave; vẫn c&ograve;n đang được hỗ trợ bởi rất nhiều thiết bị ngoại vi tr&ecirc;n thị trường. Bạn sẽ phải mua th&ecirc;m một mớ adapter để x&agrave;i với những thiết bị cũ, bạn sẽ phải mua c&aacute;p USB-C - HDMI để c&oacute; thể d&ugrave;ng với m&agrave;n h&igrave;nh ngo&agrave;i, bạn sẽ phải mua c&aacute;p USB-C - Lightning để x&agrave;i được với ngay cả iPhone. Thời gian đầu sẽ kh&ocirc;ng hề dễ chịu ch&uacute;t n&agrave;o, m&agrave; lại c&ograve;n tốn tiền nữa.<br />
<br />
Nhưng chỉ trong khoảng cuối năm nay hoặc giữa năm, mọi thứ sẽ trở n&ecirc;n dễ chịu hơn. Cổng USB-C đang được c&aacute;c nh&agrave; sản xuất điện thoại v&agrave; h&atilde;ng phụ kiện t&iacute;ch cực &aacute;p dụn cho những sản phẩm mới của họ. Sẽ chẳng bao l&acirc;u nữa thị trường sẽ tr&agrave;n ngập thiết bị ngoại vi c&oacute; cổng USB-C, l&uacute;c đ&oacute; bạn sẽ kh&ocirc;ng c&ograve;n phải lo lắng về chuyện tương th&iacute;ch.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/10/3898922_Apple_macBook_Pro_cong_nghe_cu_3.jpeg" style="height:100%; width:100%" /><br />
<br />
Đồng &yacute; c&aacute;ch l&agrave;m n&agrave;y của Apple hơi cực đoan, nhưng n&oacute; sẽ cần thiết để chiếc MacBook Pro của bạn kh&ocirc;ng bị lỗi thời trong nhiều năm sắp tới, v&agrave; cũng l&agrave; một động th&aacute;i để th&uacute;c đẩy thị trường USB-C. Phải c&oacute; những c&aacute;i t&ecirc;n lớn như Apple quyết liệt bỏ cổng cũ th&igrave; ch&uacute;ng ta mới c&oacute; một tương lai tốt hơn.<br />
<br />
&Agrave;, vẫn c&ograve;n jack tai nghe 3,5mm chứ kh&ocirc;ng bỏ đi như iPhone 7 nh&eacute;&nbsp;<img alt=":D" src="https://tinhte.vn/styles/default/xenforo/clear.png" title="Big Grin :D" /><br />
<br />
<strong>Khe thẻ SD</strong><br />
<br />
Bạn c&oacute; thể để &yacute; l&agrave; từ trước tới nay Apple kh&ocirc;ng mấy ưa thẻ SD. M&atilde;i đến năm 2008 khi c&ocirc;ng ty ra mắt MacBook với thiết kế Unibody th&igrave; khe SD mới được t&iacute;ch hợp l&ecirc;n m&aacute;y, trong khi chuẩn bộ nhớ n&agrave;y đ&atilde; được sử dụng rộng r&atilde;i từ rất l&acirc;u rồi. Sau 8 năm, Apple lại một lần nữa bỏ khe SD khỏi d&ograve;ng m&aacute;y t&iacute;nh x&aacute;ch tay của m&igrave;nh.<br />
<br />
Đ&acirc;y l&agrave; thay đổi m&agrave; m&igrave;nh nghĩ rằng nhiều anh em sẽ kh&ocirc;ng th&iacute;ch, v&agrave; bản th&acirc;n m&igrave;nh cũng thế. Thẻ SD vẫn c&ograve;n đang được sử dụng v&ocirc; c&ugrave;ng rộng r&atilde;i, v&agrave; điều đ&aacute;ng n&oacute;i l&agrave; vẫn chưa c&oacute; giải ph&aacute;p n&agrave;o thay thế n&oacute; như kiểu USB-C thay cho USB-A. Như vậy, anh em n&agrave;o sắm MacBook Pro 2016 về sẽ phải mua adapter đổi từ USB-C sang khe SD, hoặc mua adapter USB-C sang USB thường v&agrave; cắm đầu đọc hiện tại của m&igrave;nh v&agrave;o. Với những anh em chụp h&igrave;nh nhiều th&igrave; sẽ kh&oacute; chịu đ&acirc;y.<br />
<br />
Apple nghĩ g&igrave; khi bỏ khe SD? C&oacute; thể h&atilde;ng nghĩ rằng rất nhiều m&aacute;y ảnh hiện tại đ&atilde; c&oacute; chức năng truyền ảnh qua Wi-Fi n&ecirc;n kh&ocirc;ng cần đầu đọc truyền thống nữa? H&atilde;ng nghĩ rằng ch&uacute;ng ta c&oacute; thể x&agrave;i c&aacute;p để nối camera với laptop? Đ&acirc;y l&agrave; một quyết định kh&aacute; kh&oacute; hiểu tr&ecirc;n MacBook Pro 2016.<br />
<br />
<strong>HDMI</strong><br />
<br />
Bye bye HDMI, cổng USB-C giờ sẽ thay chỗ cho bạn. Nhưng c&aacute; nh&acirc;n m&igrave;nh chắc chắn vẫn sẽ phải đi t&igrave;m đầu đổi hay c&aacute;p đổi v&igrave; m&agrave;n h&igrave;nh v&agrave; m&aacute;y chiếu trong c&ocirc;ng ty m&igrave;nh vẫn c&ograve;n đang x&agrave;i HDMI, chưa c&oacute; c&aacute;i n&agrave;o d&ugrave;ng USB-C cả.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/10/3898922_Apple_macBook_Pro_cong_nghe_cu_3.jpeg" style="height:100%; width:100%" /><br />
<br />
<strong>Ph&iacute;m Esc v&agrave; Function</strong><br />
<br />
Ph&iacute;m Esc ng&agrave;y nay kh&ocirc;ng c&ograve;n nhiều gi&aacute; trị như trước. Ch&uacute;ng ta c&oacute; những n&uacute;t đ&oacute;ng hiển thị r&otilde; r&agrave;ng tr&ecirc;n c&aacute;c giao diện, từ web cho đến app native chạy tr&ecirc;n m&aacute;y, do đ&oacute; vai tr&ograve; của Esc kh&ocirc;ng c&ograve;n r&otilde; r&agrave;ng như xưa. Đ&uacute;ng l&agrave; vẫn c&ograve;n nhiều phần mềm dựa v&agrave;o n&uacute;t n&agrave;y để thực hiện thao t&aacute;c tho&aacute;t nhưng kh&ocirc;ng nhiều lắm. M&agrave; thực chất n&uacute;t Esc cũng kh&ocirc;ng phải biến mất ho&agrave;n to&agrave;n, bạn vẫn c&oacute; thể gọi n&oacute; l&ecirc;n bằng thanh&nbsp;<a href="https://tinhte.vn/tags/touch-bar/" title="">Touch Bar</a>&nbsp;n&ecirc;n cũng kh&ocirc;ng c&oacute; g&igrave; nghi&ecirc;m trọng nếu bạn cần sử dụng. Chỉ l&agrave; quyết định bỏ ph&iacute;m Esc vật l&yacute; sẽ l&agrave;m nhiều bạn bất ngờ m&agrave; th&ocirc;i.<br />
<br />
Ri&ecirc;ng h&agrave;ng ph&iacute;m Function, tr&ecirc;n Mac c&aacute;c ph&iacute;m n&agrave;y gần như kh&ocirc;ng c&ograve;n được sử dụng trong khoảng 7-8 năm trở lại đ&acirc;y. Kh&ocirc;ng c&oacute; bất k&igrave; shortcut n&agrave;o của hệ điều h&agrave;nh dựa v&agrave;o những ph&iacute;m Function, tương tự cho c&aacute;c app thứ ba ra đời trong khoảng 7 năm trở lại n&ecirc;n việc bỏ n&oacute; đi l&agrave; ho&agrave;n to&agrave;n hợp l&yacute;. M&igrave;nh đang thắc mắc kh&ocirc;ng biết khi c&agrave;i Windows l&ecirc;n th&igrave; dải Touch Bar mới của MacBook Pro sẽ hiển thị c&aacute;i g&igrave;. C&oacute; lẽ l&agrave; hiển thị chết h&agrave;ng ph&iacute;m Fn chăng v&igrave; m&igrave;nh biết hiện tại vẫn c&oacute; rất nhiều app Windows d&ugrave;ng h&agrave;ng ph&iacute;m n&agrave;y l&agrave;m shortcut.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/10/3898923_Apple_macBook_Pro_cong_nghe_cu_5.jpeg" style="height:100%; width:100%" /><br />
<br />
<strong><a href="https://tinhte.vn/tags/macbook-air/" title="">MacBook Air</a></strong><br />
<br />
Đ&uacute;ng, bạn kh&ocirc;ng nghe nhầm đ&acirc;u. MacBook Pro ra mắt đ&atilde; khiến MacBook Air chuẩn bị chết! MacBook Pro 13&quot; mới c&oacute; một option rẻ nhất, v&agrave; Apple đ&atilde; n&oacute;i tr&ecirc;n s&acirc;n khấu rằng họ muốn thiết bị n&agrave;y trở th&agrave;nh một lựa chọn trung cấp cho những ai muốn mua MacBook. Họ đưa ra một số l&yacute; do như mỏng hơn, mạnh hơn MacBook Air để thuyết phục người d&ugrave;ng. Vấn đề l&agrave; mức gi&aacute; cho chiếc MacBook Pro 2016 mới bắt đầu từ 1400$, r&otilde; l&agrave; cao hơn so với mức 1000$ của MacBook Air hiện tại n&ecirc;n sẽ hạn chế rất nhiều người tiếp cận với d&ograve;ng sản phẩm n&agrave;y.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/10/3898920_MacBook_Air_2015.jpg" style="height:100%; width:100%" /><br />
<br />
<br />
Thực chất MacBook Air hiện vẫn c&ograve;n được Apple tiếp tục b&aacute;n ch&iacute;nh thức &iacute;t nhất l&agrave; trong 1 năm tới đ&acirc;y, nhưng chỉ c&ograve;n model 13&quot; th&ocirc;i, bỏ lu&ocirc;n bản 11&quot; rồi. C&oacute; lẽ Apple đang b&aacute;n cho hết lượng h&agrave;ng c&ograve;n tồn kho m&agrave; th&ocirc;i. L&uacute;c n&agrave;y, nếu bạn muốn mua một chiếc MacBook gi&aacute; rẻ th&igrave; lựa chọn tốt nhất của bạn sẽ l&agrave; MacBook Pro 13&quot; đời cũ hoặc MacBook 12&quot; mới.<br />
<br />
T&oacute;m lại, dải sản phẩm mới của Apple sẽ như sau:
<ul>
	<li>MacBook 12&quot; Retina mỏng nhẹ, rẻ nhất</li>
	<li>MacBook Pro 13&quot; kh&ocirc;ng c&oacute; Touch Bar cho những ai cần m&aacute;y mạnh nhưng kh&ocirc;ng sẵn s&agrave;ng chi nhiều tiền</li>
	<li>MacBook Pro 13&quot; v&agrave; 15&quot; c&oacute; Touch Bar cho những người c&oacute; hầu bao rộng r&atilde;i hơn</li>
	<li>MacBook Air sẽ bị khai tử sớm, kh&ocirc;ng c&ograve;n liệt v&agrave;o danh s&aacute;ch.</li>
</ul>
<strong><a href="https://tinhte.vn/tags/o-quang/" title="">Ổ quang</a></strong><br />
<br />
Ủa l&agrave; sao? Apple đ&atilde; bỏ ổ quang từ năm 2012 rồi cơ m&agrave;? &Agrave; kh&ocirc;ng hẳn, bởi Apple vẫn c&ograve;n b&aacute;n MacBook Pro 13&quot; đời 2011 trong một thời gian d&agrave;i sau đ&oacute; nữa, v&agrave; chiếc m&aacute;y n&agrave;y vẫn c&ograve;n d&ugrave;ng ổ quang. Giờ th&igrave; thiết bị đ&oacute; cũng đ&atilde; ngừng b&aacute;n ho&agrave;n to&agrave;n, loại bỏ hẳn ổ quang ra khỏi tất cả sản phẩm m&aacute;y t&iacute;nh Apple, kể cả desktop. Xin tạm biệt ổ quang.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/10/3898924_Apple_macBook_Pro_cong_nghe_cu_4.jpeg" style="height:100%; width:100%" />', N'/Images/defaultimage.jpg', NULL, NULL, CAST(N'2016-11-15 13:12:29.980' AS DateTime), NULL, N'admin', CAST(N'2016-10-28 15:04:00.700' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'nhung-cong-nghe-cu-apple-da-khai-tu-tren-dong-macbook-pro-2016', N'nhung cong nghe cu apple da khai tu tren dong macbook pro 2016')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (210, 0, 14, N'dsfadf', N'fasdfs', N'fasdfsdf', NULL, NULL, NULL, CAST(N'2016-11-08 20:04:37.533' AS DateTime), NULL, N'admin', CAST(N'2016-11-08 13:58:18.447' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'dsfadf', N'dsfadf')
SET IDENTITY_INSERT [dbo].[TblNewsDraff] OFF
SET IDENTITY_INSERT [dbo].[TblRole] ON 

INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (1, N'xem thông tin danh sách đơn vị', NULL, NULL, 1, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblUnitListIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (2, N'xem thông tin danh sách đơn vị', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thốn', NULL, NULL, N'TblUnitList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (3, N'xóa đơn vị', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblUnitDelete', NULL, NULL, NULL, N'DELETE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (4, N'cập nhật đơn vị', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblUnitUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (5, N'tạo mới đơn vị', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblUnitCreate', NULL, NULL, NULL, N'CREATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (6, N'xem thông tin danh sách nhóm', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupListIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (7, N'xem thông tin danh sách nhóm', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (8, N'xóa nhóm', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupDelete', NULL, NULL, NULL, N'DELETE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (9, N'tạo nhóm', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupCreate', NULL, NULL, NULL, N'CREATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (10, N'cập nhật nhóm', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (11, N'xem thông tin danh sách người dùng', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblUserListIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (12, N'xem thông tin cá nhân', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblUserList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (14, N'cập nhật thông tin người dùng', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblUserUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (15, N'xem thông tin nhóm tin', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupNewsIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (16, N'xem thông tin nhóm tin', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupNewsList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (17, N'xóa nhóm tin', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupNewsDelete', NULL, NULL, NULL, N'DELETE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (18, N'tạo nhóm tin', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupNewsCreate', NULL, NULL, NULL, N'CREATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (19, N'cập nhật nhóm tin', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGroupNewsUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (20, N'xem thông tin chi tiêt tin tức', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblNewsDraffListIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (21, N'xem thông tin chi tiết tin tức', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblNewsDraffList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (22, N'xóa tin tức', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblNewsDraffDelete', NULL, NULL, NULL, N'DELETE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (23, N'tạo mới tin tức', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblNewsDraffCreate', NULL, NULL, NULL, N'CREATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (24, N'cập nhật tin tức', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblNewsDraffUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (25, N'cập nhật ảnh slide', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblChartUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (26, N'xem thông tin dan sách học sinh ưu tú', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGoodStudentListIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (27, N'xem thông tin danh sách học sinh ưu tú', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGoodStudentList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (28, N'xóa thông tin học sinh ưu tú', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGoodStudentDelete', NULL, NULL, NULL, N'DELETE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (29, N'tạo thông tin học sinh ưu tứ', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGoodStudentCreate', NULL, NULL, NULL, N'CREATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (30, N'cập nhật thông tin danh sách học sinh ưu tú', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblGoodStudentUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (31, N'xem thông tin danh sách giáo viên', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblTeacherListIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (32, N'xem thông tin danh sách giáo viên', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblTeacherList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (33, N'xóa thông tin giáo viên', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblTeacherListDelete', NULL, NULL, NULL, N'DELETE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (34, N'tạo mới thông tin giáo viên', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblTeacherListCreate', NULL, NULL, NULL, N'CREATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (35, N'cập nhật thông tin giáo viên', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblTeacherListUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (36, N'xem thôn tin danh sách lớp ', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblClassListIndex', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (37, N'xem thông tin danh sách lớp học', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblClassList', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (38, N'xóa thông tin lớp học', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblClassListDelete', NULL, NULL, NULL, N'DELETE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (39, N'tạo mới lớp học', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblClassListCreate', NULL, NULL, NULL, N'CREATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (40, N'cập nhật lớp học', NULL, NULL, NULL, NULL, N'Admin', N'quản trị hệ thống', NULL, NULL, N'TblClassListUpdate', NULL, NULL, NULL, N'UPDATE', NULL, NULL, NULL, NULL)
INSERT [dbo].[TblRole] ([RoleId], [Vie], [Eng], [Rus], [Status], [Description], [Controller], [ConVie], [ConEng], [ConRus], [Action], [AcVie], [AcEng], [AcRus], [Type], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (41, N'hiển thị thông tin ra trang chủ', NULL, NULL, NULL, NULL, N'Home', N'trang chủ', NULL, NULL, N'Index', NULL, NULL, NULL, N'VIEW', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblRole] OFF
INSERT [dbo].[TblUser] ([Username], [IsUserAd], [Password], [Name], [Email], [Phone], [Mobile], [Status], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (N'admin', 1, N'21232f297a57a5a743894a0e4a801fc3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblUser] ([Username], [IsUserAd], [Password], [Name], [Email], [Phone], [Mobile], [Status], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (N'hieutruong', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'Hiệu Trưởng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblUser] ([Username], [IsUserAd], [Password], [Name], [Email], [Phone], [Mobile], [Status], [Description], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (N'hungph', 1, N'c4ca4238a0b923820dcc509a6f75849b', N'Phạm Huy Hùng', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
ALTER TABLE [dbo].[TblComment]  WITH CHECK ADD  CONSTRAINT [FK_TblComment_TblNewsDraff] FOREIGN KEY([NewsId])
REFERENCES [dbo].[TblNewsDraff] ([NewsId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblComment] CHECK CONSTRAINT [FK_TblComment_TblNewsDraff]
GO
ALTER TABLE [dbo].[TblFileNewsDraff]  WITH CHECK ADD  CONSTRAINT [FK_TblFileNewsDraff_TblFile] FOREIGN KEY([FileId])
REFERENCES [dbo].[TblFile] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblFileNewsDraff] CHECK CONSTRAINT [FK_TblFileNewsDraff_TblFile]
GO
ALTER TABLE [dbo].[TblFileNewsDraff]  WITH CHECK ADD  CONSTRAINT [FK_TblFileNewsDraff_TblNewsDraff] FOREIGN KEY([NewsId])
REFERENCES [dbo].[TblNewsDraff] ([NewsId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[TblFileNewsDraff] CHECK CONSTRAINT [FK_TblFileNewsDraff_TblNewsDraff]
GO
ALTER TABLE [dbo].[TblGallery]  WITH CHECK ADD  CONSTRAINT [FK_TblGallery_TblGroupNews] FOREIGN KEY([GroupNewsId])
REFERENCES [dbo].[TblGroupNews] ([GroupNewsId])
GO
ALTER TABLE [dbo].[TblGallery] CHECK CONSTRAINT [FK_TblGallery_TblGroupNews]
GO
ALTER TABLE [dbo].[TblGroupRole]  WITH CHECK ADD  CONSTRAINT [FK_TblGroupRole_TblGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[TblGroup] ([GroupId])
GO
ALTER TABLE [dbo].[TblGroupRole] CHECK CONSTRAINT [FK_TblGroupRole_TblGroup]
GO
ALTER TABLE [dbo].[TblGroupRole]  WITH CHECK ADD  CONSTRAINT [FK_TblGroupRole_TblRole] FOREIGN KEY([RoleId])
REFERENCES [dbo].[TblRole] ([RoleId])
GO
ALTER TABLE [dbo].[TblGroupRole] CHECK CONSTRAINT [FK_TblGroupRole_TblRole]
GO
ALTER TABLE [dbo].[TblNewsDraff]  WITH CHECK ADD  CONSTRAINT [FK_TblNewsDraff_TblGroupNews] FOREIGN KEY([GroupNewsId])
REFERENCES [dbo].[TblGroupNews] ([GroupNewsId])
GO
ALTER TABLE [dbo].[TblNewsDraff] CHECK CONSTRAINT [FK_TblNewsDraff_TblGroupNews]
GO
ALTER TABLE [dbo].[TblUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_TblUserGroup_TblGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[TblGroup] ([GroupId])
GO
ALTER TABLE [dbo].[TblUserGroup] CHECK CONSTRAINT [FK_TblUserGroup_TblGroup]
GO
ALTER TABLE [dbo].[TblUserGroup]  WITH CHECK ADD  CONSTRAINT [FK_TblUserGroup_TblUser] FOREIGN KEY([Username])
REFERENCES [dbo].[TblUser] ([Username])
GO
ALTER TABLE [dbo].[TblUserGroup] CHECK CONSTRAINT [FK_TblUserGroup_TblUser]
GO
ALTER TABLE [dbo].[TblUserUnit]  WITH CHECK ADD  CONSTRAINT [FK_TblUserUnit_TblUnit] FOREIGN KEY([UnitId])
REFERENCES [dbo].[TblUnit] ([UnitId])
GO
ALTER TABLE [dbo].[TblUserUnit] CHECK CONSTRAINT [FK_TblUserUnit_TblUnit]
GO
ALTER TABLE [dbo].[TblUserUnit]  WITH CHECK ADD  CONSTRAINT [FK_TblUserUnit_TblUserUnit] FOREIGN KEY([UserName])
REFERENCES [dbo].[TblUser] ([Username])
GO
ALTER TABLE [dbo].[TblUserUnit] CHECK CONSTRAINT [FK_TblUserUnit_TblUserUnit]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Count_Commnet]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_Count_Commnet]
@currenttime datetime,
@newsid bigint,
@seen bit
as
begin
if(@seen='false')
select COUNT(Id) from TblComment where (CreateDate>=@currenttime and CreateDate<=GETDATE()) and NewsId=@newsid
end

GO
/****** Object:  StoredProcedure [dbo].[Sp_User_Login]    Script Date: 11/22/2016 12:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Sp_User_Login]
@username varchar(50),
@password nvarchar(150)
as
begin
declare @count int
declare @res bit
select @count=COUNT(*) from TblUser us where us.Username=@username and us.Password=@password
if(@count>0)
set @res=1
else
set
@res=0
select @res
end
GO
USE [master]
GO
ALTER DATABASE [TkSchoolNews] SET  READ_WRITE 
GO
