/****** Object:  Table [dbo].[doctorschedule]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctorschedule](
	[scheduleid] [int] IDENTITY(1,1) NOT NULL,
	[doctorid] [int] NOT NULL,
	[officeid] [int] NOT NULL,
	[appmtdate] [date] NULL,
	[appmttime] [varchar](20) NULL,
 CONSTRAINT [PrimaryKey_226759b3-1ebe-4718-b87b-9d8270bba761] PRIMARY KEY CLUSTERED 
(
	[scheduleid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
