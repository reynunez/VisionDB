/****** Object:  Table [dbo].[appmttime]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appmttime](
	[timeid] [int] IDENTITY(1,1) NOT NULL,
	[appmttime] [varchar](15) NULL,
 CONSTRAINT [PrimaryKey_844dd72b-08f4-4a42-86d0-402260b4f2ec] PRIMARY KEY CLUSTERED 
(
	[timeid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
