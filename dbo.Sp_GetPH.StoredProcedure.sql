/****** Object:  StoredProcedure [dbo].[Sp_GetPH]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetPH]
@prescid NVARCHAR (50)
WITH EXECUTE AS CALLER
AS
set nocount on

Select * from prescheader where prescid = @prescid order by prescid
GO
