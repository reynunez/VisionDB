/****** Object:  Table [dbo].[tblEyeExamTest]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEyeExamTest](
	[testid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NULL,
	[description] [varchar](100) NULL,
	[icd10list] [varchar](225) NULL,
	[icd10details] [varchar](225) NULL,
 CONSTRAINT [PK_tblEyeExamTest] PRIMARY KEY CLUSTERED 
(
	[testid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
