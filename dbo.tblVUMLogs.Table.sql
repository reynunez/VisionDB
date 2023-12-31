/****** Object:  Table [dbo].[tblVUMLogs]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVUMLogs](
	[vumlogid] [int] IDENTITY(1,1) NOT NULL,
	[logdatetime] [datetime] NULL,
	[logmodule] [varchar](50) NULL,
	[logsub] [varchar](50) NULL,
	[logerrmessage] [varchar](max) NULL,
 CONSTRAINT [PK_tblVUMLogs] PRIMARY KEY CLUSTERED 
(
	[vumlogid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
