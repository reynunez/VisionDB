/****** Object:  View [dbo].[viewDiagCodes]    Script Date: 6/10/2023 3:47:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[viewDiagCodes] AS
Select	[i10 description] as diagnosis_descr,
		'000' as group_cd,
		[i10 code] as user_cd,
		'' as diag_plan,
		[i9 code] as i9code,
		[i9 description] as i9description,
		[chapter block] as chapter
from	diagcode
union
Select	diagnosis_descr,
		group_cd,
		user_cd,
		diag_plan,
		user_cd as i9code,
		diagnosis_descr as i9description,
		'0 - Old I9 Code' as chapter
from	diagnosis
;
GO
