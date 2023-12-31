/****** Object:  Table [dbo].[tblCollections]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCollections](
	[collectionid] [int] IDENTITY(1,1) NOT NULL,
	[collection_name] [varchar](100) NULL,
	[manufacturer_name] [varchar](100) NULL,
	[min_price] [numeric](18, 2) NULL,
	[max_price] [numeric](18, 2) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_tblCollections] PRIMARY KEY CLUSTERED 
(
	[collectionid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblCollections] ADD  CONSTRAINT [DF_tblCollections_active]  DEFAULT ((1)) FOR [active]
GO
