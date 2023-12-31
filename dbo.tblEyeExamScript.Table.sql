/****** Object:  Table [dbo].[tblEyeExamScript]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEyeExamScript](
	[scriptid] [int] IDENTITY(1,1) NOT NULL,
	[examid] [int] NULL,
	[testid] [int] NULL,
	[color] [varchar](20) NULL,
	[script] [varchar](2000) NULL,
	[isall] [bit] NULL,
 CONSTRAINT [PK_tbl_EyeExamScript] PRIMARY KEY CLUSTERED 
(
	[scriptid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
