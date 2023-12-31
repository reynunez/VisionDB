/****** Object:  Table [dbo].[tblFrames]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFrames](
	[frameid] [int] IDENTITY(1,1) NOT NULL,
	[manufacturerName] [varchar](100) NULL,
	[collectionName] [varchar](100) NULL,
	[styleName] [varchar](100) NULL,
	[styleNew] [smallint] NULL,
	[colordescription] [varchar](100) NULL,
	[colorCode] [varchar](100) NULL,
	[A] [numeric](18, 2) NULL,
	[DBL] [numeric](18, 2) NULL,
	[B] [numeric](18, 2) NULL,
	[ED] [numeric](18, 2) NULL,
	[MBS] [numeric](18, 2) NULL,
	[temple] [int] NULL,
	[rimType] [varchar](100) NULL,
	[material] [varchar](100) NULL,
	[circunference] [numeric](18, 2) NULL,
	[eye] [int] NULL,
	[frameShape] [varchar](15) NULL,
	[markukp] [numeric](18, 2) NULL,
	[haveCase] [bit] NULL,
	[upc] [varchar](100) NULL,
	[CompletePrice] [numeric](18, 2) NULL,
 CONSTRAINT [PK_tblFrames] PRIMARY KEY CLUSTERED 
(
	[frameid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
