/****** Object:  Table [dbo].[emrNotes]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emrNotes](
	[notesid] [int] IDENTITY(1,1) NOT NULL,
	[notedate] [date] NULL,
	[patientid] [int] NULL,
	[notedescription] [varchar](100) NULL,
	[note] [text] NULL,
 CONSTRAINT [PK_emrnotes] PRIMARY KEY CLUSTERED 
(
	[notesid] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
