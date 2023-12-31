/****** Object:  StoredProcedure [dbo].[sp_NET_InsertDOCReasonCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/09/2021
-- Description: Insert Reason Codes Doctor
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertDOCReasonCodes]
(
	@reasonid INT ,
	@codetype VARCHAR(10) = '' ,
	@dorctorname VARCHAR(100) = ''

)
AS
BEGIN

Declare @codeid int
Select top 1 @codeid = doctorid  from doctors where description = @dorctorname;

	IF NOT EXISTS(
		select	* 
		from	tblreasoncodes 
		where	reasonid = @reasonid
				and codeid = @codeid
				and codetype = @codetype
	) BEGIN
		Insert into tblreasoncodes (reasonid,codeid,codetype,icd_code,cpt_code,createdat)
		Values(@reasonid,@codeid,@codetype,'','',GETDATE());
	END

END
GO
