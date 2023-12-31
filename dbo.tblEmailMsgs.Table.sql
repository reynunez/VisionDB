/****** Object:  Table [dbo].[tblEmailMsgs]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmailMsgs](
	[emailMsgId] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NULL,
	[Subject] [varchar](100) NULL,
	[Contents] [text] NULL,
 CONSTRAINT [PK_tblEmailMsgs] PRIMARY KEY CLUSTERED 
(
	[emailMsgId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
