/****** Object:  Table [dbo].[vendor]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vendor](
	[vendor_no] [int] IDENTITY(0,1) NOT NULL,
	[vendor_name1] [nvarchar](30) NULL,
	[vendor_name2] [nvarchar](30) NULL,
	[vendor_address1] [nvarchar](30) NULL,
	[vendor_address2] [nvarchar](30) NULL,
	[vendor_city] [nvarchar](40) NULL,
	[vendor_state] [char](2) NULL,
	[vendor_zip_code] [nvarchar](12) NULL,
	[vendor_phone1] [nvarchar](40) NULL,
	[vendor_phone2] [nvarchar](40) NULL,
	[vendor_fax] [nvarchar](20) NULL,
	[vendor_contact] [nvarchar](30) NULL,
	[vendor_account_no] [nvarchar](10) NULL,
	[vendor_type] [int] NULL,
	[vendor_frame] [bit] NULL,
	[vendor_contact_lens] [bit] NULL,
	[vendor_lens_blank] [bit] NULL,
	[vendor_other] [bit] NULL,
	[vendor_lab] [bit] NULL,
	[catalog_mfg_no] [nvarchar](10) NULL,
	[vendor_web_site] [nvarchar](255) NULL,
	[vendor_email] [nvarchar](255) NULL,
 CONSTRAINT [PK_vendor] PRIMARY KEY CLUSTERED 
(
	[vendor_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
