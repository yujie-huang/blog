USE [blog]
GO
/****** Object:  Table [dbo].[admin]    Script Date: 2019/12/27 11:36:47 ******/
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
/****** Object:  Table [dbo].[article]    Script Date: 2019/12/27 11:36:47 ******/
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
/****** Object:  Table [dbo].[title]    Script Date: 2019/12/27 11:36:47 ******/
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
/****** Object:  Table [dbo].[users]    Script Date: 2019/12/27 11:36:47 ******/
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
/****** Object:  View [dbo].[articlefull]    Script Date: 2019/12/27 11:36:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[articlefull] as
select article_id,a.type_id,a.userName,headline,content,publish_date,revise_date,statues,fullName,type_name
from article a left join users b on a.userName=b.userName left join title c on a.type_id=c.type_id
GO
INSERT [dbo].[admin] ([userId], [password], [power], [status]) VALUES (N'admin     ', N'123', N'2 ', 1)
SET IDENTITY_INSERT [dbo].[article] ON 

INSERT [dbo].[article] ([article_id], [type_id], [userName], [headline], [content], [publish_date], [revise_date], [statues]) VALUES (21, 21, N'1111111111', N'前端学习路线图', N'<p>一、基础<br>1、学习HTML基础</p><p>HTML给你的网页赋予了结构。它就像是人的骨架那样让你保持站立。首先你需要去学习语法以及它必须提供的一切。你的学习应该聚焦在下面这些东西上：</p><p><span style="background-color: rgb(70, 172, 200);">学习HTML基础，了解如何编写语义HTML理解如何把网页分成section（段落），以及如何正确组织DOM（文档对象模型）现在很多html5的新标签也很有用，需要进行了解

</span></p><p>2、学点CSS

</p><p>现在我们已经学会了如何给网页准备好骨架，接下来就是在此基础上添加一些皮肤让它好看一点了。CSS——级联样式表就是用来美化你的HTML页面的。

</p><p>实践建议：<br>一旦你掌握了基础，接下来就应该设计上一步制作的HTML网页。比方说如果你给Github档案编写了HTML页面的话，现在是时候应用CSS来让它的样子看起来像实际的Github资料页面一样了。前面的那5个页面都要拿来试一下。</p><p><br>3、学习JavaScript基础<br><br>JavaScript能让你的HTML页面互动性更强。比方说你在网站上看过的所有那些幻灯片、弹出窗口以及广播通知，以及在没有重载页面的情况下重载页面的特定部分，这些都是用JavaScript做的。在这一步中，你将会学习JavaScript的基础来为后面的旅程做好准备——<br><br></p><p><br></p>', CAST(N'2019-12-26 13:12:38.000' AS DateTime), NULL, NULL)
INSERT [dbo].[article] ([article_id], [type_id], [userName], [headline], [content], [publish_date], [revise_date], [statues]) VALUES (22, 25, N'1111111111', N'LintCode题解|翻转矩阵后的得分', N'<p>LintCode题解|翻转矩阵后的得分】<br><br>【题目描述】<br>有一个二维矩阵 A 其中每个元素的值为 0 或 1 。<br><br>移动是指选择任一行或列，并转换该行或列中的每一个值：将所有 0 都更改为 1，将所有 1 都更改为 0。<br><br>在做出任意次数的移动后，将该矩阵的每一行都按照二进制数来解释，矩阵的得分就是这些数字的总和。<br><br>返回尽可能高的分数。<br><br>1≤A.length≤20<br>1≤A[0].length≤20<br>A[i][j] 是 0 或 1<br><br>【题目样例】<br><br>样例 1:<br>输入：[[0,0,1,1],[1,0,1,0],[1,1,0,0]]<br>输出：39<br>解释：<br>转换为 [[1,1,1,1],[1,0,0,1],[1,1,1,1]]<br>0b1111 + 0b1001 + 0b1111 = 15 + 9 + 15 = 39<br><br>样例 2:<br>输入：[[1,1],[0,0],[1,0],[1,0],[1,1]]<br>输出：13<br>解释：<br>转换为 [[1,1],[1,1],[1,0],[1,0],[1,1]]<br>0b11 + 0b11 + 0b10 + ob10 + ob11 = 3 + 3 + 2 + 2 + 3= 13<br><br>【题目解析（Python）】<br><br>n*m的每个格子都具有一个权重，其中每一行权重都自左向右递减，<br>为使总和最大则尽可能使权重大的格子填“1”。最左边一列权重最大，所以总可以通过<br>行翻转使左边第一列全都置“1”，后面就不能再使用行翻转了，以免破环当前的结构，<br>所以考虑列翻转。对于除最左边第一列外的每一列，总可以通过列翻转使得该列“1”<br>的个数不小于“0”的个数。最后所有填“1”的格子的权重和即为答案。<br><br></p><p><br></p>', CAST(N'2019-12-26 13:12:24.000' AS DateTime), CAST(N'2019-12-26 13:12:03.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[article] OFF
SET IDENTITY_INSERT [dbo].[title] ON 

INSERT [dbo].[title] ([type_id], [type_name], [userName]) VALUES (21, N'技术', N'1111111111')
INSERT [dbo].[title] ([type_id], [type_name], [userName]) VALUES (22, N'百科', N'1111111111')
INSERT [dbo].[title] ([type_id], [type_name], [userName]) VALUES (23, N'生活', N'1111111111')
INSERT [dbo].[title] ([type_id], [type_name], [userName]) VALUES (24, N'Java', N'1111111111')
INSERT [dbo].[title] ([type_id], [type_name], [userName]) VALUES (25, N'Python', N'1111111111')
INSERT [dbo].[title] ([type_id], [type_name], [userName]) VALUES (26, N'摄影', N'1212121212')
SET IDENTITY_INSERT [dbo].[title] OFF
INSERT [dbo].[users] ([userName], [password], [fullName], [sex], [email], [wechat], [information], [regist_date], [status], [birth]) VALUES (N'1111111111', N'11111111', N'芝麻', N'男', NULL, NULL, NULL, CAST(N'2019-12-26 13:12:05.000' AS DateTime), 1, NULL)
INSERT [dbo].[users] ([userName], [password], [fullName], [sex], [email], [wechat], [information], [regist_date], [status], [birth]) VALUES (N'1212121212', N'12121212', N'大侠龙', N'男', NULL, NULL, NULL, CAST(N'2019-12-26 15:12:54.000' AS DateTime), 1, NULL)
INSERT [dbo].[users] ([userName], [password], [fullName], [sex], [email], [wechat], [information], [regist_date], [status], [birth]) VALUES (N'3333333333', N'33333333', N'猪猪侠', N'男', NULL, NULL, NULL, CAST(N'2019-12-26 20:12:48.000' AS DateTime), 1, NULL)
ALTER TABLE [dbo].[article]  WITH CHECK ADD FOREIGN KEY([type_id])
REFERENCES [dbo].[title] ([type_id])
GO
ALTER TABLE [dbo].[article]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[users] ([userName])
GO
ALTER TABLE [dbo].[title]  WITH CHECK ADD FOREIGN KEY([userName])
REFERENCES [dbo].[users] ([userName])
GO
