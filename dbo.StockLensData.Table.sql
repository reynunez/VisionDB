/****** Object:  Table [dbo].[StockLensData]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockLensData](
	[slID] [int] IDENTITY(1,1) NOT NULL,
	[spcid] [nvarchar](14) NULL,
	[MFG] [nvarchar](45) NULL,
	[Class] [nvarchar](10) NULL,
	[product_name] [nvarchar](65) NULL,
	[material] [nvarchar](5) NULL,
	[Manufacturer] [nvarchar](45) NULL,
	[Product Name] [nvarchar](65) NULL,
	[lens_type] [nvarchar](5) NULL,
	[Filter] [nvarchar](10) NULL,
	[Coating] [nvarchar](10) NULL,
	[Coating Brand] [nvarchar](45) NULL,
	[Right OPC] [int] NULL,
	[Left OPC] [int] NULL,
	[Diameter] [int] NULL,
	[Sph/Base] [numeric](18, 2) NULL,
	[sphere_power] [numeric](18, 2) NULL,
	[Base] [numeric](18, 2) NULL,
	[Cyl/Add] [numeric](18, 2) NULL,
	[cylinder_power] [numeric](18, 2) NULL,
	[add_power] [numeric](18, 2) NULL,
	[Frnt Rad] [numeric](18, 2) NULL,
	[Bck Rad] [int] NULL,
	[C Thk] [numeric](18, 2) NULL,
	[E Thk] [numeric](18, 2) NULL,
	[LRP in] [numeric](18, 2) NULL,
	[LRP down] [numeric](18, 2) NULL,
	[d index] [numeric](18, 2) NULL,
	[N Ref] [nvarchar](5) NULL,
	[e index] [numeric](18, 2) NULL,
	[Abbe] [int] NULL,
	[Density] [numeric](18, 2) NULL,
	[PRP out] [int] NULL,
	[PRP up] [int] NULL,
	[ND] [nvarchar](11) NULL,
 CONSTRAINT [PK_StockLensData] PRIMARY KEY CLUSTERED 
(
	[slID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
