USE [SportsShop]
GO
/****** Object:  Trigger [dbo].[TG_Sell_All_Items]    Script Date: 1/19/2022 11:11:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[TG_Sell_All_Items] on [dbo].[Sales]
after insert
as
begin
	if((select Items.quantity - inserted.quantity from inserted
								join Items on inserted.itemId = Items.id) <= 0)
	begin
		insert into Archive (title, type, manufacturer, sellPrice, costPrice, quantity)
		(select Items.title, Items.[type], Items.manufacturer, Items.salePrice, Items.costPrice, Items.quantity from inserted
								join Items on inserted.itemId = Items.id
								where Items.quantity - inserted.quantity <= 0)
	end
end