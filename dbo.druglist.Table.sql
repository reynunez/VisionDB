/****** Object:  Table [dbo].[druglist]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[druglist](
	[thid] [int] IDENTITY(1,1) NOT NULL,
	[Category] [nvarchar](50) NULL,
	[subcategory] [nvarchar](50) NULL,
	[tradeName] [nvarchar](50) NULL,
	[Generic] [nvarchar](50) NULL,
	[Manufacturer] [nvarchar](50) NULL,
	[Preparation] [nvarchar](50) NULL,
	[pedriaticUse] [nvarchar](50) NULL,
	[HowSupplied] [nvarchar](50) NULL,
	[typicalDosing] [nvarchar](50) NULL,
	[Indications] [nvarchar](max) NULL,
	[cautions] [nvarchar](250) NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_druglist] PRIMARY KEY CLUSTERED 
(
	[thid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
