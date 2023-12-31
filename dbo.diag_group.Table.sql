/****** Object:  Table [dbo].[diag_group]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[diag_group](
	[groupid] [int] IDENTITY(1,1) NOT NULL,
	[group_cd] [int] NOT NULL,
	[description] [nvarchar](40) NULL,
 CONSTRAINT [PK_diag_group] PRIMARY KEY CLUSTERED 
(
	[groupid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
