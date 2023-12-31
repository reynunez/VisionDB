/****** Object:  StoredProcedure [dbo].[sp_NET_GetApmtDet]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/07/2022
-- Description: Get Patient Appmt Details
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetApmtDet]
(
	@PAR_PATIENT_NO INT = 0
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@PATIENT_NO INT'

SET	@SQLString = N' Select		a.patient_no
								,ltrim(rtrim(p.first_name )) + '' '' + ltrim(rtrim(p.last_name )) as patient_name
								,cast(a.appmtdate as date) as appointment_date  
								,a.appmt_no 
								,a.workflow
								,a.appmtreason as reason_id
								,r.name as reason_name
								,r.description as reason_descriptioni
								,a.appmtlocation as location_id
								,a.locationname as location_name
					  From		appointment a
								left join patient p on a.patient_no = p.patient_no 
								left join tblreason r on a.appmtreason = r.reasonid 
					  where		a.patient_no = @PATIENT_NO
					  order		by a.appmtdate desc
				' 

EXECUTE sp_executesql @SQLString,@ParmDefinition,@PATIENT_NO = @PAR_PATIENT_NO;

END
GO
