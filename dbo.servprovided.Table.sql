/****** Object:  Table [dbo].[servprovided]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[servprovided](
	[serviceid] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NOT NULL,
	[servdate] [smalldatetime] NOT NULL,
	[servid] [int] NOT NULL,
	[servqty] [int] NOT NULL,
	[servchg] [money] NOT NULL,
 CONSTRAINT [PK_servprovided] PRIMARY KEY CLUSTERED 
(
	[serviceid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
