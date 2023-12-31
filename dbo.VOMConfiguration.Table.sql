/****** Object:  Table [dbo].[VOMConfiguration]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VOMConfiguration](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[emailLogin] [varchar](100) NULL,
	[emailPword] [nvarchar](50) NULL,
	[emailAddress] [varchar](100) NULL,
	[emailOutgoing] [varchar](100) NULL,
	[emailIncoming] [varchar](100) NULL,
	[emailServerauth] [int] NULL,
	[emailUseSpa] [int] NULL,
	[labelTopMarging] [numeric](18, 2) NULL,
	[labelSideMarging] [numeric](18, 2) NULL,
	[labelHeight] [numeric](18, 2) NULL,
	[labelWidth] [numeric](18, 2) NULL,
	[labelAcross] [numeric](18, 2) NULL,
	[labelDown] [numeric](18, 2) NULL,
	[labelSpace] [numeric](18, 2) NULL,
	[labelAvery] [int] NULL,
	[labelPageSize] [int] NULL,
	[TaxRate] [numeric](18, 2) NULL,
	[labjobsfolder] [varchar](max) NULL,
	[LabRxD1Folder] [varchar](max) NULL,
	[LabRxD2Folder] [varchar](max) NULL,
	[emailSMTPPort] [varchar](10) NULL,
	[patientsFolder] [varchar](1000) NULL,
	[doctorsFolder] [varchar](1000) NULL,
	[shippingFolder] [varchar](1000) NULL,
	[patientsFolderB] [varchar](1000) NULL,
	[shippingFolderB] [varchar](1000) NULL,
	[doctorsFolderB] [varchar](1000) NULL,
 CONSTRAINT [PrimaryKey_15cb7b9f-0486-417f-b711-24c9352cdeba] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
