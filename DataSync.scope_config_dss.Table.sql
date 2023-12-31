/****** Object:  Table [DataSync].[scope_config_dss]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataSync].[scope_config_dss](
	[config_id] [uniqueidentifier] NOT NULL,
	[config_data] [xml] NOT NULL,
	[scope_status] [char](1) NULL,
 CONSTRAINT [PK_DataSync.scope_config_dss] PRIMARY KEY CLUSTERED 
(
	[config_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
