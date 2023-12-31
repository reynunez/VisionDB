/****** Object:  UserDefinedFunction [dbo].[GetQuantityOnOrder]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetQuantityOnOrder]
(
	@productID nvarchar(14),
	@tableID int,
	@officeid int
)
RETURNS INT
AS
BEGIN
	DECLARE @ResultVar int
	DECLARE @ORD int,
			@REC int

	select @ORD = sum(quantity) FROM invTransactions where officeid = @officeid and  trantype = 4 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid
	select @REC = sum(quantity) FROM invTransactions where officeid = @officeid and  trantype = 5 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid

	SET @ResultVar = (isnull(@ORD,0)-isnull(@REC,0))
	IF @ResultVar < 0 BEGIN
		SET @ResultVar = 0
	END 
	
	RETURN isnull(@ResultVar,0)

END
GO
