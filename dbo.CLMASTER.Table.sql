/****** Object:  Table [dbo].[CLMASTER]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLMASTER](
	[CLID] [int] IDENTITY(1,1) NOT NULL,
	[MAN_ID] [varchar](10) NULL,
	[MAN_NAME] [varchar](100) NULL,
	[SER_ID] [varchar](10) NULL,
	[SER_NAME] [varchar](100) NULL,
	[STY_ID] [varchar](10) NULL,
	[SER_DAY_PER_LENS] [int] NULL,
	[PRF_CONVERT] [varchar](10) NULL,
	[PRF_BASECURVE] [numeric](18, 2) NULL,
	[PRF_DIAMETER] [numeric](18, 2) NULL,
	[PRF_ID] [varchar](50) NULL,
	[PRF_REV_DIAG_IND] [varchar](10) NULL,
	[PRD_ADDITION] [numeric](18, 2) NULL,
	[PRD_AXIS] [int] NULL,
	[PRD_CHECKDIGIT] [int] NULL,
	[PRD_COLOR] [varchar](50) NULL,
	[PRD_CONVERT] [varchar](50) NULL,
	[PRD_CYLINDER] [numeric](18, 2) NULL,
	[PRD_DESCRIPTION] [varchar](100) NULL,
	[PRD_ID] [varchar](25) NULL,
	[PRD_POWER] [numeric](18, 2) NULL,
	[PRD_UPC_CODE] [varchar](25) NULL,
	[PRD_COLOR_ID] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CLID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
