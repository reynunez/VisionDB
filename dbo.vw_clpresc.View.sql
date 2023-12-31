/****** Object:  View [dbo].[vw_clpresc]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[vw_clpresc] AS
Select	ph.prescid
		,ph.patient_no
		,ph.prescdate
		,ph.officeid
		,cl.lensStatus
		,cl.eye
		,cl.manufacturer
		,cl.lensname
		,cl.lenstype
		,cl.color
		,cl.sph
		,cl.cyl
		,cl.axis
		,cl.addition
		,cl.bc
		,cl.upcc
		,cl.sufamt
		,cl.voidafter
		,cl.refills
		,cl.refillsamt
		,cl.comments
from	prescheader ph JOIN
		prescCl cl ON ph.prescid = cl.prescid
where	ph.presctype = 1
GO
