/****** Object:  Table [dbo].[referrals]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[referrals](
	[referralid] [int] IDENTITY(1,1) NOT NULL,
	[doctorselection] [varchar](1000) NULL,
	[patient_no] [int] NULL,
	[patientinfo] [varchar](1000) NULL,
	[createdby] [int] NULL,
	[disposition] [text] NULL,
	[reason] [text] NULL,
	[drname] [varchar](100) NULL,
	[drnumber] [int] NULL,
	[drfax] [varchar](20) NULL,
	[datecreated] [datetime] NULL,
 CONSTRAINT [PK_referid] PRIMARY KEY CLUSTERED 
(
	[referralid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
