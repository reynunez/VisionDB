/****** Object:  Table [dbo].[prescdetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[prescdetails](
	[rxdetailid] [int] IDENTITY(1,1) NOT NULL,
	[rxnumber] [int] NOT NULL,
	[description] [char](45) NOT NULL,
	[eye] [char](2) NULL,
	[quantity] [char](15) NOT NULL,
	[every] [char](15) NOT NULL,
	[days] [smallint] NOT NULL,
 CONSTRAINT [PK_prescdetails] PRIMARY KEY CLUSTERED 
(
	[rxdetailid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
