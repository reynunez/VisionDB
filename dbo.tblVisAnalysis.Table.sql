/****** Object:  Table [dbo].[tblVisAnalysis]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVisAnalysis](
	[analysisid] [int] IDENTITY(1,1) NOT NULL,
	[analysis] [varchar](100) NULL,
	[criteria] [varchar](100) NULL,
	[code] [varchar](100) NULL,
 CONSTRAINT [PK_tblVisAnalysis] PRIMARY KEY CLUSTERED 
(
	[analysisid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
