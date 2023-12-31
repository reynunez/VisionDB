/****** Object:  Table [dbo].[PatAppointments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatAppointments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[appdate] [date] NOT NULL,
	[apptime] [varchar](15) NOT NULL,
	[firstname] [varchar](25) NULL,
	[lastname] [varchar](25) NULL,
	[birthdate] [date] NULL,
	[timeid] [int] NULL,
	[reasonid] [int] NULL,
	[officeid] [int] NULL,
	[doctorid] [int] NULL,
	[isConfirmed] [bit] NULL,
	[createDate] [date] NULL,
	[Address1] [varchar](50) NULL,
	[Address2] [varchar](50) NULL,
	[City] [varchar](35) NULL,
	[State] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[isExisting] [bit] NULL,
	[phone] [varchar](15) NULL,
	[email] [varchar](250) NULL,
	[insurance_no] [int] NULL,
	[Insured_id] [varchar](45) NULL,
	[policy_group_no] [varchar](45) NULL,
	[comment] [varchar](max) NULL,
	[midname] [varchar](45) NULL,
 CONSTRAINT [PrimaryKey_b3b40430-e885-4a76-a455-6b8d59af432f] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_cabc09af-e13a-4763-860e-db82ed05e907]  DEFAULT ((0)) FOR [isConfirmed]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_4aad3286-94bb-4f2d-ad71-8387eb31434b]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_3d57b6bd-5e40-4359-a6a5-a35bebb55692]  DEFAULT ('') FOR [Address1]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_054dda09-e959-4eb2-bdc0-0ad86c0d6242]  DEFAULT ('') FOR [Address2]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_ed504753-f71b-4544-b4b5-a1b23b5ee986]  DEFAULT ('') FOR [City]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_d907f4d0-bc8d-4b0c-a501-782b142c174b]  DEFAULT ('') FOR [State]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_1158eea1-239e-4d46-8a8d-20a4471855af]  DEFAULT ('') FOR [Zip]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_e4393128-f5e7-4e28-8697-04cd3d90d4e3]  DEFAULT ((0)) FOR [isExisting]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_7fe9046d-e3e9-40e8-b9c9-9d35ea2c3c47]  DEFAULT ('') FOR [phone]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_91c09850-c5da-45c6-8346-7fdf5d53f555]  DEFAULT ('') FOR [email]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_bc966f1a-4145-4015-b965-3dbbd0184134]  DEFAULT ((0)) FOR [insurance_no]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_9db723ab-ce54-4086-a851-ff0c9eca4b98]  DEFAULT ('') FOR [Insured_id]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_ebe542c5-3cda-41a3-bc69-48006bfb911b]  DEFAULT ('') FOR [policy_group_no]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_5bf449de-30b9-4e47-89d3-89ecb384bd20]  DEFAULT ('') FOR [comment]
GO
ALTER TABLE [dbo].[PatAppointments] ADD  CONSTRAINT [ColumnDefault_90761150-8810-4f4a-85b3-8a2a7504c89b]  DEFAULT ('') FOR [midname]
GO
