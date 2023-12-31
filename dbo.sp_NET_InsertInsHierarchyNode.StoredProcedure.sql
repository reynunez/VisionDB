/****** Object:  StoredProcedure [dbo].[sp_NET_InsertInsHierarchyNode]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 11/05/2021
-- Description: Insert Node into Insurance Hierarchy
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_InsertInsHierarchyNode](
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

	Insert into INS_HIERARCHY
	Select	@parent_level as parent_level
			,@greatgreatparent as greatgreatparent
			,@greatparent as greatparent
			,@parent as parent
			,@mylevel as mylevel
			,@myid as myid;

END
GO
