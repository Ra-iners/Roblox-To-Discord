-- replace site.xyz with your webhost and upload webhook.php to the website
-- Roblox doesen't let you post to discord webhooks via game, so we'll have to use a php script to do that

HttpService = game:GetService("HttpService")

game.Players.PlayerAdded:Connect(function(plr)
	local avatar = game.Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	print(avatar)
	HttpService:GetAsync("http://site.xyz/webhook.php?Username=" ..plr.Name .."&Message=**>> Joined the game**&Avatar=" ..avatar .."&ID=" ..plr.UserId)
	
	plr.Chatted:Connect(function(msg)
		HttpService:GetAsync("http://site.xyz/webhook.php?Username=" ..plr.Name .."&Message=" ..msg .."&Avatar=" ..avatar .."&ID=" ..plr.UserId)
	end)
end)

game.Players.PlayerRemoving:Connect(function(plr)
	local avatar = game.Players:GetUserThumbnailAsync(plr.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
	HttpService:GetAsync("http://owowhatsthis.xyz/webhook.php?Username=" ..plr.Name .."&Message=**>> Left the game**&Avatar=" ..avatar .."&ID=" ..plr.UserId)

end)
