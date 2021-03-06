USE [SportsShop]
GO
/****** Object:  Trigger [dbo].[TG_Sell_Item]    Script Date: 1/19/2022 11:10:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[TG_Sell_Item] on [dbo].[Sales]
after insert
as
begin 
	insert into History (itemTitle, buyPrice, quantity, purchuaseDate, sellerSurname, clientSurname) 
	(select Items.title, Items.salePrice, inserted.quantity, inserted.purchuaseDate, Workers.l_name, Clients.l_name from inserted
		join Items on inserted.itemId = Items.id
		join Workers on inserted.sellerId = Workers.id
		join Clients on inserted.clientId = Clients.id
	)
	declare @quan int
	set @quan = (select quantity from inserted)
	
	update Items
	set quantity = quantity - @quan
	where Items.id = (select itemId from inserted)
end