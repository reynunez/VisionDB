/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateDomEye]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 09/26/2020
-- Description: Patient Update Dominant Eye
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateDomEye](
	@patient_no  integer,
	@domeye varchar(2)
)
AS
BEGIN

    SET NOCOUNT ON;

	Update	patient 
	set		domeye = @domeye
	where	patient_no = @patient_no;

END
GO
