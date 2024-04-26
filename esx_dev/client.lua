Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        if IsPedInAnyVehicle(playerPed, false) then
            local vehicle = GetVehiclePedIsIn(playerPed, false)
            local seat = GetSeatPedIsTryingToEnter(playerPed)
            if seat == -1 or seat == 0 then
                local job = ESX.GetPlayerData().job.name -- Récupérer le job du joueur avec ESX
                if job ~= "police" then
                    TaskLeaveVehicle(playerPed, vehicle, 0)
                    print("Vous n'êtes pas autorisé à conduire ou à être passager dans ce véhicule !")
                else
                    local playerName = GetPlayerName(PlayerId()) -- Nom du joueur
                    local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)) -- Nom de la voiture
                    print(("Joueur: %s | Job: %s | Véhicule: %s"):format(playerName, job, vehicleName))
                end
            end
        end
    end
end)
