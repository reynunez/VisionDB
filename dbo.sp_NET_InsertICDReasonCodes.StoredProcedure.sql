/****** Object:  StoredProcedure [dbo].[sp_NET_InsertICDReasonCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/09/2021
-- Description: Insert Reason Codes ICD
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertICDReasonCodes]
(
	@reasonid INT ,
	@codetype VARCHAR(10) = '' ,
	@icd_code VARCHAR(10) = ''

)
AS
BEGIN

Declare @codeid int
Select top 1 @codeid = diagnosis_id from tbl_icd_codes where icd_code = @icd_code;

	IF NOT EXISTS(
		select	* 
		from	tblreasoncodes 
		where	reasonid = @reasonid
				and codeid = @codeid
				and codetype = @codetype
				and icd_code = @icd_code
	) BEGIN
		Insert into tblreasoncodes (reasonid,codeid,codetype,icd_code,cpt_code,createdat)
		Values(@reasonid,@codeid,@codetype,@icd_code,'',GETDATE());
	END

END
GO
