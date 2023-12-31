/****** Object:  Table [dbo].[xprescCL]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[xprescCL](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clprescid] [int] NULL,
	[patient_id] [int] NULL,
	[lensStatus] [varchar](10) NULL,
	[Eye] [varchar](10) NULL,
	[Manufacturer] [varchar](65) NULL,
	[lensName] [varchar](65) NULL,
	[Lenstype] [varchar](50) NULL,
	[Color] [varchar](50) NULL,
	[Sph] [numeric](8, 2) NULL,
	[Cyl] [numeric](8, 2) NULL,
	[Axis] [smallint] NULL,
	[Addition] [numeric](8, 2) NULL,
	[BC] [numeric](8, 2) NULL,
	[UPCC] [varchar](25) NULL,
	[sufamt] [bit] NULL,
	[voidafter] [datetime] NULL,
	[refills] [bit] NULL,
	[refillsamt] [smallint] NULL,
	[comments] [varchar](8000) NULL,
	[Vclrdva] [varchar](10) NULL,
	[Vclrnva] [varchar](10) NULL,
	[Vclldva] [varchar](10) NULL,
	[Vcllnva] [varchar](10) NULL,
	[Vorrdva] [varchar](10) NULL,
	[Vorrnva] [varchar](10) NULL,
	[Vorldva] [varchar](10) NULL,
	[Vorlnva] [varchar](10) NULL,
	[kr001] [numeric](8, 2) NULL,
	[kr002] [numeric](8, 2) NULL,
	[kr003] [numeric](8, 2) NULL,
	[kl001] [numeric](8, 2) NULL,
	[kl002] [numeric](8, 2) NULL,
	[kl003] [numeric](8, 2) NULL,
	[presctype] [varchar](50) NULL,
	[or] [varchar](30) NULL,
	[or2] [varchar](30) NULL
) ON [PRIMARY]
GO
