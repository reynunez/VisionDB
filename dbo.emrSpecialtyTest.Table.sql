/****** Object:  Table [dbo].[emrSpecialtyTest]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emrSpecialtyTest](
	[testid] [int] IDENTITY(1,1) NOT NULL,
	[patientid] [int] NULL,
	[testdate] [date] NULL,
	[iopOD] [nvarchar](100) NULL,
	[iopOS] [nvarchar](100) NULL,
	[iopComment] [nvarchar](100) NULL,
	[dfeOD] [nvarchar](100) NULL,
	[dfeOS] [nvarchar](100) NULL,
	[dfeComment] [nvarchar](100) NULL,
	[topoOD] [nvarchar](100) NULL,
	[topoOS] [nvarchar](100) NULL,
	[topoComment] [nvarchar](100) NULL,
	[rbutOD] [nvarchar](100) NULL,
	[rbutOS] [nvarchar](100) NULL,
	[rbutComment] [nvarchar](100) NULL,
	[aspOD] [nvarchar](100) NULL,
	[aspOS] [nvarchar](100) NULL,
	[aspComment] [nvarchar](100) NULL,
	[pspOD] [nvarchar](100) NULL,
	[pspOS] [nvarchar](100) NULL,
	[pspComment] [nvarchar](100) NULL,
	[plugsOD] [nvarchar](100) NULL,
	[plugsOS] [nvarchar](100) NULL,
	[plugsComment] [nvarchar](100) NULL,
	[diOD] [nvarchar](100) NULL,
	[diOS] [nvarchar](100) NULL,
	[diComment] [nvarchar](100) NULL,
	[gonioOD] [nvarchar](100) NULL,
	[gonioOS] [nvarchar](100) NULL,
	[gonioComment] [nvarchar](100) NULL,
	[octonhOD] [nvarchar](100) NULL,
	[octonhOS] [nvarchar](100) NULL,
	[octonhComment] [nvarchar](100) NULL,
	[octmacOD] [nvarchar](100) NULL,
	[octmacOS] [nvarchar](100) NULL,
	[octmacComment] [nvarchar](100) NULL,
	[octasOD] [nvarchar](100) NULL,
	[octasOS] [nvarchar](100) NULL,
	[octasComment] [nvarchar](100) NULL,
	[vfOD] [nvarchar](100) NULL,
	[vfOS] [nvarchar](100) NULL,
	[vfComment] [nvarchar](100) NULL,
	[cctOD] [nvarchar](100) NULL,
	[cctOS] [nvarchar](100) NULL,
	[cctComment] [nvarchar](100) NULL,
	[cdOD] [nvarchar](100) NULL,
	[cdOS] [nvarchar](100) NULL,
	[cdComment] [nvarchar](100) NULL,
	[doctorid] [int] NULL,
	[updatedate] [datetime] NULL,
	[scriptdate] [datetime] NULL,
	[rdoctorid] [int] NULL,
 CONSTRAINT [PK_sptest] PRIMARY KEY CLUSTERED 
(
	[testid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[emrSpecialtyTest] ADD  CONSTRAINT [DF_emrSpecialtyTest_doctorid]  DEFAULT ((1)) FOR [doctorid]
GO
ALTER TABLE [dbo].[emrSpecialtyTest] ADD  CONSTRAINT [DF_emrSpecialtyTest_rdoctorid]  DEFAULT ((5322)) FOR [rdoctorid]
GO
