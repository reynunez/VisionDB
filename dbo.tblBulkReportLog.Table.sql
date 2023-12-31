/****** Object:  Table [dbo].[tblBulkReportLog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBulkReportLog](
	[reportid] [bigint] IDENTITY(1,1) NOT NULL,
	[reportdatetime] [date] NULL,
	[patientslist] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblBulkReportLog] PRIMARY KEY CLUSTERED 
(
	[reportid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
