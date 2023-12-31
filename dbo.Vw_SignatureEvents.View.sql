/****** Object:  View [dbo].[Vw_SignatureEvents]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[Vw_SignatureEvents]
AS
select	dbo.SignatureEvents.eventseq,
		dbo.SignatureEvents.patient_no,
		dbo.SignatureEvents.eventdate,
		dbo.SignatureEvents.eventid,
		dbo.SignatureEvents.orderinfo,
		dbo.SigEventsCodes.description,
		dbo.SignatureEvents.sigtype 
from	dbo.SignatureEvents inner join
		dbo.SigEventsCodes on dbo.SignatureEvents.eventid = dbo.SigEventsCodes.eventid   
GO
