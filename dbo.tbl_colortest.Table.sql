/****** Object:  Table [dbo].[tbl_colortest]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_colortest](
	[testid] [int] IDENTITY(1,1) NOT NULL,
	[plate] [varchar](50) NULL,
	[normal] [int] NULL,
	[rgdeficiencies] [int] NULL,
	[colblindness] [int] NULL,
 CONSTRAINT [PK_tbl_colortest] PRIMARY KEY CLUSTERED 
(
	[testid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
