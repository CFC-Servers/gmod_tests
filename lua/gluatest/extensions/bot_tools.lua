if not SERVER then return end

--- @type Player[]
local botPool = {}
local botCounter = 0

local function getBotFromPool()
    local poolCount = #botPool
    if poolCount == 0 then return end

    for _ = 1, poolCount do
        local bot = table.remove( botPool, poolCount )
        if IsValid( bot ) then
            return bot
        end
    end

    return nil
end

--- Makes a bot for test purposes
--- @param name string? The name of the bot
--- @param allowReuse boolean? Whether or not this can return a bot that's already been used
MakeTestBot = function( name, allowReuse )
    if allowReuse == nil then allowReuse = true end

    if allowReuse then
        local bot = getBotFromPool()
        if bot then return bot end
    end

    botCounter = botCounter + 1

    name = name or ("Bot " .. botCounter)
    local newBot = player.CreateNextBot( name )
    if not newBot then
        error( "Failed to create a new bot - player limit reached?" )
    end

    return newBot
end

--- @class TestBotConfig
--- @field createdCallback fun(ply: Player)? A callback to run after the bot is created

--- Sets up a testGroup to make a test bot for each test, and remove it after each test
--- Note: Does not automatically create bots. Use `state:addBot()` or `state:addBots()` to create bots
--- @param testGroup table The test group to modify
--- @param config TestBotConfig? The configuration for the test bot
WithBotTestTools = function( testGroup, config )
    config = config or {}

    local _beforeEach = testGroup.beforeEach
    testGroup.beforeEach = function( state )
        --- @type Player[]
        state.bots = {}

        function state.addBots( count )
            local newBots = {}

            for _ = 1, count do
                local bot = MakeTestBot()
                table.insert( state.bots, bot )
                table.insert( newBots, bot )

                local cb = config.createdCallback
                if cb then cb( bot ) end
            end

            return newBots
        end

        function state.addBot( name )
            local bot = MakeTestBot( name )
            table.insert( state.bots, bot )

            local cb = config.createdCallback
            if cb then cb( bot ) end

            return bot
        end

        function state.kickBot( bot )
            table.RemoveByValue( state.bots, bot )
            if not IsValid( bot ) then
                return
            end

            bot:Kick()
        end

        function state.kickBots( bots )
            for _, bot in ipairs( bots ) do
                state.kickBot( bot )
            end
        end

        function state.kickAllBots()
            for _, bot in ipairs( botPool ) do
                if IsValid( bot ) then
                    state.kickBot( bot )
                end
            end

            for _, bot in ipairs( state.bots ) do
                if IsValid( bot ) then
                    state.kickBot( bot )
                end
            end

            state.bots = {}
        end

        if _beforeEach then _beforeEach( state ) end
    end

    local _afterEach = testGroup.afterEach
    testGroup.afterEach = function( state )
        if not state.bots then return end

        for _, bot in ipairs( state.bots ) do
            if IsValid( bot ) then
                table.insert( botPool, bot )
            end
        end

        if _afterEach then _afterEach( state ) end
    end

    return testGroup
end

hook.Add( "GLuaTest_Finished", "TestBotCleanup", function()
    for _, bot in ipairs( botPool ) do
        if IsValid( bot ) then
            bot:Kick()
        end
    end

    botPool = {}
end )
