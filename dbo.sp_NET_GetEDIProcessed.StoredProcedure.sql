/****** Object:  StoredProcedure [dbo].[sp_NET_GetEDIProcessed]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/29/2020
-- Description: Retrieve EDI Processed To Date
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEDIProcessed]

AS
BEGIN

    SET NOCOUNT ON

	Select	count(*) as ProccessedEdi
	From	INVOICE_HDR
	Where	isEDI = 1
	
END
GO
