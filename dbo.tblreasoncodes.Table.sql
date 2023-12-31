/****** Object:  Table [dbo].[tblreasoncodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblreasoncodes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reasonid] [int] NULL,
	[codeid] [int] NULL,
	[codetype] [varchar](10) NULL,
	[icd_code] [varchar](10) NULL,
	[cpt_code] [varchar](10) NULL,
	[createdat] [datetime] NULL,
 CONSTRAINT [PK_tblreasoncodes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
