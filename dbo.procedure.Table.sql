/****** Object:  Table [dbo].[procedure]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procedure](
	[pro_no] [int] NOT NULL,
	[pro_desc] [nvarchar](500) NULL,
	[pro_duration] [smallint] NULL,
	[type_no] [int] NULL,
	[pro_units_days] [smallint] NULL,
	[pro_cpt_cd] [nvarchar](25) NULL,
	[sup_group_no] [int] NULL,
	[fin_group_no] [int] NULL,
	[prd_group_no] [int] NULL,
	[pro_eye_related] [bit] NOT NULL,
	[pro_superbill_print] [bit] NOT NULL,
 CONSTRAINT [PK_procedure] PRIMARY KEY CLUSTERED 
(
	[pro_no] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
