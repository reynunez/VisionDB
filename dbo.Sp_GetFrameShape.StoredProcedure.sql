/****** Object:  StoredProcedure [dbo].[Sp_GetFrameShape]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetFrameShape]
WITH EXECUTE AS CALLER
AS
set nocount on
Select frameshape from framesstockdata where frameshape <> '' group by frameshape order by frameshape
GO
