/****** Object:  UserDefinedFunction [dbo].[GetQuantityOnHand]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[GetQuantityOnHand]
(
	@productID nvarchar(14),
	@tableID int,
	@officeid int
)
RETURNS INT
AS
BEGIN
	DECLARE @ResultVar int
	DECLARE @OB int,	-- Product Opening Balance
			@AD int,	-- Physical Count Adjustment
			@OA int,	-- Other Adjustments
			@REC int,	-- Product Received
			@SOLD int,	-- Product Sold
			@RETURNS int -- Product Returns

	select @OB = sum(quantity) FROM invTransactions where officeid = @officeid and trantype = 1 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid
	select @AD = sum(quantity) FROM invTransactions where officeid = @officeid and  trantype = 2 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid
	select @OA = sum(quantity) FROM invTransactions where officeid = @officeid and  trantype = 3 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid
	select @REC = sum(quantity) FROM invTransactions where officeid = @officeid and  trantype = 5 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid
	select @SOLD = sum(quantity)FROM invTransactions where officeid = @officeid and  trantype = 6 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid
	Select @RETURNS = sum(quantity)FROM invTransactions where officeid = @officeid and  trantype = 7 and fpcID = @productID and prodTableID = @tableID group by fpcID,prodtableid

	SET @ResultVar = (isnull(@OB,0) + isnull(@AD,0) + isnull(@OA,0) + isnull(@REC,0) - isnull(@SOLD,0) + isnull(@RETURNS,0))
	
	RETURN isnull(@ResultVar,0)

END
GO
