local QBCore = exports[Config.Core]:GetCoreObject()

CreateThread(function()
    exports[Config.Target]:AddBoxZone("EnterWarehouse", Config.Locations.EnterWarehouse, 0.2, 1.0, {
        name="ForgeryEnter",
        heading=315,
        debugPoly = Config.Debug,
        minZ=24.07,
        maxZ=33.07,
    },{ options = { { type = "client", event = "fuzz-Forgery:Client:EnterWarehouse", icon = "fas fa-user-secret", label = Language.Enter, }, }, distance = 2.5 })
    
    exports[Config.Target]:AddBoxZone("ExitWarehouse", Config.Locations.ExitWarehouse, 0.2, 1.0, {
        name="ForgeryLeave",
        heading=89,
        debugPoly = Config.Debug,
    },{ options = { { type = "client", event = "fuzz-Forgery:Client:ExitWarehouse", icon = "fas fa-user-secret", label = Language.Leave, }, }, distance = 2.5 })

    exports[Config.Target]:AddBoxZone("ForgeID", Config.Locations.ForgeID, 0.4, 0.5, {
        name="ForgeID", 
        heading=290, 
        debugPoly = Config.Debug,
    },{ options = { { type = "client", event = "fuzz-Forgery:Client:ForgeID", icon = "fas fa-user-secret", label = Language.ForgeID, }, }, distance = 2.5 })

    exports[Config.Target]:AddBoxZone("ForgeDriver", Config.Locations.ForgeDriver, 0.6, 0.6, {
        name="ForgeDrivers",
        heading=23,
        debugPoly = Config.Debug,
    },{ options = { { type = "client", event = "fuzz-Forgery:Client:ForgeDriverLicense", icon = "fas fa-user-secret", label = Language.ForgeDriver, }, }, distance = 2.5 })

    exports[Config.Target]:AddBoxZone("ForgeWeapon", Config.Locations.ForgeWeapon, 1.0, 1.0, {
        name="ForgeWeapon",
        heading=23,
        debugPoly = Config.Debug,
    },{ options = { { type = "client", event = "fuzz-Forgery:Client:ForgeWeaponLicense", icon = "fas fa-user-secret", label = Language.ForgeWeapon, }, }, distance = 2.5 })

    exports[Config.Target]:AddBoxZone("ForgeLawyer", Config.Locations.ForgeLawyer, 1.0, 1.0, {
        name="ForgeLawyer",
        heading=23,
        debugPoly = Config.Debug,
    },{ options = { { type = "client", event = "fuzz-Forgery:Client:ForgeLawyer", icon = "fas fa-user-secret", label = Language.ForgeLawyer, }, }, distance = 2.5 })
end)

RegisterNetEvent('fuzz-Forgery:Client:Notify')
AddEventHandler("fuzz-Forgery:Client:Notify", function(msg,type)
    Notify(msg,type)
end)

RegisterNetEvent('fuzz-Forgery:Client:EnterWarehouse', function()
    local Ply = PlayerPedId()
    if IsEntityDead(Ply) then return Notify(Language.Dead, "error", 5000) end
    if IsPedInAnyVehicle(Ply, false) then return Notify(Language.Car, "error", 5000) end
    if Config.NeedItem then
        QBCore.Functions.TriggerCallback("fuzz-Forgery:Server:HaveItem", function(cb)
            if cb then
                DoScreenFadeOut(1000)
                Wait(1500)
                SetEntityCoords(Ply, 1174.0, -3196.63, -39.01)
                DoScreenFadeIn(1000)
            else
                Notify(Language.RightItem, "error", 5000)
            end
        end)
    else
        DoScreenFadeOut(1000)
        Wait(1500)
        SetEntityCoords(Ply, Config.Locations.ExitWarehouse)
        DoScreenFadeIn(1000)
    end
end)

