/****** Object:  Table [dbo].[preappointment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preappointment](
	[pre_appmt_no] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NOT NULL,
	[appmtdate] [smalldatetime] NOT NULL,
	[appmttime] [varchar](20) NOT NULL,
	[appmtlocation] [int] NOT NULL,
	[appmtreason] [int] NOT NULL,
	[createdate] [smalldatetime] NULL,
	[is_cancel] [bit] NULL,
	[is_resched] [bit] NULL,
	[insurance_no] [int] NULL,
	[is_converted] [bit] NULL,
 CONSTRAINT [PK_pre_appointment] PRIMARY KEY CLUSTERED 
(
	[pre_appmt_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
