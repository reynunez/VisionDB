/****** Object:  Table [dbo].[labtreatments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[labtreatments](
	[treatmentid] [int] IDENTITY(1,1) NOT NULL,
	[manufacturer] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[txname] [nvarchar](50) NULL,
	[Cost] [numeric](18, 2) NULL,
	[listprice] [numeric](18, 2) NULL,
 CONSTRAINT [PK_labtreatments] PRIMARY KEY CLUSTERED 
(
	[treatmentid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
