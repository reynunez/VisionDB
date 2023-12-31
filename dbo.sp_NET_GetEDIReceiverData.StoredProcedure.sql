/****** Object:  StoredProcedure [dbo].[sp_NET_GetEDIReceiverData]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 01/23/2022
-- Description:	Procedure to get EDI Receivers Data
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetEDIReceiverData]
    @ID INT
AS

BEGIN

	SET NOCOUNT ON;

    select  id AS ID
            ,rname as NAME
            ,ridentifier AS IDENTIFIER
            ,raccountnumber AS ACCOUNTNUMBER
            ,intqualifier AS QUALIFIER
            ,intreceiverid AS RECEIVERID
    from    ediReceiver
    WHERE   id = @ID

END
GO
