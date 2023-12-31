/****** Object:  Table [dbo].[patient]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient](
	[patient_no] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](25) NULL,
	[mid_name] [nvarchar](15) NULL,
	[last_name] [nvarchar](25) NULL,
	[suffix] [nvarchar](10) NULL,
	[entry_date] [datetime] NULL,
	[sex] [smallint] NULL,
	[birth_date] [datetime] NULL,
	[ss_no] [nvarchar](11) NULL,
	[title] [nvarchar](10) NULL,
	[head_of_household] [smallint] NULL,
	[salutation] [nvarchar](30) NULL,
	[occupation] [nvarchar](30) NULL,
	[marital_status] [int] NULL,
	[signature_on_file] [smallint] NULL,
	[signature_date] [datetime] NULL,
	[med_alert] [ntext] NULL,
	[notes] [ntext] NULL,
	[active] [smallint] NULL,
	[last_office_visit_date] [datetime] NULL,
	[next_appointment] [datetime] NULL,
	[last_update] [datetime] NULL,
	[mailing_list] [smallint] NULL,
	[last_exam_date] [datetime] NULL,
	[eMail_address] [nvarchar](125) NULL,
	[employername] [char](45) NULL,
	[officeid] [int] NULL,
	[doctorid] [smallint] NULL,
	[isbeingedit] [bit] NOT NULL,
	[oPatient_no] [int] NULL,
	[pcp] [varchar](65) NULL,
	[ethnicity] [int] NOT NULL,
	[race] [int] NOT NULL,
	[language] [int] NOT NULL,
	[guardian] [varchar](100) NULL,
	[npcp] [int] NULL,
	[nomd] [int] NULL,
	[pharmacy] [int] NULL,
	[guardianphone] [varchar](15) NULL,
	[domeye] [varchar](2) NULL,
	[d_eom] [varchar](25) NULL,
	[d_npa] [numeric](18, 2) NULL,
	[d_npc] [varchar](25) NULL,
	[d_ct] [varchar](25) NULL,
	[d_color] [varchar](25) NULL,
 CONSTRAINT [PK_patient] PRIMARY KEY CLUSTERED 
(
	[patient_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [DF_patient_officeid]  DEFAULT ((1)) FOR [officeid]
GO
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [DF_patient_doctorid]  DEFAULT ((0)) FOR [doctorid]
GO
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [DF_patient_isbeingedit]  DEFAULT ((0)) FOR [isbeingedit]
GO
ALTER TABLE [dbo].[patient] ADD  CONSTRAINT [ColumnDefault_23f48056-1a48-447e-b9f2-5ee5afd9d6ab]  DEFAULT ('N/A') FOR [pcp]
GO
ALTER TABLE [dbo].[patient] ADD  DEFAULT ((0)) FOR [ethnicity]
GO
ALTER TABLE [dbo].[patient] ADD  DEFAULT ((0)) FOR [race]
GO
ALTER TABLE [dbo].[patient] ADD  DEFAULT ((0)) FOR [language]
GO
