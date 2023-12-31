/****** Object:  StoredProcedure [dbo].[GetPCPSelection]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 2019-12-30
-- Description:	PCP Report Selection Report
-- =============================================
CREATE PROCEDURE [dbo].[GetPCPSelection]
	@SelDate as Date
AS
BEGIN
	SET NOCOUNT ON;

	Select	ST.testid
			,ST.patientid
			,DO.doctorid
			,DO.description as DOCTOR
			,PA.npcp as PCPID
			,CASE WHEN ED.DESCRIPTION = '' THEN 'NO PCP' ELSE COALESCE(ED.DESCRIPTION,'NO PCP') END as PCP
			,ED.fax
			,(RTRIM(PA.first_name) + ' ' + RTRIM(PA.last_name)) AS patient_name
			,CAST(PA.birth_date as DATE) AS dob
			,ST.testdate
			,ST.dfeOD
			,ST.dfeOS
			,ST.dfeComment
			,CASE WHEN  (trim(ST.dfeOD) <> 'Undilated 90D/78D' OR trim(ST.dfeOS) <> 'Undilated 90D/78D')  THEN 'YES' ELSE 'NO'  END AS  DILATED
			,COALESCE(DIA.diagnosis,'NA') AS DIAGNOSIS
			,COALESCE(DIA.ISGLAUCOMA,'NA') AS ISGLAUCOMA
			,CASE WHEN ((charindex('Diabetes',ST.dfeOD) > 0) or (charindex('Diabetes',ST.dfeOS) > 0)) THEN 'YES'
			ELSE COALESCE(DIA.ISDIABETIC,'NA') 
			END AS ISDIABETIC
			,COALESCE(DIA.ISRETINOPATHY,'NA') AS ISRETINOPATHY
			,PA.last_name
			,PA.first_name
	from	emrSpecialtyTest ST LEFT JOIN
			(
				Select	cast(DIAG.diag_start as date) as diag_start
						,DIAG.patient_no
						,CASE WHEN ((charindex('E10',string_agg(DIAG.user_cd,'-'))>0) or (charindex('E11',string_agg(DIAG.user_cd,'-'))>0)) THEN 'YES' ELSE 'NO' END AS ISDIABETIC
						,CASE WHEN ((charindex('E10',string_agg(DIAG.user_cd,'-'))>0) or (charindex('E11',string_agg(DIAG.user_cd,'-'))>0)) 
							THEN 
								CASE WHEN ((charindex('E10.9',string_agg(DIAG.user_cd,'-'))>0) or (charindex('E11.9',string_agg(DIAG.user_cd,'-'))>0)) THEN 'NO' 
								ELSE 'YES' 
								END 
							ELSE 'NO'
						 END AS ISRETINOPATHY
						,CASE WHEN (charindex('H40',string_agg(DIAG.user_cd,'-'))>0) THEN 'YES' ELSE 'NO' END AS ISGLAUCOMA
						,CAST(string_agg((LTRIM(RTRIM(DIAG.user_cd)) + '-' + LTRIM(RTRIM(COD.short_description))),' | ') AS VARCHAR(2000)) as diagnosis
				from	patient_diagnosis DIAG LEFT JOIN
						tbl_icd_codes COD ON COD.icd_code = DIAG.user_cd
				GROUP	BY cast(DIAG.diag_start as date),DIAG.patient_no
			) DIA ON ST.patientid = DIA. patient_no and DIA.diag_start = @SelDate LEFT JOIN
			patient PA ON ST.patientid = PA.patient_no LEFT JOIN
			doctors DO ON DO.doctorid = ST.doctorid LEFT JOIN
			ext_doctors ED ON ED.doctorid = PA.npcp
	where	CAST(ST.testdate AS DATE) = @SelDate
			AND (trim(ST.dfeOD) <> '' and trim(ST.dfeOs) <> '')
			AND NOT DIA.diagnosis IS NULL
	order	by ST.patientid
;
END
GO
