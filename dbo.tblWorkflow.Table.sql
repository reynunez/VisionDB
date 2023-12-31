/****** Object:  Table [dbo].[tblWorkflow]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblWorkflow](
	[workflowid] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](100) NULL,
	[description] [varchar](100) NULL,
 CONSTRAINT [PK_tblWorkflow] PRIMARY KEY CLUSTERED 
(
	[workflowid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
