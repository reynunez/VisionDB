/****** Object:  StoredProcedure [dbo].[Sp_AddEMRNotes]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 08/11/2014
-- Description:	EMR Notes Add Procedure
-- =============================================
CREATE PROCEDURE [dbo].[Sp_AddEMRNotes] 
	@notedate date,
	@patientid integer,
	@notedescription varchar(100),
	@note text
AS
BEGIN
	SET NOCOUNT ON;
	Insert into dbo.emrNotes(notedate,patientid,notedescription,note) Values(@notedate,@patientid,@notedescription,@note)
END
GO
