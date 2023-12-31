/****** Object:  Table [dbo].[retEvents]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[retEvents](
	[report_id] [int] IDENTITY(1,1) NOT NULL,
	[report_date] [datetime] NULL,
	[officeid] [int] NULL,
	[office] [varchar](60) NULL,
	[description] [varchar](100) NULL,
	[patient] [varchar](100) NULL,
	[orderinfo] [varchar](100) NULL,
 CONSTRAINT [PrimaryKey_1fd4d0f8-fce2-41ff-b5c8-dbe4e67fbb6a] PRIMARY KEY CLUSTERED 
(
	[report_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
