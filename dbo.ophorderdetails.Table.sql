/****** Object:  Table [dbo].[ophorderdetails]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ophorderdetails](
	[ophprescid] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NULL,
	[sphr] [numeric](8, 2) NULL,
	[sphl] [numeric](8, 2) NULL,
	[cylr] [numeric](8, 2) NULL,
	[cyll] [numeric](8, 2) NULL,
	[axisr] [smallint] NULL,
	[axisl] [smallint] NULL,
	[addr] [numeric](8, 2) NULL,
	[addl] [numeric](8, 2) NULL,
	[distpdr] [numeric](8, 2) NULL,
	[distpdl] [numeric](8, 2) NULL,
	[nearpdr] [numeric](8, 2) NULL,
	[nearpdl] [numeric](8, 2) NOT NULL,
	[prism1r] [numeric](8, 2) NULL,
	[prism1l] [numeric](8, 2) NULL,
	[base1r] [varchar](15) NULL,
	[base1l] [varchar](15) NULL,
	[prism2r] [numeric](8, 2) NULL,
	[prism2l] [numeric](8, 2) NULL,
	[base2r] [varchar](15) NULL,
	[base2l] [varchar](15) NULL,
	[heightr] [smallint] NULL,
	[heightl] [smallint] NULL,
	[thicknessr] [smallint] NULL,
	[thicknessl] [smallint] NULL,
	[thicknesstyper] [varchar](45) NULL,
	[thicknesstypel] [varchar](45) NULL,
	[treatment1] [varchar](250) NULL,
	[treatment2] [varchar](250) NULL,
	[treatment3] [varchar](250) NULL,
	[treatment4] [varchar](250) NULL,
	[treatment5] [varchar](250) NULL,
	[treatment6] [varchar](250) NULL,
	[prescid] [varchar](25) NULL,
	[usage] [varchar](50) NULL,
 CONSTRAINT [PK_ophorderdetails] PRIMARY KEY CLUSTERED 
(
	[ophprescid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
