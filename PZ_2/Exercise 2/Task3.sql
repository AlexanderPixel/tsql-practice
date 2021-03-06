USE [SportsShop]
GO
/****** Object:  Trigger [dbo].[TG_Client_Exists]    Script Date: 1/19/2022 11:12:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[TG_Client_Exists] on [dbo].[Clients]
instead of insert
as
begin
	if ((select count(*) from inserted
		join Clients on inserted.f_name = Clients.f_name 
		and inserted.l_name = Clients.l_name
		and inserted.[address] = Clients.[address]) = 0)
	begin
		insert into Clients (f_name, l_name, [address], phone, sex, isSubscibed, discount) 
		(select f_name, l_name, [address], phone, sex, isSubscibed, discount from inserted)
	end
end