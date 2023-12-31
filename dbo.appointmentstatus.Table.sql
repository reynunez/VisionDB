/****** Object:  Table [dbo].[appointmentstatus]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointmentstatus](
	[apstatusid] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](250) NOT NULL,
 CONSTRAINT [PK_appointmentstatus] PRIMARY KEY CLUSTERED 
(
	[apstatusid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
