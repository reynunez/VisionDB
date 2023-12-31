/****** Object:  Table [dbo].[vomtasks]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vomtasks](
	[taskid] [int] IDENTITY(1,1) NOT NULL,
	[taskdescription] [nvarchar](100) NOT NULL,
	[assignfrom] [int] NULL,
	[assignto] [int] NULL,
	[area] [nvarchar](50) NULL,
	[areaid] [int] NULL,
	[areatext] [text] NOT NULL,
	[priorityid] [int] NULL,
	[statusid] [int] NULL,
	[comments] [text] NULL,
	[datecreated] [datetime] NULL,
	[dateupdated] [datetime] NULL,
	[accepted] [bit] NULL,
	[started] [datetime] NULL,
	[ended] [datetime] NULL,
	[changedby] [int] NULL,
 CONSTRAINT [PK_taskid] PRIMARY KEY CLUSTERED 
(
	[taskid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[vomtasks] ADD  CONSTRAINT [ColumnDefault_bd03a017-043b-4fc2-88a8-9196f6794b13]  DEFAULT ((0)) FOR [accepted]
GO
