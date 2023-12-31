/****** Object:  Table [dbo].[salespeople]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[salespeople](
	[salesmanid] [int] IDENTITY(1,1) NOT NULL,
	[name] [char](60) NOT NULL,
	[commision] [numeric](18, 2) NOT NULL,
	[officeid] [int] NULL,
	[Phone] [nvarchar](20) NULL,
	[persidnumber] [varchar](4) NULL,
 CONSTRAINT [PrimaryKey_9cba8048-29a5-4b69-bfee-fa4861a14677] PRIMARY KEY CLUSTERED 
(
	[salesmanid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
