/****** Object:  Table [dbo].[tbl_billing_provider]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_billing_provider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[provider_id] [varchar](20) NULL,
	[npi] [varchar](20) NULL,
	[taxid] [varchar](20) NULL,
	[address_line1] [varchar](50) NULL,
	[address_line2] [varchar](50) NULL,
	[city] [varchar](50) NULL,
	[state] [varchar](2) NULL,
	[zip] [varchar](10) NULL,
	[phone] [varchar](15) NULL,
	[active] [tinyint] NULL,
	[contactname] [varchar](100) NULL,
	[contactemail] [varchar](120) NULL,
	[contactphone] [varchar](20) NULL,
 CONSTRAINT [PK_tbl_billing_provider] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbl_billing_provider] ADD  CONSTRAINT [DF_tbl_billing_provider_active]  DEFAULT ((0)) FOR [active]
GO
