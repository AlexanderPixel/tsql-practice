USE [SportsShop]
GO
/****** Object:  Trigger [dbo].[TF_Insert_Item]    Script Date: 1/19/2022 11:57:28 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[TF_Insert_Item] on [dbo].[Items]
instead of insert
as
begin 
	if ((select count(*) from inserted
	join Items as i 
	on i.title = inserted.title
	where (i.type = inserted.type 
	and i.costPrice = inserted.costPrice
	and i.manufacturer = inserted.manufacturer
	and i.salePrice = inserted.salePrice)) > 0)
		begin
			declare @quantity int = (select inserted.quantity from inserted
									join Items as i 
									on i.title = inserted.title
									where (i.type = inserted.type 
									and i.costPrice = inserted.costPrice
									and i.manufacturer = inserted.manufacturer
									and i.salePrice = i.salePrice))
		declare @id int = (select i.id from inserted
									join Items as i 
									on i.title = inserted.title
									where (i.type = inserted.type 
									and i.costPrice = inserted.costPrice
									and i.manufacturer = inserted.manufacturer
									and i.salePrice = i.salePrice))
			update Items
			set quantity = @quantity
			where Items.id = @id
		end
end