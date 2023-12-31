/****** Object:  Table [dbo].[tblInsModifiers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInsModifiers](
	[inscptid] [int] IDENTITY(1,1) NOT NULL,
	[insurance_no] [int] NULL,
	[cptcode] [varchar](50) NULL,
	[modifier] [varchar](50) NULL,
	[modifier2] [varchar](50) NULL,
	[fee] [varchar](50) NULL,
	[cptid] [int] NULL,
 CONSTRAINT [PK_tblInsModifiers] PRIMARY KEY CLUSTERED 
(
	[inscptid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
