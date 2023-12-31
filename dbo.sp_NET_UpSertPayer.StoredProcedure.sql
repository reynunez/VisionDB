/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertPayer]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/14/2021
-- Description:	Insert/Update Payer
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertPayer](
	@payerid INT
	,@payername VARCHAR(200)
	,@payer_number VARCHAR(100)
	,@isactive bit
)
AS
BEGIN
	IF @payerid = 0 BEGIN
			Insert into tbl_payer(
					payername,
					payer_number,
					isactive 
					)
			Values(
					@payername
					,@payer_number 
					,@isactive 
			)
	END
	ELSE BEGIN

		Update tbl_payer 
			Set payername = @payername
			,payer_number = @payer_number
			,isactive = @isactive
		WHERE payerid = @payerid
	END

END
GO
