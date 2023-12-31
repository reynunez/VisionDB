/****** Object:  Table [dbo].[tbl_payer]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_payer](
	[payerid] [int] IDENTITY(1,1) NOT NULL,
	[payername] [varchar](200) NULL,
	[payer_number] [varchar](100) NULL,
	[isactive] [bit] NULL,
 CONSTRAINT [PK_tbl_payer] PRIMARY KEY CLUSTERED 
(
	[payerid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
