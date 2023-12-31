/****** Object:  View [dbo].[vw_referrals_name]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_referrals_name] AS
Select	ref.referralid
		,ref.patient_no
		,(Select top 1 pname from viewpatient where patient_no = ref.patient_no) as patient_name
		,(Select top 1 dbo.decryptstring(username,76) as username from tblVOMMaBIT where id = ref.createdby) as createdby
		,convert(varchar(20),ref.datecreated,100) as f_datecreated
		,ref.datecreated
		,ref.doctorselection
		,ref.patientinfo
		,ref.disposition
		,ref.reason
		,ref.drname
		,ref.drnumber
		,ref.drfax
from	referrals ref
GO
