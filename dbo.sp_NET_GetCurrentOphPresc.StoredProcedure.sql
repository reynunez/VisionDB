/****** Object:  StoredProcedure [dbo].[sp_NET_GetCurrentOphPresc]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/03/2020
-- Description: Get Ophthalmic History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCurrentOphPresc](
	@patient_no as integer
)
AS
BEGIN

    SET NOCOUNT ON;

	Select	dbo.GetOphLine('R',PH.prescid) as OD,
			dbo.GetOphLine('L',PH.prescid) as OS,
			PH.prescdate,
			PH.doctor,
			PH.prescid,
			opr.Usage 
	from	prescheader PH
			join prescoph OPr on OPr.prescid = PH.prescid and PH.void = 0 
			join prescoph OPl on OPl.prescid = PH.prescid and PH.void = 0 
	where	PH.patient_no = @patient_no
			and PH.presctype = 2
			and convert(date,PH.prescdate ,101) = convert(date,dateadd(hour,-5,getdate()),101)

END
GO
