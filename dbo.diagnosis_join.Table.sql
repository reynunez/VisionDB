/****** Object:  Table [dbo].[diagnosis_join]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagnosis_join](
	[diagnosis_cd] [int] IDENTITY(1,1) NOT NULL,
	[diagnosis_descr] [nvarchar](250) NULL,
	[group_cd] [int] NULL,
	[user_cd] [nvarchar](15) NULL,
	[diag_plan] [varchar](7500) NULL,
 CONSTRAINT [PK_diagnosis_join] PRIMARY KEY CLUSTERED 
(
	[diagnosis_cd] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
