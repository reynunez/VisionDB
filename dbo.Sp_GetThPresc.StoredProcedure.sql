/****** Object:  StoredProcedure [dbo].[Sp_GetThPresc]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetThPresc]
@prescid NVARCHAR (50)
WITH EXECUTE AS CALLER
AS
SET NOCOUNT ON

Select * from prescTH where prescid = @prescid order by prescid
GO
