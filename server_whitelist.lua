local configuration = {
	["whitelisted_names"] = {
		"user1",
		"user2",
		"user3",
		"user4" -- etc, just make sure the last entry does not have a comma
	}
}

RegisterServerEvent('foundation:onPlayerConnect')
AddEventHandler('foundation:onPlayerConnect', function(playerId)
    local isWhitelisted = false
	local name = GetPlayerName(playerId)
	
	print('Player ' .. name .. ' connecting with playerId ' .. playerId)
	
	for key, value in ipairs(configuration["whitelisted_names"]) do
		if configuration["whitelisted_names"][key] == name then
			print("Is a whitelisted player!")
			isWhitelisted = true;
			break;
		end
	end
	
	if not isWhitelisted then
		TriggerClientEvent('foundation:playerWhitelisted', playerId, false) -- -1 is all?
		print("Is non whitelisted player")
	else
		TriggerClientEvent('foundation:playerWhitelisted', playerId, true)
		print("Whitelisted player!")
	end
end)