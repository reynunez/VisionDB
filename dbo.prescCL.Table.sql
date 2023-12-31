/****** Object:  Table [dbo].[prescCL]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescCL](
	[clprescid] [int] IDENTITY(1,1) NOT NULL,
	[prescid] [int] NULL,
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
	[or2] [varchar](30) NULL,
	[clid] [int] NOT NULL,
 CONSTRAINT [PK_prescCL] PRIMARY KEY CLUSTERED 
(
	[clprescid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[prescCL] ADD  DEFAULT ((0)) FOR [clid]
GO
