USE [ProjectSpain]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 01-Jul-20 21:22:22 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[City] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Text] [nvarchar](350) NOT NULL,
	[PostId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LikeComms]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LikeComms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[CommentId] [int] NOT NULL,
 CONSTRAINT [PK_LikeComms] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[PostId] [int] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pictures]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pictures](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Alt] [nvarchar](350) NOT NULL,
	[Route] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Pictures] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Heading] [nvarchar](50) NOT NULL,
	[Text] [nvarchar](600) NOT NULL,
	[UserId] [int] NOT NULL,
	[CommNumb] [int] NOT NULL,
	[PictureId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[Actor] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[FirstName] [nvarchar](30) NOT NULL,
	[LastName] [nvarchar](30) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 01-Jul-20 21:22:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200620115748_ProjectSpain', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627120815_usecase', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627143826_correction', N'3.1.5')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [City]) VALUES (1, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, N'Valencia')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [City]) VALUES (2, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, N'Malaga')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [City]) VALUES (3, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, N'Madrid')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [City]) VALUES (6, CAST(N'2020-07-01T04:15:25.2760868' AS DateTime2), NULL, 0, 1, N'Vale')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [PostId], [UserId]) VALUES (1, CAST(N'2020-06-30T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'First comment', 3, 1)
INSERT [dbo].[Comments] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Text], [PostId], [UserId]) VALUES (2, CAST(N'2020-06-30T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Second comment', 3, 1)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[LikeComms] ON 

INSERT [dbo].[LikeComms] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [CommentId]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[LikeComms] OFF
GO
SET IDENTITY_INSERT [dbo].[Likes] ON 

INSERT [dbo].[Likes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [PostId]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 3)
INSERT [dbo].[Likes] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [PostId]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 3)
SET IDENTITY_INSERT [dbo].[Likes] OFF
GO
SET IDENTITY_INSERT [dbo].[Pictures] ON 

INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Alt], [Route]) VALUES (1, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-30T21:18:53.5473768' AS DateTime2), 0, 1, N'img3', N'4b4b6a71-1d13-4cec-bf7c-76f486edf130.png')
INSERT [dbo].[Pictures] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Alt], [Route]) VALUES (2, CAST(N'2020-06-30T20:36:17.7349960' AS DateTime2), NULL, 0, 1, N'img1', N'9712b6a7-911d-4906-8602-1670ed35205c.png')
SET IDENTITY_INSERT [dbo].[Pictures] OFF
GO
SET IDENTITY_INSERT [dbo].[Posts] ON 

INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Heading], [Text], [UserId], [CommNumb], [PictureId], [CategoryId]) VALUES (3, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, N'First Post', N'First post about Spain', 1, 0, 1, 1)
INSERT [dbo].[Posts] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Heading], [Text], [UserId], [CommNumb], [PictureId], [CategoryId]) VALUES (4, CAST(N'2020-06-30T19:06:11.6591822' AS DateTime2), CAST(N'2020-07-01T03:03:15.8852361' AS DateTime2), 0, 1, N'cetvrti', N'Cetvrti Post edit', 1, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[Posts] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (1, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, N'Admin')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Name]) VALUES (2, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, N'Authorized')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T20:46:47.3295823' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (2, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T20:55:41.5495779' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (3, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T20:55:54.0382949' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (4, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:30:36.2916831' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (5, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:31:22.5985647' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (6, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:32:21.4051097' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (7, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:32:25.6263913' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (8, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:32:31.2440713' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (9, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:34:46.6421863' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (10, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:34:50.7537678' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (11, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:35:01.8535724' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (12, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:35:05.3162563' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (13, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:35:11.0854022' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (14, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:35:15.9514587' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (15, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:35:18.8752299' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (16, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:35:30.8510567' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (17, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:35:35.7542997' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (18, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:43:10.4801038' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (19, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T22:43:18.2408264' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (20, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T23:42:49.9686264' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (21, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-29T23:58:21.9994684' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":2,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (22, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T00:08:16.9973549' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (23, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T00:13:05.8072753' AS DateTime2), N'Get Categories', N'{"City":null,"Id":0,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (24, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T00:18:13.9789535' AS DateTime2), N'Get Categories', N'{"Id":0,"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (25, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T00:18:34.0560154' AS DateTime2), N'Get Categories', N'{"Id":0,"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (26, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T00:30:11.2804712' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (27, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T00:34:56.8725470' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (28, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T10:32:37.3369858' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (29, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T10:43:58.8116129' AS DateTime2), N'Get Category', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (30, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T10:44:25.8574704' AS DateTime2), N'Get Category', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (31, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T10:44:30.8535147' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (32, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T10:51:20.2408021' AS DateTime2), N'Get Category', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (33, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T11:42:17.1907387' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (34, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T11:43:27.0070020' AS DateTime2), N'Get Category', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (35, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T11:48:45.5839439' AS DateTime2), N'Get Category', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (36, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T15:54:17.4691184' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (37, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T15:55:23.2916423' AS DateTime2), N'Get Category', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (38, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:00:03.8404872' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (39, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:19:33.1604179' AS DateTime2), N'Get Post', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (40, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:22:27.6806057' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (41, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:22:44.1751960' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (42, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:25:10.4148763' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (43, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:26:24.5280539' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (44, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:30:47.8168884' AS DateTime2), N'Get Post', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (45, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T16:39:30.5005657' AS DateTime2), N'Create Post', N'{"Id":0,"Heading":"Drugi post","Text":"Tekst","CommentNumb":0,"UserId":1,"PictureId":1,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (46, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T17:05:58.8101626' AS DateTime2), N'Create Post', N'{"Id":0,"Heading":"Drugi post","Text":"Tekst","CommentNumb":0,"UserId":1,"PictureId":1,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (47, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T17:13:42.2749148' AS DateTime2), N'Create Post', N'{"Id":0,"Heading":"Treci post","Text":"Tekst123","CommentNumb":0,"UserId":1,"PictureId":1,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (48, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T18:23:53.7897902' AS DateTime2), N'Create Picture', N'{"Id":0,"Alt":"img1","Route":"fc4f16bd-d845-457f-8757-3b920f570977.png","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (49, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T18:36:09.2380622' AS DateTime2), N'Create Picture', N'{"Id":0,"Alt":"img1","Route":"9712b6a7-911d-4906-8602-1670ed35205c.png","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (50, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T18:52:47.3121241' AS DateTime2), N'Get comments', N'{"Text":null,"Heading":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (51, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T19:10:32.9644313' AS DateTime2), N'Create Picture', N'{"Id":0,"Alt":"img2","Route":"07c9314d-9ba6-4178-97a7-eeb89689fafa.png","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (52, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T19:14:15.0424254' AS DateTime2), N'Edit Picture', N'{"Id":0,"Alt":"img3","Route":"c0554123-7947-4ac4-a294-fe47516a4685.png","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (53, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T19:16:22.7485343' AS DateTime2), N'Edit Picture', N'{"Id":0,"Alt":"im2","Route":"aa86bb29-351f-4da0-8715-1f7ac73e2d66.png","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (54, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T19:16:50.9465954' AS DateTime2), N'Edit Picture', N'{"Id":0,"Alt":"im2","Route":"f9b493ce-1d60-4396-a6ab-e5c49c3f3497.png","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (55, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T19:18:41.2816449' AS DateTime2), N'Edit Picture', N'{"Id":1,"Alt":"img3","Route":"4b4b6a71-1d13-4cec-bf7c-76f486edf130.png","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (56, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T22:48:27.0303759' AS DateTime2), N'Get Category', N'0', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (57, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T22:59:03.5411844' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (58, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T22:59:33.9495722' AS DateTime2), N'Get Category', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (59, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-06-30T23:34:29.6479459' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (60, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T00:48:12.9637291' AS DateTime2), N'Edit post', N'{"Id":0,"Heading":"cetvrti","Text":"Cetvrti Post edit","CommentNumb":0,"UserId":1,"PictureId":3,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (61, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T00:48:38.4075969' AS DateTime2), N'Edit post', N'{"Id":0,"Heading":"cetvrti","Text":"Cetvrti Post edit","CommentNumb":0,"UserId":1,"PictureId":0,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (62, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T00:49:46.4253813' AS DateTime2), N'Edit post', N'{"Id":0,"Heading":"cetvrti","Text":"Cetvrti Post edit","CommentNumb":0,"UserId":1,"PictureId":2,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (63, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T00:55:00.7874536' AS DateTime2), N'Edit post', N'{"Id":0,"Heading":"cetvrti","Text":"Cetvrti Post edit","CommentNumb":0,"UserId":1,"PictureId":2,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (64, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T00:59:36.9426290' AS DateTime2), N'Edit post', N'{"Id":0,"Heading":"cetvrti","Text":"Cetvrti Post edit","CommentNumb":2,"UserId":1,"PictureId":2,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (65, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:03:09.6150400' AS DateTime2), N'Edit post', N'{"Id":4,"Heading":"cetvrti","Text":"Cetvrti Post edit","CommentNumb":2,"UserId":1,"PictureId":2,"CategoryId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (66, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:14:26.9183288' AS DateTime2), N'Delete Post', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (67, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:30:27.9682069' AS DateTime2), N'Get pictures', N'{"Alt":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (68, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:36:11.2373318' AS DateTime2), N'Get pictures', N'{"Alt":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (69, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:36:37.5021175' AS DateTime2), N'Get Picture', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (70, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:43:06.9663524' AS DateTime2), N'Get Picture', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (71, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:43:28.9321923' AS DateTime2), N'Delete Picture', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (72, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:52:09.8111121' AS DateTime2), N'Create Comment', N'{"Id":0,"Text":"Cetvrti Post edit","UserId":1,"PostId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (73, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:54:59.0008978' AS DateTime2), N'Create Comment', N'{"Id":0,"Text":"komentar create","UserId":1,"PostId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (74, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T01:56:59.5287836' AS DateTime2), N'Create Comment', N'{"Id":0,"Text":"komentar create","UserId":1,"PostId":3,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (75, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:02:53.7708590' AS DateTime2), N'Create Comment', N'{"Id":0,"Text":"komentar create","UserId":1,"PostId":3,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (76, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:04:50.1821270' AS DateTime2), N'Edit Comment', N'{"Id":3,"Text":"komentar edit","UserId":1,"PostId":3,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (77, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:05:43.7289018' AS DateTime2), N'Delete Comment', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (78, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:08:32.3827517' AS DateTime2), N'Get Categories', N'{"City":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (79, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:08:47.6976634' AS DateTime2), N'Get Category', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (80, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:15:20.2839639' AS DateTime2), N'Create Category', N'{"Id":0,"City":"Vale","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (81, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:16:16.2735788' AS DateTime2), N'Edit Category', N'{"Id":5,"City":"Ediiit","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (82, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T02:18:23.3848716' AS DateTime2), N'Delete Category', N'5', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (83, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:10:06.7374325' AS DateTime2), N'Create like', N'{"Id":0,"PostId":3,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (84, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:15:23.3921243' AS DateTime2), N'Create like', N'{"Id":0,"PostId":3,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (85, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:16:22.2882812' AS DateTime2), N'Create likeCommentar', N'{"Id":0,"CommentId":1,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (86, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:17:57.8127866' AS DateTime2), N'Create Role', N'{"Id":0,"Name":"Proba","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (87, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:24:06.3441513' AS DateTime2), N'Create Role', N'{"Id":0,"Name":"Proba","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (88, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:25:57.9374686' AS DateTime2), N'Create Role', N'{"Id":0,"Name":"Proba","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (89, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:41:45.3613988' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (90, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:43:03.2903584' AS DateTime2), N'Edit Role', N'{"Id":4,"Name":"Certvdf","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (91, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:43:12.5220512' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (92, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:43:22.6448388' AS DateTime2), N'Get Role', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (93, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:49:57.3322894' AS DateTime2), N'Delete Role', N'4', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (94, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:50:09.5573053' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (95, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:51:52.4634808' AS DateTime2), N'Get Likes', N'{"PostId":null,"UserId":null,"UserName":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (96, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:52:09.0567875' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (97, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:52:19.2643830' AS DateTime2), N'Get LikeComm', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (98, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:52:26.3448586' AS DateTime2), N'Get Like', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (99, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:53:23.4632333' AS DateTime2), N'Create like', N'{"Id":0,"PostId":3,"UserId":1}', N'Anonymus')
GO
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (100, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:53:33.4142842' AS DateTime2), N'Create likeCommentar', N'{"Id":0,"CommentId":0,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (101, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:59:25.4421127' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (102, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T09:59:25.6811606' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (103, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:01:37.5848671' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (104, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:04:26.3474437' AS DateTime2), N'Get Likes', N'{"PostId":null,"UserId":null,"UserName":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (105, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:05:34.7288997' AS DateTime2), N'Create like', N'{"Id":0,"PostId":1,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (106, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:08:06.3010523' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (107, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:08:51.3249295' AS DateTime2), N'Get Likes', N'{"PostId":null,"UserId":null,"UserName":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (108, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:09:20.2174766' AS DateTime2), N'Create like', N'{"Id":0,"PostId":3,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (109, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:09:29.1389759' AS DateTime2), N'Get Likes', N'{"PostId":null,"UserId":null,"UserName":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (110, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:12:36.6016388' AS DateTime2), N'Get Likes', N'{"PostId":null,"UserId":null,"UserName":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (111, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:16:49.4725099' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (112, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:30:10.9582915' AS DateTime2), N'Get Likes', N'{"PostId":null,"UserId":null,"UserName":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (113, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:30:35.0642204' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (114, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:30:42.7114971' AS DateTime2), N'Get Roles', N'{"Name":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (115, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:31:07.2930084' AS DateTime2), N'Delete like', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (116, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:31:16.1817578' AS DateTime2), N'Get Likes', N'{"PostId":null,"UserId":null,"UserName":null,"Heading":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (117, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:31:43.2975430' AS DateTime2), N'Create likeCommentar', N'{"Id":0,"CommentId":0,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (118, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:32:29.3388597' AS DateTime2), N'Create likeCommentar', N'{"Id":0,"CommentId":3,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (119, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:32:48.2161864' AS DateTime2), N'Create likeCommentar', N'{"Id":0,"CommentId":1,"UserId":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (120, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:32:55.1924011' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (121, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:33:06.1051659' AS DateTime2), N'Delete likeComm', N'2', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (122, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:33:14.8900621' AS DateTime2), N'Get LikeComms', N'{"UserId":null,"CommentId":null,"UserName":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (123, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T10:46:03.1844061' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (124, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T12:44:12.4623264' AS DateTime2), N'Get UserUseCase', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (125, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T12:52:52.4884809' AS DateTime2), N'Get UserUseCase', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (126, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:04:01.7542090' AS DateTime2), N'Get Users', N'{"UserName":null,"FirstName":null,"LastName":null,"Name":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (127, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:04:29.0139192' AS DateTime2), N'Get User', N'1', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (128, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:04:44.0498245' AS DateTime2), N'Get Users', N'{"UserName":null,"FirstName":null,"LastName":null,"Name":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (129, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:08:13.7393169' AS DateTime2), N'Create user', N'{"Id":0,"UserName":"Nena","Password":"nena123","Email":"nena@gmail","FirstName":"Nenaa","LastName":"Djakovic","RoleId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (130, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:09:05.1950682' AS DateTime2), N'Create user', N'{"Id":0,"UserName":"Nena","Password":"nena123","Email":"nena@gmail.com","FirstName":"Nenaa","LastName":"Djakovic","RoleId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (131, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:10:04.1719822' AS DateTime2), N'Edit User', N'{"Id":2,"UserName":"Nena","Password":"nena123","Email":"nena@gmail.com","FirstName":"Nenaa","LastName":"Djakovicccc","RoleId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (132, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:47:27.4790157' AS DateTime2), N'Edit User', N'{"Id":2,"UserName":"Nena","Password":"nena123","Email":"nena@gmail.com","FirstName":"Nenaa","LastName":"Djakovicccc","RoleId":1,"IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (133, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T13:48:15.2185330' AS DateTime2), N'Get Users', N'{"UserName":null,"FirstName":null,"LastName":null,"Name":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (134, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T15:42:58.2497108' AS DateTime2), N'Delete Role', N'3', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (1002, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T17:03:17.0114916' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (1003, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T17:24:05.7114514' AS DateTime2), N'Get Posts', N'{"UserName":null,"Heading":null,"Category":null,"Text":null,"PerPage":10,"PageNumber":1}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (1004, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T17:38:47.5532808' AS DateTime2), N'Create Category', N'{"Id":0,"City":"City1","IsDeleted":false}', N'Anonymus')
INSERT [dbo].[UseCaseLogs] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [Date], [UseCaseName], [Data], [Actor]) VALUES (1005, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, CAST(N'2020-07-01T17:51:46.2525768' AS DateTime2), N'Create Category', N'{"Id":0,"City":"fdfkdfdf","IsDeleted":false}', N'Anonymus')
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, N'Admin', N'Sifra1', N'admin@gmail.com', N'Nevena', N'Djakovic', 1)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (2, CAST(N'2020-07-01T15:09:05.6933221' AS DateTime2), CAST(N'2020-07-01T15:47:42.1917182' AS DateTime2), 0, 1, N'Nena', N'nena123', N'nena@gmail.com', N'Nenaa', N'Djakovicccc', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (3, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Maja', N'maja123', N'maja@gmail.com', N'Maja', N'Majic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1002, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Kaca', N'kaca123', N'kaca@gmail.com', N'Kaca', N'Kajic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1003, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Marko', N'marko123', N'marko@gmail.com', N'Marko', N'Markovic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1004, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Nikola', N'nikola123', N'nikola@gmail.com', N'Nikola', N'Nikolic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1005, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Viktor', N'viktor123', N'viktor@gmail.com', N'Viktor', N'Vicic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1006, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Sanja', N'sanja123', N'sanja@gmail.com', N'Sanja', N'Simic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1007, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Anja', N'anja123', N'anja@gmail.com', N'Anja', N'Andric', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1009, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Darko', N'darko123', N'darko@gmail.com', N'Darko', N'Lukovic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1010, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'David', N'david123', N'david@gmail.com', N'David', N'Davidovic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1011, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Petar', N'petar123', N'petar@gmail.com', N'Petar', N'Peric', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1012, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Mira', N'mira123', N'mira@gmail.com', N'Mirjana', N'Miric', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1013, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Nemanja', N'neca123', N'neca@gmail.com', N'Nemanja', N'Nedic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1014, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Milica', N'mica123', N'mica@gmail.com', N'Milica', N'Micic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1015, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Ivan', N'ivan123', N'ivan@gmail.com', N'Ivan', N'Ivanovic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1016, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Gavril', N'gavril123', N'gavril@gmail.com', N'Gavril', N'Gavrilovic', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1017, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Andrijan', N'andrijan123', N'andr@gmail.com', N'Andrijan', N'Andric', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1018, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Olja', N'olja123', N'olja@gmail.com', N'Olja', N'Maric', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserName], [Password], [Email], [FirstName], [LastName], [RoleId]) VALUES (1019, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, N'Neda', N'neda123', N'neda@gmail.com', N'Neda', N'Nedic', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, 1, 27)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (2, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, 1, 28)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (4, CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), CAST(N'2020-06-27T00:00:00.0000000' AS DateTime2), 0, 1, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1003, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 0, 1, 1)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1005, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 2)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1006, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 3)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1007, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 4)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1008, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 5)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1010, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 6)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1011, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 7)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1013, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 8)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1014, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 9)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1015, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 10)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1016, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 11)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1017, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 12)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1018, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 13)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1019, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 14)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1020, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 15)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1021, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 16)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1022, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 17)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1023, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 18)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1024, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 19)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1025, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 20)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1026, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 21)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1027, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 22)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1028, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 23)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1029, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 24)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1030, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 25)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1031, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 26)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1032, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 27)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1033, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 28)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1034, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 29)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1035, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 30)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1036, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 31)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1037, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 32)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1038, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 33)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1040, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 34)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1041, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 35)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1042, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 36)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1043, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 37)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1044, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 38)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsDeleted], [IsActive], [UserId], [UseCaseId]) VALUES (1045, CAST(N'2020-07-01T00:00:00.0000000' AS DateTime2), NULL, 0, 1, 1, 39)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Categories] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Comments] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[LikeComms] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[LikeComms] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Likes] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Pictures] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Posts] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Roles] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (CONVERT([bit],(1))) FOR [IsActive]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Posts_PostId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_UserId]
GO
ALTER TABLE [dbo].[LikeComms]  WITH CHECK ADD  CONSTRAINT [FK_LikeComms_Comments_CommentId] FOREIGN KEY([CommentId])
REFERENCES [dbo].[Comments] ([Id])
GO
ALTER TABLE [dbo].[LikeComms] CHECK CONSTRAINT [FK_LikeComms_Comments_CommentId]
GO
ALTER TABLE [dbo].[LikeComms]  WITH CHECK ADD  CONSTRAINT [FK_LikeComms_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[LikeComms] CHECK CONSTRAINT [FK_LikeComms_Users_UserId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Posts_PostId] FOREIGN KEY([PostId])
REFERENCES [dbo].[Posts] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Posts_PostId]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_Users_UserId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Pictures_PictureId] FOREIGN KEY([PictureId])
REFERENCES [dbo].[Pictures] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Pictures_PictureId]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
