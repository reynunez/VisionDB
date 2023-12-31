/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphPrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/01/2020
-- Description: Get Ophthalmic Prescription
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphPrescription](
	@prescid as integer
)
AS
BEGIN

	Select	sphr 
			,sphl
			,cylr
			,cyll
			,Axisr 
			,Axisl 
			,Addr 
			,Addl 
			,Distpdr 
			,Distpdl 
			,Prism1r 
			,Prism1l 
			,Prism2r 
			,Prism2l 
			,Usage 
			,voidafter 
			,refills 
			,refillsamt 
			,comments 
			,vsrdva 
			,vsrnva 
			,vsldva 
			,vslnva 
			,vcrdva 
			,vcrnva 
			,vcldva 
			,vclnva 
			,kr001 
			,kr002 
			,kr003 
			,kl001 
			,kl002 
			,kl003 
			,presctype 
			,color 
			,npa 
			,npc 
			,dom 
			,eom 
			,ct 
			,kair 
			,kail 
			,krir 
			,kril 
	From	prescoph 
	where	prescid = @prescid

END
GO
