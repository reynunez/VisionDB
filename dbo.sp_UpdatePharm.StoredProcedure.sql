/****** Object:  StoredProcedure [dbo].[sp_UpdatePharm]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/16/2020
-- Description:	Update Patient Pharmacy
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdatePharm] (
	@pharmacy integer,
	@patient_no bigint
)
AS
BEGIN
	SET NOCOUNT ON;
	update	patient
	set		pharmacy = @pharmacy
	where	patient_no = @patient_no
END
GO
