/****** Object:  Table [dbo].[prescription]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescription](
	[rxnumber] [int] IDENTITY(1,1) NOT NULL,
	[rxtype] [int] NOT NULL,
	[patient_no] [int] NOT NULL,
	[lsph] [numeric](18, 2) NOT NULL,
	[lcyl] [numeric](18, 2) NOT NULL,
	[laxis] [numeric](18, 2) NOT NULL,
	[lbasec] [numeric](18, 2) NOT NULL,
	[ldiameter] [numeric](18, 2) NOT NULL,
	[rsph] [numeric](18, 2) NOT NULL,
	[rcyl] [numeric](18, 2) NOT NULL,
	[raxis] [numeric](18, 2) NOT NULL,
	[rbasec] [numeric](18, 2) NOT NULL,
	[rdiameter] [numeric](18, 2) NOT NULL,
	[sv] [smallint] NOT NULL,
	[bf] [smallint] NOT NULL,
	[prog] [smallint] NOT NULL,
	[uv] [smallint] NOT NULL,
	[scratchc] [smallint] NOT NULL,
	[antiref] [smallint] NOT NULL,
	[polishe] [smallint] NOT NULL,
	[ploycarb] [smallint] NOT NULL,
	[highidx] [smallint] NOT NULL,
	[cldesc] [char](45) NOT NULL,
	[rxdate] [datetime] NOT NULL,
	[refill] [smallint] NOT NULL,
	[refillqty] [smallint] NOT NULL,
	[voidafter] [datetime] NOT NULL,
	[sufficient] [smallint] NOT NULL,
	[eyedescr] [char](12) NOT NULL,
	[eyedescl] [char](12) NOT NULL,
	[addr] [char](10) NULL,
	[addl] [char](10) NULL,
	[otherr] [varchar](50) NULL,
	[otherl] [varchar](50) NULL,
	[pd1] [varchar](10) NULL,
	[pd2] [varchar](10) NULL,
 CONSTRAINT [PK_prescription] PRIMARY KEY CLUSTERED 
(
	[rxnumber] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
