/****** Object:  StoredProcedure [dbo].[sp_NET_GetClManufacturer]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 05/16/2021
-- Description:	Get Contact Lenses manufacturer
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetClManufacturer]
AS
	SET NOCOUNT ON;

	Select * From(
				SELECT	DISTINCT
						MAN_ID
						,MAN_NAME 
				FROM	CLMAN_SER_UNIT
				UNION
				SELECT	'WAVE' as MAN_ID,
						'WAVE'as MAN_NAME
	) m
	ORDER BY m.MAN_NAME
GO
