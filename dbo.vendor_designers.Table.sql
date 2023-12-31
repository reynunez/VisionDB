/****** Object:  Table [dbo].[vendor_designers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendor_designers](
	[designer_no] [int] NOT NULL,
	[vendor_no] [int] NULL,
	[designer_name] [nvarchar](30) NULL,
	[catalog_designer_name] [nvarchar](30) NULL,
 CONSTRAINT [PrimaryKey_e03e3764-4e33-45e2-aa7e-0df32593faf1] PRIMARY KEY CLUSTERED 
(
	[designer_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
