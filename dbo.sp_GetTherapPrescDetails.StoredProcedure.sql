/****** Object:  StoredProcedure [dbo].[sp_GetTherapPrescDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/16/2018
-- Description:	Get Therapeutic Presc Details
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetTherapPrescDetails](
@prescid INTEGER
)
AS
begin

	Select	h.prescid
			,prescdate
			,d.description as presc_doctor
			,o.description as office
			,c.tradename
			,c.generic
			,c.manufacturer
			,c.preparation
			,c.howsupplied
			,c.voidafter
			,c.sig
	from	prescheader h join
			prescth c ON h.prescid = c.prescid join
			doctors d ON h.doctor = cast(d.doctorid as nvarchar(255)) join
			office o ON o.officeid = h.officeid
	Where	h.prescid = @prescid
end
GO
