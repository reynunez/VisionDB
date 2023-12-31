/****** Object:  Table [dbo].[patientrpt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patientrpt](
	[preportid] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NOT NULL,
	[handc] [smallint] NOT NULL,
	[sendbym] [smallint] NOT NULL,
	[sendbyf] [smallint] NOT NULL,
	[toname] [char](45) NOT NULL,
	[fordesc] [char](45) NOT NULL,
	[rptdate] [datetime] NOT NULL,
	[history] [text] NOT NULL,
	[findings] [text] NOT NULL,
	[disposition] [text] NOT NULL,
	[toffyes] [smallint] NOT NULL,
	[toffno] [smallint] NOT NULL,
	[returndate] [datetime] NOT NULL,
	[nextapp] [smallint] NOT NULL,
	[emergency] [smallint] NOT NULL,
	[urgent] [smallint] NOT NULL,
	[routine] [smallint] NOT NULL,
 CONSTRAINT [PK_patientrpt] PRIMARY KEY CLUSTERED 
(
	[preportid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
