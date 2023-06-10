/****** Object:  StoredProcedure [dbo].[sp_AddScheduleRecod]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_AddScheduleRecod]
@doctorid INT, @officeid INT, @appmtdate DATE, @appmttime VARCHAR (20)
WITH EXECUTE AS CALLER
AS
Insert into doctorschedule(doctorid,officeid,appmtdate,appmttime)
Values(@doctorid,@officeid,@appmtdate,@appmttime)
GO
