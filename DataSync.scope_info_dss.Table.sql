/****** Object:  Table [DataSync].[scope_info_dss]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataSync].[scope_info_dss](
	[scope_local_id] [int] IDENTITY(1,1) NOT NULL,
	[scope_id] [uniqueidentifier] NOT NULL,
	[sync_scope_name] [nvarchar](100) NOT NULL,
	[scope_sync_knowledge] [varbinary](max) NULL,
	[scope_tombstone_cleanup_knowledge] [varbinary](max) NULL,
	[scope_timestamp] [timestamp] NULL,
	[scope_config_id] [uniqueidentifier] NULL,
	[scope_restore_count] [int] NOT NULL,
	[scope_user_comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_DataSync.scope_info_dss] PRIMARY KEY CLUSTERED 
(
	[sync_scope_name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [DataSync].[scope_info_dss] ADD  DEFAULT (newid()) FOR [scope_id]
GO
ALTER TABLE [DataSync].[scope_info_dss] ADD  DEFAULT ((0)) FOR [scope_restore_count]
GO
