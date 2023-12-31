/****** Object:  Table [dbo].[AbbOrders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AbbOrders](
	[abbOrderId] [int] IDENTITY(1,1) NOT NULL,
	[ordercode] [varchar](45) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ReferenceId] [varchar](20) NULL,
	[VUReferenceId] [varchar](20) NULL,
	[CustomerId] [varchar](20) NULL,
	[OrderStatus] [varchar](45) NULL,
	[ShippingAddresee] [varchar](100) NULL,
	[ShippingAddress1] [varchar](100) NULL,
	[ShippingCity] [varchar](100) NULL,
	[ShippingStateCode] [varchar](50) NULL,
	[ShippingPostalCode] [varchar](20) NULL,
	[ShippingMethod] [varchar](25) NULL,
	[ShippingCharges] [numeric](18, 2) NULL,
	[TotalAmount] [numeric](18, 2) NULL,
	[PartnerTrackingId] [varchar](20) NULL,
	[ShipToPatient] [bit] NULL,
 CONSTRAINT [PK_AbbOrders] PRIMARY KEY CLUSTERED 
(
	[abbOrderId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
