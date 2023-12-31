/****** Object:  StoredProcedure [dbo].[sp_NET_GetReasonCPT]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/22/2020
-- Description:	Appointment Reasons CPT List
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetReasonCPT](
	@reasonid INT
)
AS
BEGIN

	SET NOCOUNT ON;

 SELECT		DISTINCT
			TR.reasonid 
			,TR.acronym 
			,cpt.code  as cpt_code
			,cpt.class 
			,cpt.modifier 
			,cpt.modifier2 
			,cpt.description 
			,cpt.fee
  FROM		TBLREASON TR 
			JOIN tblreasoncodes TRC ON TR.reasonid = TRC.reasonid 
			JOIN tblcpt CPT ON cpt.code = TRC.cpt_code  
  WHERE		TR.reasonid = @reasonid;

END
GO
