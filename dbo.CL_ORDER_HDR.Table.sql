/****** Object:  Table [dbo].[CL_ORDER_HDR]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CL_ORDER_HDR](
	[ORDER_ID] [int] IDENTITY(1,1) NOT NULL,
	[PATIENT_NO] [int] NOT NULL,
	[OFFICEID] [int] NOT NULL,
	[PRESC_STATUS_OD] [varchar](25) NULL,
	[PRESC_SPH_OD] [numeric](18, 2) NULL,
	[PRESC_CYL_OD] [numeric](18, 2) NULL,
	[PRESC_AXIS_OD] [numeric](18, 2) NULL,
	[PRESC_ADD_OD] [numeric](18, 2) NULL,
	[PRESC_BC_OD] [numeric](18, 2) NULL,
	[PRESC_STATUS_OS] [varchar](25) NULL,
	[PRESC_SPH_OS] [numeric](18, 2) NULL,
	[PRESC_CYL_OS] [numeric](18, 2) NULL,
	[PRESC_AXIS_OS] [numeric](18, 2) NULL,
	[PRESC_ADD_OS] [numeric](18, 2) NULL,
	[PRESC_BC_OS] [numeric](18, 2) NULL,
	[ORDER_COMMENT] [varchar](max) NULL,
	[ORDER_RESP] [varchar](50) NULL,
	[ORDER_TRAY] [varchar](50) NULL,
	[ORDER_INS_PLAN] [varchar](100) NULL,
	[ORDER_INS_BENEFITS] [varchar](100) NULL,
	[ORDER_INS_AUTH] [varchar](100) NULL,
	[ORDER_DATE] [datetime] NULL,
	[ORDER_PATIENT] [numeric](18, 2) NULL,
	[ORDER_INSURANCE] [numeric](18, 2) NULL,
	[ORDER_TOTAL] [numeric](18, 2) NULL,
	[FLOWSTATUS] [varchar](50) NULL,
	[username] [varchar](100) NULL,
	[PRESCID] [int] NULL,
	[STATUS_CHANGE_DATE] [date] NULL,
	[STATUS_CHANGE_LOCATION] [varchar](100) NULL,
	[shiptopatient] [bit] NULL,
 CONSTRAINT [PK_CL_ORDER_HDR] PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[CL_ORDER_HDR] ADD  DEFAULT ((0)) FOR [shiptopatient]
GO
