/****** Object:  Table [dbo].[appvisitstate]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appvisitstate](
	[stateid] [smallint] IDENTITY(1,1) NOT NULL,
	[statecode] [smallint] NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_appvisitstate] PRIMARY KEY CLUSTERED 
(
	[stateid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
