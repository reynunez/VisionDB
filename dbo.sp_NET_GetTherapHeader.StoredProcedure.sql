/****** Object:  StoredProcedure [dbo].[sp_NET_GetTherapHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/24/2020
-- Description:	Get Therapeutic Presc Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetTherapHeader]
	@prescid int
AS
BEGIN
	Select	h.prescid
			,h.patient_no 
			,h.presctype 
			,h.patient_no 
			,h.prescdate
			,h.doctor
			,h.license
			,h.void
			,h.officeid
			,h.voidreason
			,d.voidafter 
			,d.suffamt 
			,d.refills 
			,d.refillsamt 
			,d.comments 
	from	prescheader h
			join (
				Select	top 1  voidafter,suffamt,refills,refillsamt,comments,prescid 
				from	prescTH
				where	prescid = @prescid
				) d on h.prescid = d.prescid
	where	h.prescid = @prescid;

END
GO
