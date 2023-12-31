/****** Object:  StoredProcedure [dbo].[sp_NET_GetInvReferring]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Reynaldo Nunez
-- Create date: 02/03/2022
-- Description:	Get referring provider from invoice
-- =============================================
CREATE PROCEDURE [dbo].[sp_NET_GetInvReferring](
	@invoiceid int
)
AS
	SET NOCOUNT ON;
	
	declare @thisdoctor varchar(200)
	set		@thisdoctor	=  '%' + (Select DISTINCT REFERRING from INVOICE_ITEMS where invoiceid = @invoiceid AND REFERRING <> '') +  '%'

	IF	@thisdoctor <> '' BEGIN
			if exists(Select * from ext_doctors where description like @thisdoctor)
				select	doctorid
						,description
						,first_name as firstname
						,last_name as lastname
						,address1 
						,address2
						,city
						,state
						,zip
						,npi
						,email
						,phone
						,fax
				from	ext_doctors 
				where	description like @thisdoctor ;
			ELSE 
				select	doctorid
						,description
						,firstname
						,lastname
						,address1 
						,address2
						,city
						,state
						,zip
						,npi
						,''  AS email
						,phone
						,fax
				from	doctors 
				WHERE	description LIKE @thisdoctor ;
	END
	ELSE BEGIN
				select	doctorid
						,description
						,firstname
						,lastname
						,address1 
						,address2
						,city
						,state
						,zip
						,npi
						,''  AS email
						,phone
						,fax
				from	doctors 
				WHERE	doctorid = 1
	END
GO
