/****** Object:  Table [dbo].[clorders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clorders](
	[clorderid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL,
	[status] [varchar](10) NULL,
	[eye] [varchar](10) NULL,
	[manufacturer] [varchar](65) NULL,
	[name] [varchar](65) NULL,
	[lenstype] [varchar](50) NULL,
	[color] [varchar](50) NULL,
	[sph] [numeric](8, 2) NULL,
	[cyl] [numeric](8, 2) NULL,
	[axis] [smallint] NULL,
	[addition] [numeric](8, 2) NULL,
	[BC] [numeric](8, 2) NULL,
	[UPCC] [nvarchar](25) NULL,
	[Qty] [smallint] NULL,
	[price] [numeric](8, 2) NULL,
	[cost] [numeric](18, 2) NULL,
 CONSTRAINT [PK_clorders] PRIMARY KEY CLUSTERED 
(
	[clorderid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
