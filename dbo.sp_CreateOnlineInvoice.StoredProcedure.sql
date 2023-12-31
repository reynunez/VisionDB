/****** Object:  StoredProcedure [dbo].[sp_CreateOnlineInvoice]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/12/2017
-- Description:	Create Online Orders Procedure
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateOnlineInvoice](
---- Invoice Main
@patient_no int ,
@reference char(1) ,
@provider char(45) ,
@providerid int ,
@recorder char(45) ,
@recorderid char(10) ,
@invdate datetime ,
@transdate datetime ,
@checkamt money ,
@checkno char(10) ,
@bankno char(15) ,
@cashamt money ,
@otheramt money ,
@othertype char(15) ,
@otherref char(15) ,
@discount money ,
@salestax money ,
@pcharges money ,
@inscharges money ,
@instax money ,
@adjustments money ,
@otheropitms money ,
@credits money ,
@trayno char(10) ,
@pbalance money ,
@ibalance money ,
@note nvarchar(500) ,
@insurance_no int ,
@officeid int,
--- Invoice Details
@invdetails varchar(2000),
--- Invoice Order
@orderstring varchar(500)
)
AS
BEGIN
SET NOCOUNT ON;
DECLARE @trancount int;
	SET @trancount = @@trancount;
BEGIN TRY
    IF @trancount = 0
      BEGIN TRANSACTION
    ELSE
      SAVE TRANSACTION sp_CreateOnlineInvoice
	  ;

--- Declare new invoice
declare	@invoiceid integer

Insert into invoice(patient_no,reference,provider,providerid,recorder,recorderid,invdate,transdate,checkamt,checkno,bankno,cashamt,otheramt,othertype,otherref,discount,salestax,pcharges,inscharges,instax,adjustments,otheropitms,credits,pbalance,ibalance,note,trayno,insurance_no,officeid)
Values(@patient_no,@reference,@provider,@providerid,@recorder,@recorderid,@invdate,@transdate,@checkamt,@checkno,@bankno,@cashamt,@otheramt,@othertype,@otherref,@discount,@salestax,@pcharges,@inscharges,@instax,@adjustments,@otheropitms,@credits,@trayno,@pbalance,@ibalance,@note,@insurance_no,@officeid)
;

--- Get new invoice number
Select top 1 @invoiceid = invoiceid from invoice order by invoiceid desc
;

--- Get Invoice Details
Declare @item varchar(1000),
		@citem varchar(1000),
	    @details_string varchar(1000);

set @details_string = replace(replace(@invdetails,'^',''''),'|',',');

DECLARE details_cursor CURSOR FOR
Select * from [dbo].[SplitString](@details_string,'~')

OPEN details_cursor;
FETCH NEXT FROM details_cursor into @item;
WHILE @@FETCH_STATUS = 0
   BEGIN
	  --'Insert into invoicedetails '
	  set @citem = 'Insert into invoicedetails Select ' + cast(@invoiceid as varchar(10)) + ' as invoiceid,' + @item;
	  Exec(@citem);
      FETCH NEXT FROM details_cursor into @item;
   END;
CLOSE details_cursor;
DEALLOCATE details_cursor;
;

---- Insert Orders related to Invoice
if @orderstring <> '' BEGIN
	Declare @orderid varchar(15);
	Declare @insertString varchar(500);

	DECLARE orders_cursor CURSOR FOR
	SELECT Item as orderid FROM dbo.SplitString(@orderstring,'|');
	OPEN orders_cursor;
	FETCH NEXT FROM orders_cursor into @orderid;
	WHILE @@FETCH_STATUS = 0
	   BEGIN
			set @insertString = 'Insert into ordersinvoiced(invoiceid,orderid) values(' + CAST(@invoiceid as varchar(12)) + ',' + @orderid + ')'
	  		Exec(@insertString)
		  FETCH NEXT FROM orders_cursor into @orderid;
	   END;
	CLOSE orders_cursor;
	DEALLOCATE orders_cursor;
END

lbexit:
	 IF @trancount = 0
	 COMMIT;
 Select @invoiceid as invoiceid
END TRY
BEGIN CATCH
DECLARE @error int,
		 @message varchar(4000),
		 @xstate int;

 SELECT
	 @error = ERROR_NUMBER(),
	 @message = ERROR_MESSAGE(),
	 @xstate = XACT_STATE();

 IF @xstate = -1
	 ROLLBACK;
 IF @xstate = 1 AND @trancount = 0
	 ROLLBACK
 IF @xstate = 1 AND @trancount > 0
	 ROLLBACK TRANSACTION sp_InsertOnlineOphOrder;

 RAISERROR ('sp_CreateOnlineInvoice: %d: %s', 16, 1, @error, @message);
END CATCH
END
GO
