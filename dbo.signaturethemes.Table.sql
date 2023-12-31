/****** Object:  Table [dbo].[signaturethemes]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[signaturethemes](
	[signatureid] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NULL,
	[sigbody] [varchar](max) NULL,
	[sigfooter] [varchar](max) NULL,
	[abbreviation] [varchar](50) NULL,
	[signumber] [int] NULL,
 CONSTRAINT [PK_signaturethemes] PRIMARY KEY CLUSTERED 
(
	[signatureid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
