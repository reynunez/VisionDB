/****** Object:  Table [dbo].[SignatureEventsList]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignatureEventsList](
	[eventid] [int] IDENTITY(1,1) NOT NULL,
	[eventdescription] [varchar](100) NOT NULL,
	[eventmain] [text] NOT NULL,
	[eventfooter] [text] NOT NULL,
 CONSTRAINT [PrimaryKey_e9751fd1-5686-49ef-b6c0-0fe3a714d0b6] PRIMARY KEY CLUSTERED 
(
	[eventid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
