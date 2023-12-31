/****** Object:  View [dbo].[Vw_Net_SignatureEvents]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [dbo].[Vw_Net_SignatureEvents]
AS
select	dbo.SignatureEvents.eventseq,
		dbo.SignatureEvents.patient_no,
		dbo.SignatureEvents.eventdate,
		dbo.SignatureEvents.eventid,
		dbo.SignatureEvents.orderinfo,
		dbo.signaturethemes.title as description,
		dbo.SignatureEvents.sigtype 
from	dbo.SignatureEvents inner join
		dbo.signaturethemes on dbo.SignatureEvents.eventid = dbo.signaturethemes.signatureid   
GO
