/****** Object:  StoredProcedure [dbo].[sp_NET_GetApmtFreq]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/07/2022
-- Description: Get Appointments Frequency
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetApmtFreq]
(
	@PAR_DATE_1 DATE = '',
	@PAR_DATE_2 DATE = '',
	@PAR_VISITS_1 INT = 0,
	@PAR_VISITS_2 INT = 0
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@DATE_1 DATE,@DATE_2 DATE,@VISITS_1 INT,@VISITS_2 INT'

SET	@SQLString = N'Select	a.patient_no
							,ltrim(rtrim(p.first_name )) + '' '' + ltrim(rtrim(p.last_name )) as patient_name
							,a.Frequency 
							,ltrim(rtrim(coalesce(p.first_name,'''') )) + '' '' + ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(p.first_name,'''') ))  + ''|'' +
							 ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(p.email_address,''''))) + ''|'' + 
							 ltrim(rtrim(coalesce(ad.phone1,''''))) + ''|'' + 
							 cast(p.patient_no as varchar) as payload
					From	(Select	patient_no
									,count(appmtdate) as Frequency
							 From	appointment' +
							 CASE WHEN (@PAR_DATE_1 <> '' AND @PAR_DATE_2 <> '') THEN ' WHERE cast(appmtdate as date) between @DATE_1 and @DATE_2 ' ELSE ' ' END +
							 'Group	By patient_no) as a
							left join patient p on a.patient_no = p.patient_no  
							left join address ad on ad.patient_no = p.patient_no
					where	a.patient_no <> 0
				' + 
				CASE WHEN (@PAR_VISITS_1 <> 0 and @PAR_VISITS_2 <> 0)THEN ' and a.Frequency BETWEEN @VISITS_1 AND @VISITS_2' ELSE '' END



EXECUTE sp_executesql @SQLString,@ParmDefinition,@DATE_1=@PAR_DATE_1,@DATE_2=@PAR_DATE_2,@VISITS_1=@PAR_VISITS_1,@VISITS_2=@PAR_VISITS_2;

END
GO
