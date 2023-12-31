/****** Object:  Table [dbo].[diagcat]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagcat](
	[diagcat] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_diagcat] PRIMARY KEY CLUSTERED 
(
	[diagcat] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
