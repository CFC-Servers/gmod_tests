if not SERVER then return end

local botCounter = 0
--- Makes a bot for test purposes
--- @param name string? The name of the bot
MakeTestBot = function( name )
    botCounter = botCounter + 1

    name = name or ("Bot " .. botCounter)
    return player.CreateNextBot( name )
end

--- @class TestBotConfig
--- @field name? string The name of the bot
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
                local bot = MakeTestBot( config.name )
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

            game.KickID( bot:UserID() )
        end

        function state.kickBots()
            local bots = state.bots
            local botCount = #bots

            for i = botCount, 1, -1 do
                local bot = bots[i]
                state.kickBot( bot )
            end
        end

        if _beforeEach then _beforeEach( state ) end
    end

    local _afterEach = testGroup.afterEach
    testGroup.afterEach = function( state )
        if not state.bots then return end
        state.kickBots()

        if _afterEach then _afterEach( state ) end
    end

    local _beforeAll = testGroup.beforeAll
    testGroup.beforeAll = function()
        for _, bot in ipairs( player.GetBots() ) do
            game.KickID( tostring( bot:UserID() ) )
        end

        if _beforeAll then _beforeAll() end
    end

    return testGroup
end
