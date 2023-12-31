/****** Object:  Table [dbo].[framesdata]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[framesdata](
	[fpcID] [nvarchar](14) NOT NULL,
	[upc] [nvarchar](14) NULL,
	[styleID] [int] NULL,
	[styleName] [nvarchar](50) NULL,
	[colordescription] [nvarchar](50) NULL,
	[colorCode] [nvarchar](20) NULL,
	[lenscolor] [nvarchar](50) NULL,
	[lenscolorCode] [nvarchar](20) NULL,
	[eye] [int] NULL,
	[bridge] [int] NULL,
	[temple] [int] NULL,
	[DBL] [numeric](18, 2) NULL,
	[A] [numeric](18, 2) NULL,
	[B] [numeric](18, 2) NULL,
	[ED] [numeric](18, 2) NULL,
	[circunference] [numeric](18, 2) NULL,
	[EDangle] [numeric](18, 2) NULL,
	[frontPrice] [money] NULL,
	[HalfTemplePrice] [money] NULL,
	[TemplesPrice] [money] NULL,
	[CompletePrice] [money] NULL,
	[manufacturerName] [nvarchar](50) NULL,
	[brandName] [nvarchar](50) NULL,
	[collectionName] [nvarchar](50) NULL,
	[genderType] [nvarchar](20) NULL,
	[ageGroup] [nvarchar](15) NULL,
	[activeStatus] [nvarchar](50) NULL,
	[productGroupName] [nvarchar](15) NULL,
	[rimType] [nvarchar](25) NULL,
	[material] [nvarchar](50) NULL,
	[frameShape] [nvarchar](15) NULL,
	[styleNew] [smallint] NULL,
	[changedPrice] [smallint] NULL,
	[country] [nvarchar](30) NULL,
	[sku] [nvarchar](30) NULL,
	[yearintroduced] [smallint] NULL,
	[endoflinemarker] [nvarchar](2) NULL,
	[DBC] [numeric](18, 2) NULL,
	[markup] [money] NULL,
	[markupFront] [money] NULL,
	[markupTemple] [money] NULL,
 CONSTRAINT [PK_framesdata] PRIMARY KEY CLUSTERED 
(
	[fpcID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
