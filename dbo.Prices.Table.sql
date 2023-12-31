/****** Object:  Table [dbo].[Prices]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prices](
	[Id] [int] NOT NULL,
	[manucode] [nvarchar](255) NULL,
	[namecode] [nvarchar](255) NULL,
	[clname] [nvarchar](255) NULL,
	[trial] [nvarchar](255) NULL,
	[STB] [nvarchar](255) NULL,
	[color] [nvarchar](255) NULL,
	[cost] [float] NULL,
	[year_supply] [float] NULL,
	[profit] [float] NULL,
	[price] [float] NULL,
	[rounded] [float] NULL,
 CONSTRAINT [PrimaryKey_659c2d43-48b4-411b-8238-f143c6ae43e8] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
