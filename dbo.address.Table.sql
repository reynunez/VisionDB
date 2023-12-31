/****** Object:  Table [dbo].[address]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[address](
	[address_no] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NULL,
	[address1] [nvarchar](40) NULL,
	[address2] [nvarchar](40) NULL,
	[city] [nvarchar](40) NULL,
	[state] [nvarchar](2) NULL,
	[zip] [nvarchar](10) NULL,
	[phone1] [nvarchar](30) NULL,
	[phone2] [nvarchar](30) NULL,
	[fax] [nvarchar](20) NULL,
 CONSTRAINT [PK_address] PRIMARY KEY CLUSTERED 
(
	[address_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
