/****** Object:  Table [DataSync].[schema_info_dss]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DataSync].[schema_info_dss](
	[schema_major_version] [int] NOT NULL,
	[schema_minor_version] [int] NOT NULL,
	[schema_extended_info] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DataSync.schema_info_dss] PRIMARY KEY CLUSTERED 
(
	[schema_major_version] ASC,
	[schema_minor_version] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
