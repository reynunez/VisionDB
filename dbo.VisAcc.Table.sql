/****** Object:  Table [dbo].[VisAcc]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VisAcc](
	[vaid] [int] IDENTITY(1,1) NOT NULL,
	[scale] [numeric](18, 2) NULL,
	[value] [nvarchar](50) NULL,
 CONSTRAINT [PK_VisAcc] PRIMARY KEY CLUSTERED 
(
	[vaid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
