/****** Object:  StoredProcedure [dbo].[Sp_GetJobsDesc]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[Sp_GetJobsDesc]
WITH EXECUTE AS CALLER
AS
set nocount on

Select distinct description from jobs order by description
GO
