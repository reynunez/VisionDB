/****** Object:  Table [dbo].[vomImages]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vomImages](
	[patient_no] [int] NOT NULL,
	[image_date] [date] NULL,
	[saved_image] [image] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
