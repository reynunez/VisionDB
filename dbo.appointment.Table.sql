/****** Object:  Table [dbo].[appointment]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[appointment](
	[appmt_no] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NOT NULL,
	[appmtdoctor] [int] NOT NULL,
	[appmtdate] [smalldatetime] NOT NULL,
	[appmttime] [varchar](20) NOT NULL,
	[appmtlocation] [int] NOT NULL,
	[appmtreason] [int] NOT NULL,
	[offduty] [varchar](10) NULL,
	[returntowork] [smalldatetime] NULL,
	[letterto] [varchar](50) NULL,
	[salesmanid] [int] NULL,
	[createdate] [smalldatetime] NULL,
	[is_cancel] [bit] NULL,
	[is_resched] [bit] NULL,
	[new_date] [datetime] NULL,
	[reason] [varchar](100) NULL,
	[apstatusid] [int] NULL,
	[isWalkin] [bit] NULL,
	[visitstate] [smallint] NULL,
	[insurance_no] [int] NULL,
	[ins_authorization] [varchar](45) NULL,
	[ins_benefits] [varchar](45) NULL,
	[note] [varchar](max) NULL,
	[billingprov] [varchar](100) NULL,
	[referring_prov] [varchar](100) NULL,
	[rendering_prov] [varchar](100) NULL,
	[payer] [varchar](100) NULL,
	[locationname] [varchar](100) NULL,
	[insurance_name] [varchar](100) NULL,
	[username] [varchar](100) NULL,
	[workflow] [varchar](50) NULL,
	[DATE_CREATED] [datetime] NULL,
 CONSTRAINT [PK_appointment] PRIMARY KEY CLUSTERED 
(
	[appmt_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[appointment] ADD  CONSTRAINT [DF_appointment_apstatusid]  DEFAULT ((4)) FOR [apstatusid]
GO
ALTER TABLE [dbo].[appointment] ADD  CONSTRAINT [DF_appointment_isWalkin]  DEFAULT ((0)) FOR [isWalkin]
GO
