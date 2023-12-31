/****** Object:  Table [dbo].[tblOrderStatusHist]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrderStatusHist](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderid] [int] NOT NULL,
	[status] [int] NOT NULL,
	[changedate] [datetime] NOT NULL,
	[officeid] [int] NULL,
 CONSTRAINT [PrimaryKey_2226a99b-2ff6-4bcb-8051-b6a26179326c] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
