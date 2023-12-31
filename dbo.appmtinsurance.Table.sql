/****** Object:  Table [dbo].[appmtinsurance]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appmtinsurance](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[appmt_no] [bigint] NULL,
	[ins_authorization] [varchar](100) NULL,
	[ins_benefits] [varchar](100) NULL,
 CONSTRAINT [PK_appmtinsurance] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
