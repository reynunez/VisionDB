/****** Object:  StoredProcedure [dbo].[sp_CreateOrder]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






-- ============================================= 
-- Author:		Reynaldo Nunez
-- Create date: 6/30/2010
-- Description:	Save Order
-- =============================================
CREATE PROCEDURE [dbo].[sp_CreateOrder](
	@ordertype int,
	@patient_no int,
	@ordertotal decimal(8,2),
	@orderdetails varchar(2000) = '',
	@officeID int,
	@orderstatus int = 1,
	@userid int = 0
)
AS
declare @orderdate datetime
	set @orderdate = dateadd(hh,-5,Getdate())

	Insert into Orders(ordertype,orderdate,patient_no,ordertotal,orderstatus,orderdetails,officeid,userid)
	Values(@ordertype,@orderdate,@patient_no,@ordertotal,@orderstatus,@orderdetails,@officeID,@userid)

	Select top 1 orderid from orders order by orderid desc
GO
