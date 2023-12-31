/****** Object:  Table [dbo].[eyesselection]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[eyesselection](
	[eyeid] [int] NOT NULL,
	[description] [nvarchar](65) NULL,
	[value] [nchar](10) NULL,
 CONSTRAINT [PrimaryKey_0b7e9b3d-f0cd-4860-a27c-3af8269018c8] PRIMARY KEY CLUSTERED 
(
	[eyeid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
