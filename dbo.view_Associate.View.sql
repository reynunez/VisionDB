/****** Object:  View [dbo].[view_Associate]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[view_Associate]
AS
SELECT     salesmanid AS [code], name AS description
FROM         dbo.salespeople
GO
