/****** Object:  Table [dbo].[product_type]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type](
	[prdl_no] [int] IDENTITY(1,1) NOT NULL,
	[prdl_desc] [nvarchar](30) NULL,
	[prd_type_no] [int] NULL,
 CONSTRAINT [PK_product_type] PRIMARY KEY CLUSTERED 
(
	[prdl_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
