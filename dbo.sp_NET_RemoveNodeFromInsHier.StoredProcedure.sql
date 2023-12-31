/****** Object:  StoredProcedure [dbo].[sp_NET_RemoveNodeFromInsHier]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/06/2021
-- Description: Remove Node From Hierarchy
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_RemoveNodeFromInsHier](
	@parent_level int,
	@greatgreatparent int,
	@greatparent int,
	@parent int,
	@mylevel int,
	@myid int
)
AS
BEGIN

    SET NOCOUNT ON;

	Delete	from INS_HIERARCHY
	where	myid = @myid
			and mylevel = @mylevel
			and parent = @parent
			and parent_level = @parent_level
			and greatparent = @greatparent
			and greatgreatparent = @greatgreatparent

END
GO
