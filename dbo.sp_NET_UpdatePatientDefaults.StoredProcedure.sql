/****** Object:  StoredProcedure [dbo].[sp_NET_UpdatePatientDefaults]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/08/2020
-- Description: Patient Update Defaults
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdatePatientDefaults](
	@patient_no  integer,
	@domeye varchar(2),
	@d_eom varchar(25),
	@d_npa numeric(18,2),
	@d_npc varchar(25),
	@d_ct varchar(25),
	@d_color varchar(25)
)
AS
BEGIN

    SET NOCOUNT ON;

	Update	patient 
	set		domeye = @domeye
			,d_eom = @d_eom
			,d_npa = @d_npa
			,d_npc = @d_npc
			,d_ct = @d_ct
			,d_color = @d_color
	where	patient_no = @patient_no;

END
GO
