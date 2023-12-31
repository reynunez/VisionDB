/****** Object:  Table [dbo].[shipping_details]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[shipping_details](
	[shipid] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NULL,
	[shipdate] [date] NULL,
	[tracking_number] [varchar](255) NULL,
	[order_type] [varchar](50) NULL,
	[orderid] [int] NULL,
	[service_type] [varchar](50) NULL,
	[shipto_addressid] [int] NULL,
	[comments] [text] NULL,
 CONSTRAINT [PK_shipping_details] PRIMARY KEY CLUSTERED 
(
	[shipid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
