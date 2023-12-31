/****** Object:  Table [dbo].[reportslog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reportslog](
	[reportid] [int] IDENTITY(1,1) NOT NULL,
	[reportnameid] [int] NULL,
	[patient_no] [int] NULL,
	[reportdatetime] [datetime] NULL,
	[createdby] [int] NULL,
 CONSTRAINT [PK_reportslog] PRIMARY KEY CLUSTERED 
(
	[reportid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
