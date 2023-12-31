/****** Object:  Table [dbo].[emrscripts2]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emrscripts2](
	[scriptid] [int] IDENTITY(1,1) NOT NULL,
	[scriptcontents] [text] NULL,
 CONSTRAINT [PK_script2] PRIMARY KEY CLUSTERED 
(
	[scriptid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
