/****** Object:  View [dbo].[vwEDI837Source]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vwEDI837Source]
AS
SELECT	distinct 
		Invoice.invoiceid, 
		Invoice.patient_no, 
		Invoice.reference, 
		Invoice.postdate, 
		Invoice.provider, 
		Invoice.providerid, 
		Invoice.recorder, 
		Invoice.recorderid, 
        Invoice.invdate, 
		Invoice.transdate, 
		Invoice.pcharges, 
		Invoice.inscharges, 
		Invoice.ibalance, 
		invoicedetails.productname, 
		invoicedetails.cpt, 
        invoicedetails.icd9, 
		invoicedetails.insurance, 
		invoicedetails.qty, 
		invoicedetails.fees, 
		invoicedetails.coverage, 
		invoicedetails.patientamt, 
        invoicedetails.insamt, 
        invoicedetails.provider as providername,
		insurance.insurance_no,
		insurance.insurance_name, 
		insurance.payer_id ,
		insurance.payer_Name,
		insurance.insurance_account_no, 
		insurance.insurance_address1, 
		insurance.insurance_address2, 
        insurance.insurance_city, 
		insurance.insurance_state, 
		insurance.insurance_zip_cd, 
		insurance.insurance_phone_no,
		insurance.Availity,
		insurance.issendprovider
FROM    Invoice LEFT JOIN
        invoicedetails ON Invoice.invoiceid = invoicedetails.invoiceid LEFT JOIN
        insurance ON invoicedetails.insuranceid = insurance.insurance_no
GO
