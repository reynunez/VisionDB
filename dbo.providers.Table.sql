/****** Object:  Table [dbo].[providers]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[providers](
	[providerid] [int] IDENTITY(1,1) NOT NULL,
	[Provider] [nvarchar](65) NULL,
	[Supplies] [nvarchar](65) NULL,
	[Account Address] [nvarchar](120) NULL,
	[Account Number] [nvarchar](45) NULL,
	[Website] [nvarchar](255) NULL,
	[Email] [nvarchar](1000) NULL,
	[Login] [nvarchar](45) NULL,
	[Password] [nvarchar](45) NULL,
	[Phone] [nvarchar](25) NULL,
	[officeid] [int] NULL,
 CONSTRAINT [PK_providers] PRIMARY KEY CLUSTERED 
(
	[providerid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
