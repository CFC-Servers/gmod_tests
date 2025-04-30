-- Kicks the default test bot
for _, v in pairs( player.GetBots() ) do
    v:Kick()
end
