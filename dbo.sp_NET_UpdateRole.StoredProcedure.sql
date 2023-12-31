/****** Object:  StoredProcedure [dbo].[sp_NET_UpdateRole]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Reynaldo Nunez
-- Create Date: 06/28/2020
-- Description: Update Security Roles
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_UpdateRole]
(
		@roleid int,
		@enabled tinyint = 0,
		@chkP1 tinyint = 0,
		@chkP2 tinyint = 0,
		@chkP3 tinyint = 0,
		@chkP4 tinyint = 0,
		@chkP5 tinyint = 0,
		@chkP6 tinyint = 0,
		@chkF1 tinyint = 0,
		@chkF2 tinyint = 0,
		@chkF3 tinyint = 0,
		@chkF4 tinyint = 0,
		@chkF5 tinyint = 0,
		@chkF6 tinyint = 0,
		@chkM1 tinyint = 0,
		@chkM2 tinyint = 0,
		@chkM3 tinyint = 0,
		@chkA1 tinyint = 0,
		@chkA2 tinyint = 0,
		@chkA3 tinyint = 0,
		@chkA4 tinyint = 0,
		@chkA5 tinyint = 0,
		@chkPr1 tinyint = 0,
		@chkPr2 tinyint = 0,
		@chkPr3 tinyint = 0,
		@chkPr4 tinyint = 0,
		@chkPr5 tinyint = 0,
		@chkO1 tinyint = 0,
		@chkO2 tinyint = 0,
		@chkO3 tinyint = 0,
		@chkO4 tinyint = 0,
		@chkI1 tinyint = 0,
		@chkI2 tinyint = 0,
		@chkI3 tinyint = 0,
		@chkI4 tinyint = 0,
		@chkS1 tinyint = 0,
		@chkPg1 tinyint = 0,
		@chkE1 tinyint = 0,
		@chkR1 tinyint = 0,
		@chkCt1 tinyint = 0,
		@chkO5 tinyint = 0,
		@chkI5 tinyint = 0,
		@chkBc1 tinyint = 0,
		@chkRe1 tinyint = 0
)
AS
BEGIN

    SET NOCOUNT ON

	UPDATE VUMSRoles
	SET enabled = @enabled,
		chkP1 = @chkP1,
		chkP2 = @chkP2,
		chkP3 = @chkP3,
		chkP4 = @chkP4,
		chkP5 = @chkP5,
		chkP6 = @chkP6,
		chkF1 = @chkF1,
		chkF2 = @chkF2,
		chkF3 = @chkF3,
		chkF4 = @chkF4,
		chkF5 = @chkF5,
		chkF6 = @chkF6,
		chkM1 = @chkM1,
		chkM2 = @chkM2,
		chkM3 = @chkM3,
		chkA1 = @chkA1,
		chkA2 = @chkA2,
		chkA3 = @chkA3,
		chkA4 = @chkA4,
		chkA5 = @chkA5,
		chkPr1 = @chkPr1,
		chkPr2 = @chkPr2,
		chkPr3 = @chkPr3,
		chkPr4 = @chkPr4,
		chkPr5 = @chkPr5,
		chkO1 = @chkO1,
		chkO2 = @chkO2,
		chkO3 = @chkO3,
		chkO4 = @chkO4,
		chkI1 = @chkI1,
		chkI2 = @chkI2,
		chkI3 = @chkI3,
		chkI4 = @chkI4,
		chkS1 = @chkS1,
		chkPg1 = @chkPg1,
		chkE1 = @chkE1,
		chkR1 = @chkR1,
		chkCt1 = @chkCt1,
		chkO5 = @chkO5,
		chkI5 = @chkI5,
		chkBc1 = @chkBc1,
		chkRe1 = @chkRe1
	where roleid = @roleid
END
GO
