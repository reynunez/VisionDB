/****** Object:  StoredProcedure [dbo].[sp_NET_VoidPrescripition]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 10/31/2020
-- Description: Get Ophthalmic History
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_VoidPrescripition](
	@prescid as integer
)
AS
BEGIN

	Update	prescheader 
	Set		void = 1
	Where	prescid = @prescid;
END
GO
