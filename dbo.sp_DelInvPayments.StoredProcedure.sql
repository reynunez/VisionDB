/****** Object:  StoredProcedure [dbo].[sp_DelInvPayments]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_DelInvPayments](
	@invoiceid int
) AS
delete from payments where invoiceid = @invoiceid
GO
