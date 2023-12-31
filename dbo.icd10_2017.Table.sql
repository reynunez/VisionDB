/****** Object:  Table [dbo].[icd10_2017]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[icd10_2017](
	[order_no] [bigint] NOT NULL,
	[group_code] [varchar](8) NULL,
	[group_description] [varchar](max) NULL,
	[subgroup_code] [varchar](8) NULL,
	[subgroup_description] [varchar](max) NULL,
	[icd10_code] [varchar](8) NULL,
	[short_description] [varchar](max) NULL,
	[long_description] [varchar](max) NULL,
	[icd_code] [varchar](10) NULL,
	[diag_plan] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
