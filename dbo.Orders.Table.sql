/****** Object:  Table [dbo].[Orders]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderid] [int] IDENTITY(1,1) NOT NULL,
	[ordertype] [smallint] NULL,
	[orderdate] [datetime] NULL,
	[patient_no] [int] NULL,
	[ordertotal] [decimal](18, 2) NULL,
	[orderstatus] [smallint] NULL,
	[Tray] [varchar](25) NULL,
	[statuschange] [varchar](35) NULL,
	[orderdetails] [varchar](2000) NULL,
	[comments] [text] NULL,
	[OrderFrame] [bit] NULL,
	[labtray] [nvarchar](20) NULL,
	[officeid] [int] NULL,
	[userid] [int] NULL,
	[ship_address_no] [int] NULL,
	[elab] [bit] NULL,
	[olorder] [int] NULL,
	[olnotes] [text] NULL,
	[vomonline] [bit] NULL,
	[onlinecomments] [text] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[orderid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_OrderFrame]  DEFAULT ((0)) FOR [OrderFrame]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_Orders_elab]  DEFAULT ((0)) FOR [elab]
GO
