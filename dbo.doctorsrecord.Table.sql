/****** Object:  Table [dbo].[doctorsrecord]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[doctorsrecord](
	[visit_id] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NOT NULL,
	[doctorid] [int] NOT NULL,
	[visit_date] [datetime] NOT NULL,
	[comp] [smallint] NOT NULL,
	[glau] [smallint] NOT NULL,
	[conl] [smallint] NOT NULL,
	[minr] [smallint] NOT NULL,
	[chis] [smallint] NOT NULL,
 CONSTRAINT [PK_tbl_doctorsrecord] PRIMARY KEY CLUSTERED 
(
	[visit_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[doctorsrecord] ADD  DEFAULT ((0)) FOR [chis]
GO
