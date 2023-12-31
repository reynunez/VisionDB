/****** Object:  Table [dbo].[payments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[payments](
	[paymentid] [int] IDENTITY(1,1) NOT NULL,
	[invoiceid] [int] NOT NULL,
	[pydate] [datetime] NOT NULL,
	[pytype] [smallint] NOT NULL,
	[payer] [smallint] NOT NULL,
	[pymemo] [text] NULL,
	[payment] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_payments] PRIMARY KEY CLUSTERED 
(
	[paymentid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
