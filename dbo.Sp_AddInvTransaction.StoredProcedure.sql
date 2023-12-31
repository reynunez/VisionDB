/****** Object:  StoredProcedure [dbo].[Sp_AddInvTransaction]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Sp_AddInvTransaction]( 
	@PONumber	nvarchar(15)	=	'',
	@fpcID		nvarchar(14),
	@tranType	smallint,
	@prodtableID	smallint,
	@Quantity	int,
	@officeid	int
)
AS
BEGIN
	DECLARE @transactionDate DATETIME
	set @transactionDate = dateadd(hh,-5,Getdate())
	Insert into InvTransactions(
								transactionDate,
								PONumber,
								tranType,
								fpcID,
								prodtableID,
								Quantity,
								officeID)
				Values(
						@transactionDate,
						@PONumber,
						@tranType,
						@fpcID,
						@prodtableID,
						@Quantity,
						@officeid)
						

END
GO
