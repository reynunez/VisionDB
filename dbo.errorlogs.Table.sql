/****** Object:  Table [dbo].[errorlogs]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[errorlogs](
	[errorid] [int] IDENTITY(1,1) NOT NULL,
	[errorcode] [varchar](25) NULL,
	[errordescription] [varchar](max) NULL,
	[errorsource] [varchar](100) NULL,
	[errormodule] [varchar](100) NULL,
	[errorsubroutine] [varchar](100) NULL,
	[errordate] [date] NULL,
	[errortime] [time](7) NULL,
 CONSTRAINT [PK_errorlogs] PRIMARY KEY CLUSTERED 
(
	[errorid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
