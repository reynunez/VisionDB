/****** Object:  StoredProcedure [dbo].[sp_AddtoBulkRptLog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: January 5th 2020
-- Description:	Bulk Report log
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddtoBulkRptLog](
	@reportdatetime datetime	,
	@patientslist NVARCHAR(MAX)
)
AS
BEGIN
	SET NOCOUNT ON;

	Insert into tblBulkReportLog(reportdatetime,patientslist)
	Values(@reportdatetime, @patientslist)
	;
END
GO
