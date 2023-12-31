/****** Object:  View [dbo].[EMRScriptsList]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[EMRScriptsList] As
SELECT	p.patient_no
		,rtrim(ltrim(p.first_name)) + iif(len(p.mid_name)>0,' ','') + rtrim(ltrim(p.mid_name)) + ' ' + rtrim(ltrim(last_name)) as patient_name
		,s.sdate
		,s.scriptdate
		,s.scripttime
		,scriptcontents
FROM	patient p inner join
		emrsavedscripts s on p.patient_no = s.patientid
GO
