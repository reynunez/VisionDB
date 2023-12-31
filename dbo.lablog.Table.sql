/****** Object:  Table [dbo].[lablog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lablog](
	[logid] [int] IDENTITY(1,1) NOT NULL,
	[createdate] [datetime] NULL,
	[filename] [varchar](50) NULL,
	[contents] [text] NULL,
	[ishold] [bit] NULL,
	[movedate] [datetime] NULL,
 CONSTRAINT [PK_lablog] PRIMARY KEY CLUSTERED 
(
	[logid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
