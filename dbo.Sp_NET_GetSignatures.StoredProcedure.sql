/****** Object:  StoredProcedure [dbo].[Sp_NET_GetSignatures]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 06/08/2020
-- Description:	Get Signature Events
-- =============================================
CREATE PROCEDURE [dbo].[Sp_NET_GetSignatures]
	@signatureid integer 
AS
BEGIN
	Select * from signaturethemes where signatureid = @signatureid
END
GO
