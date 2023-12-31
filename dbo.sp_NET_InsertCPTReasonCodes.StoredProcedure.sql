/****** Object:  StoredProcedure [dbo].[sp_NET_InsertCPTReasonCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/09/2021
-- Description: Insert Reason Codes CPT
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertCPTReasonCodes]
(
	@reasonid INT ,
	@codetype VARCHAR(10) = '' ,
	@modifier VARCHAR(10) = '' ,
	@cpt_code VARCHAR(10) = ''

)
AS
BEGIN

Declare @codeid int
Select top 1 @codeid = id from tblcpt where code = @cpt_code and modifier = @modifier;

	IF NOT EXISTS(
		select	* 
		from	tblreasoncodes 
		where	reasonid = @reasonid
				and codeid = @codeid
				and codetype = @codetype
				and cpt_code = @cpt_code
	) BEGIN
		Insert into tblreasoncodes (reasonid,codeid,codetype,icd_code,cpt_code,createdat)
		Values(@reasonid,@codeid,@codetype,'',@cpt_code,GETDATE());
	END

END
GO
