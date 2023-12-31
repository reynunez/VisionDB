/****** Object:  View [dbo].[getPatients]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE VIEW [dbo].[getPatients]
AS
SELECT dbo.patient.patient_no,
  dbo.patient.opatient_no,
  dbo.patient.first_name,
  dbo.patient.mid_name,
  dbo.patient.last_name,
  dbo.patient.suffix,
  dbo.patient.entry_date,
  dbo.patient.sex,
  dbo.patient.birth_date,
  dbo.patient.ss_no,
  dbo.patient.title,
  dbo.patient.head_of_household,
  dbo.patient.salutation,
  dbo.patient.occupation,
  dbo.patient.marital_status,
  dbo.patient.signature_on_file,
  dbo.patient.signature_date,
  dbo.patient.med_alert,
  dbo.patient.notes,
  dbo.patient.active,
  dbo.patient.last_office_visit_date,
  (Select top 1 appmtdate from appointment where patient_no = dbo.patient.patient_no and appmtdate <= getdate() order by appmtdate desc) as last_appointment,
  (Select top 1 appmtdate from appointment where patient_no = dbo.patient.patient_no and appmtdate >= getdate() order by appmtdate asc) as next_appointment,
  dbo.patient.last_update,
  dbo.patient.mailing_list,
  dbo.patient.last_exam_date,
  dbo.patient.eMail_address,
  dbo.patient.employername,
  dbo.patient.officeid,
  dbo.patient.doctorid,
  dbo.patient.isbeingedit,
  dbo.address.address1, 
  dbo.address.address2,
  dbo.address.city, 
  dbo.address.state, 
  dbo.address.zip, 
  dbo.address.phone1, 
  dbo.address.phone2, 
  dbo.address.fax, 
  dbo.office.description AS office_name, 
  dbo.office.voicent, 
  dbo.doctors.description AS doctor_name, 
  (Select top 1 insurance_no from patient_insurances where patient_no = dbo.patient.patient_no and isDefault = 1 order by ins_no desc) as insurance_no,
  (Select top 1 insured_id from patient_insurances where patient_no = dbo.patient.patient_no and isDefault = 1 order by ins_no desc) as insured_id,
  (Select top 1 policy_group_no from patient_insurances where patient_no = dbo.patient.patient_no and isDefault = 1 order by ins_no desc) as policy_group_no,
  (Select top 1 iauthorization from patient_insurances where patient_no = dbo.patient.patient_no and isDefault = 1 order by ins_no desc) as iauthorization,
  (Select top 1 benefits from patient_insurances where patient_no = dbo.patient.patient_no and isDefault = 1 order by ins_no desc) as benefits,
  dbo.udf_GetUnpaidBal(dbo.patient.patient_no) as balance
FROM    dbo.patient LEFT JOIN
        dbo.doctors ON dbo.patient.doctorid = dbo.doctors.doctorid LEFT JOIN
        dbo.office ON dbo.patient.officeid = dbo.office.officeid LEFT JOIN
        dbo.address ON dbo.patient.patient_no = dbo.address.patient_no
GO
