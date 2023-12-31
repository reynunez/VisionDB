/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertInsCPTMod]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/14/2021
-- Description:	Insert/Update Ins Modifier
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertInsCPTMod](
	@inscptid int = 0
	,@insurance_no int
	,@cptcode varchar(50)
	,@modifier varchar(50)
	,@modifier2 varchar(50)
	,@fee varchar(50)
	,@cptid int
)
AS
BEGIN
	IF @inscptid = 0 BEGIN

	Insert into	tblInsModifiers(
				insurance_no
				,cptcode
				,modifier
				,modifier2
				,fee
				,cptid
				)
	Values(
		@insurance_no
		,@cptcode
		,@modifier
		,@modifier2
		,@fee
		,@cptid
	)

	END
	ELSE BEGIN

		Update tblInsModifiers
			Set cptcode = @cptcode 
			,modifier = @modifier 
			,modifier2 = @modifier2 
			,fee = @fee
			,cptid= @cptid
		WHERE inscptid = @inscptid

	END

END
GO
