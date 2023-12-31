/****** Object:  Table [dbo].[xshipaddress]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xshipaddress](
	[address_no] [int] NULL,
	[patient_no] [int] NULL,
	[address1] [nvarchar](100) NULL,
	[address2] [nvarchar](100) NULL,
	[city] [nvarchar](80) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](10) NULL,
	[phone1] [nvarchar](15) NULL,
	[phone2] [nvarchar](15) NULL,
	[fax] [nvarchar](15) NULL,
	[default] [bit] NULL,
	[create_date] [date] NULL
) ON [PRIMARY]
GO
