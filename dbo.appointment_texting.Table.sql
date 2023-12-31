/****** Object:  Table [dbo].[appointment_texting]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment_texting](
	[messageid] [int] IDENTITY(1,1) NOT NULL,
	[appmt_no] [int] NULL,
	[results] [nvarchar](500) NULL,
	[tdate] [datetime] NULL,
 CONSTRAINT [PK_appointment_texting] PRIMARY KEY CLUSTERED 
(
	[messageid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
