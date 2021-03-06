USE [blog]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2019/12/27 11:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[admin](
	[userId] [nchar](10) NOT NULL,
	[password] [nvarchar](50) NULL,
	[power] [nchar](2) NULL,
	[status] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[article]    Script Date: 2019/12/27 11:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[article](
	[article_id] [int] IDENTITY(1,1) NOT NULL,
	[type_id] [int] NOT NULL,
	[userName] [nchar](10) NOT NULL,
	[headline] [nvarchar](500) NULL,
	[content] [ntext] NULL,
	[publish_date] [datetime] NULL,
	[revise_date] [datetime] NULL,
	[statues] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[article_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[title]    Script Date: 2019/12/27 11:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[title](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](100) NOT NULL,
	[userName] [nchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[users]    Script Date: 2019/12/27 11:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[userName] [nchar](10) NOT NULL,
	[password] [nvarchar](32) NULL,
	[fullName] [nvarchar](50) NULL,
	[sex] [nvarchar](4) NULL,
	[email] [nvarchar](100) NULL,
	[wechat] [nvarchar](100) NULL,
	[information] [ntext] NULL,
	[regist_date] [datetime] NULL,
	[status] [bit] NULL CONSTRAINT [dfst]  DEFAULT ((1)),
	[birth] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [dbo].[articlefull]    Script Date: 2019/12/27 11:27:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[articlefull] as
select article_id,a.type_id,a.userName,headline,content,publish_date,revise_date,statues,fullName,type_name
from article a left join users b on a.userName=b.userName left join title c on a.type_id=c.type_id
GO
ALTER TABLE [dbo].[article]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[title] ([type_id])
GO
ALTER TABLE [dbo].[article]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[users] ([userName])
GO
ALTER TABLE [dbo].[title]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[users] ([userName])
GO
