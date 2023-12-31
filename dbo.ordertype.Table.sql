/****** Object:  Table [dbo].[ordertype]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordertype](
	[ordertype] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](65) NULL,
 CONSTRAINT [PK_ordertype] PRIMARY KEY CLUSTERED 
(
	[ordertype] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
