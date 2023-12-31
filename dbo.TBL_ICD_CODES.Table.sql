/****** Object:  Table [dbo].[TBL_ICD_CODES]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TBL_ICD_CODES](
	[DIAGNOSIS_ID] [bigint] NULL,
	[CHAPTER] [varchar](100) NULL,
	[CHAPTER_DESC] [varchar](100) NULL,
	[SECTION] [varchar](100) NULL,
	[SECTION_DESCRIPTION] [varchar](100) NULL,
	[GROUP_CODE] [varchar](100) NULL,
	[GROUP_DESCRIPTION] [varchar](100) NULL,
	[ICD_CODE] [varchar](100) NULL,
	[SHORT_DESCRIPTION] [varchar](100) NULL,
	[LONG_DESCRIPTION] [varchar](100) NULL
) ON [PRIMARY]
GO
