/****** Object:  Table [dbo].[tblreason]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblreason](
	[reasonid] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[acronym] [varchar](25) NULL,
	[description] [varchar](250) NULL,
	[time_frame] [varchar](25) NULL,
	[system] [varchar](25) NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_tblreason] PRIMARY KEY CLUSTERED 
(
	[reasonid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
