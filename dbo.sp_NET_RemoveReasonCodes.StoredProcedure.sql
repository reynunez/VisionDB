/****** Object:  StoredProcedure [dbo].[sp_NET_RemoveReasonCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/18/2020
-- Description: Remove Reasons related codes
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_RemoveReasonCodes]
(
	@id INT
)
AS
BEGIN
	IF EXISTS(
		Select	* 
		from	tblreasoncodes 
		where	id = @id
		) BEGIN
		Delete 
		from	tblreasoncodes
		Where	id = @id
	END
END
GO
