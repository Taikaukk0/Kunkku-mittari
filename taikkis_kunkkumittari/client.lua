function round(n)
    return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if(IsPedInAnyVehicle(PlayerPedId(), false)) then
            local kmh = round(GetEntitySpeed(GetVehiclePedIsIn(PlayerPedId(), false))*3.6)
            local fuel = round(GetVehicleFuelLevel(GetVehiclePedIsIn(PlayerPedId(), false))*1.54)
            drawText(7, 0.5, 0.93, 0.0, 0.0, kmh.." ~r~KM/H", 0.5, 0.5)
            drawText(4, 0.5, 0.95, 0.0, 0.0, "~r~Bensa: ~w~"..fuel, 0.45, 0.45)
        end
    end
end)

function drawText(fontId, x,y ,width,height, text, scale, scale1)
SetTextFont(fontId)
SetTextProportional(0)
SetTextScale(scale, scale1)
--SetTextColour(255, 255, 255, 255) --change the color here
SetTextDropShadow(0, 0, 0, 0,200)
SetTextEdge(1, 0, 0, 0, 255)
SetTextDropShadow(1)
SetTextCentre(1)
SetTextOutline(1)
SetTextEntry("STRING")
AddTextComponentString(text)
DrawText(x - width/2, y - height/2 + 0.005)
end