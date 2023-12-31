/****** Object:  Table [dbo].[tbl_editransactions]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_editransactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[scriptdate] [datetime] NULL,
	[description] [varchar](250) NULL,
	[savedscript] [text] NULL,
 CONSTRAINT [PK_tbl_editransactions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