RegisterNetEvent('fuzz-Forgery:Client:ExitWarehouse', function()
    local Ply = PlayerPedId()
    if IsEntityDead(Ply) then return Notify(Language.Dead, "error", 5000) end
    if IsPedInAnyVehicle(Ply, false) then return Notify(Language.Car, "error", 5000) end
    DoScreenFadeOut(1000)
    Wait(1500)
    SetEntityCoords(Ply, Config.Locations.EnterWarehouse)
    DoScreenFadeIn(1000)
    TriggerServerEvent('fuzz-Forgery:server:RemoveKeyItem')
end)

RegisterNetEvent('fuzz-Forgery:Client:ForgeID', function()
    local openMenuItem = Config.HackItemNeeded
    local hasItem = QBCore.Functions.HasItem(openMenuItem)
         if hasItem then
            local success = exports['ran-minigames']:OpenTerminal()
    if success then
    TriggerServerEvent("fuzz-Forgery:server:RemoveHackItem")
    local dialog = exports[Config.Input]:ShowInput({
        header = "Forge an ID",
        submitText = "Forge ID",
        inputs = {
            { text = Language.FirstName, name = "firstname", type = "text", isRequired = true },
            { text = Language.LastName, name = "lastname", type = "text", isRequired = true },
            { text = Language.Birthday, name = "birthday", type = "text", isRequired = true },
            { text = Language.Nationality, name = "nationality", type = "text", isRequired = true }
        },
    })

    if dialog then
        local citizenid = tostring(QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(5)):upper()
        local firstname = (dialog['firstname'])
        local lastname = (dialog['lastname'])
        local birthday = (dialog['birthday'])
        local nationality = (dialog['nationality'])

        QBCore.Functions.Progressbar("ForgingID", Language.ForgingID, (Config.Times.ForgeID*1000), false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        { animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 49,
        }, {}, function()

        end, function()
            TriggerServerEvent("fuzz-Forgery:Server:ForgeID",citizenid, firstname, lastname, birthday, nationality)
            if Config.CallCops then
                CallCops()
            end
        end)
    end
    else
    QBCore.Functions.Notify('You Failed to hack the computer', "error")
    end
    else
    QBCore.Functions.Notify('You need the passcode', "error") 
    end
end)

RegisterNetEvent('fuzz-Forgery:Client:ForgeDriverLicense', function()
    local openMenuItem = Config.HackItemNeeded
    local hasItem = QBCore.Functions.HasItem(openMenuItem)
    local CustomSettings = {
        settings = {
            handleEnd = true;  --Send a result message if true and callback when message closed or callback immediately without showing the message
            speed = 10; --pixels / second
            scoreWin = 1000; --Score to win
            scoreLose = -150; --Lose if this score is reached
            maxTime = 60000; --sec
            maxMistake = 5; --How many missed keys can there be before losing
            speedIncrement = 1; --How much should the speed increase when a key hit was successful
        },
        keys = {"a", "w", "d", "s", "g"}; --You can hash this out if you want to use default keys in the java side.
    }
         if hasItem then  local success = exports['cd_keymaster']:StartKeyMaster(CustomSettings)
            if success then
                TriggerServerEvent("fuzz-Forgery:server:RemoveHackItem")
                local dialog = exports[Config.Input]:ShowInput({
                    header = "Forge a Drivers License",
                    submitText = "Forge License",
                    inputs = {
                        { text = Language.FirstName, name = "firstname", type = "text", isRequired = true },
                        { text = Language.LastName, name = "lastname", type = "text", isRequired = true },
                        { text = Language.Birthday, name = "birthday", type = "text", isRequired = true },
                        { text = Language.Nationality, name = "nationality", type = "text", isRequired = true }
                    },
                })
            
                if dialog then
                    local firstname = (dialog['firstname'])
                    local lastname = (dialog['lastname'])
                    local birthday = (dialog['birthday'])
            
                    QBCore.Functions.Progressbar("ForgindDriver", Language.ForgingDriver, (Config.Times.ForgeDriver*1000), false, false, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    },
                    { animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 49,
                    }, {}, function()
                    
                    end, function()
                        TriggerServerEvent("fuzz-Forgery:Server:ForgeDriverLicense", firstname, lastname, birthday)
                        if Config.CallCops then
                            CallCops()
                        end
                    end)
                end
            else
                QBCore.Functions.Notify('You Failed to hack the computer', "error")
            end    
    else
    QBCore.Functions.Notify('You need the passcode', "error") 
    end
