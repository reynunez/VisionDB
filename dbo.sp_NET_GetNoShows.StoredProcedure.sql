/****** Object:  StoredProcedure [dbo].[sp_NET_GetNoShows]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/07/2022
-- Description: Get Appointments No Shows
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetNoShows]
(
	@PAR_DATE_1 DATE = '',
	@PAR_DATE_2 DATE = '',
	@PAR_LOCATION INT = 0
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@DATE_1 DATE,@DATE_2 DATE,@LOCATION INT'

SET	@SQLString = N'Select	a.patient_no
							,ltrim(rtrim(p.first_name )) + '' '' + ltrim(rtrim(p.last_name )) as patient_name
							,cast(a.appmtdate as date) as appmtdate  
							,a.appmt_no 
							,a.workflow
							,a.appmtreason
							,r.name
							,r.description
							,a.apstatusid 
							,s.description as appmt_status
							,a.appmtlocation
							,a.locationname
							,ltrim(rtrim(coalesce(p.first_name,'''') )) + '' '' + ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(p.first_name,'''') ))  + ''|'' +
							 ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(a.locationname,''''))) + ''|'' +
							 ltrim(rtrim(coalesce(ins.insurance_name,''''))) + ''|'' +
							 ltrim(rtrim(coalesce(d.description,''''))) + ''|'' + 
							 ltrim(rtrim(coalesce(p.email_address,''''))) + ''|'' + 
							 ltrim(rtrim(coalesce(ad.phone1,''''))) + ''|'' + 
							 cast(p.patient_no as varchar) as payload
				  From		appointment a
							left join patient p on a.patient_no = p.patient_no 
							left join address ad on ad.patient_no = a.patient_no
							left join tblreason r on a.appmtreason = r.reasonid 
							left join appointmentstatus s on a.apstatusid = s.apstatusid
							left join View_PatInsurance ins ON ins.patient_no = p.patient_no and ins.ins_no = a.insurance_no 
							left join doctors d ON d.doctorid = a.appmtdoctor
				  where		a.workflow = ''noshow''
				' + 
				CASE WHEN (@PAR_DATE_1 <> '' AND @PAR_DATE_2 <> '') THEN ' and CAST(a.appmtdate as DATE)  BETWEEN @DATE_1 AND @DATE_2' ELSE '' END +
				CASE WHEN @PAR_LOCATION <> 0 THEN ' and a.appmtlocation = @LOCATION' ELSE '' END



EXECUTE sp_executesql @SQLString,@ParmDefinition,@DATE_1=@PAR_DATE_1,@DATE_2=@PAR_DATE_2,@LOCATION=@PAR_LOCATION;

END
GO
