/****** Object:  StoredProcedure [dbo].[Sp_GetPatientOrderReceipt]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetPatientOrderReceipt]
@patient_no NVARCHAR (50)
AS
SET NOCOUNT ON
Select orderid,ordertype,ordertotal,orderdate from orders where orderstatus in (3,8) and patient_no = @patient_no order by patient_no
GO
