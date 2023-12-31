/****** Object:  StoredProcedure [dbo].[sp_NET_GetPatientsBday]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/07/2022
-- Description: Get Patient Birthday
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPatientsBday]
(
	@PAR_MONTH VARCHAR(20) = '',
	@PAR_DAY INT = 0
)

AS
BEGIN

DECLARE @SQLString NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(MAX);

SET @ParmDefinition = N'@MONTH VARCHAR(20),@DAY INT'

SET	@SQLString = N'Select	p.patient_no
							,ltrim(rtrim(p.first_name )) + '' '' + ltrim(rtrim(p.last_name )) as patient_name
							,CAST(p.birth_date AS DATE) as birthday
							,(0 + Convert(Char(8),GETDATE(),112) - Convert(Char(8),CAST(p.birth_date AS DATE),112)) / 10000 AS Age
							,COALESCE(CAST(CAST(l.last_appmtdate as DATE) AS VARCHAR(10)),''No Visits'') as Last_Visit
							,ltrim(rtrim(coalesce(p.first_name,'''') )) + '' '' + ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(p.first_name,'''') ))  + ''|'' +
							 ltrim(rtrim(coalesce(p.last_name,'''') )) + ''|'' +
							 ltrim(rtrim(coalesce(p.email_address,''''))) + ''|'' + 
							 ltrim(rtrim(coalesce(ad.phone1,''''))) + ''|'' + 
							 cast(p.patient_no as varchar) as payload
					From	patient p
							left join address ad on ad.patient_no = p.patient_no
							join vw_patientLastAppmt l on p.patient_no = l.patient_no 
					where	1=1 
							and NOT (ltrim(rtrim(p.first_name )) + '' '' + ltrim(rtrim(p.last_name ))) is NULL 
					' +
					CASE WHEN (@PAR_MONTH <> '' AND @PAR_DAY <> 0) THEN ' and format(CAST(p.birth_date AS DATE),''MMMM'') =  @MONTH and DATEPART(dd,CAST(p.birth_date AS DATE)) = @DAY ' ELSE ' ' END +
					'order	By p.patient_no '

EXECUTE sp_executesql @SQLString,@ParmDefinition,@MONTH=@PAR_MONTH,@DAY=@PAR_DAY;

END
GO
