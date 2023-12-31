/****** Object:  Table [dbo].[Products]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[prd_no] [int] IDENTITY(1,1) NOT NULL,
	[prd_type_no] [smallint] NULL,
	[prd_desc] [nvarchar](50) NULL,
	[prd_fee] [money] NULL,
	[pro_cpt_cd] [nvarchar](15) NULL,
	[taxable] [bit] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[prd_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((1)) FOR [taxable]
GO
