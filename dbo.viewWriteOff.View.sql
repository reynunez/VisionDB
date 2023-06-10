/****** Object:  View [dbo].[viewWriteOff]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[viewWriteOff]
AS
SELECT	invoiceid, 
		'Write Off' as [type], 
		SUM(woamount) as woAmount
FROM    dbo.InvWriteOff
GROUP	BY invoiceid
GO