end)

RegisterNetEvent('fuzz-Forgery:Client:ForgeWeaponLicense', function()
    local openMenuItem = Config.HackItemNeeded
    local hasItem = QBCore.Functions.HasItem(openMenuItem)
         if hasItem then
             exports['boii-chiphack']:StartGame(function(success)
            
                if success then
                    TriggerServerEvent("fuzz-Forgery:server:RemoveHackItem")
    local dialog = exports[Config.Input]:ShowInput({
        header = "Forge a Weapon License",
        submitText = "Forge a Weapon License",
        inputs = {
            { text = Language.FirstName, name = "firstname", type = "text", isRequired = true },
            { text = Language.LastName, name = "lastname", type = "text", isRequired = true },
            { text = Language.Birthday, name = "birthday", type = "text", isRequired = true },
        },
    })

    if dialog then
        local citizenid = tostring(QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(5)):upper()
        local firstname = (dialog['firstname'])
        local lastname = (dialog['lastname'])
        local birthday = (dialog['birthday'])

        QBCore.Functions.Progressbar("ForgingID", Language.ForgingID, (Config.Times.ForgeWeapon*1000), false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        { animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 49,
        }, {}, function()

        end, function()
            TriggerServerEvent("fuzz-Forgery:Server:ForgeWeaponLicense", citizenid, firstname, lastname, birthday)
            if Config.CallCops then
                CallCops()
            end
        end)
    end
                else
                    QBCore.Functions.Notify('You Failed to hack the computer', "error")
                end
            end, 4, 37)
    else
    QBCore.Functions.Notify('You need the passcode', "error") 
    end
end)



RegisterNetEvent('fuzz-Forgery:Client:ForgeLawyer', function()
    local openMenuItem = Config.HackItemNeeded
    local hasItem = QBCore.Functions.HasItem(openMenuItem)
         if hasItem then
            local success = exports['ran-minigames']:MemoryCard(360)
    if success then
    TriggerServerEvent("fuzz-Forgery:server:RemoveHackItem")
    local dialog = exports[Config.Input]:ShowInput({
        header = "Forge a Lawyer Pass",
        submitText = "Forge a Lawyer Pass",
        inputs = {
            { text = Language.FirstName, name = "firstname", type = "text", isRequired = true },
            { text = Language.LastName, name = "lastname", type = "text", isRequired = true },
            { text = Language.Birthday, name = "birthday", type = "text", isRequired = true },
            { text = Language.ID, name = "id", type = "text", isRequired = true },
        },
    })

    if dialog then
        local citizenid = tostring(QBCore.Shared.RandomStr(3) .. QBCore.Shared.RandomInt(5)):upper()
        local firstname = (dialog['firstname'])
        local lastname = (dialog['lastname'])
        local birthday = (dialog['birthday'])
        local id = (dialog['id'])

        QBCore.Functions.Progressbar("ForgingID", Language.ForgingID, (Config.Times.ForgeLawyer*1000), false, false, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        { animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", anim = "machinic_loop_mechandplayer", flags = 49,
        }, {}, function()

        end, function()
            TriggerServerEvent("fuzz-Forgery:Server:ForgeLawyer", citizenid, firstname, lastname, birthday, id)
            if Config.CallCops then
                CallCops()
            end
        end)
    end
    else
    QBCore.Functions.Notify('You Failed to hack the computer', "error")
    end
    else
    QBCore.Functions.Notify('You need the passcode', "error")  
    end 
end)