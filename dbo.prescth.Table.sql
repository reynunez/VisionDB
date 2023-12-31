/****** Object:  Table [dbo].[prescth]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescth](
	[thprescid] [int] IDENTITY(1,1) NOT NULL,
	[prescid] [int] NULL,
	[tradename] [varchar](50) NULL,
	[generic] [varchar](50) NULL,
	[manufacturer] [varchar](65) NULL,
	[preparation] [varchar](50) NULL,
	[howsupplied] [varchar](50) NULL,
	[eye] [varchar](10) NULL,
	[qty] [varchar](20) NULL,
	[every] [varchar](20) NULL,
	[days] [varchar](20) NULL,
	[suffamt] [bit] NULL,
	[voidafter] [datetime] NULL,
	[refills] [bit] NULL,
	[refillsamt] [smallint] NULL,
	[comments] [text] NULL,
	[sig] [varchar](max) NULL,
 CONSTRAINT [PK_prescth] PRIMARY KEY CLUSTERED 
(
	[thprescid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
