/****** Object:  Table [dbo].[StockFrames]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockFrames](
	[stockid] [int] IDENTITY(1,1) NOT NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[Model] [nvarchar](100) NULL,
	[A] [numeric](18, 0) NULL,
	[DBL] [numeric](18, 0) NULL,
	[B] [numeric](18, 0) NULL,
	[ED] [numeric](18, 0) NULL,
	[Temple] [numeric](18, 0) NULL,
	[Color] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[price] [numeric](18, 2) NULL,
	[brandname] [nvarchar](100) NULL,
	[collectionname] [nvarchar](100) NULL,
	[stylename] [nvarchar](100) NULL,
	[colordescription] [nvarchar](100) NULL,
	[colorcode] [nvarchar](50) NULL,
	[DBC] [numeric](8, 2) NULL,
	[DEC] [numeric](18, 2) NULL,
	[MBS] [numeric](18, 2) NULL,
	[rimtype] [nvarchar](100) NULL,
	[material] [nvarchar](100) NULL,
	[frameshape] [nvarchar](100) NULL,
	[circunference] [numeric](18, 2) NULL,
	[eye] [int] NULL,
	[UPC] [nvarchar](50) NULL,
 CONSTRAINT [PK_StockFrames] PRIMARY KEY CLUSTERED 
(
	[stockid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
