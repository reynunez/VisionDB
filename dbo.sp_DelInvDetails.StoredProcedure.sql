/****** Object:  StoredProcedure [dbo].[sp_DelInvDetails]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_DelInvDetails](
	@invoiceid int
) AS

delete from invdetails where invoiceid = @invoiceid
GO
