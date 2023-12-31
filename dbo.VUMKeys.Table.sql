/****** Object:  Table [dbo].[VUMKeys]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VUMKeys](
	[uid] [int] IDENTITY(1,1) NOT NULL,
	[k1hash] [varchar](100) NULL,
	[k2hash] [varchar](100) NULL,
	[k3hash] [varchar](100) NULL,
	[belongtoid] [int] NULL,
	[act] [tinyint] NULL,
	[ad] [tinyint] NULL,
	[istmp] [tinyint] NULL,
	[fnhash] [varchar](100) NULL,
	[lnhash] [varchar](100) NULL
) ON [PRIMARY]
GO
