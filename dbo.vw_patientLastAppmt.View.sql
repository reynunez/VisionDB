/****** Object:  View [dbo].[vw_patientLastAppmt]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE view [dbo].[vw_patientLastAppmt]
  AS
    select	patient_no
			,max(appmtdate)last_appmtdate
			,abs(datediff(dy,cast(getdate()as date),cast(max(appmtdate) as date))) days
			,abs(datediff(mm,cast(getdate()as date),cast(max(appmtdate) as date))) months
  from		appointment 
  group		by patient_no
GO
