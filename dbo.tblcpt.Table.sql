/****** Object:  Table [dbo].[tblcpt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblcpt](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class] [varchar](50) NULL,
	[code] [varchar](50) NULL,
	[modifier] [varchar](50) NULL,
	[modifier2] [varchar](50) NULL,
	[description] [varchar](max) NULL,
	[fee] [numeric](18, 2) NULL,
 CONSTRAINT [PK_tblcpt] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
