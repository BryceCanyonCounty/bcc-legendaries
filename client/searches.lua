--Creates the search chest function that is used twice in the script
function searchsetupmain(type, x, y, z) --function catches these variables from where ever it is called
    --Spawning Object Setup
    local object = CreateObject('p_chest01x', x, y, z - 1, true, false, false) --creates an object
    RequestModel(object, true)     --requests the object model

    --Prompt Group Setup
    local PromptGroup = VORPutils.Prompts:SetupPromptGroup()       --registers a prompt group
    local firstprompt = PromptGroup:RegisterPrompt(Config.Language.ChestPrompt, 0x760A9C6F, 1, 1, true, 'hold', { timedeventhash = "MEDIUM_TIMED_EVENT" })     --creates a prompt in the prompt group
    
    --Blip and Waypoint Setup
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, -1282792512, x, y, z, 100.0) --creates a blip with yellow circle around it
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Language.Lastlocationblip) --names the blip
    VORPutils.Gps:SetGps(x, y, z) --Creates the gps waypoint

    --Distance Tracker Setup
    while true do --while loop runs until broken
        Citizen.Wait(10) --waits 10ms prevents crashing
        if StopAll then break end --if var true then break loop
        local pl = GetEntityCoords(PlayerPedId()) --gets players coords
        if GetDistanceBetweenCoords(pl.x ,pl.y, pl.z, x, y, z, true) < 3 then --if the distance is less than 3 then
            --Handles showing prompt, and prompt completion
            PromptGroup:ShowGroup(Config.Language.ChestPrompt)           --Names the prompt search chest
            if firstprompt:HasCompleted() then          --if the prmpt has been done then
                RemoveBlip(blip) --removes blip
                VORPutils.Gps:RemoveGps() --removes gps
                --Playing Animation
                RequestAnimDict('mech_ransack@chest@med@open@crouch@b')                --Checks to see if its loaded
                while not HasAnimDictLoaded('mech_ransack@chest@med@open@crouch@b') do --makes sure its loaded
                    Citizen.Wait(0)
                end
                TaskPlayAnim(PlayerPedId(), 'mech_ransack@chest@med@open@crouch@b', 'base', 8.0, 8.0, 1000, 17, 0.2, false, false, false) --plays the animation
                VORPcore.NotifyRightTip(Config.Language.Cluefound, 4000) break --prints on screen and breaks loop
            end         --end of animation setup
        end
    end
    if StopAll then --if var true then
        RemoveBlip(blip) --removes blip
        VORPutils.Gps:RemoveGps() --removes gps
        firstprompt:DeletePrompt() --removes the prompt
        VORPcore.NotifyRightTip(Config.Language.Deadtext, 4000) return --prints on screen and returns ending function here not allowing code below to run
    end

    --Type detection setup
    if type == 'InitSearch' then --if type recieved is the string then
        if Data.enemynpc then --if var true then
            npc() --trigger function
        else --else var is not true then
            spawnanimal() --trigger function
        end
    elseif type == 'NpcSearch' then --else the tpye is this string then
        spawnanimal() --trigger function
    end
end