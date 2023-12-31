/****** Object:  Table [dbo].[tblEyeExamCpt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEyeExamCpt](
	[cptid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NOT NULL,
	[eyetestid] [int] NULL,
	[codelist] [varchar](1000) NULL,
	[codedetails] [varchar](1000) NULL,
 CONSTRAINT [PK_tblEyeExamCpt] PRIMARY KEY CLUSTERED 
(
	[cptid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
