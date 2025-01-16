--Pulled and modified from vorp_hunting
function SkinnedPed(legendaryPed, data)
    while true do
        Wait(2)
        local size = GetNumberOfEvents(0)
        if size > 0 then
            for index = 0, size - 1 do
                local event = GetEventAtIndex(0, index)
                if event == 1376140891 then
                    local view = exports['bcc-legendaries']:DataViewNativeGetEventData(0, index, 3)
                    local pedGathered = view['2']
                    local ped = view['0']
                    local model = GetEntityModel(pedGathered)
                    local model2 = GetEntityModel(legendaryPed)
                    -- Bool to let you know if animation/longpress was enacted.
                    local bool_unk = view['4']
                    -- Ensure the player who enacted the event is the one who gets the rewards
                    local playerPed = PlayerPedId()
                    local playergate = playerPed == ped
                    if playergate == true and bool_unk == 1 and model == model2 then --if the variable Animal is the legendary
                        TriggerServerEvent('bcc-legendaries:GiveItems', data.id)
                        Wait(300000)
                        DeletePed(legendaryPed)
                        break
                    end
                end
            end
        end
    end
end
