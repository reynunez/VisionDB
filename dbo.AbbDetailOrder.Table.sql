/****** Object:  Table [dbo].[AbbDetailOrder]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbbDetailOrder](
	[abbOrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ordercode] [varchar](45) NOT NULL,
	[ProductId] [varchar](20) NULL,
	[ProductName] [varchar](45) NULL,
	[Quantity] [int] NULL,
	[CustomerPartId] [int] NULL,
	[ExtendedPrice] [numeric](18, 2) NULL,
	[ItemComment] [varchar](50) NULL,
	[UnitPrice] [numeric](18, 2) NULL,
 CONSTRAINT [PK_AbbDetailOrder] PRIMARY KEY CLUSTERED 
(
	[abbOrderDetailId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
