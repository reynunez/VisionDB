/****** Object:  StoredProcedure [dbo].[sp_NET_GetCLPrice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/29/2020
-- Description: Retrieve Contact Lens Price
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetCLPrice]
(
	@upcc VARCHAR(25),
	@clid int
)
AS
BEGIN

    SET NOCOUNT ON

	if @clid = 0 BEGIN
		Select	[list price]
		from	contactlens 
		where	upcc = @upcc
	END
	ELSE BEGIN
		Select	[list price]
		from	contactlens 
		where	clid = @clid
	END 
END
GO
