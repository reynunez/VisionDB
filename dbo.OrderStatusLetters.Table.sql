/****** Object:  Table [dbo].[OrderStatusLetters]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatusLetters](
	[letterid] [int] NOT NULL,
	[product1] [text] NULL,
	[product2] [text] NULL,
 CONSTRAINT [PrimaryKey_032276fa-87d9-4847-90b6-34c49e216911] PRIMARY KEY CLUSTERED 
(
	[letterid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
