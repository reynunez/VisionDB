/****** Object:  Table [dbo].[PurchaseOrders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseOrders](
	[poID] [int] IDENTITY(1,1) NOT NULL,
	[vendorName] [nvarchar](100) NULL,
	[shipVia] [nvarchar](100) NULL,
	[dateRequired] [datetime] NULL,
	[description] [nvarchar](100) NULL,
	[datePromissed] [datetime] NULL,
	[orderDate] [datetime] NULL,
 CONSTRAINT [PK_PurchaseOrders] PRIMARY KEY CLUSTERED 
(
	[poID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
