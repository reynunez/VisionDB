/****** Object:  Table [dbo].[tbl_NET_drschedule]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_NET_drschedule](
	[scheduleid] [int] IDENTITY(1,1) NOT NULL,
	[doctorid] [int] NULL,
	[officeid] [int] NULL,
	[schddate] [date] NULL,
	[time] [varchar](10) NULL,
	[thisweek] [int] NULL,
	[thisrow] [int] NULL,
	[thiscol] [int] NULL,
 CONSTRAINT [PK_tbl_NET_drschedule] PRIMARY KEY CLUSTERED 
(
	[scheduleid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
