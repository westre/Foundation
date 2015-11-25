local isWhitelisted = false;

AddEventHandler('onPlayerJoining', function(playerId, name)
	TriggerServerEvent('foundation:onPlayerConnect')
end)

RegisterNetEvent('foundation:playerWhitelisted')
AddEventHandler('foundation:playerWhitelisted', function(whitelisted)
	isWhitelisted = whitelisted
	
	if not isWhitelisted then
		SendNUIMessage({
			command = 'blockPlayer'
		})
	else
		sendMessage('You are whitelisted, welcome!')
	end
end)

function sendMessage(message)
	TriggerEvent('chatMessage', '', { 0, 0, 0 }, message)
end

Citizen.CreateThread(function()
	while true do
        Wait(50)
		
		if NetworkIsPlayerActive(PlayerId()) then
			if not isWhitelisted then
				local ped = GetPlayerPed(PlayerId())
				if IsEntityVisible(ped) then
					SetEntityVisible(ped, false)
				end
				SetPlayerInvincible(PlayerId(), true)
				SetPlayerControl(PlayerId(), false, false)
			end
		end        
    end
end)