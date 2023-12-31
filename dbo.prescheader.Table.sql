/****** Object:  Table [dbo].[prescheader]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescheader](
	[prescid] [int] IDENTITY(1,1) NOT NULL,
	[presctype] [int] NULL,
	[patient_no] [int] NULL,
	[prescdate] [datetime] NULL,
	[doctor] [varchar](65) NULL,
	[license] [varchar](20) NULL,
	[void] [bit] NULL,
	[officeid] [int] NULL,
	[orderprefix] [varchar](10) NULL,
	[voidreason] [varchar](max) NULL,
 CONSTRAINT [PK_prescheader] PRIMARY KEY CLUSTERED 
(
	[prescid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[prescheader] ADD  CONSTRAINT [ColumnDefault_bf7bb05b-dc49-414f-85b4-8037ce326956]  DEFAULT ((0)) FOR [void]
GO
