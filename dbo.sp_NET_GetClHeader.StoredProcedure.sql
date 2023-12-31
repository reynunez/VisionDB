/****** Object:  StoredProcedure [dbo].[sp_NET_GetClHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/24/2020
-- Description:	Get CL Presc Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetClHeader]
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
			,d.comments
			,d.sufamt
			,d.refills
			,d.refillsamt
			,d.voidafter
			,d.lensStatus
	from	prescheader h
			join (
				Select	top 1 comments,prescid,sufamt,refills,refillsamt,voidafter,lensStatus 
				from	prescCL
				where	prescid = @prescid
				) d on h.prescid = d.prescid
	where	h.prescid = @prescid;

END
GO
