/****** Object:  Table [dbo].[tblVOMMaBIT]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblVOMMaBIT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [varchar](65) NOT NULL,
	[UserLogin] [varchar](15) NOT NULL,
	[UserReference] [varchar](15) NOT NULL,
	[UserLocation] [int] NULL,
	[UserPosition] [varchar](50) NULL,
	[UserActive] [bit] NULL,
	[Column1] [bit] NULL,
	[Column2] [bit] NULL,
	[Column3] [bit] NULL,
	[Column4] [bit] NULL,
	[Column5] [bit] NULL,
	[Column6] [bit] NULL,
	[Column7] [bit] NULL,
	[Column8] [bit] NULL,
	[Column9] [bit] NULL,
	[Column10] [bit] NULL,
	[Column11] [bit] NULL,
	[Column12] [bit] NULL,
	[Column13] [bit] NULL,
	[Column14] [bit] NULL,
	[Column15] [bit] NULL,
	[Column16] [bit] NULL,
	[Column17] [bit] NULL,
	[Column18] [bit] NULL,
	[Column19] [bit] NULL,
	[Column20] [bit] NULL,
	[Column21] [bit] NULL,
	[Column22] [bit] NULL,
	[Column23] [bit] NULL,
	[Column24] [bit] NULL,
	[Column25] [bit] NULL,
	[Column26] [bit] NULL,
	[Column27] [bit] NULL,
	[Column28] [bit] NULL,
	[Column29] [bit] NULL,
	[Column30] [bit] NULL,
	[Column31] [bit] NULL,
	[Column32] [bit] NULL,
	[Column33] [bit] NULL,
	[Column34] [bit] NULL,
	[Column35] [bit] NULL,
	[Column36] [bit] NULL,
	[Column37] [bit] NULL,
	[Column38] [bit] NULL,
	[Column39] [bit] NULL,
	[Column40] [bit] NULL,
	[Column41] [bit] NULL,
	[Column42] [bit] NULL,
	[Column43] [bit] NULL,
	[Column44] [bit] NULL,
	[Column45] [bit] NULL,
	[Column46] [bit] NULL,
	[Column47] [bit] NULL,
	[Column48] [bit] NULL,
	[Column49] [bit] NULL,
	[Column50] [bit] NULL,
	[Column51] [bit] NULL,
	[Column52] [bit] NULL,
	[Column53] [bit] NULL,
	[Column54] [bit] NULL,
	[Column55] [bit] NULL,
	[Column56] [bit] NULL,
	[Column57] [bit] NULL,
	[Column58] [bit] NULL,
	[Column59] [bit] NULL,
	[Column60] [bit] NULL,
	[Column61] [bit] NULL,
	[Column62] [bit] NULL,
	[Column63] [bit] NULL,
	[Column64] [bit] NULL,
	[Column65] [bit] NULL,
	[CheckInDateTime] [datetime] NULL,
	[CheckOutDateTime] [datetime] NULL,
	[cLocation] [int] NULL,
	[locationID] [int] NULL,
	[defaultpath] [text] NULL,
	[Column66] [bit] NULL,
 CONSTRAINT [PrimaryKey_a662bef9-114d-4a4c-89bb-f49987e434ba] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
