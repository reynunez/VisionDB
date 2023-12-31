/****** Object:  StoredProcedure [dbo].[sp_UpdateVoidAfter]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/14/2015
-- Description:	Update VoidAfter Date
-- =============================================
CREATE PROCEDURE [dbo].[sp_UpdateVoidAfter] 
	@presctype varchar(2),
	@voidafter datetime,
	@prescid int
AS
BEGIN
	IF (@presctype = 'CL') BEGIN
		Update prescCL
		Set voidafter = @voidafter
		Where prescid = @prescid
	END
	
	IF (@presctype = 'OP') BEGIN
		Update prescoph
		Set voidafter = @voidafter
		Where prescid = @prescid	
	END
	
	IF (@presctype = 'TH') BEGIN
		Update prescTH
		Set voidafter = @voidafter
		Where prescid = @prescid
	END	
	
END
GO
