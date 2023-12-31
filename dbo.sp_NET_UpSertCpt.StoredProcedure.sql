/****** Object:  StoredProcedure [dbo].[sp_NET_UpSertCpt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/17/2020
-- Description: Updte/Insert Billing Code Record
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpSertCpt]
(
	@id int,
	@class VARCHAR(50),
	@code VARCHAR(50),
	@modifier VARCHAR(50),
	@modifier2 VARCHAR(50),
	@description VARCHAR(MAX),
	@fee NUMERIC(18,2)
)	
AS
BEGIN

    SET NOCOUNT ON
	IF @id = 0 BEGIN
		Insert into tblcpt(	class
							,code 
							,modifier 
							,modifier2
							,description 
							,fee
							)
					Values(	@class
							,@code 
							,@modifier 
							,@modifier2
							,@description 
							,@fee
							)
		END
		ELSE BEGIN
			Update	tblcpt
					set	class = @class ,
					code = @code ,
					modifier = @modifier ,
					modifier2 = @modifier2 ,
					description = @description ,
					fee = @fee 
			where	id = @id 
		END

END
GO
