/****** Object:  StoredProcedure [dbo].[sp_NET_ValidateReasonCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 08/08/2020
-- Description: Reason Valid Codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_ValidateReasonCodes]
(
	@reasonid int,
	@objectid int,
	@objecttype varchar(25)
)
AS
BEGIN
    SET NOCOUNT ON

	  IF EXISTS(Select codeid from tblreasoncodes where codetype = @objecttype and reasonid = @reasonid ) BEGIN
		IF EXISTS(Select codeid from tblreasoncodes where codetype = @objecttype and reasonid = @reasonid and codeid = @objectid) BEGIN
			SELECT 1 AS RESULTS
		END
		ELSE BEGIN
			SELECT 0 AS RESULTS
		END
	  END
	  ELSE BEGIN
		SELECT 1 AS RESULTS
	  END	
END
GO
