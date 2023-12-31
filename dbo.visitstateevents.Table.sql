/****** Object:  Table [dbo].[visitstateevents]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[visitstateevents](
	[visitid] [bigint] IDENTITY(1,1) NOT NULL,
	[appmt_no] [bigint] NULL,
	[patient_no] [bigint] NULL,
	[visitstate] [smallint] NULL,
	[eventtimedate] [timestamp] NULL,
 CONSTRAINT [PK_visitstateevents] PRIMARY KEY CLUSTERED 
(
	[visitid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
