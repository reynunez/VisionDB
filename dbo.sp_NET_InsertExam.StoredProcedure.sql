/****** Object:  StoredProcedure [dbo].[sp_NET_InsertExam]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/07/2020
-- Description: Insert Eye Exam
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertExam]
(
		@patientid int,
		@datestr varchar(25),
		@timestr varchar(25),
		@contents varchar(max)
)
AS
BEGIN

    SET NOCOUNT ON

	Insert into eyeexam(
		examdate,
		contents,
		datestr,
		timestr,
		patientid
		)
	Values(
		DATEADD(hh,-5,getdate()),
		@contents,
		@datestr,
		@timestr,
		@patientid
	)
END
GO
