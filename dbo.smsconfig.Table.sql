/****** Object:  Table [dbo].[smsconfig]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[smsconfig](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[area] [varchar](50) NULL,
	[message] [varchar](1000) NULL,
 CONSTRAINT [PK_smsconfig] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
