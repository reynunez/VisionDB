/****** Object:  StoredProcedure [dbo].[sp_GetPayment]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_GetPayment](@pmtType smallint, @pmtDate datetime )
AS
	declare @paymentType varchar(6)
	declare @payment money
	declare @payment2 money
	if @pmtType = 0 begin
		Set @paymentType = 'Check'
		Select @payment2 = sum(checkamt)  from invoice
		where invdate = @pmtDate
	end
	else if @pmtType = 1 begin
		Set @paymentType = 'Cash'
		select @payment2 = sum(cashamt)  from invoice
		where invdate = @pmtDate
	end
	else if @pmtType = 2 begin
		Set @paymentType = 'Other'
		select @payment2 = sum(otheramt)  from invoice
		where invdate = @pmtDate
	end
	select @payment = payment  from view_paymentsbydate
	where paytype = @paymentType and pydate = @pmtDate
	select (isnull(@payment,0) + isnull(@payment2,0))  as 'payment'
GO
