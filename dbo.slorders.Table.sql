/****** Object:  Table [dbo].[slorders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slorders](
	[slorderid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL,
	[lenstype] [varchar](50) NULL,
	[eye] [varchar](10) NULL,
	[manufacturer] [varchar](65) NULL,
	[lname] [varchar](65) NULL,
	[material] [varchar](65) NULL,
	[sph] [decimal](8, 2) NULL,
	[cyl] [decimal](8, 2) NULL,
	[addition] [decimal](8, 2) NULL,
	[price] [decimal](18, 2) NULL,
	[UPCC] [nvarchar](20) NULL,
	[cost] [numeric](18, 2) NULL,
	[index] [numeric](18, 2) NULL,
	[style] [nvarchar](50) NULL,
	[tbase] [nvarchar](11) NULL,
	[CT] [numeric](18, 2) NULL,
	[ET] [numeric](18, 2) NULL,
 CONSTRAINT [PK_slorders] PRIMARY KEY CLUSTERED 
(
	[slorderid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
