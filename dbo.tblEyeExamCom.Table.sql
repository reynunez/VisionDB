/****** Object:  Table [dbo].[tblEyeExamCom]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEyeExamCom](
	[comid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NULL,
	[description] [varchar](225) NULL,
	[icd10list] [varchar](225) NULL,
	[icd10details] [varchar](225) NULL,
 CONSTRAINT [PK_tblEyeExamCom] PRIMARY KEY CLUSTERED 
(
	[comid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
