/****** Object:  StoredProcedure [dbo].[sp_AddtoReportsLog]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 12-13-14
-- Description:	Reports Log Add Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_AddtoReportsLog] 
	@reportnameid int,
	@patient_no int,
	@createdby int
AS
BEGIN
	Insert into dbo.reportslog(reportnameid,patient_no,reportdatetime,createdby)
	Values(@reportnameid,@patient_no,dateadd(Hh,-5,current_timestamp),@createdby)
END
GO
