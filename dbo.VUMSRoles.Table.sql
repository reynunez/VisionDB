/****** Object:  Table [dbo].[VUMSRoles]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VUMSRoles](
	[roleid] [int] IDENTITY(1,1) NOT NULL,
	[rolename] [varchar](100) NULL,
	[enabled] [tinyint] NULL,
	[chkP1] [tinyint] NULL,
	[chkP2] [tinyint] NULL,
	[chkP3] [tinyint] NULL,
	[chkP4] [tinyint] NULL,
	[chkP5] [tinyint] NULL,
	[chkP6] [tinyint] NULL,
	[chkF1] [tinyint] NULL,
	[chkF2] [tinyint] NULL,
	[chkF3] [tinyint] NULL,
	[chkF4] [tinyint] NULL,
	[chkF5] [tinyint] NULL,
	[chkM1] [tinyint] NULL,
	[chkM2] [tinyint] NULL,
	[chkM3] [tinyint] NULL,
	[chkA1] [tinyint] NULL,
	[chkA2] [tinyint] NULL,
	[chkA3] [tinyint] NULL,
	[chkA4] [tinyint] NULL,
	[chkPr1] [tinyint] NULL,
	[chkPr2] [tinyint] NULL,
	[chkPr3] [tinyint] NULL,
	[chkPr4] [tinyint] NULL,
	[chkO1] [tinyint] NULL,
	[chkO2] [tinyint] NULL,
	[chkO3] [tinyint] NULL,
	[chkI1] [tinyint] NULL,
	[chkI2] [tinyint] NULL,
	[chkI3] [tinyint] NULL,
	[chkS1] [tinyint] NULL,
	[chkPg1] [tinyint] NULL,
	[chkE1] [tinyint] NULL,
	[chkR1] [tinyint] NULL,
	[chkPr5] [tinyint] NULL,
	[chkCt1] [tinyint] NULL,
	[chkA5] [tinyint] NULL,
	[chkO4] [tinyint] NULL,
	[chkI4] [tinyint] NULL,
	[chkF6] [tinyint] NULL,
	[chkO5] [tinyint] NULL,
	[chkI5] [tinyint] NULL,
	[chkBc1] [tinyint] NULL,
	[chkRe1] [tinyint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[VUMSRoles] ADD  DEFAULT ((0)) FOR [chkA5]
GO
ALTER TABLE [dbo].[VUMSRoles] ADD  DEFAULT ((0)) FOR [chkO4]
GO
ALTER TABLE [dbo].[VUMSRoles] ADD  DEFAULT ((0)) FOR [chkI4]
GO
ALTER TABLE [dbo].[VUMSRoles] ADD  DEFAULT ((0)) FOR [chkF6]
GO
