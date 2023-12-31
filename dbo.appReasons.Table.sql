/****** Object:  Table [dbo].[appReasons]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appReasons](
	[reasonID] [int] IDENTITY(1,1) NOT NULL,
	[reasoncode] [varchar](10) NULL,
	[description] [varchar](50) NULL,
 CONSTRAINT [PK_appReasons] PRIMARY KEY CLUSTERED 
(
	[reasonID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
