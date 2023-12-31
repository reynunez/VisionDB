/****** Object:  View [dbo].[view_prescfill]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[view_prescfill]
AS
SELECT	ISNULL(LTRIM(RTRIM(dbo.patient.first_name)) + ' ' + LTRIM(RTRIM(dbo.patient.last_name)), '') AS [name], 
		ISNULL(dbo.address.address1, N'') AS [address1], 
		ISNULL(LTRIM(RTRIM(dbo.address.city)) + ', ' + LTRIM(RTRIM(dbo.address.state)) + ' ' + LTRIM(RTRIM(dbo.address.zip)), '') AS [address2],
		ISNULL(dbo.address.phone1, N'') AS [phone], 
		ISNULL(dbo.address.fax, N'') AS [fax], 
		ISNULL(dbo.patient.sex, '') AS [sex], 
		ISNULL(dbo.patient.email_address, '') AS [email], 
		ISNULL(dbo.office.officeid,0) AS [officeid],
		ISNULL(dbo.office.description,N'') AS [office], 
		ISNULL(dbo.office.address1, '') AS [ofaddress1], 
		ISNULL(LTRIM(RTRIM(dbo.office.City)) + ', ' + LTRIM(RTRIM(dbo.office.state)) + ' ' + LTRIM(RTRIM(dbo.office.zip)), '') AS [ofaddress2], 
		ISNULL(dbo.office.phone, '') AS [ofphone], 
		ISNULL(dbo.office.fax, '') AS [offax], 
        ISNULL(dbo.doctors.description, N'') AS doctor, 
		ISNULL(dbo.doctors.doctorid, 0) as [doctorid],
		ISNULL(dbo.doctors.license, '') AS [license], 
		dbo.patient.patient_no, 
		ISNULL(dbo.patient.birth_date, CONVERT(DATETIME, '1900-01-01 00:00:00', 102)) AS [dob],
		ISNULL(dbo.address.city,'') AS [city],
		ISNULL(dbo.address.state,'') AS [state],
		ISNULL(dbo.address.zip,'') AS [zip],
		ISNULL(pcp.description,'PCP Unavailable') as pcp,
		ISNULL(omd.description,'OMD Unavailable') as omd
FROM    dbo.patient LEFT JOIN
        dbo.address ON dbo.patient.patient_no = dbo.address.patient_no LEFT JOIN
        dbo.office ON dbo.patient.officeid = dbo.office.officeid LEFT JOIN
        dbo.doctors ON dbo.patient.doctorid = dbo.doctors.doctorid LEFT JOIN
		dbo.ext_doctors pcp ON dbo.patient.npcp = pcp.doctorid and pcp.specialty like '%PCP%' LEFT JOIN
		dbo.ext_doctors omd ON dbo.patient.npcp = omd.doctorid and omd.specialty like '%OMD%' 
GO
