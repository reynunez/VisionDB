/****** Object:  StoredProcedure [dbo].[sp_NET_DisablePatientInsurance]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/30/2020
-- Description:	Disable Insurance
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_DisablePatientInsurance]
	@Ins_no INT
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE patient_insurances
	SET date_disabled = DATEADD(hh,-5,getdate())
	WHERE Ins_no = @Ins_no;
END
GO
