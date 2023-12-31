/****** Object:  Table [dbo].[ProvidersId]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProvidersId](
	[provid] [int] IDENTITY(1,1) NOT NULL,
	[doctorid] [int] NOT NULL,
	[insurance_no] [int] NOT NULL,
	[provider_id] [char](15) NOT NULL,
	[officeid] [int] NULL,
	[billingprovider_id] [int] NULL,
 CONSTRAINT [PK_ProvidersId] PRIMARY KEY CLUSTERED 
(
	[provid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ProvidersId] ADD  CONSTRAINT [DF_ProvidersId_billingprovider_id]  DEFAULT ((0)) FOR [billingprovider_id]
GO
