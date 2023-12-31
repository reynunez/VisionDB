/****** Object:  StoredProcedure [dbo].[UpdtAppmt_Cancelation]    Script Date: 6/10/2023 3:47:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdtAppmt_Cancelation](
        @appmt_no int , 
        @is_cancel bit , 
        @is_resched bit , 
        @new_date datetime , 
        @reason VARCHAR(100) 
)        
AS

        Update dbo.appointment
        set     is_cancel = @is_cancel,
                is_resched = @is_resched,
                new_date = @new_date,
                reason = @reason
        WHERE   appmt_no = @appmt_no
GO
