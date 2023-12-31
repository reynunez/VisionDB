/****** Object:  StoredProcedure [dbo].[sp_NET_DeleteContacts]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/17/2020
-- Description: Adding/Update a Contact Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_DeleteContacts]
(
		@clid integer = 0
)
As

if @clid <> 0 BEGIN
	DELETE from contactlens WHERE clid = @clid;
END;
GO
