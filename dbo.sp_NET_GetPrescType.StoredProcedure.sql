/****** Object:  StoredProcedure [dbo].[sp_NET_GetPrescType]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 03/10/2021
-- Description:	Get Presc type
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetPrescType](
	@prescid INT
)
AS
BEGIN

	SET NOCOUNT ON;


	Select	prescid 
			,CASE 
				WHEN presctype = 3 THEN 'THE'
				WHEN presctype = 1 THEN 'CLE'
				WHEN presctype = 2 THEN 'OPH'
			END AS ptype
			,d.doctorid 
			,p.officeid 
	from	prescheader p
			left join doctors d ON p.doctor = d.description
	WHERE	prescid = @prescid

END
GO
