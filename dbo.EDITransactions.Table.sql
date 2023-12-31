/****** Object:  Table [dbo].[EDITransactions]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EDITransactions](
	[edisequence] [int] IDENTITY(1,1) NOT NULL,
	[trandate] [datetime] NULL,
	[numberofsegments] [int] NULL,
	[filename] [nvarchar](100) NULL,
 CONSTRAINT [PK_EDITransactions] PRIMARY KEY CLUSTERED 
(
	[edisequence] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
