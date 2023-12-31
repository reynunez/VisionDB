/****** Object:  StoredProcedure [dbo].[sp_GetContactsFromPresc]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 07/04/2018
-- Description:	Get Contact Lenses from Prescription
-- =============================================
CREATE PROCEDURE [dbo].[sp_GetContactsFromPresc](
	@prescID integer
)
AS
BEGIN
	Select	c.lensstatus,
			c.eye,
			c.Manufacturer,
			c.LensName,
			case when upper(cl.stb) = 'T' then 'Toric'
				 when upper(cl.stb) = 'S' then 'Single Vision'
				 when upper(cl.stb) = 'B' then 'Bifocal'
			end as lenstype,
			cl.color,
			c.sph,
			c.cyl,
			c.axis,
			c.addition,
			c.bc,
			c.upcc,
			cl.[list price],
			cl.cost
	from	prescheader h join
			prescCL c ON h.prescid = c.prescid  JOIN
			contactlens cl ON c.Manufacturer = cl.manufacturername and
							  c.LensName = cl.clname and
							  c.sph = cl.sph and
							  c.Cyl = cl.cyl and
							  c.Axis = cl.axs and
							  c.Color = cl.color and 
							  c.BC = cl.bc
	where	h.prescid = @prescID
END
GO
