/****** Object:  Table [dbo].[servcategories]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servcategories](
	[servcat] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](45) NOT NULL,
 CONSTRAINT [PK_servcategories] PRIMARY KEY CLUSTERED 
(
	[servcat] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
