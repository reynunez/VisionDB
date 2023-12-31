/****** Object:  Table [dbo].[xpatient]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xpatient](
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
	[pharmacy] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
