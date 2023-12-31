/****** Object:  Table [dbo].[eyeexam]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eyeexam](
	[examid] [int] IDENTITY(1,1) NOT NULL,
	[examdate] [datetime] NULL,
	[contents] [varchar](max) NULL,
	[datestr] [varchar](25) NULL,
	[timestr] [varchar](25) NULL,
	[patientid] [int] NOT NULL,
 CONSTRAINT [PK_eyeexam] PRIMARY KEY CLUSTERED 
(
	[examid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[eyeexam] ADD  DEFAULT ((0)) FOR [patientid]
GO
