/****** Object:  StoredProcedure [dbo].[sp_DeletePrescription]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 7/25/2010
-- Description:	Dele Existing Prescription
-- =============================================
CREATE PROCEDURE [dbo].[sp_DeletePrescription](
	@prescid INT,
	@voidreason text = NULL
)
AS
	Update prescheader 
	set void = 1,
		voidreason = @voidreason
	where prescid = @prescid
/*
BEGIN
	DECLARE @PrescType INT
	BEGIN TRAN
		SELECT @PrescType = presctype from prescheader where prescid = @prescid

		DELETE FROM prescheader WHERE prescid = @prescid
		IF @@ERROR <> 0 BEGIN
			ROLLBACK TRAN
			RAISERROR ('Error Voiding Prescription.', -- Message text.
					   16, -- Severity.
					   1 -- State.
					   );
			goto End_Deleting
		END

		IF @PrescType = 1 BEGIN
			DELETE FROM PrescCL WHERE prescid = @prescid
			IF @@ERROR <> 0 BEGIN
				ROLLBACK TRAN
				RAISERROR ('Error Voiding Prescription.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
				goto End_Deleting
			END
		END
		
		IF @PrescType = 2 BEGIN
			DELETE FROM PrescOph WHERE prescid = @prescid
			IF @@ERROR <> 0 BEGIN
				ROLLBACK TRAN
				RAISERROR ('Error Voiding Prescription.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
				goto End_Deleting
			END
		END

		IF @PrescType = 3 BEGIN
			DELETE FROM Prescth WHERE prescid = @prescid
			IF @@ERROR <> 0 BEGIN
				ROLLBACK TRAN
				RAISERROR ('Error void Prescription.', -- Message text.
						   16, -- Severity.
						   1 -- State.
						   );
				goto End_Deleting
			END
		END

	COMMIT TRAN
End_Deleting:
END
*/
GO
