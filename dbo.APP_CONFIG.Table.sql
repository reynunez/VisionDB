/****** Object:  Table [dbo].[APP_CONFIG]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APP_CONFIG](
	[configid] [int] IDENTITY(1,1) NOT NULL,
	[EMAIL_Login] [varchar](100) NULL,
	[EMAIL_Password] [varchar](25) NULL,
	[EMAIL_Address] [varchar](250) NULL,
	[EMAIL_Outgoing] [varchar](100) NULL,
	[EMAIL_Incoming] [varchar](100) NULL,
	[EMAIL_Port] [int] NULL,
	[LAB_McledFolder] [varchar](250) NULL,
	[INV_Tax] [numeric](18, 2) NULL,
	[SMSUSER] [varchar](50) NULL,
	[SMSKEY] [varchar](50) NULL,
	[SMSORDER] [varchar](max) NULL,
	[SMSAPPMT] [varchar](max) NULL,
	[ORTHOKEMAIL] [varchar](max) NULL,
	[PROMOEMAIL] [varchar](max) NULL,
	[BILLING_PROV] [varchar](120) NULL,
	[RENDERING_PROV] [varchar](120) NULL,
	[REFERRING_PROV] [varchar](120) NULL,
	[ST_PRIMNUM] [varchar](50) NULL,
	[ST_TOKEN] [varchar](50) NULL,
	[ST_ORDERMSG] [varchar](max) NULL,
	[ST_APPMSG] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[configid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
