/****** Object:  StoredProcedure [dbo].[sp_UpdateOMD]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/16/2020
-- Description:	Update Patient OMD
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateOMD] (
	@nomd integer,
	@patient_no bigint
)
AS
BEGIN
	SET NOCOUNT ON;
	update	patient
	set		nomd = @nomd
	where	patient_no = @patient_no
END
GO
