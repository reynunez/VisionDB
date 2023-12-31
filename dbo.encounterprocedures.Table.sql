/****** Object:  Table [dbo].[encounterprocedures]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encounterprocedures](
	[procedureid] [int] IDENTITY(1,1) NOT NULL,
	[patientid] [int] NOT NULL,
	[appointmentid] [int] NOT NULL,
	[encounterdate] [datetime] NOT NULL,
	[class] [varchar](50) NOT NULL,
	[cptcode] [varchar](50) NOT NULL,
	[cptmodifier] [varchar](50) NOT NULL,
	[cptmodifier2] [varchar](50) NOT NULL,
	[cptdescription] [varchar](500) NULL,
	[fee] [numeric](18, 2) NULL,
 CONSTRAINT [PK_encounterprocedures] PRIMARY KEY CLUSTERED 
(
	[procedureid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
