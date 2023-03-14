--Pulled from vorp_hunting and modified to function the way i wanted it too
function skinnedped()
    while true do
        Citizen.Wait(2)
        local size = GetNumberOfEvents(0)
        if size > 0 then
            for index = 0, size - 1 do
                local event = GetEventAtIndex(0, index)
                if event == 1376140891 then
                    local view = exports["hd_legendaries"]:DataViewNativeGetEventData(0, index, 3) --for it to work in otehr codes changehorizon legend to the file name
                    local ped = view['0']
                    -- Bool to let you know if animation/longpress was enacted.
                    local bool_unk = view['4']
                    -- Ensure the player who enacted the event is the one who gets the rewards
                    local player = PlayerPedId()
                    local playergate = player == ped
                    if playergate == true and bool_unk == 1 then --if the varaible Animal is the gator then
                        TriggerServerEvent('hd_legendaries:giveitemsbear', Rewards)
                        Wait(300000)
                        DeletePed(Createdped2)
                        break
                    end
                end
            end
        end
    end
end