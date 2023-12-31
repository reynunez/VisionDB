/****** Object:  Table [dbo].[tblOrdersSelections]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblOrdersSelections](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[element] [varchar](50) NULL,
	[item] [varchar](50) NULL,
 CONSTRAINT [PK_tblOrdersSelections] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
