/****** Object:  Table [dbo].[creditnotes]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[creditnotes](
	[cnoteid] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NOT NULL,
	[invoiceid] [int] NOT NULL,
	[invoicedate] [datetime] NOT NULL,
	[supportdoc] [smallint] NOT NULL,
	[fullcredit] [smallint] NOT NULL,
	[partialcredit] [smallint] NOT NULL,
	[invrev] [smallint] NOT NULL,
	[goodsret] [smallint] NOT NULL,
	[other] [smallint] NOT NULL,
	[fulldesc] [text] NOT NULL,
	[authorizedby] [char](45) NOT NULL,
	[notedate] [datetime] NOT NULL,
	[amount] [numeric](18, 2) NOT NULL,
 CONSTRAINT [PK_creditnotes] PRIMARY KEY CLUSTERED 
(
	[cnoteid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
