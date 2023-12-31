/****** Object:  Table [dbo].[tbl_iophistory]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_iophistory](
	[iopid] [int] IDENTITY(1,1) NOT NULL,
	[patient_no] [int] NOT NULL,
	[testdate] [date] NULL,
	[iopOD] [varchar](25) NULL,
	[iopOS] [varchar](25) NULL,
	[iopComment] [varchar](250) NULL,
 CONSTRAINT [PK_tbl_iophistory] PRIMARY KEY CLUSTERED 
(
	[iopid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
