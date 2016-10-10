USE [TkSchoolNews]
GO
/****** Object:  FullTextCatalog [TKDatabaseFullTextCatalog]    Script Date: 10/7/2016 3:45:30 PM ******/
CREATE FULLTEXT CATALOG [TKDatabaseFullTextCatalog]WITH ACCENT_SENSITIVITY = ON
AS DEFAULT

GO
/****** Object:  Table [dbo].[TblChart]    Script Date: 10/7/2016 3:45:30 PM ******/
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
/****** Object:  Table [dbo].[TblComment]    Script Date: 10/7/2016 3:45:31 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblFile]    Script Date: 10/7/2016 3:45:31 PM ******/
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
 CONSTRAINT [PK_TblFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TblFileNewsDraff]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblGallery]    Script Date: 10/7/2016 3:45:31 PM ******/
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
 CONSTRAINT [PK__TblGalle__3214EC07CE473C78] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TblGroup]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblGroupNews]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblGroupRole]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblLog]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblNewsDraff]    Script Date: 10/7/2016 3:45:31 PM ******/
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
	[IsHome] [bit] NOT NULL DEFAULT ('false'),
	[IsEvent] [bit] NOT NULL DEFAULT ('false'),
	[Count] [int] NULL,
	[TitleEng] [nvarchar](500) NULL,
	[ShortContentEng] [nvarchar](1500) NULL,
	[ContentEng] [text] NULL,
	[IsWeek] [bit] NOT NULL DEFAULT ('false'),
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
/****** Object:  Table [dbo].[TblRole]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblUnit]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblUser]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblUserGroup]    Script Date: 10/7/2016 3:45:31 PM ******/
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
/****** Object:  Table [dbo].[TblUserUnit]    Script Date: 10/7/2016 3:45:31 PM ******/
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

