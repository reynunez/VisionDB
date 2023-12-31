/****** Object:  StoredProcedure [dbo].[usp_SavePatientEMRScript]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 9-25-2014
-- Description:	Save patients EMR scripts
-- =============================================
CREATE PROCEDURE [dbo].[usp_SavePatientEMRScript]
	@patientid [int],
	@sdate date,
	@scriptdate varchar(50),
	@scripttime varchar(50),
	@scriptcontents [text],
	@initialscript [text],
	@natureofvisit varchar(240),
	@assessment [text] = ''
AS
BEGIN
	Insert into emrsavedscripts
	Select 	@patientid,@sdate,@scriptdate,@scripttime,@scriptcontents,@initialscript,@natureofvisit,@assessment
END
GO
