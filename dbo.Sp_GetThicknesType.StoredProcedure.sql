/****** Object:  StoredProcedure [dbo].[Sp_GetThicknesType]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetThicknesType]
WITH EXECUTE AS CALLER
AS
Set Nocount On

Select distinct description from thicknesstype order by description
GO
