/****** Object:  Table [dbo].[ext_doctors]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ext_doctors](
	[doctorid] [int] IDENTITY(1,1) NOT NULL,
	[description] [nvarchar](50) NULL,
	[address1] [char](45) NULL,
	[address2] [char](45) NULL,
	[city] [char](25) NULL,
	[state] [char](2) NULL,
	[zip] [char](10) NULL,
	[phone] [char](15) NULL,
	[fax] [char](15) NULL,
	[license] [char](45) NULL,
	[taxid] [char](20) NULL,
	[degrees] [char](45) NULL,
	[specialty] [char](45) NULL,
	[isactive] [bit] NULL,
	[npi] [varchar](15) NULL,
	[lastrecordedsig] [datetime] NULL,
	[email] [varchar](255) NULL,
	[last_name] [varchar](100) NULL,
	[first_name] [varchar](100) NULL,
	[specialtyid] [smallint] NULL,
 CONSTRAINT [PK_ext_doctors] PRIMARY KEY CLUSTERED 
(
	[doctorid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
