/****** Object:  Table [dbo].[CLMAN_SER_UNIT]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLMAN_SER_UNIT](
	[MANSER_ID] [int] IDENTITY(1,1) NOT NULL,
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
	[UNIT_ID] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
