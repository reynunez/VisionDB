/****** Object:  StoredProcedure [dbo].[sp_NET_GetCptRecord]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/17/2020
-- Description: Get Billing Code Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCptRecord]
(
	@id int
)
AS
BEGIN

    SET NOCOUNT ON

	Select	*
	from	tblcpt
	where	id = @id

END
GO
