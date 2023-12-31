/****** Object:  StoredProcedure [dbo].[sp_NET_GetPreAppointments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/04/2022
-- Description: Get Pre Appointments
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPreAppointments]
(
	@PAR_DATE_1 DATE = '',
	@PAR_DATE_2 DATE = '',
	@PAR_LOCATION INT = 0,
	@PAR_INSURANCE_NO INT = 0,
	@PAR_REASON INT = 0
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@DATE_1 DATE,@DATE_2 DATE,@LOCATION INT,@INSURANCE_NO INT,@REASON INT'

SET	@SQLString = N'
				Select	pa.pre_appmt_no as Pre_Appointment_no
						,pa.patient_no as Patient_no
						,LTRIM(RTRIM(p.first_name)) + '' '' + LTRIM(RTRIM(p.last_name )) as Patient_Name
						,pa.appmtlocation as Location_no
						,o.description as Location_name
						,pa.appmtreason as Reason_id
						,r.name as Reason_name
						,(ltrim(rtrim(r.description)) + '' '' + ltrim(rtrim(r.acronym)))  as Reason_description
						,pa.appmtdate as Pre_appointment_date
						,pa.appmttime as Pre_appointment_time
						,pa.insurance_no 
						,ins.insurance_name
						,IIF(SC.schdate IS NULL,''--'',''Available'') as Schedule
						,IIF(SC.doctorid IS NULL,0,d.doctorid) as SchDoctorId
						,IIF(SC.doctorid IS NULL,''--'',d.description) as SchDoctor
				from	preappointment pa
						left join (Select distinct cast(schddate as date) as schdate,time,officeid,doctorid from tbl_NET_drschedule) sc ON ((cast(pa.appmtdate as date) = cast(sc.schdate as date)) AND pa.appmttime = sc.time and pa.appmtlocation = sc.officeid)
						left join patient p ON pa.patient_no = p.patient_no 
						left join office o ON pa.appmtlocation = o.officeid 
						left join tblreason r ON pa.appmtreason = r.reasonid 
						left join View_PatInsurance ins ON ins.patient_no = pa.patient_no and ins.ins_no = pa.insurance_no 
						left join doctors d ON d.doctorid = sc.doctorid 
				where	1=1 
						and pa.is_cancel = 0 
						and pa.is_converted = 0 
				' + 
				CASE WHEN (@PAR_DATE_1 <> '' AND @PAR_DATE_2 <> '') THEN 'AND cast(pa.appmtdate as date) between @DATE_1 and @DATE_2 ' ELSE ' ' END +
				CASE WHEN @PAR_LOCATION <> 0 THEN ' and pa.appmtlocation = @LOCATION' ELSE '' END +
				CASE WHEN @PAR_INSURANCE_NO <> 0 THEN ' and pa.insurance_no  = @INSURANCE_NO' ELSE '' END +
				CASE WHEN @PAR_REASON <> '' THEN ' and pa.appmtreason = @REASON' ELSE '' END 

EXECUTE sp_executesql @SQLString,@ParmDefinition,@DATE_1=@PAR_DATE_1,@DATE_2=@PAR_DATE_2,@LOCATION=@PAR_LOCATION,@INSURANCE_NO=@PAR_INSURANCE_NO,@REASON=@PAR_REASON;

END
GO
