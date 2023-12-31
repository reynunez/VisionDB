/****** Object:  Table [dbo].[tbl_signatures]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_signatures](
	[signature_id] [int] NOT NULL,
	[description] [varchar](250) NOT NULL,
	[contents] [text] NOT NULL,
	[footer] [varchar](250) NOT NULL,
 CONSTRAINT [PK_tbl_signatures] PRIMARY KEY CLUSTERED 
(
	[signature_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
