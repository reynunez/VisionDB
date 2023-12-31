/****** Object:  Table [dbo].[bitdesc]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitdesc](
	[bitid] [int] IDENTITY(1,1) NOT NULL,
	[bitval] [int] NULL,
	[description] [char](10) NULL,
 CONSTRAINT [PK_bitdesc2] PRIMARY KEY CLUSTERED 
(
	[bitid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
