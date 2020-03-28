print("^0======================================================================^7")
print("^0[^4Author^0] ^7:^1 KreezoX^7")
print("^0[^3Version^0] ^7:^0 ^01.0^7")
print("^0======================================================================^7")

ESX = nil


Citizen.CreateThread(function()
    while ESX == nil do
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
	Citizen.Wait(0)
    end
end)

local DarkShop = {

    Base = { Title = "Achats Illégaux" },
    Data = { currentMenu = "~b~Liste des Objets Illégaux" },
    Events = {

        onSelected = function(self, _, btn, CMenu, menuData, currentButton, currentSlt, result)
              if btn.name == "Graine de Weed" then
                    TriggerServerEvent('KrXDarkShop:buy', 40, "graine", "Graine de Weed")
              elseif btn.name == "Truelle" then
                    TriggerServerEvent('KrXDarkShop:buy', 1750, "truele", "Truelle")
              elseif btn.name == "Forceur de Serrure" then
                    TriggerServerEvent('KrXDarkShop:buy', 2450, "lockpick", "Forceur de Serrure")
              elseif btn.name == "Gilet par Balle Type - 1" then
                    TriggerServerEvent('KrXDarkShop:buy', 1550, "bulletproof", "Gilet par Balle Type - 1")
              elseif btn.name == "Gilet par Balle Type - 2" then
                    TriggerServerEvent('KrXDarkShop:buy', 1850, "bullet2", "Gilet par Balle Type - 2")
              elseif btn.name == "Gilet par Balle Type - 3" then
                    TriggerServerEvent('KrXDarkShop:buy', 2150, "bullet3", "Gilet par Balle Type - 3")
              elseif btn.name == "Combinaison Hazmat Noir" then
                    TriggerServerEvent('KrXDarkShop:buy', 1150, "hazmat1", "Combinaison Hazmat Noir")




              end
        end,
    },

    Menu = {
        ["~b~Liste des Objets Illégaux"] = {
            b = {
                {name = "Drogue", ask = "→", askX = true},
                {name = "Braquage", ask = "→", askX = true},
            }
        },

        ["drogue"] = {
            b = {
                {name = "Graine de Weed", ask = "~g~40$", askX = true},
                {name = "Truelle", ask = "~g~1750$", askX = true},
            }
        },

        ["braquage"] = {
            b = {
                {name = "Forceur de Serrure", ask = "~g~2450$", askX = true},
                {name = "Gilet par Balle Type - 1", ask = "~g~1550$", askX = true},
                {name = "Gilet par Balle Type - 2", ask = "~g~1850$", askX = true},
                {name = "Gilet par Balle Type - 3", ask = "~g~2150$", askX = true},
                {name = "Combinaison Hazmat Noir", ask = "~g~1150$", askX = true},

            }
        },
    }
}
                 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if Vdist2(GetEntityCoords(PlayerPedId(), false), 3313.079, 5177.347,  19.614) < 1.2 then
            ESX.ShowHelpNotification("Appuyez sur ~INPUT_TALK~ pour intéragir avec le ~b~Vendeur Illégal")
            if IsControlJustPressed(1,51) then 
                CreateMenu(DarkShop)
            end
        end
    end
end)

Citizen.CreateThread(function()
    local hash = GetHashKey("csb_sol")

    while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
    end

    ped = CreatePed("PED_TYPE_APPLE", "csb_sol", 3313.079, 5178.347, 18.614, 160.111, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)


    
