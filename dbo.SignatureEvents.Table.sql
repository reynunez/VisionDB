/****** Object:  Table [dbo].[SignatureEvents]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignatureEvents](
	[eventseq] [int] IDENTITY(1,1) NOT NULL,
	[eventid] [int] NULL,
	[eventdate] [datetime] NULL,
	[patient_no] [int] NULL,
	[orderinfo] [nvarchar](200) NULL,
	[sigtype] [int] NULL,
	[sigDocument] [varchar](100) NULL,
 CONSTRAINT [PK_SignatureEvents] PRIMARY KEY CLUSTERED 
(
	[eventseq] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[SignatureEvents] ADD  CONSTRAINT [ColumnDefault_7ddafbe0-2f70-4c65-9647-4d97a3f6e933]  DEFAULT ((0)) FOR [sigtype]
GO
