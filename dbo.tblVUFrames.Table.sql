/****** Object:  Table [dbo].[tblVUFrames]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVUFrames](
	[frameid] [int] IDENTITY(1,1) NOT NULL,
	[manufacturerName] [varchar](100) NULL,
	[collectionName] [varchar](100) NULL,
	[styleName] [varchar](100) NULL,
	[colordescription] [varchar](100) NULL,
	[A] [int] NULL,
	[DBL] [int] NULL,
	[B] [int] NULL,
	[ED] [int] NULL,
	[rimType] [varchar](100) NULL,
	[CompletePrice] [numeric](18, 2) NULL,
	[date_created] [datetime] NULL,
	[date_updated] [datetime] NULL,
	[trace] [varchar](max) NULL,
 CONSTRAINT [PK_tblVUFrames] PRIMARY KEY CLUSTERED 
(
	[frameid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblVUFrames] ADD  DEFAULT ('') FOR [trace]
GO
