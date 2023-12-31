/****** Object:  StoredProcedure [dbo].[Sp_AddInventoryTran]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Sp_AddInventoryTran]
@ponumber INT=0, @trantype INT, @fpcID NVARCHAR (100), @prodtableid INT, @quantity INT, @officeid INT, @orderid INT=0
AS
BEGIN
 declare @transactiondate datetime
 set @transactiondate = GETDATE()
 Insert into invtransactions(
        transactiondate,
        ponumber,
        trantype,
        fpcID,
        officeid,
        prodtableid,
        quantity,
        orderid)
     Values(
       @transactiondate,
       @ponumber,
       @trantype,
       @fpcID,
       @officeid,
       @prodtableid,
       @quantity,
       @orderid)
END
GO
