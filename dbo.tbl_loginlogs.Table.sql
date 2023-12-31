/****** Object:  Table [dbo].[tbl_loginlogs]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_loginlogs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[login_user] [varchar](200) NULL,
	[login_timestamp] [datetime] NULL,
	[login_appversion] [varchar](100) NULL,
 CONSTRAINT [PK_tbl_loginlogs] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
