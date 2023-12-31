/****** Object:  Table [dbo].[tblDailyReconciliations]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDailyReconciliations](
	[reconid] [int] IDENTITY(1,1) NOT NULL,
	[recondate] [datetime] NULL,
	[cash] [numeric](18, 2) NULL,
	[other] [numeric](18, 2) NULL,
	[itemscount] [int] NULL,
	[rcash] [numeric](18, 2) NULL,
	[rother] [numeric](18, 2) NULL,
	[dcash] [numeric](18, 2) NULL,
	[dother] [numeric](18, 2) NULL,
	[officeid] [int] NULL,
	[comments] [varchar](max) NULL,
 CONSTRAINT [PK_tblDailyReconciliations] PRIMARY KEY CLUSTERED 
(
	[reconid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
