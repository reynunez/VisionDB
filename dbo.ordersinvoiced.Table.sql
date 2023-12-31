/****** Object:  Table [dbo].[ordersinvoiced]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordersinvoiced](
	[recordid] [int] IDENTITY(1,1) NOT NULL,
	[invoiceid] [int] NULL,
	[orderid] [int] NULL,
 CONSTRAINT [PK_ordersinvoiced] PRIMARY KEY CLUSTERED 
(
	[recordid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
