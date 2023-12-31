/****** Object:  Table [dbo].[emrsavedscripts]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emrsavedscripts](
	[scriptid] [int] IDENTITY(1,1) NOT NULL,
	[patientid] [int] NOT NULL,
	[sdate] [datetime] NULL,
	[scriptdate] [varchar](50) NULL,
	[scripttime] [varchar](50) NULL,
	[scriptcontents] [text] NULL,
	[initialscript] [text] NULL,
	[natureofvisit] [varchar](240) NULL,
	[assessment] [text] NULL,
 CONSTRAINT [PK_patscript] PRIMARY KEY CLUSTERED 
(
	[scriptid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
