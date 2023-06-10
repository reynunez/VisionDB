/****** Object:  StoredProcedure [dbo].[sp_UpdateSpTestScriptDate]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: Dec-29-2014
-- Description:	Update ScriptDate
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateSpTestScriptDate] 
		@testid int
AS
BEGIN
	Update emrSpecialtyTest
	Set scriptdate = dateadd(Hh,-5,current_timestamp)
	Where testid = @testid
END
GO
