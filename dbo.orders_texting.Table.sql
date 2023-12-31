/****** Object:  Table [dbo].[orders_texting]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders_texting](
	[messageid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL,
	[results] [nvarchar](500) NULL,
	[tdate] [datetime] NULL,
 CONSTRAINT [PK_orders_texting] PRIMARY KEY CLUSTERED 
(
	[messageid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
