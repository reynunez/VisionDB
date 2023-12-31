/****** Object:  StoredProcedure [dbo].[sp_NET_GetOrdersbyEvent]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/23/2020
-- Description: Get Menu Orders
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOrdersbyEvent]
(
	@EVENT VARCHAR(1),
	@PATIENT_NO INTEGER
)
AS
BEGIN

	if @EVENT = 'A' BEGIN
		SET NOCOUNT ON

		Select	orderid,
				ordertype,
				ordertotal,
				orderdate 
		from	view_NET_NewOrders 
		where	patient_no = @PATIENT_NO 
		order	by patient_no
	END 
	ELSE IF @EVENT = 'R' BEGIN
		SET NOCOUNT ON

		Select	orderid,
				ordertype,
				ordertotal,
				orderdate 
		from	view_NET_CompNotOrders 
		where	patient_no = @PATIENT_NO 
		order	by patient_no
	END

END
GO
