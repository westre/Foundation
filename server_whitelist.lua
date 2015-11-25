local configuration = {
	["whitelisted_names"] = {
		"user1",
		"user2",
		"user3",
		"user4" -- etc, just make sure the last entry does not have a comma
	}
}

RegisterServerEvent('foundation:onPlayerConnect')
AddEventHandler('foundation:onPlayerConnect', function()
    local isWhitelisted = false
	local name = GetPlayerName(source)
	
	print('Player ' .. name .. ' connecting with playerId ' .. source)
	
	for key, value in ipairs(configuration["whitelisted_names"]) do
		if configuration["whitelisted_names"][key] == name then
			print("Is a whitelisted player!")
			isWhitelisted = true;
			break;
		end
	end
	
	TriggerClientEvent('foundation:playerWhitelisted', source, isWhitelisted)
end)