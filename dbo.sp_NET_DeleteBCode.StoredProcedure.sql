/****** Object:  StoredProcedure [dbo].[sp_NET_DeleteBCode]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/17/2020
-- Description: Delete Billing Code Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_DeleteBCode]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON

	Delete from	tblcpt
	where	id = @id

END
GO
