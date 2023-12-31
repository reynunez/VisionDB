/****** Object:  StoredProcedure [dbo].[Sp_GetPatientOrders]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetPatientOrders]
@Patient_no NVARCHAR (50)
AS
set nocount on

Select orderid,ordertype,ordertotal,orderdate from orders where orderstatus = 1 and patient_no = @Patient_no order by patient_no
GO
