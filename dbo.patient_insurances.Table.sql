/****** Object:  Table [dbo].[patient_insurances]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patient_insurances](
	[Ins_no] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NULL,
	[insurance_no] [int] NULL,
	[insured_id] [nvarchar](20) NULL,
	[policy_group_no] [nvarchar](20) NULL,
	[iauthorization] [char](45) NULL,
	[benefits] [char](45) NULL,
	[isDefault] [bit] NULL,
	[isDisabled] [bit] NULL,
	[date_creaated] [date] NULL,
	[date_disabled] [date] NULL,
 CONSTRAINT [PK_patient_insurances] PRIMARY KEY CLUSTERED 
(
	[Ins_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[patient_insurances] ADD  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[patient_insurances] ADD  DEFAULT ((0)) FOR [isDisabled]
GO
