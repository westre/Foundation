local configuration = {
	["whitelisted_names"] = {}
}

local whitelistConfig = './resources/westre-whitelist/whitelist.txt'

-- This event gets called when the resource is starting
AddEventHandler('onResourceStarting', function(resource)
	refreshWhitelist()
end)

-- Custom event gets called when a client joins
RegisterServerEvent('foundation:onPlayerConnect')
AddEventHandler('foundation:onPlayerConnect', function()
    local isWhitelisted = false
	local name = GetPlayerName(source)
	
	print('Player ' .. name .. ' connecting with playerId ' .. source)
	
	for key, value in ipairs(configuration["whitelisted_names"]) do
		if configuration["whitelisted_names"][key] == name then
			isWhitelisted = true;
			break;
		end
	end
	
	TriggerClientEvent('foundation:playerWhitelisted', source, isWhitelisted)
end)

-- Hook into the chat event to handle messages (requires chat resource)
AddEventHandler('chatMessageEntered', function(name, color, message)
    if message:sub(1, 1) == '!' and string.len(message) >= 2 then
		print("Executed command: " .. message .. " by " .. name)
		
		if message == "!refreshwhitelist" then
			refreshWhitelist()
			
			local namesWhitelisted = ""
			for key, value in ipairs(configuration["whitelisted_names"]) do
				namesWhitelisted = namesWhitelisted .. configuration["whitelisted_names"][key] .. " | "
			end
			
			TriggerClientEvent('chatMessage', source, '', { 255, 255, 255 }, "Whitelist has been refreshed: " .. namesWhitelisted)
		end
	end
end)

-- Refreshes the whitelist table
function refreshWhitelist() 
	print("Refreshing whitelist...")
	-- Clear the whitelist table
	for key, value in ipairs(configuration["whitelisted_names"]) do 
		configuration["whitelisted_names"][key] = nil 
	end
	
	local file = io.open(whitelistConfig, "rb")
  	if file then 
		for line in io.lines(whitelistConfig) do 
			-- Populate the whitelist table with contents from the textfile
			table.insert(configuration["whitelisted_names"], line)
  		end	
  		file:close() 
	else
		print("Error: can not locate whitelist.txt")
	end
	
	print("Found " .. #configuration["whitelisted_names"] .. " whitelisted entries")
end