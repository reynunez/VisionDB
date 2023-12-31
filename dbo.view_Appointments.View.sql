/****** Object:  View [dbo].[view_Appointments]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE view [dbo].[view_Appointments]
As
SELECT DISTINCT
    appointment.appmt_no,
    appointment.appmttime,
    appointment.appmtdate,
    RIGHT(REPLICATE('0',10) + ltrim(RTRIM(CAST(patient.patient_no AS VARCHAR(10)))),10) AS
    patient_no,
    patient.first_name,
    patient.last_name,
    patient.birth_date,
    patient.eMail_address,
    address.phone1,
	ltrim(rtrim(address.address1)) + ' ' + ltrim(rtrim(address.city)) + ', '  + ltrim(rtrim(address.state)) + ' ' + ltrim(rtrim(address.zip)) as pataddress,
    RTRIM(patient.first_name) + ' ' + RTRIM(patient.last_name) AS [PatientName],
    office.officeid,
    office.voicent,
    office.description AS location,
    office.address1,
    office.City,
    office.state,
    office.zip,
    doctors.doctorid,
    doctors.description    AS [doctor],
    appReasons.name AS [reason],
    cast(appointment.note as varchar) as note,
    salespeople.name AS [createdby],
    (
        SELECT
            top 1 insurance_name
        FROM
            View_PatInsurance
        WHERE
            patient_no = patient.patient_no
        AND isDefault = 1) AS [insname],
    (
        SELECT
            top 1 insured_id
        FROM
            View_PatInsurance
        WHERE
            patient_no = patient.patient_no
        AND isDefault = 1) AS [insid],
    case WHEN appointment.is_cancel = 1 then 'Yes' ELSE 'No' END as cancelled,
    CASE when appointment.new_date is NULL then '' ELSE appointment.new_date END as newdate,
	appointmentstatus.description as apstatus,
	appvisitstate.description as visitstate,
	COALESCE(appmtinsurance.ins_authorization,'') AS ins_authorization,
	COALESCE(appmtinsurance.ins_benefits,'') AS ins_benefits,
	pcp.description as pcp,
	ins.insurance_name,
	appointment.username
FROM	appointment
LEFT JOIN patient ON appointment.patient_no = patient.patient_no
LEFT JOIN ext_doctors pcp on pcp.doctorid = patient.npcp 
LEFT JOIN address ON patient.patient_no = address.patient_no
LEFT JOIN  office ON appointment.appmtlocation = office.officeid
LEFT JOIN (select distinct reasonid,name from tblreason ) appReasons ON appointment.appmtreason = appReasons.reasonID
LEFT JOIN doctors ON appointment.appmtdoctor = doctors.doctorid
LEFT JOIN salespeople ON salespeople.salesmanid = appointment.salesmanid
LEFT JOIN appointmentstatus ON appointmentstatus.apstatusid = appointment.apstatusid
LEFT JOIN appvisitstate ON appvisitstate.statecode = appointment.visitstate
LEFT JOIN appmtinsurance ON appmtinsurance.appmt_no = appointment.appmt_no
LEFT JOIN View_PatInsurance ins ON ins.patient_no = patient.patient_no and ins.isdefault = 1 and ins.active = 1


GO
