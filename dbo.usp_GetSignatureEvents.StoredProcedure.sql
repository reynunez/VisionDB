/****** Object:  StoredProcedure [dbo].[usp_GetSignatureEvents]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- Exec usp_GetSignatureEvents '09/12/2013'
CREATE PROCEDURE [dbo].[usp_GetSignatureEvents](
	@pdFrom varchar(10) = '',
	@pdTo varchar(10) = '',
	@nOfficeid INT = 0
)
AS
	Declare @dFrom as datetime,
			@dTo as datetime

	If (@pdFrom = '') BEGIN
		Set @dFrom = DATEADD(hh,-5,getdate())
	END
	ELSE BEGIN
		Set @dFrom = Cast(@pdFrom as datetime)
	END

	If (@pdTo = '') BEGIN
		Set @dFrom = DATEADD(hh,-5,getdate())
	END
	ELSE BEGIN
		Set @dTo = Cast(@pdTo as datetime)
	END

		Truncate Table retEvents

		Declare	@eventDate datetime,
				@officeid int,
				@office varchar(60),
				@description varchar(100),
				@patient varchar(60),
				@orderinfo varchar(100),
				@OidCount int,
				@oldOffID int,
				@oldEvDate datetime

		Set @oldOffID = 0
		Set @oldEvDate = cast('01/01/1900' as datetime)

		IF (@nOfficeid = 0) BEGIN
		Declare evCursor cursor for		
			Select	dbo.SignatureEvents.eventdate,
					dbo.patient.officeid,
					(Select description from dbo.office where officeid = dbo.patient.officeid) as Office,
					dbo.SigEventsCodes.description ,
					(ltrim(rtrim(dbo.patient.first_name)) + ' ' + ltrim(rtrim(dbo.patient.last_name))) as Patient,
					dbo.SignatureEvents.orderinfo 
			from	dbo.SignatureEvents inner join
					dbo.SigEventsCodes on dbo.SignatureEvents.eventid = dbo.SigEventsCodes.eventid  Left join
					dbo.patient on dbo.patient.patient_no = dbo.SignatureEvents.patient_no 
			WHERE	dbo.SignatureEvents.eventdate between @dFrom and @dTo and not dbo.patient.officeid is null and dbo.patient.officeid <> 0 
			order	by dbo.SignatureEvents.eventdate,dbo.patient.officeid
		END
		ELSE BEGIN
		Declare evCursor cursor for		
			Select	dbo.SignatureEvents.eventdate,
					dbo.patient.officeid,
					(Select description from dbo.office where officeid = dbo.patient.officeid) as Office,
					dbo.SigEventsCodes.description ,
					(ltrim(rtrim(dbo.patient.first_name)) + ' ' + ltrim(rtrim(dbo.patient.last_name))) as Patient,
					dbo.SignatureEvents.orderinfo 
			from	dbo.SignatureEvents inner join
					dbo.SigEventsCodes on dbo.SignatureEvents.eventid = dbo.SigEventsCodes.eventid  Left join
					dbo.patient on dbo.patient.patient_no = dbo.SignatureEvents.patient_no 
			WHERE	dbo.SignatureEvents.eventdate between @dFrom and @dTo and not dbo.patient.officeid is null and dbo.patient.officeid = @nOfficeid
			order	by dbo.SignatureEvents.eventdate,dbo.patient.officeid
		END

		Open evCursor
		Fetch Next from evCursor into @eventDate,@officeid,@office,@description,@patient,@orderinfo

		While @@FETCH_STATUS = 0 BEGIN

			if @oldOffID <> @officeid or @oldEvDate <> @eventDate begin

				if @oldOffID <> 0 or @oldEvDate <> cast('01/01/1900' as datetime) begin
					Set @OidCount = @OidCount + 1
					Insert into retEvents(report_date,officeid,office,description,patient,orderinfo) Values(@oldEvDate,null,@office + ' Events:' + cast(@OidCount as varchar(10)),'','','')
				end

				set @oldOffID = @officeid
				Set @oldEvDate = @eventDate
				Set @OidCount = 0
			end
			else begin
				Set @OidCount = @OidCount + 1
			end
			Insert into retEvents(report_date,officeid,office,description,patient,orderinfo) Values(@eventDate,@officeid,@office,@description,@patient,@orderinfo)

			Fetch Next from evCursor into @eventDate,@officeid,@office,@description,@patient,@orderinfo
		END
		Set @OidCount = @OidCount + 1
		Insert into retEvents(report_date,officeid,office,description,patient,orderinfo) Values(@oldEvDate,null,@office + ' Events:' + cast(@OidCount as varchar(10)),'','','')
		Close evCursor
		Deallocate evCursor
		Select * from retEvents
		truncate table retEvents
RETURN 0
GO
