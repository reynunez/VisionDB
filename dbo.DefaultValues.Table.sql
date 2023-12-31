/****** Object:  Table [dbo].[DefaultValues]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DefaultValues](
	[officeid] [int] NOT NULL,
	[doctorid] [int] NOT NULL,
	[taxrate] [numeric](18, 2) NULL,
	[imgfolder] [text] NOT NULL,
	[DefaultID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PrimaryKey_482a6fab-6a26-4705-97e7-53cb6f810684] PRIMARY KEY CLUSTERED 
(
	[DefaultID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
