/****** Object:  StoredProcedure [dbo].[sp_GetOphPresc]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_GetOphPresc]
@prescid INT
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

Select * from prescoph where prescid = @prescid order by prescid
GO
