/****** Object:  StoredProcedure [dbo].[sp_NET_GetEDIReceiver]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/22/2022
-- Description:	Procedure to get EDI Receivers
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEDIReceiver]
AS

BEGIN

	SET NOCOUNT ON;

	Select	id
			,rname 
	from	ediReceiver

END
GO
