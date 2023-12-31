/****** Object:  Table [dbo].[services]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[services](
	[servcat] [int] NOT NULL,
	[servid] [int] IDENTITY(1,1) NOT NULL,
	[servdesc] [nvarchar](45) NOT NULL,
	[np] [nvarchar](12) NULL,
	[ep] [nvarchar](12) NULL,
	[cpt] [nvarchar](12) NULL,
	[fee] [money] NULL,
	[taxable] [smallint] NULL,
 CONSTRAINT [PK_services] PRIMARY KEY CLUSTERED 
(
	[servid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[services] ADD  CONSTRAINT [DF_services_taxable]  DEFAULT ((0)) FOR [taxable]
GO
