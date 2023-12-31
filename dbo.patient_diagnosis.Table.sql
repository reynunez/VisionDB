/****** Object:  Table [dbo].[patient_diagnosis]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient_diagnosis](
	[patdiagcode] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NULL,
	[user_cd] [nvarchar](10) NULL,
	[diag_date] [datetime] NULL,
	[diag_start] [datetime] NULL,
	[diag_end] [datetime] NULL,
	[comments] [varchar](2000) NULL,
	[cd_key] [int] NULL,
	[is_icd10] [bit] NULL,
 CONSTRAINT [PK_patient_diagnosis] PRIMARY KEY CLUSTERED 
(
	[patdiagcode] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
