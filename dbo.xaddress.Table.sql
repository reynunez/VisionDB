/****** Object:  Table [dbo].[xaddress]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xaddress](
	[patient_no] [int] NULL,
	[address1] [nvarchar](40) NULL,
	[address2] [nvarchar](40) NULL,
	[city] [nvarchar](40) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](10) NULL,
	[phone1] [nvarchar](30) NULL,
	[phone2] [nvarchar](30) NULL,
	[fax] [nvarchar](20) NULL
) ON [PRIMARY]
GO
