/****** Object:  StoredProcedure [dbo].[sp_NET_GetLastVisit]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/06/2022
-- Description: Get Appointments Last Visit
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetLastVisit]
(
	@PAR_MONTHS_1 INT = 0,
	@PAR_MONTHS_2 INT = 0,
	@PAR_LOCATION INT = 0,
	@PAR_INSURANCE_NO INT = 0,
	@PAR_WORKFLOW VARCHAR(100) = ''
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@MONTHS_1 INT,@MONTHS_2 INT,@LOCATION INT,@INSURANCE_NO INT,@WORKFLOW VARCHAR(100)'

SET	@SQLString = N'
				Select		a.patient_no
							,ltrim(rtrim(p.first_name )) + '' '' + ltrim(rtrim(p.last_name )) as patient_name
							,a.last_appmtdate 
							,a.months
							,ap.appmt_no 
							,ap.workflow
							,case ap.isWalkin when 0 then ''No'' Else ''Yes'' END IsWalkin
							,ap.apstatusid 
							,s.description as appmt_status
							,ap.appmtreason
							,r.name
							,r.description
							,ap.appmtlocation
							,ap.locationname
							,ins.insurance_no
							,ins.insurance_name
							,ltrim(rtrim(coalesce(p.first_name,'''') )) + '' '' + ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(p.first_name,'''') ))  + ''|'' +
							 ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(ap.locationname,''''))) + ''|'' +
							 ltrim(rtrim(coalesce(ins.insurance_name,''''))) + ''|'' +
							 ltrim(rtrim(coalesce(d.description,''''))) + ''|'' + 
							 ltrim(rtrim(coalesce(p.email_address,''''))) + ''|'' + 
							 ltrim(rtrim(coalesce(ad.phone1,''''))) + ''|'' + 
							 cast(p.patient_no as varchar) as payload
				From		vw_patientLastAppmt a
							left join patient p on a.patient_no = p.patient_no 
							left join address ad on ad.patient_no = a.patient_no
							left join appointment ap on ap.appmtdate = a.last_appmtdate and ap.patient_no = a.patient_no 
							left join tblreason r on ap.appmtreason = r.reasonid 
							left join appointmentstatus s on ap.apstatusid = s.apstatusid
							left join View_PatInsurance ins ON ins.patient_no = p.patient_no and ins.ins_no = ap.insurance_no 
							left join doctors d ON d.doctorid = ap.appmtdoctor
				where		ap.appmtreason <> 11
							and coalesce(ap.is_cancel,0) <> 1
				' + 
				CASE WHEN (@PAR_MONTHS_1 <> 0 AND @PAR_MONTHS_2 <> 0) THEN ' and a.months BETWEEN @MONTHS_1 AND @MONTHS_2' ELSE '' END +
				CASE WHEN @PAR_LOCATION <> 0 THEN ' and ap.appmtlocation = @LOCATION' ELSE '' END +
				CASE WHEN @PAR_INSURANCE_NO <> 0 THEN ' and ins.insurance_no = @INSURANCE_NO' ELSE '' END +
				CASE WHEN @PAR_WORKFLOW <> '' THEN ' and ap.workflow = @WORKFLOW' ELSE '' END



EXECUTE sp_executesql @SQLString,@ParmDefinition,@MONTHS_1=@PAR_MONTHS_1,@MONTHS_2=@PAR_MONTHS_2,@LOCATION=@PAR_LOCATION,@INSURANCE_NO=@PAR_INSURANCE_NO,@WORKFLOW=@PAR_WORKFLOW;

END
GO
