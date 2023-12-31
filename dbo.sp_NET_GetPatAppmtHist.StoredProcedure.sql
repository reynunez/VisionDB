/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatAppmtHist]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/07/2022
-- Description: Get Patient Appmt History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatAppmtHist]
(
	@PAR_PATIENT_NO INT = 0,
	@PAR_FIRST_NAME VARCHAR(100) = '',
	@PAR_LAST_NAME VARCHAR(100) = ''
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@PATIENT_NO INT,@FIRST_NAME VARCHAR(100),@LAST_NAME VARCHAR(100)'

SET	@SQLString = N' Select		a.patient_no
								,ltrim(rtrim(p.first_name )) + '' '' + ltrim(rtrim(p.last_name )) as patient_name
								,cast(a.appmtdate as date) as appointment_date  
								,a.appmt_no 
								,a.workflow
								,d.description as doctor_name
								,r.name as reason_name
								,r.description as reason_description
								,a.locationname as location_name
								,s.description as appmt_status
					  From		appointment a
								left join patient p on a.patient_no = p.patient_no 
								left join tblreason r on a.appmtreason = r.reasonid 
								left join appointmentstatus s on a.apstatusid = s.apstatusid
								LEFT JOIN doctors d ON a.appmtdoctor = d.doctorid
					  where		1=1
				'  +
				CASE WHEN @PAR_PATIENT_NO <> 0 THEN ' and a.patient_no = @PATIENT_NO' ELSE '' END +
				CASE WHEN @PAR_FIRST_NAME <> '' THEN ' and p.first_name = @FIRST_NAME' ELSE '' END +
				CASE WHEN @PAR_LAST_NAME <> '' THEN ' and p.last_name = @LAST_NAME' ELSE '' END +
				' order by a.appmtdate desc'

EXECUTE sp_executesql @SQLString,@ParmDefinition,@PATIENT_NO = @PAR_PATIENT_NO,@FIRST_NAME=@PAR_FIRST_NAME,@LAST_NAME=@PAR_LAST_NAME;

END
GO
