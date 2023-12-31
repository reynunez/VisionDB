/****** Object:  StoredProcedure [dbo].[sp_NET_InsertEDITransaction]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 01/28/2022
-- Description: Insert EDI Script
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertEDITransaction](
	@description varchar(250),
	@savedscript text
)
AS
BEGIN
		
		SET NOCOUNT ON

		INSERT INTO tbl_editransactions(
								scriptdate,
								description,
								savedscript
								)
		VALUES(
								getdate(),
								@description,
								@savedscript
								)
END

GO
