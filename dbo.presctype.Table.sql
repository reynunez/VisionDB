/****** Object:  Table [dbo].[presctype]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[presctype](
	[rxtype] [int] NOT NULL,
	[description] [char](45) NOT NULL,
 CONSTRAINT [PK_presctype] PRIMARY KEY CLUSTERED 
(
	[rxtype] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
