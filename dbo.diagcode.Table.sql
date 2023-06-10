/****** Object:  Table [dbo].[diagcode]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diagcode](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Chapter Block] [varchar](max) NULL,
	[I9 Code] [varchar](max) NULL,
	[I9 Description] [varchar](max) NULL,
	[I10 Code] [varchar](max) NULL,
	[I10 Description] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
