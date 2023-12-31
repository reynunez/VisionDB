/****** Object:  Table [dbo].[labinventory]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[labinventory](
	[labrecid] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [nvarchar](50) NULL,
	[name] [nvarchar](200) NULL,
	[type] [nvarchar](50) NULL,
	[price] [numeric](18, 2) NULL,
	[cost] [numeric](18, 2) NULL,
	[material] [nvarchar](50) NULL,
	[cpt_cd] [nvarchar](50) NULL,
	[style] [nvarchar](20) NULL,
	[lind] [numeric](18, 2) NULL,
 CONSTRAINT [PK_labinventory] PRIMARY KEY CLUSTERED 
(
	[labrecid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
