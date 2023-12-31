/****** Object:  Table [dbo].[sforders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sforders](
	[sforderid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL,
	[type] [nvarchar](50) NULL,
	[manufacturer] [varchar](65) NULL,
	[model] [nvarchar](65) NULL,
	[color] [nvarchar](50) NULL,
	[A] [decimal](8, 2) NULL,
	[dbl] [decimal](8, 2) NULL,
	[B] [decimal](8, 2) NULL,
	[ED] [decimal](18, 2) NULL,
	[Temple] [decimal](8, 2) NULL,
	[Price] [decimal](18, 2) NULL,
	[ordertype] [nvarchar](50) NULL,
	[jobtype] [nvarchar](50) NULL,
	[dbc] [decimal](8, 2) NULL,
	[dec] [decimal](8, 2) NULL,
	[mbs] [decimal](8, 2) NULL,
	[eye] [int] NULL,
	[circunference] [decimal](8, 2) NULL,
	[colorcode] [nvarchar](35) NULL,
	[collectionname] [nvarchar](50) NULL,
	[frameshape] [nvarchar](50) NULL,
	[material] [nvarchar](50) NULL,
	[rimtype] [nvarchar](50) NULL,
	[havecase] [bit] NULL,
	[UPC] [nvarchar](20) NULL,
	[ToOrder] [bit] NULL,
	[fpcID] [nvarchar](14) NULL,
	[cost] [numeric](18, 2) NULL,
 CONSTRAINT [PK_sforders] PRIMARY KEY CLUSTERED 
(
	[sforderid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[sforders] ADD  CONSTRAINT [DF_sforders_ToOrder_1]  DEFAULT ((0)) FOR [ToOrder]
GO
