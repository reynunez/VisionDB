/****** Object:  Table [dbo].[jobs]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[jobid] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](100) NULL,
 CONSTRAINT [PK_jobs] PRIMARY KEY CLUSTERED 
(
	[jobid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