INSERT [dbo].[TblChart] ([id], [src1], [src2], [src3], [src4], [src5], [Status], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (1, N'/Data/images/IMG_5009.JPG', N'/Data/images/IMG_5008.JPG', N'/Data/images/IMG_5009.JPG', N'/Data/images/IMG_5011.JPG', N'/Data/images/IMG_5035(1).JPG', NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblChart] OFF
SET IDENTITY_INSERT [dbo].[TblComment] ON 

INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (8, N'đội trưởng đội dưa hấu', N'kinh v&atilde;i&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/ops.gif" style="height:40px; width:40px" title="" />', NULL, 17, CAST(N'2016-09-24 21:41:28.143' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (9, N'tôm càng xanh continue lengend', N'con n&agrave;y m&agrave; thịt th&igrave; ngon vl&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/band.gif" style="height:68px; width:80px" title="" />', NULL, 17, CAST(N'2016-09-24 21:42:57.007' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (11, N'đội trưởng đội dưa hấu', N'<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;t&ocirc;m c&agrave;ng xanh continue lengend</strong><br />
con n&agrave;y m&agrave; thịt th&igrave; ngon vl&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/band.gif" style="height:68px; width:80px" title="" /></blockquote>
</div>
<br />
<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/puke.gif" style="height:25px; width:65px" title="" />', NULL, 17, CAST(N'2016-09-24 22:06:56.183' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (14, N'google', N'xe đẹp v&atilde;i&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/dribble.gif" style="height:40px; width:40px" title="" />', NULL, 14, CAST(N'2016-09-24 22:15:06.160' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (15, N'microsoft', N'<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;google</strong><br />
xe đẹp v&atilde;i&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/dribble.gif" style="height:40px; width:40px" title="" /></blockquote>
</div>
cũng b&igrave;nh thường', NULL, 14, CAST(N'2016-09-24 22:15:45.167' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (16, N'testwweb', N'<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;microsoft</strong>
<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;google</strong><br />
xe đẹp v&atilde;i&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/dribble.gif" style="height:40px; width:40px" title="" /></blockquote>
</div>
cũng b&igrave;nh thường</blockquote>
</div>
fdfdfdfdfdfd', NULL, 14, CAST(N'2016-09-24 22:16:52.940' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (30, N'cảnh sát giao thông', N'<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;t&ocirc;m c&agrave;ng xanh continue lengend</strong><br />
con n&agrave;y m&agrave; thịt th&igrave; ngon vl&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/band.gif" style="height:68px; width:80px" title="" /></blockquote>
</div>
<br />
ăn thịt c&aacute; sấu dai nh&aacute;ch ấy&nbsp;<img alt=":badsmelly:" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/bad_smelly.gif" style="height:40px; width:40px" title=":badsmelly:" />', NULL, 17, CAST(N'2016-09-25 01:59:03.197' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (32, N'admin', N'đẹp qu&aacute;&nbsp;<img alt=":adore:" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/adore.gif" style="height:40px; width:40px" title=":adore:" />', NULL, 81, CAST(N'2016-09-25 13:07:03.127' AS DateTime), 1)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (33, N'lê tuấn anh', N'ước g&igrave; được v&agrave;o đ&acirc;y một lần&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/still_dreaming.gif" style="height:40px; width:40px" title="" />', NULL, 81, CAST(N'2016-09-25 13:09:41.177' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (39, N'test69', N'đẹp v&atilde;i&nbsp;', NULL, 81, CAST(N'2016-09-26 00:12:44.417' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (43, N'overwatch', N'Theo truyền thống, c&aacute;c h&atilde;ng điện thoại di động xem kỹ thuật như lợi thế cạnh tranh cốt l&otilde;i nhưng thường thu&ecirc; thiết kế b&ecirc;n ngo&agrave;i. Nokia, ngược lại, lại cam kết sử dụng c&aacute;c chuy&ecirc;n gia thiết kế của m&igrave;nh v&agrave; mời Nuovo về từ Designworks, cho &ocirc;ng một nh&oacute;m v&agrave; studio ri&ecirc;ng tại Calabasas, California. Do kh&ocirc;ng c&oacute; chỉ thị r&otilde; r&agrave;ng về điện thoại kế tiếp, &ocirc;ng xem như c&aacute;i cớ để s&aacute;ng tạo.&nbsp;<em>&ldquo;Ch&uacute;ng t&ocirc;i bắt đầu nghĩ, &ldquo;H&atilde;y đổi mới h&igrave;nh dạng v&agrave; kiểu d&aacute;ng&rdquo;&rdquo;,</em>&nbsp;Nuovo hồi tưởng.', NULL, 84, CAST(N'2016-09-26 00:34:24.753' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (46, N'紫冥#51932', N'<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;overwatch</strong><br />
Theo truyền thống, c&aacute;c h&atilde;ng điện thoại di động xem kỹ thuật như lợi thế cạnh tranh cốt l&otilde;i nhưng thường thu&ecirc; thiết kế b&ecirc;n ngo&agrave;i. Nokia, ngược lại, lại cam kết sử dụng c&aacute;c chuy&ecirc;n gia thiết kế của m&igrave;nh v&agrave; mời Nuovo về từ Designworks, cho &ocirc;ng một nh&oacute;m v&agrave; studio ri&ecirc;ng tại Calabasas, California. Do kh&ocirc;ng c&oacute; chỉ thị r&otilde; r&agrave;ng về điện thoại kế tiếp, &ocirc;ng xem như c&aacute;i cớ để s&aacute;ng tạo.&nbsp;<em>&ldquo;Ch&uacute;ng t&ocirc;i bắt đầu nghĩ, &ldquo;H&atilde;y đổi mới h&igrave;nh dạng v&agrave; kiểu d&aacute;ng&rdquo;&rdquo;,</em>&nbsp;Nuovo hồi tưởng.</blockquote>
</div>
&nbsp;thấy đ&uacute;ng m&agrave;', NULL, 84, CAST(N'2016-09-26 00:40:21.050' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (47, N'rồ mẽo', N'nếu nokia chạy android th&igrave; c&oacute; khi đ&atilde; kh&aacute;c<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/doubt.gif" style="height:40px; width:40px" title="" />', NULL, 84, CAST(N'2016-09-26 14:16:20.870' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (49, N'nokia lumia', N'nh&igrave;n h&igrave;nh cũng b&oacute;ng bẩy phết&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/smile.gif" style="height:40px; width:40px" title="" />', NULL, 86, CAST(N'2016-09-26 14:34:29.060' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (50, N'we are vozer', N'<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;nokia lumia</strong><br />
nh&igrave;n h&igrave;nh cũng b&oacute;ng bẩy phết&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/smile.gif" style="height:40px; width:40px" title="" /></blockquote>
</div>
<br />
HTC thiết kế đẹp, phần mềm cũng được m&agrave; kh&ocirc;ng hiểu sao lại lỗ, c&ograve;n kh&ocirc;ng bằng mấy c&aacute;i điện thoại t&agrave;u như oppo&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/pudency.gif" style="height:40px; width:40px" title="" />', NULL, 86, CAST(N'2016-09-26 14:37:23.677' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (51, N'test 123', N'<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/lmao.gif" style="height:33px; width:65px" title="" />&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/hehe.gif" style="height:20px; width:20px" title="" />', NULL, 88, CAST(N'2016-09-27 17:26:13.343' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (53, N'le1tuans', N'kiểu n&agrave;y th&igrave; mấy em rx460 ăn c&aacute;m rồi&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/cheers.gif" style="height:30px; width:58px" title="" />', NULL, 88, CAST(N'2016-09-27 19:26:39.340' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (54, N'sky''ssss', N'<div>
<blockquote><strong>b&igrave;nh luận của&nbsp;le1tuans</strong><br />
kiểu n&agrave;y th&igrave; mấy em rx460 ăn c&aacute;m rồi&nbsp;<img alt="" src="http://localhost:63277/assets/plugins/ckeditor/plugins/smiley/images/msn/cheers.gif" style="height:30px; width:58px" title="" /></blockquote>
</div>
<br />
chẳng qua c&aacute;i driver của AMD như beep kh&ocirc;ng th&igrave; biết tay nhau ngay', NULL, 88, CAST(N'2016-09-27 19:27:27.507' AS DateTime), 0)
INSERT [dbo].[TblComment] ([Id], [Name], [Content], [ParentId], [NewsId], [CreateDate], [IsAd]) VALUES (59, N'ffffffffffffffffffffffffffff', N'ffffffffffffffffffffffffff', NULL, 88, CAST(N'2016-09-30 14:31:32.790' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TblComment] OFF
SET IDENTITY_INSERT [dbo].[TblFile] ON 

INSERT [dbo].[TblFile] ([Id], [Directory], [Name], [Content], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (21, N'~/App_Data/Uploads/', N'DS HOC SINH LOP 7,8,9 NAM HOC 16-17.xls', NULL, N'hungph', CAST(N'2016-09-23 00:12:32.407' AS DateTime), NULL, NULL)
INSERT [dbo].[TblFile] ([Id], [Directory], [Name], [Content], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (22, N'~/App_Data/Uploads/', N'danh sách lớp 6 2016 - 2017.xls', NULL, N'hungph', CAST(N'2016-09-23 00:12:38.413' AS DateTime), NULL, NULL)
INSERT [dbo].[TblFile] ([Id], [Directory], [Name], [Content], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (23, N'~/App_Data/Uploads/', N'DANH SÁCH GIÁO VIÊN.doc', NULL, N'hungph', CAST(N'2016-09-23 00:23:16.053' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblFile] OFF
SET IDENTITY_INSERT [dbo].[TblFileNewsDraff] ON 

INSERT [dbo].[TblFileNewsDraff] ([Id], [FileId], [NewsId], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (28, 22, 169, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblFileNewsDraff] ([Id], [FileId], [NewsId], [CreateUser], [CreateDate], [EditUser], [EditDate]) VALUES (29, 22, 170, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[TblFileNewsDraff] OFF
SET IDENTITY_INSERT [dbo].[TblGallery] ON 

INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate]) VALUES (3, N'nhà chính', N'/Data/images/IMG_5008.JPG', NULL, N'hungph', CAST(N'2016-09-23 17:17:52.140' AS DateTime), NULL, NULL)
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate]) VALUES (6, N'sân chào cờ', N'/Data/images/IMG_5011.JPG', NULL, N'hungph', CAST(N'2016-09-23 18:05:29.937' AS DateTime), NULL, NULL)
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate]) VALUES (7, N'nhà hiệu bộ', N'/Data/images/IMG_5035(1).JPG', NULL, N'hungph', CAST(N'2016-09-23 18:05:37.870' AS DateTime), NULL, NULL)
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate]) VALUES (9, N'cổng trường', N'/Data/images/IMG_5009.JPG', NULL, N'admin', CAST(N'2016-09-23 19:02:48.793' AS DateTime), NULL, NULL)
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate]) VALUES (10, N'phòng tin học', N'/Data/images/IMG_5032.JPG', NULL, N'hungph', CAST(N'2016-09-26 14:25:54.167' AS DateTime), NULL, NULL)
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate]) VALUES (11, N'sân thể dục', N'/Data/images/IMG_5022.JPG', NULL, N'hungph', CAST(N'2016-09-26 19:46:40.187' AS DateTime), NULL, NULL)
INSERT [dbo].[TblGallery] ([Id], [Name], [ImageUrl], [GroupNewsId], [CreateUser], [Createdate], [EditUser], [EditDate]) VALUES (12, N'trường học', N'/Data/images/IMG_5018.JPG', NULL, N'hungph', CAST(N'2016-09-26 19:47:44.560' AS DateTime), NULL, NULL)
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

INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (12, 0, 14, N'Cảnh sát giao thông cẩu xe có người bên trong là đúng hay sai?', N'<p>test</p>
', N'<p>Ng&agrave;y 13/9 b&agrave; Trần Thị H&agrave; (36 tuổi, ngụ thị x&atilde; Long Kh&aacute;nh, Đồng Nai) l&aacute;i &ocirc;t&ocirc; vượt đ&egrave;n v&agrave;ng, bị CSGT ra hiệu dừng xe, y&ecirc;u cầu xuất tr&igrave;nh giấy tờ. Tuy nhi&ecirc;n, b&agrave; H&agrave; kh&ocirc;ng chấp h&agrave;nh v&agrave; bất ngờ tăng tốc bỏ chạy.</p>

<p>Sau đ&oacute;, tổ CSGT đ&atilde; truy đuổi kịp v&agrave; tiếp tục y&ecirc;u cầu t&agrave;i xế xuất tr&igrave;nh giấy tờ nhưng b&agrave; H&agrave; vẫn kh&ocirc;ng hợp t&aacute;c, kh&ocirc;ng chịu ra khỏi xe.&nbsp;Sau một hồi thuyết phục kh&ocirc;ng th&agrave;nh,&nbsp;lực lượng chức năng đ&atilde;&nbsp;<a href="http://vnexpress.net/tin-tuc/thoi-su/giao-thong/csgt-cau-oto-cung-nu-tai-xe-ve-tram-lap-bien-ban-3467496.html" target="_blank">điều xe cẩu k&eacute;o cả xe v&agrave; t&agrave;i xế về Trạm CSGT&nbsp;</a>Ng&atilde; ba Th&aacute;i Lan&nbsp;để xử l&yacute; theo quy định.</p>

<p>Sau đ&oacute;,&nbsp;<a href="http://vnexpress.net/tin-tuc/phap-luat/nu-tai-xe-bi-cau-oto-se-nop-phat-gan-5-trieu-dong-3467896.html" target="_blank">nữ t&agrave;i xế bị phạt 5 triệu đồng</a>&nbsp;v&igrave; phạm 6 lỗi: kh&ocirc;ng chấp h&agrave;nh t&iacute;n hiệu đ&egrave;n, kh&ocirc;ng chấp h&agrave;nh hiệu lệnh, kh&ocirc;ng mang bảo hiểm xe, kh&ocirc;ng mang bằng l&aacute;i, kh&ocirc;ng c&oacute; đăng kiểm xe, kh&ocirc;ng mang theo giấy tờ xe.</p>

<p>Ng&agrave;y 14/9,&nbsp;nữ t&agrave;i xế n&agrave;y chia sẻ &quot;khi bị cảnh s&aacute;t y&ecirc;u cầu dừng lại v&igrave; vượt đ&egrave;n v&agrave;ng, t&ocirc;i đ&atilde; y&ecirc;u cầu xem bằng chứng phạm luật th&igrave; thấy một cảnh s&aacute;t &quot;ngoắc ngoắc&quot;. T&ocirc;i tưởng được đi n&ecirc;n l&ecirc;n xe chạy đến c&ocirc;ng ty th&igrave; bị&nbsp;CSGT đuổi theo n&oacute;i kh&ocirc;ng chấp h&agrave;nh hiệu lệnh.&nbsp;T&ocirc;i đề nghị cho xem h&igrave;nh ảnh vi phạm nhưng chờ l&acirc;u n&ecirc;n t&ocirc;i n&oacute;i để t&ocirc;i v&agrave;o b&aacute;o c&aacute;o cho sếp người nước ngo&agrave;i l&iacute; do đến trễ&quot;.</p>

<p>L&yacute; giải việc m&igrave;nh ở tr&ecirc;n xe, nữ t&agrave;i xế n&oacute;i trước đ&oacute; bị rớt ch&igrave;a kh&oacute;a n&ecirc;n ở lại t&igrave;m: &quot;Tr&ecirc;n xe c&oacute; gần một tỷ đồng trả lương c&ocirc;ng nh&acirc;n n&ecirc;n t&ocirc;i li&ecirc;n tục hỏi ai lượm được ch&igrave;a kho&aacute; xe nhưng kh&ocirc;ng thấy ai trả lời.&nbsp;T&ocirc;i sợ người lượm được ch&igrave;a kho&aacute; sẽ lấy tiền, giấy tờ n&ecirc;n xin anh cảnh s&aacute;t cho thời gian t&igrave;m ch&igrave;a kho&aacute;&quot;.</p>

<p>&quot;C&ograve;n cảnh s&aacute;t n&oacute;i t&ocirc;i kh&ocirc;ng t&ocirc;n trọng họ n&ecirc;n hối xe cẩu đến cẩu cả t&ocirc;i lẫn xe về trạm&quot;. &gt;&nbsp;<a href="http://vitalk.vn/threads/nu-tai-xe-bi-cau-ca-xe-va-nguoi-tuyen-bo-se-kien-csgt-neu-chi-dung-va-du-bang-chung.2437412/" target="_blank"><strong>Xem chi tiết</strong></a></p>

<p>Vụ việc hiện đang g&acirc;y tranh c&atilde;i về c&aacute;c vần đề sau:</p>

<p>-&nbsp;H&agrave;nh động cẩu xe&nbsp;của CSGT khi c&oacute;&nbsp;người đang ngồi trong xe&nbsp;l&agrave; đ&uacute;ng hay sai?&nbsp;</p>

<p>- Tại sao nữ t&agrave;i xế kh&ocirc;ng gọi điện b&aacute;o sếp m&agrave; cứ lao xe đi khi c&ocirc;ng an đang y&ecirc;u cầu dừng?</p>

<p>- Ở quanh đ&oacute; c&oacute; rất nhiều c&ocirc;ng an, tại sao b&agrave; H&agrave; lại sợ mất một tỷ đồng?&nbsp;</p>
', N'http://st.vitalk.vn/img/2016/9_14/anh-1-ba-tran-thi-ha-ke-lai-su-viec-2-14_2n601ts1lk2pt.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-16 18:19:15.203' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'canh-sat-giao-thong-cau-xe-co-nguoi-ben-trong-la-dung-hay-sai', N'canh sat giao thong cau xe co nguoi ben trong la dung hay sai?')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (13, 0, 14, N'Vòng năm Ngoại hạng Anh: Man City trên đà chiến thắng', N'<p>Man City đứng trước cơ hội nối d&agrave;i mạch thắng khi tiếp Bournemouth trong khi Man Utd đối mặt với nguy cơ khủng hoảng nghi&ecirc;m trọng nếu kh&ocirc;ng đ&aacute;nh bại Watford.</p>
', N'<img alt="" src="http://img.f4.thethao.vnecdn.net/2016/09/16/2016-09-11T164242Z-116613762-MT1ACI14605225-RTRMADP-3-SOCCER-ENGLAND-SWA-CHE-1473999571_660x0.jpg" style="height:480px; width:660px" />
<p><strong>Chelsea - Liverpool</strong>&nbsp;(2h thứ Bảy, 17/9): Lần gần nhất Chelsea thắng ba trận li&ecirc;n tiếp tr&ecirc;n s&acirc;n nh&agrave; l&agrave; v&agrave;o th&aacute;ng 5/2015 v&agrave; họ sẽ t&aacute;i hiện chiến t&iacute;ch đ&oacute; nếu hạ gục Liverpool.</p>

<p>Trận h&ograve;a tr&ecirc;n s&acirc;n Swansea cuối tuần trước khiến thầy tr&ograve; Antonio Conte đứt chuỗi trận thắng từ đầu m&ugrave;a v&agrave; hụt hơi trong cuộc đua ng&ocirc;i đầu với Man City. Tuy nhi&ecirc;n, khi được trở lại ph&aacute;o đ&agrave;i Stamford Bridge, nhiều khả năng họ sẽ lấy lại cảm gi&aacute;c chiến thắng.</p>

<p>Ở m&ugrave;a giải năm ngo&aacute;i, Chelsea chỉ thắng năm trong 19 trận tr&ecirc;n s&acirc;n nh&agrave;. Thực tế, họ gi&agrave;nh được nhiều chiến thắng hơn tr&ecirc;n s&acirc;n kh&aacute;ch. Những kết quả khả quan đầu m&ugrave;a giải năm nay, với phong độ ổn định tr&ecirc;n s&acirc;n nh&agrave;, l&agrave; dấu hiệu cho thấy Chelsea đ&atilde; sẵn s&agrave;ng trở lại với cuộc đua v&ocirc; địch.</p>

<p>Liverpool l&agrave; một trong năm đội đ&aacute;nh bại Chelsea ở Stamford Bridge m&ugrave;a giải năm ngo&aacute;i. Chiến thắng 4-1 trước ĐKVĐ Leicester v&ograve;ng trước l&agrave; c&uacute; h&iacute;ch tinh thần mạnh mẽ với đội qu&acirc;n của Jurgen Klopp đồng thời đưa họ trở th&agrave;nh đội b&oacute;ng ghi được nhiều b&agrave;n thắng nhất ở Ngoại hạng Anh trong năm 2016.<br />
<img alt="" src="http://img.f4.thethao.vnecdn.net/2016/09/16/2016-09-10T143545Z-116519745-MT1ACI14603308-RTRMADP-3-SOCCER-ENGLAND-ARS-SOT-1474000323_660x0.jpg" style="height:422px; width:660px" /><br />
<br />
<strong>Hull - Arsenal</strong>&nbsp;(21h thứ Bảy, 17/9): Bảy điểm sau bốn v&ograve;ng đấu l&agrave; kết quả tốt ngo&agrave;i mong đợi của Hull v&agrave; đội chủ nh&agrave; hy vọng sẽ c&oacute; điểm trước &aacute; qu&acirc;n m&ugrave;a trước.<br />
<br />
Hull chỉ k&eacute;m vị tr&iacute; thứ tư hai điểm v&agrave; đang bằng điểm với Arsenal. Một trong ba t&acirc;n binh của Ngoại hạng Anh m&ugrave;a giải n&agrave;y đang c&oacute; sự tự tin sau khởi đầu tốt. Tuy nhi&ecirc;n, lịch sử đối đầu kh&ocirc;ng ủng hộ đội chủ nh&agrave; ở trận đấu tới.<br />
<br />
Hull đ&aacute;nh bại Arsenal trong lần đầu ti&ecirc;n hai đội b&oacute;ng n&agrave;y gặp mặt tại Ngoại hạng Anh v&agrave;o năm 2008. Tuy nhi&ecirc;n, kể từ đ&oacute; trở đi, họ thua s&aacute;u trong bảy lần chạm tr&aacute;n tiếp theo. Ngo&agrave;i ra, trong bốn lần đối đầu đo&agrave;n qu&acirc;n của Arsene Wenger tại Cup FA, Hull to&agrave;n thua.<br />
<br />
Arsenal thắng năm trong s&aacute;u lần gần nhất h&agrave;nh qu&acirc;n đến s&acirc;n của Hull. Một chiến thắng nữa sẽ gi&uacute;p họ trở th&agrave;nh đội b&oacute;ng nhiều lần đ&aacute;nh bại đội chủ nh&agrave; nhất tr&ecirc;n s&acirc;n KC. Vấn đề với c&aacute;c học tr&ograve; của Wenger l&uacute;c n&agrave;y l&agrave; h&agrave;ng thủ. Trong trận h&ograve;a 1-1 với PSG ở Champions League. nếu Edinson Cavani dứt điểm tốt hơn, Arsenal đ&atilde; phải nhận một trận thua đậm ở Paris. T&acirc;n binh&nbsp;Shkodran Mustafi c&oacute; lẽ cần th&ecirc;m thời gian để h&ograve;a nhập.<br />
<br />
<img alt="" src="http://img.f1.thethao.vnecdn.net/2016/09/16/2016-08-20T182535Z-114719135-MT1ACI14578488-RTRMADP-3-SOCCER-ENGLAND-LEI-ARS-1474012385_660x0.jpg" style="height:440px; width:660px" /><br />
<br />
<strong>Leicester - Burnley</strong>&nbsp;(21h thứ Bảy, 17/9): M&ugrave;a giải năm nay chứng kiến lần thứ hai li&ecirc;n tiếp nh&agrave; ĐKVĐ Ngoại hạng Anh khởi đầu chiến dịch bảo vệ ng&ocirc;i vương với bốn điểm sau bốn trận đầu.<br />
<br />
Phong độ sụt giảm của Leicester kh&ocirc;ng g&acirc;y sốc như Chelsea c&aacute;ch đ&acirc;y một năm. Tuy nhi&ecirc;n, họ &iacute;t nhất kh&ocirc;ng muốn nhận một thất bại ở trận đấu thứ năm, điều m&agrave; Chelsea đ&atilde; tr&aacute;nh được năm ngo&aacute;i.&nbsp;<br />
<br />
Burnley c&oacute; phong độ tương đối ổn định thời gian gần đ&acirc;y nhưng Leicester bất bại trong ch&iacute;n lần gần nhất đối đầu đội b&oacute;ng xứ Wales. Lần gần nhất &quot;Bầy c&aacute;o&quot; thất thủ tr&ecirc;n s&acirc;n nh&agrave; trước một đội mới l&ecirc;n hạng tại Ngoại hạng Anh đ&atilde; l&agrave; từ năm 2001.<br />
<br />
Burnley thường xuy&ecirc;n để thủng lưới v&agrave;o cuối trận nhưng họ đ&atilde; thắng hai trong ba trận s&acirc;n kh&aacute;ch gần nhất tại Ngoại hạng Anh. Trước đ&oacute;, để đạt th&agrave;nh t&iacute;ch tương tự, họ phải trải qua 36 trận.<img alt="" src="http://img.f2.thethao.vnecdn.net/2016/09/16/2016-09-10T230748Z-116550468-MT1ACI14602889-RTRMADP-3-SOCCER-ENGLAND-MUN-MCI-1474013387_660x0.jpg" style="height:424px; width:660px" /><br />
<br />
&nbsp;</p>

<p><strong>Man City - Bournemouth</strong>&nbsp;(21h thứ Bảy, 17/9): Guardiola sẽ hướng đến việc c&acirc;n bằng kỷ lục to&agrave;n thắng s&aacute;u trận đầu m&ugrave;a giải do Carlo Ancelotti lập hồi c&ograve;n dẫn dắt Chelsea.</p>

<p>Man City l&agrave; đội duy nhất tại Ngoại hạng Anh thắng cả bốn trận đầu m&ugrave;a giải năm nay. D&ugrave; kh&ocirc;ng trận n&agrave;o giữ sạch lưới, đội b&oacute;ng của Pep Guardiola chưa một lần bị rơi v&agrave;o thế phải b&aacute;m đuổi tỷ số.&nbsp;</p>

<p>Ở m&ugrave;a giải năm ngo&aacute;i, Bournemouth thất bại trong cả hai trận lượt đi v&agrave; về trước Man City đều với c&aacute;ch biệt bốn b&agrave;n. Do đ&oacute;, nhiều người dự đo&aacute;n một chiến thắng đậm cho đội đầu bảng cuối tuần n&agrave;y.</p>

<p>Kelechi Iheanacho, người đ&oacute;ng g&oacute;p một b&agrave;n v&agrave; một đường kiến tạo ở trận thắng Man Utd 2-1, nhiều khả năng sẽ tiếp tục được đ&aacute; ch&iacute;nh v&igrave; Sergio Aguero vắng mặt. Tiền đạo người Nigeria thể hiện duy&ecirc;n ghi b&agrave;n khi sở hữu ch&iacute;n pha lập c&ocirc;ng chỉ sau 13 c&uacute; s&uacute;t tr&uacute;ng đ&iacute;ch.&nbsp;</p>
', N'http://img.f2.thethao.vnecdn.net/2016/09/16/2016-09-10T230748Z-116550468-MT1ACI14602889-RTRMADP-3-SOCCER-ENGLAND-MUN-MCI-1474013387_660x0.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-16 18:23:32.153' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'vong-nam-ngoai-hang-anh-man-city-tren-da-chien-thang', N'vong nam ngoai hang anh: man city tren da chien thang')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (14, 0, 14, N'Mercedes CL550 AMG giá 1,9 tỷ đồng ở Sài Gòn', N'<p>CL550 trang bị động cơ V8 dung t&iacute;ch 5,5 l&iacute;t, c&ocirc;ng suất 388 m&atilde; lực, đ&atilde;&nbsp;lăn b&aacute;nh hơn 110.000 km</p>
', N'<img alt="" src="http://img.f29.vnecdn.net/2016/09/16/DSC00219-6788-1473992908.jpg" style="height:275px; width:490px" />
<p>Tr&igrave;nh l&agrave;ng 2007, CL-class thế hệ thứ ba mang v&oacute;c d&aacute;ng hiện đại, thời trang v&agrave; rất c&aacute; t&iacute;nh. Phần th&acirc;n vuốt cong kiểu kh&iacute; động học giống S-class. Nhưng nhờ thiết kế 2 cửa coupe n&ecirc;n CL-class khỏe v&agrave; năng động hơn. Thu h&uacute;t sự ch&uacute; &yacute; nhất c&oacute; lẽ l&agrave; kết cấu cửa k&iacute;nh. Do kh&ocirc;ng sử dụng trục B n&ecirc;n ca-bin CL-class giống như một m&aacute;i v&ograve;m c&ocirc;ng nghệ cao.</p>

<p>Với chiều d&agrave;i 5 m, CL550 c&oacute; phần nhỉnh hơn BMW 650i Coupe đời 2007 khoảng 23 cm, phần lớn phần ch&ecirc;nh lệch chiều d&agrave;i n&agrave;y được ph&acirc;n bổ phần đầu xe. Phần th&acirc;n vuốt cong kiểu kh&iacute; động học nhưng nhờ thiết kế 2 cửa coupe n&ecirc;n CL-class khỏe v&agrave; năng động hơn. Thu h&uacute;t sự ch&uacute; &yacute; nhất c&oacute; lẽ l&agrave; kết cấu cửa k&iacute;nh.</p>

<p>Kh&ocirc;ng gian nội thất kh&ocirc;ng kh&aacute;c nhiều S-class với những chi tiết gỗ, da v&agrave; mạ kim loại cao cấp. C&aacute;c thiết bị c&oacute; thể vừa điều khiển trực tiếp hoặc th&ocirc;ng qua n&uacute;m điều khiển.</p>

<p>Phi&ecirc;n bản CL550 trang bị động cơ V8 dung t&iacute;ch 5,5 l&iacute;t, c&ocirc;ng suất 388 m&atilde; lực tại v&ograve;ng tua 6.000 v&ograve;ng/ph&uacute;t, m&ocirc;-men xoắn cực đại 530 Nm ở v&ograve;ng tua 2.000 v&ograve;ng/ph&uacute;t. Hộp số tự động 7 cấp 7G-Tronic. Thời gian tăng tốc từ vị tr&iacute; xuất ph&aacute;t l&agrave; 5,4 gi&acirc;y. Tốc độ tối đa ở mức 250 km/h.</p>

<p>Trong danh mục sản phẩm của Mercedes, CL-class l&agrave; d&ograve;ng coupe cỡ lớn, ph&aacute;t triển dựa tr&ecirc;n bản sedan hạng sang cao cấp S-class.&nbsp;Mercedes trang bị &iacute;t nhất l&agrave; động cơ V8 cho hầu hết c&aacute;c phi&ecirc;n bản CL. Thậm ch&iacute; CL65 AMG sử dụng động cơ V12.</p>
', N'http://img.f29.vnecdn.net/2016/09/16/DSC00219-6788-1473992908.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-16 18:29:37.430' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'mercedes-cl550-amg-gia-19-ty-dong-o-sai-gon', N'mercedes cl550 amg gia 1,9 ty dong o sai gon')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (16, 0, 14, N'“Lái xe buýt ở Hà Nội như siêu nhân, áp lực lớn, còn bị ghẻ lạnh”', N'<p>&ldquo;Với điều kiện như hiện nay, người l&aacute;i xe bu&yacute;t phải c&oacute; thần kinh th&eacute;p mới l&aacute;i được. Nhiều l&uacute;c t&ocirc;i n&oacute;i đ&ugrave;a họ l&agrave; những si&ecirc;u nh&acirc;n. Với &aacute;p lực lớn, nhưng t&ocirc;i c&oacute; cảm gi&aacute;c nghề l&aacute;i xe bu&yacute;t đang bị ghẻ lạnh&rdquo;, &ocirc;ng Nguyễn C&ocirc;ng Nhật &ndash; Ph&oacute; Tổng Gi&aacute;m đốc Tổng C&ocirc;ng ty Vận tải H&agrave; Nội n&oacute;i.</p>
', N'<p>Ng&agrave;y 16/9, UBND TP H&agrave; Nội tổ chức Hội thảo n&acirc;ng cao chất lượng v&agrave; ph&aacute;t triển vận tải h&agrave;nh kh&aacute;ch c&ocirc;ng cộng bằng xe bu&yacute;t ở Thủ đ&ocirc; giai đoạn 2016-2020, định hướng 2025. Theo định hướng đến năm 2020, vận tải h&agrave;nh kh&aacute;ch c&ocirc;ng cộng tr&ecirc;n địa b&agrave;n H&agrave; Nội đ&aacute;p ứng được 20% nhu cầu, đến năm 2025 đ&aacute;p ứng được 25%, trong đ&oacute; vận tải bằng xe bu&yacute;t vẫn l&agrave; chủ lực với sự hỗ trợ của c&aacute;c tuyến bu&yacute;t nhanh (BRT) v&agrave; đường sắt tr&ecirc;n cao.</p>

<p><strong>Cả Thủ đ&ocirc; c&oacute; 1,3km đường ri&ecirc;ng cho xe bu&yacute;t</strong></p>

<p>Tại hội thảo, &ocirc;ng Nguyễn Ho&agrave;ng Hải &ndash; Gi&aacute;m đốc Trung t&acirc;m Quản l&yacute; v&agrave; Điều h&agrave;nh giao th&ocirc;ng đ&ocirc; thị H&agrave; Nội cho biết, hiện tại tr&ecirc;n địa b&agrave;n th&agrave;nh phố c&oacute; 96 tuyến xe bu&yacute;t, trong đ&oacute; 75 tuyến trợ gi&aacute;, 12 tuyến bu&yacute;t kh&ocirc;ng trợ gi&aacute; v&agrave; 9 tuyến bu&yacute;t kế cận. Tr&ecirc;n to&agrave;n mạng lưới hiện c&oacute; 1.546 xe bu&yacute;t, d&ugrave; đ&atilde; được đầu tư n&acirc;ng cấp nhưng vẫn c&ograve;n nhiều phương tiện cũ. Việc sử dụng c&aacute;c phương tiện hiện tại dẫn tới một số hệ lụy như lượng kh&iacute; xả v&agrave;o m&ocirc;i trường cao, trung b&igrave;nh h&agrave;ng năm hệ thống ti&ecirc;u thụ cỡ 20.000 tấn diesel.<img alt="" src="https://dantri4.vcmedia.vn/k:9c72452778/2016/09/16/15-34819-1158e-1474019999616/laixebuytohanoinhusieunhanapluclonconbighelanh.jpg" style="float:left; height:300px; width:440px" /><br />
To&agrave;n th&agrave;nh phố H&agrave; Nội mới chỉ c&oacute; 1,3km đường d&agrave;nh ri&ecirc;ng cho xe bu&yacute;t (Ảnh: Việt Hưng)<br />
<br />
&nbsp;</p>

<p>D&ugrave; định hướng tương lai, vận tải h&agrave;nh kh&aacute;ch c&ocirc;ng cộng đ&aacute;p ứng nhu cầu ng&agrave;y c&agrave;ng lớn, trong đ&oacute; xe bu&yacute;t vẫn l&agrave; chủ lực nhưng &ocirc;ng Hải đưa ra cảnh b&aacute;o bắt đầu từ 2015 lượng h&agrave;nh kh&aacute;ch c&oacute; hiện tượng suy giảm, sản lượng đạt 431,9 triệu lượt kh&aacute;ch (năm 2014 đạt 469 triệu lượt kh&aacute;ch); 7 th&aacute;ng đầu năm 2016 sản lượng tiếp tục giảm 9,5% so với c&ugrave;ng kỳ. Nguy&ecirc;n nh&acirc;n được chỉ r&otilde; l&agrave; do dịch vụ xe bu&yacute;t bị x&aacute;o trộn, thiếu ổn định, kh&ocirc;ng hấp dẫn v&agrave; kh&ocirc;ng thuận tiện; Những yếu tố về lộ tr&igrave;nh c&ugrave;ng với &ugrave;n tắc giao th&ocirc;ng tr&ecirc;n tuyến vẫn tiếp tục diễn ra khiến thời gian chuyến đi tăng l&ecirc;n cũng l&agrave; một trong những nguy&ecirc;n nh&acirc;n.</p>

<p>&Ocirc;ng Nguyễn C&ocirc;ng Nhật - Ph&oacute; Tổng gi&aacute;m đốc tổng c&ocirc;ng ty vận tải H&agrave; Nội cho rằng, một trong những điều kiện ti&ecirc;n quyết để xe bu&yacute;t hoạt động l&agrave; đường d&agrave;nh ri&ecirc;ng. Tuy nhi&ecirc;n, hiện tr&ecirc;n địa chỉ c&oacute; 1,3km đường d&agrave;nh cho xe bu&yacute;t nhưng thực chất đ&acirc;y chỉ l&agrave; nh&aacute;nh của điểm trung chuyển. Ngo&agrave;i việc xe bu&yacute;t đi lại kh&oacute; khăn tr&ecirc;n đường, c&ograve;n việc ra v&agrave;o c&aacute;c điểm đ&oacute;n trả kh&aacute;ch rất dễ xung đột với phương tiện kh&aacute;c.</p>

<p>&ldquo;Gần như xe bu&yacute;t phải loay hoay len lỏi trong một rừng xe m&aacute;y. Với điều kiện như vậy, người l&aacute;i xe bu&yacute;t phải c&oacute; thần kinh th&eacute;p mới l&aacute;i được. Nhiều l&uacute;c t&ocirc;i n&oacute;i đ&ugrave;a họ l&agrave; những si&ecirc;u nh&acirc;n khi đối mặt với thực trạng giao th&ocirc;ng. Với &aacute;p lực lớn, nhưng t&ocirc;i c&oacute; cảm gi&aacute;c như nghề l&aacute;i xe bu&yacute;t đang bị ghẻ lạnh&rdquo;, &ocirc;ng Nguyễn C&ocirc;ng Nhật chia sẻ.</p>

<p><strong>&ldquo;Đầu t&agrave;u&rdquo; giảm phương tiện c&aacute; nh&acirc;n</strong></p>

<p>Ph&oacute; Gi&aacute;o sư, Tiến sĩ Từ Sỹ S&ugrave;a &ndash; Bộ m&ocirc;n Vận tải đường bộ v&agrave; th&agrave;nh phố (Đại học GTVT) đ&aacute;nh gi&aacute;, tại H&agrave; Nội, &ugrave;n tắc giao th&ocirc;ng ng&agrave;y c&agrave;ng phổ biến v&agrave; trầm trọng, nguy&ecirc;n nh&acirc;n ch&iacute;nh của vấn đề n&agrave;y xuất ph&aacute;t từ việc lựa chọn cơ cấu sử dụng phương tiện kh&ocirc;ng hợp l&yacute;. Số lượng phương tiện c&aacute; nh&acirc;n tăng nhanh ch&oacute;ng trong khi vận tải h&agrave;nh kh&aacute;ch c&ocirc;ng cộng thiếu về số lượng v&agrave; hạn chế về chất lượng.</p>

<p>Theo &ocirc;ng S&ugrave;a, tỷ lệ đ&aacute;p ứng hiện nay của xe bu&yacute;t tr&ecirc;n địa b&agrave;n H&agrave; Nội khoảng 10%, để tăng tỷ lệ đ&aacute;p ứng l&ecirc;n mức 15% sẽ cần th&ecirc;m khoảng 2.400 xe, mức 20% khoảng 3.300 xe. &ldquo;Với điều kiện hạ tầng như hiện nay, việc đưa th&ecirc;m số lượng phương tiện tr&ecirc;n v&agrave;o hoạt động l&agrave; hết sức kh&oacute; khăn&rdquo;, Ph&oacute; Gi&aacute;o sư S&ugrave;a n&oacute;i.</p>

<p>Tuy nhi&ecirc;n, theo Ph&oacute; Gi&aacute;o sư Từ Sỹ S&ugrave;a, H&agrave; Nội vẫn cần phải ki&ecirc;n định với chủ trương ph&aacute;t triển vận tải h&agrave;nh kh&aacute;ch c&ocirc;ng cộng l&agrave; giải ph&aacute;p cơ bản giải quyết &ugrave;n tắc giao th&ocirc;ng v&agrave; hạn chế phương tiện c&aacute; nh&acirc;n. Do vậy, để đảm b&aacute;o ph&aacute;t triển xe bu&yacute;t đ&aacute;p ứng nhu cầu của nh&acirc;n d&acirc;n, H&agrave; Nội cần phải đảm bảo chất lượng dịch vụ, trong đ&oacute; đặc biệt quan t&acirc;m đến chi ph&iacute; v&agrave; thời gian đi lại.</p>

<p>&Ocirc;ng Khuất Việt H&ugrave;ng - Ph&oacute; Chủ tịch chuy&ecirc;n tr&aacute;ch Ủy ban ATGT Quốc gia cho rằng, vận tải h&agrave;nh kh&aacute;ch c&ocirc;ng cộng cần phải chuẩn h&oacute;a c&aacute;c điều kiện tối thiểu về chất lượng dịch vụ, trong đ&oacute; ti&ecirc;u ch&iacute; số một l&agrave; phải đ&uacute;ng giờ ở tất cả c&aacute;c trạm dừng đỗ. Tuy nhi&ecirc;n, để l&agrave;m được điều đ&oacute; th&igrave; phải ưu ti&ecirc;n hạ tầng cho xe bu&yacute;t. Theo &ocirc;ng Khuất Việt H&ugrave;ng, trước mắt cần phải chấp nhận điều tiết quyền sử dụng đường của những loại phương tiện kh&aacute;c.</p>

<p>Ph&oacute; Chủ tịch chuy&ecirc;n tr&aacute;ch Ủy ban ATGT Quốc gia đ&aacute;nh gi&aacute; trở ngại lớn trong việc ph&aacute;t triển giao th&ocirc;ng c&ocirc;ng cộng hiện nay kh&ocirc;ng phải l&agrave; nguồn vốn m&agrave; l&agrave; tốc độ ra quyết định. Do vậy, về d&agrave;i hạn c&aacute;c cơ quan chức năng cần phải thay đổi tư duy l&agrave;m quy hoạch, từ quy hoạch chung đến quy hoạch ph&aacute;t triển c&aacute;c phương thức vận tải. &ldquo;Thời t&ocirc;i l&agrave;m chuy&ecirc;n m&ocirc;n, t&ocirc;i n&oacute;i ch&uacute;ng ta đang quy hoạch theo kiểu Th&aacute;nh Gi&oacute;ng, tức chỉ qua một đ&ecirc;m ch&uacute; b&eacute; 3 tuổi v&uacute;t l&ecirc;n th&agrave;nh Ph&ugrave; đổng Thi&ecirc;ng Vương&rdquo;, &ocirc;ng Khuất Việt H&ugrave;ng n&oacute;i.</p>

<p>Ngo&agrave;i ra, &ocirc;ng Khuất Việt H&ugrave;ng c&ograve;n đ&aacute;nh gi&aacute;, vận tải h&agrave;nh kh&aacute;ch c&ocirc;ng cộng v&ugrave;ng cũng c&oacute; &yacute; nghĩa cực kỳ quan trọng đối với H&agrave; Nội, đặc biệt trong đ&oacute; l&agrave; vấn đề giảm &ugrave;n tắc giao th&ocirc;ng ở cửa ng&otilde; v&agrave; giảm tai nạn giao th&ocirc;ng tr&ecirc;n c&aacute;c trục đường ch&iacute;nh ra v&agrave;o Thủ đ&ocirc;. Ch&iacute;nh v&igrave; vậy, &ocirc;ng H&ugrave;ng mong TP H&agrave; Nội phối hợp với Bộ GTVT kh&ocirc;ng chỉ l&agrave;m tốt vận tải h&agrave;nh kh&aacute;ch nội đ&ocirc; m&agrave; cả vận tải c&ocirc;ng cộng v&ugrave;ng để giảm &ugrave;n tắc v&agrave; tai nạn giao th&ocirc;ng.</p>

<p style="text-align:right"><strong>Quang Phong</strong></p>
', N'https://dantri4.vcmedia.vn/k:9c72452778/2016/09/16/15-34819-1158e-1474019999616/laixebuytohanoinhusieunhanapluclonconbighelanh.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-16 18:34:28.863' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'“lai-xe-buyt-o-ha-noi-nhu-sieu-nhan-ap-luc-lon-con-bi-ghe-lanh”', N'“lai xe buyt o ha noi nhu sieu nhan, ap luc lon, con bi ghe lanh”')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (17, 0, 14, N'Kinh hoàng cảnh rắn lớn châu Mỹ săn và nuốt sống cá sâu', N'Hai kẻ săn mồi tuyệt vời dưới nước l&agrave; rắn ch&acirc;u Mỹ v&agrave; c&aacute; sấu caiman gặp nhau ở trung t&acirc;m c&aacute;c khu rừng nhiệt đới v&agrave; kết quả chỉ c&oacute; một con c&ograve;n sống. C&uacute; ra đ&ograve;n nhanh như chớp của rắn Anaconda khổng lồ đ&atilde; kh&ocirc;ng cho c&aacute; sấu bất kỳ một cơ hội n&agrave;o.<br />
<br />
&nbsp;', N'<iframe allowfullscreen="" frameborder="0" height="357" scrolling="no" src="http://vcplayer.vcmedia.vn/1.1?_site=dantri&amp;vid=dantri/6unb7i5ueiv7mtcccccccccccckanv/2016/09/16/ran-1473990114185-60506.mp4&amp;_listsuggest=http://s1.dantri.com.vn/video/zone-0/suggest-videos.htm&amp;autoplay=false&amp;mute=false" width="606"></iframe>', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-16 18:36:41.193' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'kinh-hoang-canh-ran-lon-chau-my-san-va-nuot-song-ca-sau', N'kinh hoang canh ran lon chau my san va nuot song ca sau')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (26, 0, 1, N'THÔNG ĐIỆP CỦA HIỆU TRƯỞNG', NULL, N'<img alt="" src="/Data/images/IMG_4998.JPG" style="height:133px; width:200px" /><br />
Trường Trung học cơ sở Thị trấn Tứ Kỳ l&agrave; nơi học tập của biết bao thế hệ học sinh từ thời kh&aacute;ng chiến chống Ph&aacute;p. Ng&agrave;y đầu th&agrave;nh lập, trường chỉ c&oacute; 2<br />
lớp với hơn 60 học sinh. Tuy cơ sở vật chất c&ograve;n kh&oacute; khăn, thầy v&agrave; tr&ograve; thường xuy&ecirc;n phải sơ t&aacute;n nhưng vẫn kh&ocirc;ng c&aacute;n bộ, học sinh trường THCS Thị trấn Tứ Kỳ<br />
lu&ocirc;n khắc phục, vượt qua gian nan. Trải qua 50 năm ph&aacute;t triển, Trường THCS Thị trấn Tứ Kỳ đ&atilde; trở th&agrave;nh l&aacute; cờ ti&ecirc;n phong trong phong tr&agrave;o gi&aacute;o dục của huyện Tứ Kỳ n&oacute;i ri&ecirc;ng v&agrave; tỉnh Hải Dương n&oacute;i chung. Ban gi&aacute;m hiệu, c&aacute;n bộ cũng như học sinh của trường đ&atilde; v&agrave; đang tham gia nhiều phong tr&agrave;o t&iacute;ch cực như:<br />
<br />
-<em>&nbsp;Trường học th&acirc;n thiện, học sinh t&iacute;ch cực.<br />
<br />
- N&oacute;i kh&ocirc;ng với gian lận v&agrave; bệnh th&agrave;nh t&iacute;ch trong gi&aacute;o dục.<br />
<br />
- Học tập v&agrave; l&agrave;m theo tấm gương đạo đức Hồ Ch&iacute; Minh.</em><br />
<br />
Trong tương lai, thầy v&agrave; tr&ograve; Trường THCS Thị trấn Tứ Kỳ quyết t&acirc;m phấn đấu đạt được nhiều th&agrave;nh t&iacute;ch mới v&agrave; ph&aacute;t huy những điểm mạnh đồng thời hạn chế những yếu k&eacute;m c&ograve;n tồn tại<br />
<br />
Xin cảm ơn<br />
<br />
Phạm Xu&acirc;n Sang<br />
<br />
Hiệu trưởng Trường trung học cơ sở Thị trấn Tứ Kỳ', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 20:17:24.130' AS DateTime), NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'THONG-DIEP-CUA-HIEU-TRUONG', NULL)
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
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (28, 0, 3, N'LỊCH SỬ', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:02:22.790' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'lich-su', N'lich su')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (29, 0, 4, N'THÀNH TÍCH', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:02:36.850' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'THANH-TICH', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (30, 0, 5, N'BAN GIÁM HIỆU', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:02:56.530' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'BAN-GIAM-HIEU', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (31, 0, 6, N'HOẠT ĐỘNG', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:03:07.933' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'HOAT-DONG', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (32, 0, 7, N'GIÁO DỤC', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:51:26.233' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'GIAO-DUC', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (33, 0, 8, N'CƠ SỞ VẬT CHẤT', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:51:49.457' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'CO-SO-VAT-CHAT', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (35, 0, 11, N'TỔ KHOA HỌC XÃ HỘI', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:52:32.247' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'TO-KHOA-HOC-XA-HOI', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (36, 0, 12, N'TỔ VĂN PHÒNG', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:52:48.507' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'TO-VAN-PHONG', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (37, 0, 13, N'HỌC SINH TIÊU BIỂU', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:53:12.577' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'HOC-SINH-TIEU-BIEU', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (38, 0, 15, N'LIÊN HỆ', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-21 22:53:23.720' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, N'LIEN-HE', NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (67, 0, 14, N'[unboxing] his rx 470 iceq x² oc 4gb ship lazada', N'mới nhận đc con his 470 từ lazada<br />
c&oacute; chụp v&agrave;i ảnh cho ae n&agrave;o c&oacute; &yacute; định mua tham khảo&nbsp;<img alt="" src="https://vozforums.com/images/smilies/Off/big_smile.gif" title="Big Smile" /><br />
h&agrave;ng khi đ&oacute;ng g&oacute;i', N'<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_24_01_Pro_zpsdmvsfxp2.jpg" style="height:100%; width:100%" /><br />
<br />
mặt trước<br />
<br />
<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_24_38_Pro_zpsrxhusflp.jpg" style="height:100%; width:100%" /><br />
<br />
mặt sau<br />
<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_24_44_Pro_zpscxw22wkp.jpg" style="height:100%; width:100%" /><br />
<br />
mở hộp<br />
<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_25_33_Pro_zps7yapoevf.jpg" style="height:100%; width:100%" /><br />
<br />
<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_26_48_Pro_zps9opocuqf.jpg" style="height:100%; width:100%" /><br />
<br />
<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_26_53_Pro_zpssaxli1zo.jpg" style="height:100%; width:100%" /><br />
<br />
<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_26_59_Pro_zpsvkkqs2ok.jpg" style="height:100%; width:100%" /><br />
<br />
hảng của m&igrave;nh l&agrave; tem của TPStore<br />
<img alt="" src="http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_27_10_Pro_zps92xc3ucx.jpg" style="height:100%; width:100%" /><br />
<br />
Fan card chỉ quay khi đặt 60 độ trở l&ecirc;n, l&agrave;m l&uacute;c đầu m&igrave;nh tưởng quạt t&egrave;o ko quay&nbsp;<img alt="" src="https://vozforums.com/images/smilies/Off/nosebleed.gif" title="Nose Bleedding" />', N'http://i635.photobucket.com/albums/uu79/okas000/WP_20160910_12_26_48_Pro_zps9opocuqf.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-23 12:20:53.287' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'unboxing-his-rx-470-iceq-x²-oc-4gb-ship-lazada', N'[unboxing] his rx 470 iceq x² oc 4gb ship lazada')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (81, 0, 14, N'Loạt ảnh chứng minh ngồi ngắm cảnh tại khoang lái máy bay mới là thiên đường', N'<p>Chắc chắn rằng nếu bạn được cơ hội ngồi v&agrave;o đ&acirc;y, ắt hẳn đ&oacute; l&agrave; những gi&acirc;y ph&uacute;t trải nghiệm đ&aacute;ng nhớ nhất của cuộc đời m&igrave;nh.</p>
', N'<p>Chắc hẳn những ai đ&atilde; từng đi m&aacute;y bay đều th&iacute;ch cảm gi&aacute;c ngồi ngắm cảnh m&acirc;y v&agrave; trời khi đang ở tr&ecirc;n độ cao v&agrave;i ng&agrave;n m&eacute;t. Nhiều người trong số n&agrave;y sẽ d&ugrave;ng&nbsp;<a href="http://genk.vn/dien-thoai.htm" target="_blank" title="điện thoại">điện thoại</a>&nbsp;hoặc&nbsp;<a href="http://genk.vn/may-anh.htm" target="_blank" title="máy ảnh">m&aacute;y ảnh</a>&nbsp;để ghi lại những khoảnh khắc đẹp tuyệt vời n&agrave;y, tuy nhi&ecirc;n mấy ai biết được nếu khung cảnh ở vị tr&iacute; kh&aacute;ch ngồi đẹp 1 th&igrave; trong khoang l&aacute;i của phi c&ocirc;ng độ đẹp tăng l&ecirc;n gấp 10 lần.</p>

<p>Kh&ocirc;ng tin ư? Mời độc giả c&ugrave;ng chi&ecirc;m ngưỡng loạt ảnh chứng minh khoang l&aacute;i m&aacute;y bay mới ch&iacute;nh l&agrave; văn ph&ograve;ng l&agrave;m việc đẹp nhất h&agrave;nh tinh n&agrave;y.<br />
<br />
<img alt="" src="http://genknews.genkcdn.vn/2016/genk123-8-1474460337041.jpg" style="height:100%; width:100%" /></p>

<p style="text-align:center"><em><span style="font-family:Times New Roman,Times,serif">Cơ trưởng Kort từng c&oacute; một tuổi thơ bay cao theo đ&uacute;ng nghĩa đen, bởi cả bố v&agrave; &ocirc;ng nội đều l&agrave; phi c&ocirc;ng khinh kh&iacute; cầu n&ecirc;n anh đ&atilde; được cho l&ecirc;n cao từ l&uacute;c c&ograve;n b&eacute; t&iacute;. Ch&iacute;nh sự th&iacute;ch th&uacute; v&agrave; niềm đam m&ecirc; n&agrave;y m&agrave; ngay khi đủ tuổi, anh đ&atilde; tham gia ngay v&agrave;o trường đ&agrave;o tạo l&aacute;i m&aacute;y bay.</span></em></p>

<p><img alt="" src="http://genknews.genkcdn.vn/2016/genk123-9-1474460337041.jpg" style="height:100%; width:100%" /></p>

<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><em>Mỗi khi v&agrave;o văn ph&ograve;ng đặc biệt n&agrave;y, anh đều mang theo m&igrave;nh chiếc m&aacute;y ảnh để lưu lại những khoảnh khắc đẹp nhất của thi&ecirc;n nhi&ecirc;n: từ cảnh ho&agrave;ng h&ocirc;n, b&igrave;nh minh, cho đến những v&ugrave;ng n&uacute;i tuyết trắng x&oacute;a hay những t&ograve;a nh&agrave; t&iacute; hon trong th&agrave;nh phố...</em></span></p>

<p><em><span style="font-family:Times New Roman,Times,serif"><img alt="" src="http://genknews.genkcdn.vn/2016/genk123-6-1474460337039.jpg" style="height:100%; width:100%" /></span></em></p>

<p style="text-align:center"><em><span style="font-family:Times New Roman,Times,serif">Tất cả đều hiện ra r&otilde; mồn một trước mắt v&agrave; chắc chắn rằng nếu bạn được cơ hội ngồi v&agrave;o đ&acirc;y, ắt hẳn đ&oacute; l&agrave; những gi&acirc;y ph&uacute;t trải nghiệm đ&aacute;ng nhớ nhất của cuộc đời m&igrave;nh.</span></em></p>

<p><br />
<img alt="" src="http://genknews.genkcdn.vn/2016/genk123-7-1474460337040.jpg" style="height:100%; width:100%" /></p>

<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><em>Chụp ảnh tr&ecirc;n buồng l&aacute;i cũng kh&ocirc;ng phải l&agrave; điều dễ như ăn kẹo, bởi Kort gặp phải một số kh&oacute; khăn li&ecirc;n quan đến vấn đề kỹ thuật chụp, trong đ&oacute; c&oacute; cả độ ch&ecirc;nh s&aacute;ng giữa buồng l&aacute;i v&agrave; ngoại cảnh.</em></span></p>

<p><img alt="" src="http://genknews.genkcdn.vn/2016/genk123-5-1474460337038.jpg" style="height:100%; width:100%" /></p>

<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><em>Chẳng hạn như khi ngo&agrave;i trời nắng gắt v&agrave; buồng l&aacute;i th&igrave; lại qu&aacute; tối, v&ugrave;ng s&aacute;ng v&agrave; v&ugrave;ng tối ch&ecirc;nh lệch qu&aacute; nhiều khiến ảnh đ&ocirc;i khi sẽ kh&ocirc;ng được ưng &yacute;. Điều n&agrave;y buộc Kort phải d&ugrave;ng đến giải ph&aacute;p chụp nhiều bức ảnh ở c&aacute;c độ phơi s&aacute;ng kh&aacute;c nhau (bracketing) rồi xử l&yacute; hậu kỳ mới c&oacute; thể cho ra được sản phẩm tốt nhất.</em></span><br />
&nbsp;</p>

<p><span style="font-family:Times New Roman,Times,serif"><em><img alt="" src="http://genknews.genkcdn.vn/2016/genk123-4-1474460337038.jpg" style="height:100%; width:100%" /></em></span></p>

<p style="text-align:center"><em><span style="font-family:Times New Roman,Times,serif">Tương tự khi trời tối, b&ecirc;n ngo&agrave;i th&igrave; tối đen như mực c&ograve;n b&ecirc;n trong buồng l&aacute;i lại c&oacute; qu&aacute; nhiều đ&egrave;n cũng l&agrave; một thử th&aacute;ch kh&ocirc;ng nhỏ với Kort.</span></em></p>

<p>Độc giả c&oacute; thể chi&ecirc;m ngưỡng th&ecirc;m văn ph&ograve;ng l&agrave;m việc của Martijn Kort tại&nbsp;<a href="http://www.martijnkort-photography.com/" rel="nofollow" target="_blank">trang web c&aacute; nh&acirc;n</a>của anh hoặc qua&nbsp;<a href="https://www.instagram.com/flightdeck_views/" rel="nofollow" target="_blank">Instagram</a>&nbsp;v&agrave;&nbsp;<a href="https://www.facebook.com/Martijnkortphotography/" rel="nofollow" target="_blank">Facebook</a>.</p>

<p style="text-align:right"><span style="font-family:Times New Roman,Times,serif"><em><strong>(Tổng hợp)</strong></em></span></p>
', N'http://genknews.genkcdn.vn/2016/genk123-8-1474460337041.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-09-25 13:06:30.107' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'loat-anh-chung-minh-ngoi-ngam-canh-tai-khoang-lai-may-bay-moi-la-thien-duong', N'loat anh chung minh ngoi ngam canh tai khoang lai may bay moi la thien duong')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (84, 0, 14, N'Nokia 3210, chú dế mở đầu cuộc cách mạng di động như thế nào?', N'<p>Nokia 3210 đ&atilde; mở đầu cuộc c&aacute;ch mạng di động như thế n&agrave;o v&agrave; n&oacute; tiết lộ g&igrave; về thiết bị tiếp theo sẽ thay đổi thế giới.</p>
', N'<p>Năm 1997, những chiếc điện thoại đều nh&agrave;m ch&aacute;n. Sau khi Motorola lần đầu tr&igrave;nh diễn c&ocirc;ng nghệ di động, thiết bị n&agrave;y nhanh ch&oacute;ng vấp phải h&agrave;ng loạt thử th&aacute;ch từ k&iacute;ch cỡ, chi ph&iacute;, năng lực xử l&yacute;, cơ sở hạ tầng. Tuy nhi&ecirc;n, một ng&agrave;nh c&ocirc;ng nghiệp cũng từ đ&oacute; dần dần nổi l&ecirc;n, d&ugrave; chỉ phục vụ cho tầng lớp l&atilde;nh đạo doanh nghiệp (chiếc DynaTAC của Motorola c&oacute; gi&aacute; 4.000 USD trong năm 1984), nhấn mạnh gi&aacute; trị mang t&iacute;nh biểu tượng.</p>

<p>Bước sang những năm 1990, thiết bị nhỏ đi, chi ph&iacute; cuộc gọi thấp hơn, v&ugrave;ng phủ s&oacute;ng rộng hơn. Song, kh&aacute;i niệm điện thoại di động vẫn gắn liền với một thiết bị chậm chạp, vụng về, cho đến khi một nh&agrave; thiết kế t&agrave;i năng hướng đến sự đơn giản cho ra đời chiếc điện thoại thay đổi mọi thứ.<br />
<br />
<img alt="" src="http://genknews.genkcdn.vn/thumb_w/640/2016/cau-chuyen-ve-nokia-3210-2-1474766298935.png" style="height:100%; width:100%" /></p>

<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><em>Nokia 3210 l&agrave; b&agrave;i học đ&aacute;ng gi&aacute; cho những ai đang muốn ph&aacute;t triển thiết bị đột ph&aacute; mới</em></span></p>

<p>Người đ&oacute; kh&ocirc;ng phải Jony Ive v&agrave; chiếc điện thoại cũng kh&ocirc;ng phải iPhone. Đ&oacute; l&agrave; người đ&agrave;n &ocirc;ng c&oacute; t&ecirc;n Frank Nuovo, v&agrave; thiết bị anh tạo ra l&agrave; một trong số &iacute;t những m&aacute;y được mọi người nhớ t&ecirc;n: Nokia 3210. Kh&ocirc;ng chỉ vậy, h&igrave;nh d&aacute;ng, bộ vỏ, nhạc chu&ocirc;ng cổ điển hay game di động mới l&agrave;m n&ecirc;n sự nổi tiếng cho n&oacute;.</p>

<p>Ng&agrave;y nay, khi một điện thoại mới được c&ocirc;ng bố, n&oacute; k&eacute;o theo l&agrave;n s&oacute;ng b&aacute;o ch&iacute;, tiếp thị li&ecirc;n tiếp. C&oacute; c&aacute;c tin đồn, r&ograve; rỉ, live blog, suy đo&aacute;n, đ&aacute;nh gi&aacute;, mổ xẻ, b&agrave;i kiểm tra &aacute;p lực. Khi Apple ra iPhone 7, Thời b&aacute;o Wall Street đ&atilde; ph&aacute;t trực tiếp l&ecirc;n Facebook cảnh d&igrave;m m&aacute;y dưới nước để kiểm tra khả năng chống nước.</p>

<p>Cuối những năm 1990, những chiếc điện thoại mới kh&ocirc;ng tạo ra x&aacute;o động như vậy. Kh&ocirc;ng c&oacute; sự kiện giới thiệu n&agrave;o cho Nokia 3210, c&aacute;c tờ b&aacute;o lớn c&ograve;n kh&ocirc;ng buồn đ&aacute;nh gi&aacute;. Tuy nhi&ecirc;n, nếu nh&igrave;n lại qu&aacute; khứ, n&oacute; đ&atilde; khuấy động cuộc c&aacute;ch mạng di động kh&ocirc;ng thua bất kỳ thiết bị n&agrave;o kh&aacute;c trong lịch sử. 3210 v&agrave; &lsquo;hậu duệ&rsquo; của n&oacute; x&aacute;c lập lại vai tr&ograve; của c&ocirc;ng nghệ trong cuộc sống của ch&uacute;ng ta.</p>

<p>Bằng c&aacute;ch suy t&iacute;nh lại c&aacute;c linh kiện mấu chốt cũng như ch&uacute; &yacute; đến c&aacute;ch người trẻ sử dụng n&oacute;, họ đ&atilde; biến một thứ kỳ cục th&agrave;nh một thứ đơn giản v&agrave; lịch sự. N&oacute; l&agrave; b&agrave;i học đ&aacute;ng ghi nhớ cho những ai đang muốn ph&aacute;t triển thiết bị đột ph&aacute; tiếp theo.</p>

<p>H&atilde;y c&ugrave;ng quay lại năm 1997. Nh&agrave; sản xuất h&agrave;ng đầu khi ấy, Motorola, cơ cấu v&ograve;ng đời sản phẩm xoay quanh c&aacute;c tiến bộ cơ bản trong c&ocirc;ng nghệ, chủ yếu l&agrave; chipset tr&ecirc;n điện thoại v&agrave; cơ sở hạ tầng viễn th&ocirc;ng phụ tr&aacute;ch t&iacute;n hiệu mạng. Khi một chipset sẵn s&agrave;ng, họ mới ra mắt d&ograve;ng điện thoại mới. Nokia, c&ocirc;ng ty đứng sau về uy t&iacute;n v&agrave; doanh số, cũng vậy.</p>

<p>Những l&atilde;nh đạo trẻ, đầy quyết t&acirc;m đang t&igrave;m kiếm một lợi thế để đối đầu với đối thủ lớn hơn. Họ c&oacute; lẽ đ&atilde; nh&igrave;n thấy trước sự hội tụ c&aacute;c tiến bộ c&ocirc;ng nghệ cho ph&eacute;p điện thoại di động đến với đ&aacute;m đ&ocirc;ng, trong đ&oacute; c&oacute; mạng 2G để mọi người nhắn tin văn bản. Song, tồn tại một vấn đề: kh&ocirc;ng c&oacute; chipset mới n&agrave;o để Nokia x&acirc;y dựng thiết bị mới. N&oacute; giống như &ldquo;b&igrave;nh mới rượu cũ&rdquo; nhưng Nuovo xem đ&acirc;y l&agrave; khoảnh khắc của m&igrave;nh.<br />
<br />
<img alt="" src="http://genknews.genkcdn.vn/2016/cau-chuyen-ve-nokia-3210-1-1474766298933.png" style="height:100%; width:100%" /></p>

<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><em>Nguy&ecirc;n mẫu chiếc 3210</em></span></p>

<p>Theo truyền thống, c&aacute;c h&atilde;ng điện thoại di động xem kỹ thuật như lợi thế cạnh tranh cốt l&otilde;i nhưng thường thu&ecirc; thiết kế b&ecirc;n ngo&agrave;i. Nokia, ngược lại, lại cam kết sử dụng c&aacute;c chuy&ecirc;n gia thiết kế của m&igrave;nh v&agrave; mời Nuovo về từ Designworks, cho &ocirc;ng một nh&oacute;m v&agrave; studio ri&ecirc;ng tại Calabasas, California. Do kh&ocirc;ng c&oacute; chỉ thị r&otilde; r&agrave;ng về điện thoại kế tiếp, &ocirc;ng xem như c&aacute;i cớ để s&aacute;ng tạo.&nbsp;<em>&ldquo;Ch&uacute;ng t&ocirc;i bắt đầu nghĩ, &ldquo;H&atilde;y đổi mới h&igrave;nh dạng v&agrave; kiểu d&aacute;ng&rdquo;&rdquo;,</em>&nbsp;Nuovo hồi tưởng.</p>

<p>Cuối năm 1997, Nuovo &aacute;p dụng &ldquo;quy tr&igrave;nh tầm nh&igrave;n&rdquo; c&oacute; t&ecirc;n Vision &rsquo;99. &Ocirc;ng chia c&aacute;c nh&agrave; thiết kế th&agrave;nh từng nh&oacute;m v&agrave; giao cho họ s&aacute;ng tạo c&aacute;c concept mới, kh&ocirc;ng chỉ 1 m&agrave; tới 7 điện thoại kh&aacute;c nhau ho&agrave;n to&agrave;n, mỗi m&aacute;y lại được chế tạo xoay quanh ph&acirc;n kh&uacute;c v&agrave; mục đ&iacute;ch kh&aacute;c nhau. C&aacute;c ph&acirc;n kh&uacute;c m&agrave; họ lựa chọn &ndash; &ldquo;xa xỉ&rdquo;, &ldquo;cao cấp&rdquo;, &ldquo;doanh nh&acirc;n/cổ điển&rdquo;, &ldquo;thời trang&rdquo;, &ldquo;thể thao&rdquo;, &ldquo;biểu đạt&rdquo; v&agrave; &ldquo;tuổi trẻ&rdquo; &ndash; đều quen thuộc với c&aacute;c nh&agrave; thiết kế v&agrave; nh&agrave; tiếp thị trong c&aacute;c lĩnh vực kh&aacute;c. Song, chưa ai chia l&aacute;t thị trường di động như vậy.</p>

<p>Alastair Curtis, nh&agrave; thiết kế người Anh hoạt động dưới quyền Nuovo, nhớ lại:&nbsp;<em>&ldquo;Ch&uacute;ng t&ocirc;i phải kể c&acirc;u chuyện về thị trường di động sẽ trở th&agrave;nh thế n&agrave;o, kh&ocirc;ng chỉ l&agrave; một sản phẩm kinh doanh&rdquo;</em>. Nh&oacute;m của &ocirc;ng lấy cảm hứng từ c&aacute;c thiết bị ti&ecirc;u d&ugrave;ng như đồng hồ Casio G-Shock v&agrave; Sony Walkman.&nbsp;<em>&ldquo;Ch&uacute;ng t&ocirc;i kh&ocirc;ng sợ h&atilde;i. Mọi thứ đều sẵn s&agrave;ng để thay đổi&rdquo;.</em></p>

<p>Từ l&uacute;c mới bắt đầu, concept điện thoại &ldquo;biểu đạt&rdquo;, c&oacute; thể thay đổi theo thị hiếu c&aacute; nh&acirc;n, đ&atilde; c&oacute; đ&agrave; ri&ecirc;ng b&ecirc;n trong dự &aacute;n. Cả nh&oacute;m thiết kế kh&ocirc;ng thiết lập từ h&igrave;nh mẫu n&agrave;o v&igrave; kh&ocirc;ng c&oacute; t&ecirc;n tuổi lớn n&agrave;o từng sản xuất một thiết bị cho người trẻ. Họ đối mặt với c&acirc;u hỏi: l&agrave;m thế n&agrave;o để biến một thứ v&ocirc; c&ugrave;ng kh&ocirc;ng th&uacute; vị th&agrave;nh hấp dẫn? Concept đ&oacute; ch&iacute;nh l&agrave; Nokia 3210 sau n&agrave;y.</p>

<p>C&aacute;c nh&agrave; thiết kế bắt đầu bằng việc suy nghĩ về linh kiện k&eacute;m hấp dẫn nhất: ăng-ten. Kh&ocirc;ng chỉ lập dị, n&oacute; c&ograve;n l&agrave;m cho điện thoại kh&oacute; mang theo trong t&uacute;i &aacute;o. Kh&ocirc;ng thể nghĩ ra c&aacute;ch trang ho&agrave;ng n&oacute;, họ quyết định đơn giản hơn l&agrave; l&agrave;m cho n&oacute; biến mất, đặt v&agrave;o b&ecirc;n trong thiết bị. Đ&oacute; l&agrave; lựa chọn t&aacute;o bạo được đưa ra bởi c&aacute;c nh&agrave; thiết kế v&agrave; khiến c&aacute;c kỹ sư tức đi&ecirc;n.</p>

<p>Peter Roepke, người đứng đầu dự &aacute;n đưa 3210 th&agrave;nh hiện thực, thừa nhận ăng-ten bị giấu đi l&agrave; điểm kh&oacute; khi b&aacute;n h&agrave;ng.&nbsp;<em>&ldquo;Tất cả điện thoại đều c&oacute; ăng-ten ngo&agrave;i. Người ti&ecirc;u d&ugrave;ng mặc định nghĩ n&oacute; kh&ocirc;ng hoạt động tốt nếu thiếu ăng-ten</em>&rdquo;. C&ograve;n đối với kỹ sư trong nh&oacute;m, họ ho&agrave;n to&agrave;n phản đối. Song, cuối c&ugrave;ng, họ đ&atilde; thiết kế lại bộ pin của m&aacute;y để nh&eacute;t vừa ăng-ten v&agrave;o trong.</p>

<p>Chi tiết n&agrave;y khiến điện thoại rộng hơn, cồng kềnh hơn, ngược với sự t&ocirc;n s&ugrave;ng mảnh dẻ của ng&agrave;nh (một trong những thiết kế th&agrave;nh c&ocirc;ng đầu ti&ecirc;n của Nuovo tại Nokia l&agrave; 8110 si&ecirc;u mỏng ra năm 1996, đẹp tới mức được xuất hiện trong phim Ma trận), nhưng đồng thời l&agrave;m cho 3210 ngắn lại, cong hơn, vừa vặn trong t&uacute;i &aacute;o. C&ugrave;ng l&uacute;c n&agrave;y, họ lại đưa v&agrave;o được m&agrave;n h&igrave;nh rộng hơn, dễ đọc hơn. &ldquo;<em>T&ocirc;i c&ograve;n nhớ đ&atilde; thảo luận với Alastair về &ldquo;v&ograve;ng h&ocirc;ng&rdquo; tr&ecirc;n điện thoại. Ch&uacute;ng t&ocirc;i muốn n&oacute; thật gợi cảm&rdquo;</em>, Nuovo cho biết.</p>

<p>Cuộc th&iacute; nghiệm mở rộng đến th&acirc;n m&aacute;y. C&aacute;c nh&agrave; thiết kế thường chế tạo vỏ trước v&agrave; vỏ sau dễ th&aacute;o rời để người d&ugrave;ng kết hợp theo thị hiếu, trang phục hay thậm ch&iacute; cả t&acirc;m trạng. Tuy nhi&ecirc;n, Curtis cho rằng yếu tố then chốt dẫn đến th&agrave;nh c&ocirc;ng của 3210 ch&iacute;nh l&agrave; c&aacute;c b&ecirc;n thứ ba bắt đầu sản xuất vỏ bảo vệ bằng nhựa nhiều m&agrave;u sắc cho thiết bị v&agrave; c&aacute;c nh&agrave; b&aacute;n lẻ cũng bắt đầu sử dụng ch&uacute;ng để thu h&uacute;t sự ch&uacute; &yacute; của người mua.</p>

<p>Khi đến tay người d&ugrave;ng, 3210 tiếp tục khẳng định gi&aacute; trị một lần nữa. Nắm bắt vai tr&ograve; như một m&oacute;n đồ chơi chứ kh&ocirc;ng chỉ một tiện &iacute;ch, Nokia đ&atilde; c&agrave;i đặt game đơn giản nhưng g&acirc;y nghiện v&ocirc; c&ugrave;ng đ&oacute; l&agrave; Snake (rắn săn mồi). Lần đầu ti&ecirc;n trong lịch sử, điện thoại biến th&agrave;nh thiết bị giải tr&iacute; c&aacute; nh&acirc;n, một c&aacute;ch để giết thời gian khi bạn chẳng c&oacute; g&igrave; để l&agrave;m. &ldquo;Đ&oacute; l&agrave; bước ngoặt quan trọng, kh&ocirc;ng chỉ về phong c&aacute;ch m&agrave; cả mục đ&iacute;ch sử dụng của điện thoại&rdquo;, Nuovo n&oacute;i.<br />
<br />
<img alt="" src="http://genknews.genkcdn.vn/2016/cau-chuyen-ve-nokia-3210-1474766298928.jpg" style="height:100%; width:100%" /></p>

<p style="text-align:center"><span style="font-family:Times New Roman,Times,serif"><em>C&aacute;c th&agrave;nh vi&ecirc;n trong nh&oacute;m Vision &#39;99 thiết kế n&ecirc;n Nokia 3210</em></span></p>

<p>Vậy l&agrave;m thế n&agrave;o Nokia nh&igrave;n thấy hết tất cả điều n&agrave;y? Sự tập trung v&agrave;o thiết kế chắc chắn l&agrave; một phần trong th&agrave;nh c&ocirc;ng của họ nhưng kh&ocirc;ng thể kh&ocirc;ng nhắc đến t&iacute;nh quốc tế của thị trường m&agrave; Nokia phục vụ. Giữa những năm 1990, trong khi Motorola thống trị thị trường Mỹ với điện thoại analog, Nokia lại c&oacute; bước đi mạo hiểm khi đặt cược v&agrave;o ti&ecirc;u chuẩn viễn th&ocirc;ng GSM m&agrave; h&atilde;ng ti&ecirc;n phong. GSM hỗ trợ ra đời c&aacute;c t&iacute;nh năng mới như SMS hay tin nhắn văn bản m&agrave; Nokia giới thiệu năm 1992.</p>

<p>Tại Mỹ, kh&aacute;ch h&agrave;ng doanh nghiệp c&oacute; thể chi cả đống tiền cước gọi h&agrave;ng th&aacute;ng nhưng tại những nơi kh&aacute;c tr&ecirc;n thế giới, mọi người mua điện thoại gi&aacute; rẻ hơn v&agrave; tiết kiệm từng ph&uacute;t. Một trong c&aacute;c phương ph&aacute;p tiết kiệm l&agrave; li&ecirc;n lạc chủ yếu qua tin nhắn. 3210 đặc biệt dễ nhắn tin v&igrave; c&oacute; hai t&iacute;nh năng mới: dự đo&aacute;n từ T9 để nhắn nhanh hơn v&agrave; &ldquo;tin nhắn h&igrave;nh ảnh&rdquo; c&agrave;i sẵn, ch&iacute;nh l&agrave; tiền nh&acirc;n của emoji ng&agrave;y nay.</p>

<p>Trong b&agrave;i b&aacute;o trang b&igrave;a tạp ch&iacute; Wired năm 1999 c&oacute; tựa đề &ldquo;Just Say Nokia&rdquo;, Steve Silberman đ&atilde; tới Phần Lan v&agrave; chứng kiến những c&ocirc; cậu thanh thiếu ni&ecirc;n &ldquo;d&aacute;n mắt&rdquo; v&agrave;o chiếc điện thoại Nokia của m&igrave;nh, nhắn tin li&ecirc;n tục cho người kh&aacute;c.</p>

<p>Nokia giới thiệu 3210 v&agrave;o ng&agrave;y 18/3/1999, gọi n&oacute; l&agrave; &ldquo;chiếc điện thoại di động cho sự thuận tiện v&agrave; c&aacute; nh&acirc;n h&oacute;a căn bản&rdquo;, tung ra chiến dịch tiếp thị nhằm v&agrave;o đối tượng trẻ hơn th&ocirc;ng thường. H&atilde;ng đ&atilde; b&aacute;n được khoảng 160 triệu m&aacute;y, biến 3210 trở th&agrave;nh một trong những điện thoại b&aacute;n chạy nhất mọi thời đại. Kh&ocirc;ng c&oacute; chiếc iPhone n&agrave;o được ưa chuộng như thế. N&oacute; gi&uacute;p Nokia vượt qua Motorola chiếm ng&ocirc;i nh&agrave; sản xuất điện thoại di động lớn nhất thế giới, danh hiệu n&agrave;y m&atilde;i đến năm 2012 mới bị Samsung tước đoạt.</p>

<p>Thử nghiệm của Nuovo với c&aacute;c ph&acirc;n kh&uacute;c thị trường v&ocirc; c&ugrave;ng quan trọng đối với sự trỗi dậy của Nokia. Nếu kh&ocirc;ng c&oacute; ch&uacute;ng, sẽ kh&ocirc;ng c&oacute; 3210 hay bất kỳ chiếc điện thoại n&agrave;o kh&aacute;c &ldquo;ăn theo&rdquo; con đường n&agrave;y. Song, khi Nokia tỏ ra ngoan cố trước sự ph&aacute;t triển của thị trường, chiến lược trở th&agrave;nh điểm yếu khi đối thủ ho&agrave;n to&agrave;n mới nổi l&ecirc;n với sự tập trung v&agrave;o một loại thiết bị đặc biệt.</p>

<p>Apple iPhone ra đời năm 2007 đ&atilde; l&agrave;m được nhiều thứ với smartphone giống như Nokia l&agrave;m với điện thoại phổ th&ocirc;ng: l&agrave;m cho ch&uacute;ng đẹp hơn, dễ sử dụng v&agrave; hướng đến đ&aacute;m đ&ocirc;ng. Trong khi Nokia v&agrave; c&aacute;c h&atilde;ng kh&aacute;c thử nghiệm v&ocirc; số loại phần cứng kh&aacute;c nhau, Apple chỉ tạo ra một mẫu iPhone v&agrave; tập trung nguồn lực v&agrave;o phần mềm ưu việt.</p>

<p>Bị k&eacute;o xuống bởi hệ điều h&agrave;nh Symbian cồng kềnh m&agrave; Nokia đồng sở hữu với Ericsson, điện thoại Nokia bắt đầu mất đi ưu thế, ban đầu ở dấu ấn v&agrave; cuối c&ugrave;ng l&agrave; doanh số. C&ocirc;ng ty phải b&aacute;n mảng thiết bị cho Microsoft năm 2014 lấy 7,9 tỷ USD. Trong v&ograve;ng 2 năm, Microsoft về cơ bản đ&atilde; t&aacute;ch từng phần v&agrave; b&aacute;n mảng điện thoại phổ th&ocirc;ng v&agrave; thương hiệu Nokia cho Foxconn với gi&aacute; chỉ 350 triệu USD v&agrave;o đầu năm nay. Tất cả những người c&oacute; li&ecirc;n quan đến sự ra đời của 3210 đều đ&atilde; chia ly.</p>

<p>D&ugrave; vậy, bản th&acirc;n 3210 vẫn chứng tỏ sự bền bỉ của n&oacute;. Bạn vẫn c&oacute; thể mua v&agrave; sử dụng 3210 ng&agrave;y nay v&agrave; thậm ch&iacute; ph&aacute;t hiện nhiều ưu điểm so với c&aacute;c smartphone cao cấp kh&aacute;c. Pin k&eacute;o d&agrave;i h&agrave;ng ng&agrave;y chỉ với một lần sạc v&agrave; bạn kh&ocirc;ng phải lo n&oacute; bị cong hay vỡ.&nbsp;<em>&ldquo;Khi bạn đ&aacute;nh rơi những thứ n&agrave;y, ch&uacute;ng kh&ocirc;ng bị vỡ&rdquo;, Nuovo n&oacute;i đầy tự h&agrave;o, &ldquo;Ch&uacute;ng bật l&ecirc;n&rdquo;. Sản phẩm kế nhiệm 3210, 3310, cũng được y&ecirc;u th&iacute;ch đến mức c&oacute; &ldquo;ảnh chế&rdquo; ri&ecirc;ng v&agrave; c&ograve;n được BuzzFeed gọi l&agrave; &ldquo;ph&aacute;t minh vĩ đại nhất của con người&rdquo;</em>.</p>

<p>3210 kh&ocirc;ng phải chiến thắng của ph&acirc;n kh&uacute;c thị trường m&agrave; l&agrave; của hợp nhất thị trường. Với kh&aacute;i niệm điện thoại &ldquo;biểu đạt&rdquo;, Nuovo, Curtis, Roepke v&agrave; đồng nghiệp đ&atilde; t&aacute;i tưởng tượng mẫu di động cho người trẻ nhưng cuối c&ugrave;ng lại l&agrave; cho tất cả mọi người. Sự đơn giản, dễ sử dụng, t&iacute;nh thời trang h&oacute;a ra lại trở th&agrave;nh gi&aacute; trị phổ biến hơn những g&igrave; họ mong đợi.</p>

<p>C&acirc;u chuyện về 3210 l&agrave; lời nhắc nhở d&agrave;nh cho những c&ocirc;ng nghệ mới rằng con đường để được c&ocirc;ng ch&uacute;ng chấp nhận hiếm khi dễ d&agrave;ng. C&aacute;c thiết bị mới hiện tại như smartwatch, k&iacute;nh th&ocirc;ng minh, tai nghe th&ocirc;ng minh, thiết bị thực tế ảo đều kh&ocirc;ng duy&ecirc;n d&aacute;ng, kh&ocirc;ng th&uacute; vị v&agrave; kh&ocirc;ng thay đổi cơ bản c&aacute;ch ch&uacute;ng ta sống. Tuy nhi&ecirc;n, với thiết kế đ&uacute;ng đắn v&agrave;o đ&uacute;ng thời điểm, n&oacute; c&oacute; thể trở n&ecirc;n huyền thoại như 3210.</p>

<p style="text-align:right"><strong><em><span style="font-family:Times New Roman,Times,serif">Theo ICT News</span></em></strong></p>
', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-25 23:48:57.797' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'nokia-3210-chu-de-mo-dau-cuoc-cach-mang-di-dong-nhu-the-nao', N'nokia 3210, chu de mo dau cuoc cach mang di dong nhu the nao?')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (86, 0, 14, N'Trên tay HTC Desire 10 Pro: 4GB RAM, 64GB bộ nhớ trong dưới 10 triệu', N'<a href="https://tinhte.vn/tags/htc-desire-10-pro/" title="">HTC Desire 10 Pro</a>&nbsp;l&agrave; chiếc điện thoại tầm trung của&nbsp;<a href="https://tinhte.vn/tags/htc/" title="">HTC</a>&nbsp;dự kiến sẽ b&aacute;n ra ở Việt Nam trong khoảng th&aacute;ng 11 với cấu h&igrave;nh ổn v&agrave; mức gi&aacute; kh&aacute; hấp dẫn. Sản phẩm n&agrave;y c&oacute; gi&aacute; b&aacute;n khoảng dưới 10 triệu đồng, phi&ecirc;n bản Việt Nam c&oacute; vẻ như sẽ d&ugrave;ng cấu h&igrave;nh 4GB RAM v&agrave; 64GB bộ nhớ trong, tức cao hơn so với phi&ecirc;n bản 3GB RAM 32GB bộ nhớ trong ở một số thị trường quốc tế kh&aacute;c.', N'<iframe allowfullscreen="" frameborder="0" height="360" src="//www.youtube.com/embed/-LlmK3rEky0" width="640"></iframe><br />
<br />
<strong>Thiết kế</strong><br />
HTC&nbsp;<a href="https://tinhte.vn/tags/desire-10/" title="">Desire 10</a>&nbsp;Pro l&agrave; chiếc điện thoại c&oacute; thiết kế kh&aacute; đẹp, điểm nhấn của n&oacute; nằm ở dải kim loại chia cắt v&agrave; cụm camera ở mặt sau. So với đại đa số c&aacute;c điện thoại trung cấp đang c&oacute; thiết kế tương tự nhau tr&ecirc;n thị trường th&igrave; Desire 10 Pro đẹp v&agrave; lạ mắt hơn hẳn. Tổng thể của m&aacute;y tựa như c&aacute;c d&ograve;ng m&aacute;y Desire trước kia nhưng vẫn c&oacute; những điểm kh&aacute;c biệt rất ri&ecirc;ng.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/09/3878650_HTC_Desire_10_Pro_Tren_tay_tinhte.vn.jpg" style="height:100%; width:100%" /><br />
<br />
Cảm gi&aacute;c cầm HTC Desire 10 Pro l&agrave; tốt, m&aacute;y kh&ocirc;ng cho cảm gi&aacute;c thật sự cao cấp do thiết kế sử dụng vỏ polycarbonat ph&iacute;a ngo&agrave;i nhưng vẫn rất cứng c&aacute;p nhờ v&agrave;o khung kim loại ph&iacute;a trong. Tr&ecirc;n Desire 10 Pro th&igrave; kim loại hiện diện ở 2 phần: bộ khung v&agrave; c&aacute;c dải cắt b&ecirc;n ngo&agrave;i m&aacute;y. Nh&igrave;n chung, nếu bạn đ&atilde; quen với c&aacute;c vỏ m&aacute;y kim loại th&igrave; c&oacute; thể sẽ hơi kh&ocirc;ng th&iacute;ch Desire 10 Pro, nhưng c&aacute; nh&acirc;n m&igrave;nh đ&aacute;nh gi&aacute; đ&acirc;y kh&ocirc;ng phải l&agrave; vấn đề qu&aacute; lớn, nhất l&agrave; khi vỏ nhựa mang lại cho ch&uacute;ng ta những m&agrave;u vui vẻ như xanh ngọc.<br />
<br />
<strong>T&iacute;nh năng:</strong><br />
Sử dụng MediaTek Helio P10, con chip kh&aacute; mạnh của MediaTek n&ecirc;n hiệu năng kh&ocirc;ng phải l&agrave; một điểm yếu của Desire 10 Pro. Tuy nhi&ecirc;n, m&igrave;nh vẫn mong HTC sử dụng X10 hơn l&agrave; P10 để tăng lợi thế cạnh tranh hơn. Hiện tại một số m&aacute;y c&oacute; cấu h&igrave;nh tương tự HTC Desire 10 Pro đều d&ugrave;ng Helio P10, nhưng tất cả c&aacute;c m&aacute;y đ&oacute; đều đ&atilde; b&aacute;n được hơn nửa năm nay rồi v&agrave; c&oacute; đối tượng kh&aacute;ch h&agrave;ng ri&ecirc;ng rồi.<br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/09/3878651_HTC_Desire_10_Pro_Tren_tay_tinhte.vn-11.jpg" style="height:100%; width:100%" /><br />
<br />
Nếu như&nbsp;<a href="https://tinhte.vn/tags/desire-10-lifestyle/" title="">Desire 10 Lifestyle</a>&nbsp;sử dụng m&agrave;n h&igrave;nh 720p th&igrave; Desire 10 Pro d&ugrave;ng Super LCD 5.5&rdquo; FullHD. M&igrave;nh chưa thể nhận x&eacute;t nhiều về Desire 10 Pro v&igrave; m&agrave;n h&igrave;nh m&aacute;y vẫn l&agrave; bản thử nghiệm, c&oacute; cảm gi&aacute;c tấm nền chưa được ho&agrave;n thiện v&igrave; hở s&aacute;ng hơi nhiều. Ch&uacute;ng ta sẽ chờ m&aacute;y ch&iacute;nh thức để c&oacute; thể đưa ra nhận x&eacute;t cuối c&ugrave;ng.<br />
<br />
<strong>Camera:&nbsp;<br />
<img alt="" src="https://tinhte.vn/store/2016/09/3878644_HTC_Desire_10_Pro_Tren_tay_tinhte.vn-3.jpg" style="height:100%; width:100%" /><br />
<br />
HTC Desire 10 Pro</strong>
<ul>
	<li>Hệ điều h&agrave;nh: Android 6.0 với SenseUI</li>
	<li>M&agrave;n h&igrave;nh: 5,5&quot; Full HD, 400 ppi, Gorilla Glass</li>
	<li>Camera: 20MP, ống k&iacute;nh 27,8mm f/2.0, lấy n&eacute;t laser, đ&egrave;n flash 2 t&ocirc;ng m&agrave;u</li>
	<li>Camera trước: 13MP, ống k&iacute;nh 27,8mm f/2.2, quay phim Full HD</li>
	<li>Nền tảng: MediaTek Helio P10</li>
	<li>RAM: 4GB</li>
	<li>Bộ nhớ trong: 64GB, thẻ nhớ mở rộng microSD hỗ trợ tối đa 2TB</li>
	<li>Thiết kế vỏ kim loại, cảm biến v&acirc;n tay ở mặt lưng</li>
	<li>Mạng: LTE 4G Cat.6</li>
	<li>Kết nối: Wi-Fi chuẩn n (2 băng tần), Bluetooth 4.2, NFC</li>
	<li>Giao tiếp: &acirc;m thanh 3,5mm; micro USB</li>
	<li>Pin: 3.000 mAh</li>
	<li>K&iacute;ch thước: 156.5 x 76 x 7.86 mm</li>
	<li>Trọng lượng: 165 g</li>
</ul>
<img alt="" src="https://tinhte.vn/store/2016/09/3878647_HTC_Desire_10_Pro_Tren_tay_tinhte.vn-9.jpg" style="height:100%; width:100%" /><br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/09/3878649_HTC_Desire_10_Pro_Tren_tay_tinhte.vn-10.jpg" style="height:100%; width:100%" /><br />
<br />
<img alt="" src="https://tinhte.vn/store/2016/09/3878640_HTC_Desire_10_Pro_Tren_tay_tinhte.vn-5.jpg" style="height:100%; width:100%" /><br />
<br />
<br />
&nbsp;', N'https://tinhte.vn/store/2016/09/3878640_HTC_Desire_10_Pro_Tren_tay_tinhte.vn-5.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-26 14:32:24.543' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'tren-tay-htc-desire-10-pro-4gb-ram-64gb-bo-nho-trong-duoi-10-trieu', N'tren tay htc desire 10 pro: 4gb ram, 64gb bo nho trong duoi 10 trieu')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (88, 0, 14, N'Sẽ có GTX 1050 và GTX 1050Ti, 4GB VRAM, giá từ 2,5 triệu đồng', N'NVIDIA dự kiến sẽ c&ocirc;ng bố card đồ họa tiếp theo của h&atilde;ng n&agrave;y trong th&aacute;ng tới đ&acirc;y, v&agrave; kh&ocirc;ng g&igrave; kh&aacute;c, chắc chắn đ&oacute; sẽ l&agrave; một VGA sử dụng GPU GP107 v&agrave; mang t&ecirc;n GTX 1050.<br />
<br />
Tuy nhi&ecirc;n, một diễn biến mới đ&acirc;y chỉ ra rằng nh&agrave; ph&aacute;t triển sẽ sử dụng &quot;b&agrave;i cũ&quot; l&agrave; tung ra 2 phi&ecirc;n bản GTX 1050Ti v&agrave; non-Ti, giống như họ đ&atilde; từng l&agrave;m với GTX 750 trước đ&acirc;y.', N'<p>Th&ocirc;ng tin tới từ trang HWBattle cho biết sau GP106, GPU nằm b&ecirc;n trong GTX 1060, tiếp tới NVIDIA sẽ khai th&aacute;c GP107, l&otilde;i đồ họa gi&aacute; rẻ của h&atilde;ng n&agrave;y.<br />
<br />
<img alt="" src="http://genknews.genkcdn.vn/thumb_w/640/2016/nvidia-geforce-gtx-1050-ti-and-geforce-gtx-1050-pascal-1-1474787003038.png" style="height:100%; width:100%" /><br />
<br />
&nbsp;</p>

<p>Trước khi đến với chi tiết về bộ đ&ocirc;i VGA mới, h&atilde;y c&ugrave;ng nh&igrave;n lại loạt VGA đời Maxwell trước đ&acirc;y l&agrave; GTX 750, GTX 750Ti v&agrave; GTX 950. Cả 3 sản phẩm n&agrave;y đều nằm trong ph&acirc;n kh&uacute;c gi&aacute; rẻ v&agrave; cận trung cấp, với hiệu năng được khẳng định qua 2 năm ch&uacute;ng c&oacute; mặt tr&ecirc;n thị trường. T&iacute;nh tới thời điểm hiện tại, d&ugrave; đ&atilde; lỗi thời, nhưng doanh số của c&aacute;c m&atilde; VGA kể tr&ecirc;n vẫn ở mức rất tốt bởi ch&uacute;ng đủ để đ&aacute;p ứng nhu cầu chơi game cơ bản, v&iacute; dụ như tại c&aacute;c cửa h&agrave;ng game net.</p>

<p>NVIDIA đang muốn tạo ra một bước tiến d&agrave;i mới, với c&aacute;c GPU thế hệ Pascal. C&aacute;c VGA ra mắt trước đ&oacute; của nh&agrave; ph&aacute;t triển n&agrave;y đ&atilde; thực sự tạo ra tiếng vang khi hiệu năng đặc biệt vượt trội so với thế hệ tuơng ứng trước đ&oacute;, v&agrave; GTX 1050 sẽ kh&ocirc;ng phải ngoại lệ.</p>

<p>D&ugrave; chưa ra mắt, nhưng c&oacute; thể tin tưởng rằng GTX 1050 v&agrave; đặc biệt l&agrave; GTX 1050Ti sẽ mang tới sức mạnh vượt trội so với GTX 950 trước đ&acirc;y v&agrave; c&oacute; mức gi&aacute; tuơng đuơng. Dưới đ&acirc;y l&agrave; 1 v&agrave;i th&ocirc;ng số về 2 card đồ họa mới theo th&ocirc;ng tin từ HWBattle, so s&aacute;nh c&ugrave;ng GTX 950.<br />
<br />
<img alt="" src="http://genknews.genkcdn.vn/thumb_w/640/2016/nvidia-geforce-gtx-1050-ti-and-geforce-gtx-1050-pascal-3-840x559-1474787003040.png" style="height:100%; width:100%" />Nếu như trước đ&acirc;y, GTX 950 c&oacute; 2 phi&ecirc;n bản, một y&ecirc;u cầu nguồn phụ, c&ograve;n lại th&igrave; kh&ocirc;ng. L&ecirc;n tới GTX 1050 v&agrave; GTX 1050Ti, cả 2 đều chỉ y&ecirc;u cầu 75W, lấy điện ho&agrave;n to&agrave;n th&ocirc;ng qua PCI-E 3.0 16X.</p>

<p>Tiếp đến l&agrave; dung lượng VRAM, trong khi GTX 1050Ti c&oacute; tới 4GB RAM v&agrave; hứa hẹn sẽ mạnh ngang GTX 960 4GB RAM trước đ&acirc;y, th&igrave; GTX 1050 sẽ chỉ c&oacute; 2GB bộ nhớ.</p>

<p>&nbsp;</p>
', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-26 20:15:34.200' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'se-co-gtx-1050-va-gtx-1050ti-4gb-vram-gia-tu-25-trieu-dong', N'se co gtx 1050 va gtx 1050ti, 4gb vram, gia tu 2,5 trieu dong')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (139, 0, 10, N'TỔ KHOA HỌC TỰ NHIÊN', NULL, N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas feugiat consequat diam. Maecenas metus. Vivamus diam purus, cursus a, commodo non, facilisis vitae, nulla. Aenean dictum lacinia tortor. Nunc iaculis, nibh non iaculis aliquam, orci felis euismod neque, sed ornare massa mauris sed velit. Nulla pretium mi et risus. Fusce mi pede, tempor id, cursus ac, ullamcorper nec, enim. Sed tortor. Curabitur molestie. Duis velit augue, condimentum at, ultrices a, luctus ut, orci. Donec pellentesque egestas eros. Integer cursus, augue in cursus faucibus, eros pede bibendum sem, in tempus tellus justo quis ligula. Etiam eget tortor. Vestibulum rutrum, est ut placerat elementum, lectus nisl aliquam velit, tempor aliquam eros nunc nonummy metus. In eros metus, gravida a, gravida sed, lobortis id, turpis. Ut ultrices, ipsum at venenatis fringilla, sem nulla lacinia tellus, eget aliquet turpis mauris non enim. Nam turpis. Suspendisse lacinia. Curabitur ac tortor ut ipsum egestas elementum. Nunc imperdiet gravida mauris.', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'hungph', CAST(N'2016-09-26 20:15:34.200' AS DateTime), NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL)
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (153, 0, 14, N'Choáng ngợp 12 nữ thần showbiz Châu Á 2016 vừa được công bố', N'<strong>Song Hye Kyo đoạt ng&ocirc;i nữ thần trong khi đ&oacute; vị tr&iacute; thứ hai thuộc về Trung Quốc.</strong><br />
<br />
Trong bảng xếp hạng c&aacute;c nữ thần trong showbiz ch&acirc;u &Aacute; năm 2016 vừa được c&ocirc;ng bố, Song Hye Kyo giữ ng&ocirc;i vị số 1. Nữ diễn vi&ecirc;n&nbsp;<em>Hậu duệ mặt trời&nbsp;</em>xuất sắc vượt qua nhiều gương mặt xinh đẹp kh&aacute;c. C&aacute;c người đẹp trong danh s&aacute;ch n&agrave;y ngo&agrave;i Song Hye Kyo c&ograve;n c&oacute; Song Ji Hyo, Jessica, Dương Mịch, Triệu Lệ Dĩnh...', N'<img alt="" src="http://123.30.184.190/upload/4-2016/images/2016-10-03/147547978631069-3.jpg" style="height:100%; width:100%" /><br />
<br />
Danh s&aacute;ch Nữ thần ch&acirc;u &Aacute; do một c&ocirc;ng ty c&ocirc;ng nghệ điện tử chuy&ecirc;n về giải tr&iacute; Contemporary Asian Goddess Entertainment Network tổ chức h&agrave;ng năm. Đ&acirc;y cũng l&agrave; cuộc b&igrave;nh chọn ra những gương mặt xinh đẹp nhất dựa theo số lượt vote của cư d&acirc;n mạng.<br />
<br />
<img alt="" src="http://123.30.184.190/upload/4-2016/images/2016-10-03/147548527580460-toc-mai-lua-thua-song-hye-kyo.jpg" style="height:100%; width:100%" /><br />
<br />
Song Hye Kyo &ndash; 3.749.837 b&igrave;nh chọn, ng&ocirc;i sao Hallyu tỏa s&aacute;ng nhất trong năm với bộ phim&nbsp;<em>Hậu duệ mặt trời</em><br />
<br />
&nbsp;', N'http://123.30.184.190/upload/4-2016/images/2016-10-03/147547978631069-3.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-10-04 23:57:19.967' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'choang-ngop-12-nu-than-showbiz-chau-a-2016-vua-duoc-cong-bo', N'choang ngop 12 nu than showbiz chau a 2016 vua duoc cong bo')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (155, 0, 14, N'hita giảm giá các khóa họchita giảm giá các khóa học', N'hita giảm gi&aacute; c&aacute;c kh&oacute;a học', N'hita giảm gi&aacute; c&aacute;c kh&oacute;a học', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-10-05 00:43:54.623' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'hita-giam-gia-cac-khoa-hochita-giam-gia-cac-khoa-hoc', N'hita giam gia cac khoa hochita giam gia cac khoa hoc')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (169, 0, 14, N'danh sách học sinh lớp 6, 7, 8', N'test', N'danh s&aacute;ch lớp 6, 7, 8', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-10-07 14:49:07.340' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'danh-sach-hoc-sinh-lop-6-7-8', N'danh sach hoc sinh lop 6, 7, 8')
INSERT [dbo].[TblNewsDraff] ([NewsId], [CodeNews], [GroupNewsId], [Title], [ShortContent], [Content], [BigImage], [SmaallImage], [ReleaseUser], [ReleaseDate], [RelaseStatus], [CreateUser], [CreateDate], [EditUser], [EditDate], [IsHome], [IsEvent], [Count], [TitleEng], [ShortContentEng], [ContentEng], [IsWeek], [Controller], [Action], [Metatitle], [SubTitle]) VALUES (170, 0, 14, N'danh sách lớp 6', N'nh&agrave; trường th&ocirc;ng b&aacute;o danh s&aacute;ch học sinh lớp 6 năm học n&agrave;y', N'chi tiết trong file đ&iacute;nh k&egrave;m', N'/Images/defaultimage.jpg', NULL, NULL, NULL, NULL, N'admin', CAST(N'2016-10-07 15:37:34.100' AS DateTime), NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, N'danh-sach-lop-6', N'danh sach lop 6')
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
/****** Object:  StoredProcedure [dbo].[Sp_User_Login]    Script Date: 10/7/2016 3:45:31 PM ******/
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
