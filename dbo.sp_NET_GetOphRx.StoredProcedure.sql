/****** Object:  StoredProcedure [dbo].[sp_NET_GetOphRx]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/24/2020
-- Description: Get Rx Ophthalmic
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetOphRx](
	@prescid as integer
)
AS
BEGIN

	Select	Distpdr 
			,Distpdl 
			,sphr 
			,sphl 
			,cylr 
			,cyll
			,Axisr 
			,Axisl 
			,vcrdva 
			,vcldva 
			,Prism1r
			,Prism1l 
			,Prism2r 
			,Prism2l 
			,Addr 
			,Addl 
			,Usage 
	from	prescoph where prescid   = @prescid

END
GO
