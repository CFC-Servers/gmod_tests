AddCSLuaFile()

--- Returns player.GetHumans() == 0
WHEN_NO_HUMANS = function()
    return #player.GetHumans() == 0
end
