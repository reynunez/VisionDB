/****** Object:  Table [dbo].[SigEventsCodes]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SigEventsCodes](
	[eventid] [int] NOT NULL,
	[description] [nvarchar](65) NULL,
 CONSTRAINT [PK_SigEventsID] PRIMARY KEY CLUSTERED 
(
	[eventid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
