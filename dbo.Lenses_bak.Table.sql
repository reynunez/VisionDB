/****** Object:  Table [dbo].[Lenses_bak]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lenses_bak](
	[lensid] [bigint] NOT NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[product_name] [nvarchar](50) NULL,
	[lens_type] [nvarchar](50) NULL,
	[material] [nvarchar](50) NULL,
	[sku_number] [nvarchar](50) NULL,
	[sphere_power] [numeric](18, 2) NULL,
	[cylinder_power] [numeric](18, 2) NULL,
	[add_power] [numeric](18, 2) NULL,
	[eye_selection] [nvarchar](50) NULL,
	[price] [numeric](18, 2) NULL,
	[cost] [numeric](18, 2) NULL,
	[spcID] [nvarchar](50) NULL,
	[MFG] [nvarchar](45) NULL,
	[Class] [nvarchar](10) NULL,
	[Product Name] [nvarchar](65) NULL,
	[Filter] [nvarchar](10) NULL,
	[Coating] [nvarchar](10) NULL,
	[Coating Brand] [nvarchar](45) NULL,
	[Right OPC] [int] NULL,
	[Left OPC] [int] NULL,
	[Diameter] [int] NULL,
	[Frnt Rad] [numeric](18, 2) NULL,
	[Bck Rad] [int] NULL,
	[C Thk] [numeric](18, 2) NULL,
	[E Thk] [numeric](18, 2) NULL,
	[LRP in] [numeric](18, 2) NULL,
	[LRP down] [numeric](18, 2) NULL,
	[d index] [numeric](18, 3) NULL,
	[N Ref] [nvarchar](5) NULL,
	[e index] [numeric](18, 3) NULL,
	[Abbe] [int] NULL,
	[Density] [numeric](18, 2) NULL,
	[PRP out] [int] NULL,
	[PRP up] [int] NULL,
	[ND] [nvarchar](11) NULL,
	[cpt] [nvarchar](255) NULL,
	[active] [int] NULL,
 CONSTRAINT [PK_Lenses_bak] PRIMARY KEY CLUSTERED 
(
	[lensid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
