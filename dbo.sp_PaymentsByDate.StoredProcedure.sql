/****** Object:  StoredProcedure [dbo].[sp_PaymentsByDate]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[sp_PaymentsByDate]
@cDate DATETIME, @officeid INT=0
AS
Declare @Check money,
  @Check2 money,
  @Cash money,
  @Cash2 money,
  @Other money,
  @Other2 money

If (@officeid = 0) BEGIN

    Select @Check = isnull(sum(checkamt),0) from invoice where convert(datetime,convert(varchar(10),invdate,101)) = @cDate
    Select @Cash = isnull(sum(cashamt),0) from invoice where convert(datetime,convert(varchar(10),invdate,101)) = @cDate
    Select @Other = isnull(sum(otheramt),0) from invoice where convert(datetime,convert(varchar(10),invdate,101)) = @cDate
    Select @Check2 = isnull(sum(Payment),0) from payments where pyType = 0 and convert(datetime,convert(varchar(10),pydate,101)) = @cDate
    Select @Cash2 = isnull(sum(Payment),0) from payments where pyType = 1 and convert(datetime,convert(varchar(10),pydate,101)) = @cDate
    Select @Other2 = isnull(sum(Payment),0) from payments where pyType = 2 and convert(datetime,convert(varchar(10),pydate,101)) = @cDate

END
ELSE BEGIN

    Select @Check = isnull(sum(checkamt),0) from invoice where convert(datetime,convert(varchar(10),invdate,101)) = @cDate AND officeid = @officeid
    Select @Cash = isnull(sum(cashamt),0) from invoice where convert(datetime,convert(varchar(10),invdate,101)) = @cDate AND officeid = @officeid
    Select @Other = isnull(sum(otheramt),0) from invoice where convert(datetime,convert(varchar(10),invdate,101)) = @cDate AND officeid = @officeid

    Select @Check2 = isnull(sum(Payment),0) from payments inner join invoice on invoice.invoiceid = payments.invoiceid where pyType = 0 and convert(datetime,convert(varchar(10),pydate,101)) = @cDate and invoice.officeid = @officeid
    Select @Cash2 = isnull(sum(Payment),0) from payments inner join invoice on invoice.invoiceid = payments.invoiceid where pyType = 1 and convert(datetime,convert(varchar(10),pydate,101)) = @cDate  and invoice.officeid = @officeid
    Select @Other2 = isnull(sum(Payment),0) from payments inner join invoice on invoice.invoiceid = payments.invoiceid where pyType = 2 and convert(datetime,convert(varchar(10),pydate,101)) = @cDate  and invoice.officeid = @officeid

END



Select (@Check + @Check2)as [check], (@Cash + @Cash2) as [cash], (@Other + @Other2) as [other], (@Check + @Check2 + @Cash + @Cash2 + @Other + @Other2) as [total]
GO
