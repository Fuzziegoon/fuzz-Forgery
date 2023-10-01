local QBCore = exports[Config.Core]:GetCoreObject()

RegisterServerEvent("fuzz-Forgery:Server:ForgeID", function(citizenid, firstname, lastname, birthday, nationality)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local items = Config.DirtyPayItem
    local amnt = Config.Amount
    local hasItem = exports['ps-inventory']:HasItem(src, items, amnt)
    if Config.DirtyPay then 
        if hasItem then
            info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = nationality

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["id_card"], 'add')
        Player.Functions.AddItem("id_card", 1, nil, info)

        Player.Functions.RemoveItem(Config.DirtyPayItem, amnt)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DirtyPayItem], 'remove')

        if Config.RemoveHackItem then
            Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
        end 
    else
        TriggerClientEvent('fuzz-Forgery:Client:Notify', src, Language.Money, 'error', 5000)
    end
else
    if Player.PlayerData.money.cash >= Config.Amount then
        info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = nationality

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["id_card"], 'add')
        Player.Functions.AddItem("id_card", 1, nil, info)

        Player.Functions.RemoveMoney(Config.Payment, Config.Amount)

        if Config.RemoveHackItem then
            Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
        end 


        else
        TriggerClientEvent('fuzz-Forgery:Client:Notify', src, Language.Money, 'error', 5000)
        end
    end
end)

RegisterServerEvent("fuzz-Forgery:Server:ForgeDriverLicense", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local items = Config.DirtyPayItem
    local amnt = Config.Amount
    local hasItem = exports['ps-inventory']:HasItem(src, items, amnt)
    if Config.DirtyPay then 
        if hasItem then
            info = {}
            info.firstname = firstname
            info.lastname = lastname
            info.birthdate = birthday
            info.type = "CLASS G DRIVER LICENSE"
    
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["driver_license"], 'add')
            Player.Functions.AddItem("driver_license", 1, nil, info)
            Player.Functions.RemoveItem(Config.DirtyPayItem, amnt)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DirtyPayItem], 'remove')
    
            if Config.RemoveHackItem then
                Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
            end 
    
        else
            TriggerClientEvent('fuzz-Forgery:Client:Notify', src, Language.Money, 'error', 5000)
        end
    else
    if Player.PlayerData.money.cash >= Config.Amount then
        info = {}
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.type = "CLASS G DRIVER LICENSE"

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["driver_license"], 'add')
        Player.Functions.AddItem("driver_license", 1, nil, info)

        Player.Functions.RemoveMoney(Config.Payment, Config.Amount)

        if Config.RemoveHackItem then
            Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
        end 

        else
        TriggerClientEvent('fuzz-Forgery:Client:Notify', src, Language.Money, 'error', 5000)
        end
    end
end)

RegisterServerEvent("fuzz-Forgery:Server:ForgeWeaponLicense", function(firstname,lastname,birthday)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local items = Config.DirtyPayItem
    local amnt = Config.Amount
    local hasItem = exports['ps-inventory']:HasItem(src, items, amnt)
    if Config.DirtyPay then 
        if hasItem then
            info = {}
            info.citizenid = citizenid
            info.firstname = firstname
            info.lastname = lastname
            info.birthdate = birthday
    
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weaponlicense"], 'add')
            Player.Functions.AddItem("weaponlicense", 1, nil, info)
            Player.Functions.RemoveItem(Config.DirtyPayItem, amnt)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DirtyPayItem], 'remove')
    
            if Config.RemoveHackItem then
                Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
            end 
    
        else
            TriggerClientEvent('fuzz-Forgery:Client:Notify', src, Language.Money, 'error', 5000)
        end
    else
    if Player.PlayerData.money.cash >= Config.Amount then
        info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weaponlicense"], 'add')
        Player.Functions.AddItem("weaponlicense", 1, nil, info)

        Player.Functions.RemoveMoney(Config.Payment, Config.Amount)

        if Config.RemoveHackItem then
            Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
        end 

        else
            TriggerClientEvent('fuzz-Forgery:Client:Notify', src, Language.Money, 'error', 5000)
        end
    end
end)

RegisterServerEvent("fuzz-Forgery:Server:ForgeLawyer", function(firstname,lastname,birthday, citizenid, id)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local items = Config.DirtyPayItem
    local amnt = Config.Amount
    local hasItem = exports['ps-inventory']:HasItem(src, items, amnt)
    if Config.DirtyPay then 
        if hasItem then
            info = {}
            info.citizenid = citizenid
            info.firstname = firstname
            info.lastname = lastname
            info.birthdate = birthday
            info.id = id
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["lawyerpass"], 'add')
            Player.Functions.AddItem("lawyerpass", 1, nil, info)
            Player.Functions.RemoveItem(Config.DirtyPayItem, amnt)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.DirtyPayItem], 'remove') 
        else
            TriggerClientEvent('QBCore:Notify', src, 'You dont have enough money.', 'error')
        end  
    else
            if Player.PlayerData.money.cash >= Config.Amount then
        info = {}
        info.citizenid = citizenid
        info.firstname = firstname
        info.lastname = lastname
        info.birthdate = birthday
        info.id = id

        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["lawyerpass"], 'add')
        Player.Functions.AddItem("lawyerpass", 1, nil, info)

        if Config.RemoveHackItem then
            Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
        end 

        Player.Functions.RemoveMoney(Config.Payment, Config.Amount)
    else
        TriggerClientEvent('fuzz-Forgery:Client:Notify', src, Language.Money, 'error', 5000)
        end
    end
end)

if Config.NeedItem then
    QBCore.Functions.CreateCallback('fuzz-Forgery:Server:HaveItem', function(source, cb)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
            if not Player then return end
            if Player.Functions.GetItemByName(Config.Item) and Player.Functions.GetItemByName(Config.Item).amount >= 1 then
                cb(true)
             else
                cb(false)
         end
    end)
end

RegisterServerEvent("fuzz-Forgery:server:RemoveHackItem", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Config.RemoveHackItem then
    Player.Functions.RemoveItem(Config.HackItemNeeded, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.HackItemNeeded], 'remove')
    end
end)

RegisterServerEvent("fuzz-Forgery:server:RemoveKeyItem", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(Config.Item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.Item], 'remove')
    if Config.AddBrokenKey then 
    Player.Functions.AddItem("keyfrags", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["keyfrags"], 'add')
    TriggerClientEvent('QBCore:Notify', src, 'Your Key Has Broken.', 'error')
    end
end)