/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphHeader]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 10/24/2020
-- Description:	Get Oph Presc Header
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphHeader]
	@prescid int
AS
BEGIN

	Select	h.prescid
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
			,d.sphr 
			,d.sphl 
			,d.cylr
			,d.cyll 
			,d.axisr 
			,d.axisl
			,d.addr 
			,d.addl 
			,d.Prism1r 
			,d.Prism1l 
			,d.Prism2r 
			,d.Prism2l 
			,d.Distpdr 
			,d.Distpdl 
			,d.Usage 
			,d.Lenstype 
			,d.presctype 
	from	prescheader h
			join prescoph d on h.prescid = d.prescid
	where	h.prescid = @prescid;

END
GO
