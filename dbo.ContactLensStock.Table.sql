/****** Object:  Table [dbo].[ContactLensStock]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactLensStock](
	[fpcID] [nvarchar](100) NOT NULL,
	[officeID] [int] NOT NULL,
	[manufacturername] [nvarchar](100) NULL,
	[clname] [nvarchar](100) NULL,
	[cost] [numeric](18, 2) NULL,
	[list price] [numeric](18, 2) NULL,
	[trial] [nvarchar](1) NULL,
	[stb] [nvarchar](1) NULL,
	[bc] [numeric](18, 2) NULL,
	[sph] [numeric](18, 2) NULL,
	[cyl] [numeric](18, 2) NULL,
	[axs] [numeric](18, 0) NULL,
	[cladd] [numeric](18, 2) NULL,
	[istrial] [numeric](18, 0) NULL,
	[color] [nvarchar](50) NULL,
	[upcc] [nvarchar](100) NULL
) ON [PRIMARY]
GO
