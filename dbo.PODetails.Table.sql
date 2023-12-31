/****** Object:  Table [dbo].[PODetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PODetails](
	[poID] [int] IDENTITY(1,1) NOT NULL,
	[fpcID] [nvarchar](14) NOT NULL,
	[upc] [nvarchar](14) NULL,
	[manufacturerName] [nvarchar](50) NULL,
	[brandName] [nvarchar](50) NULL,
	[DBL] [numeric](18, 2) NULL,
	[A] [numeric](18, 2) NULL,
	[B] [numeric](18, 2) NULL,
	[ED] [numeric](18, 2) NULL,
	[rimType] [nvarchar](25) NULL,
	[material] [nvarchar](50) NULL,
	[frameShape] [nvarchar](15) NULL,
	[Price] [numeric](18, 2) NULL,
	[Quantity] [int] NULL,
	[Total] [numeric](18, 2) NULL,
	[officeID] [int] NOT NULL,
 CONSTRAINT [PK_PODetails] PRIMARY KEY CLUSTERED 
(
	[poID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
