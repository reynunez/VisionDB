/****** Object:  StoredProcedure [dbo].[sp_NET_GetReasonCodes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 07/18/2020
-- Description: Get Reason Grids
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetReasonCodes]
(
	@reasonid INT,
	@codetype VARCHAR(20)
)
AS
BEGIN
	IF @codetype = 'CPT' BEGIN
		Select	r.id as codeid,
				o.code,
				o.modifier,
				o.description
		from	tblreasoncodes r JOIN
				tblcpt o ON o.id = r.codeid
		where	r.codetype = @codetype
				and r.reasonid = @reasonid
	END 
	ELSE IF @codetype = 'ICD' BEGIN
		Select	r.id as codeid,
				o.icd_code,
				o.SHORT_DESCRIPTION,
				o.LONG_DESCRIPTION
		from	tblreasoncodes r JOIN
				tbl_icd_codes o ON o.diagnosis_id = r.codeid
		where	r.codetype = @codetype
				and r.reasonid = @reasonid
	END
	ELSE IF @codetype = 'DOCTOR' BEGIN
		Select	r.id as codeid,
				o.description
		from	tblreasoncodes r JOIN
				doctors o ON o.doctorid = r.codeid
		where	r.codetype = @codetype
				and r.reasonid = @reasonid
	END
	ELSE IF @codetype = 'OFFICE' BEGIN
		Select	r.id as codeid,
				o.description
		from	tblreasoncodes r JOIN
				office o ON o.officeid = r.codeid
		where	r.codetype = @codetype
				and r.reasonid = @reasonid
	END 

END
GO
