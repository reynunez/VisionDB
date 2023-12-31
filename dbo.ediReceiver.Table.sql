/****** Object:  Table [dbo].[ediReceiver]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ediReceiver](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[rname] [varchar](50) NULL,
	[ridentifier] [varchar](25) NULL,
	[raccountnumber] [varchar](25) NULL,
	[intqualifier] [varchar](2) NULL,
	[intreceiverid] [varchar](25) NULL,
 CONSTRAINT [PrimaryKey_98c8c9f9-184f-44e8-bb60-9ae3262ef415] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
