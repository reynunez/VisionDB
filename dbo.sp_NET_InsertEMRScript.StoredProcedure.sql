/****** Object:  StoredProcedure [dbo].[sp_NET_InsertEMRScript]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/08/2020
-- Description:Get EMR Script
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertEMRScript](
	@patientid integer,
	@sdate datetime,
	@scriptdate varchar(50),
	@scripttime varchar(50),
	@scriptcontents text,
	@initialscript text,
	@natureofvisit varchar(240),
	@assessment text
)
AS
BEGIN

		SET NOCOUNT ON

		INSERT INTO emrsavedscripts(
								patientid,
								sdate,
								scriptdate,
								scripttime,
								scriptcontents,
								initialscript,
								natureofvisit,
								assessment
								)
		VALUES(
								@patientid,
								@sdate,
								@scriptdate,
								@scripttime,
								@scriptcontents,
								@initialscript,
								@natureofvisit,
								@assessment
								)
END

GO
