/****** Object:  Table [dbo].[FramesStockData]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FramesStockData](
	[fpcID] [nvarchar](100) NOT NULL,
	[officeID] [int] NOT NULL,
	[manufacturerName] [nvarchar](100) NULL,
	[collectionName] [nvarchar](100) NULL,
	[styleName] [nvarchar](100) NULL,
	[styleNew] [smallint] NULL,
	[colordescription] [nvarchar](100) NULL,
	[colorCode] [nvarchar](100) NULL,
	[A] [numeric](18, 2) NULL,
	[DBL] [numeric](18, 2) NULL,
	[DBC] [numeric](18, 2) NULL,
	[B] [numeric](18, 2) NULL,
	[ED] [numeric](18, 2) NULL,
	[MBS] [numeric](18, 2) NULL,
	[temple] [int] NULL,
	[rimType] [nvarchar](100) NULL,
	[material] [nvarchar](100) NULL,
	[circunference] [numeric](18, 2) NULL,
	[eye] [int] NULL,
	[frameShape] [nvarchar](15) NULL,
	[markup] [money] NULL,
	[haveCase] [bit] NULL,
	[upc] [nvarchar](100) NULL,
	[CompletePrice] [numeric](18, 2) NULL,
 CONSTRAINT [PK_framesstockdata] PRIMARY KEY CLUSTERED 
(
	[fpcID] ASC,
	[officeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FramesStockData] ADD  CONSTRAINT [DF_FramesStockData_haveCase]  DEFAULT ((0)) FOR [haveCase]
GO
