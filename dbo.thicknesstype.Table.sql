/****** Object:  Table [dbo].[thicknesstype]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thicknesstype](
	[thicknessid] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_thicknesstype] PRIMARY KEY CLUSTERED 
(
	[thicknessid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
