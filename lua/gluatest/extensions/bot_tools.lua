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
--- @return Player bot The bot that was created
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

local function getNewBotState()
    --- @class GmodTests_BotState
    local botState = {}

    --- @type Player[] The bots that were created/reserved for this test
    botState.bots = {}

    --- Adds the given number of bots
    --- (Note: This may reuse bots from the pool if they are available)
    --- @param count number The number of bots to add
    --- @return Player[] bots The bots that were created
    function botState.addBots( count )
        --- @type Player[]
        local newBots = {}

        for _ = 1, count do
            local bot = MakeTestBot()
            table.insert( botState.bots, bot )
            table.insert( newBots, bot )

            local cb = config.createdCallback
            if cb then cb( bot ) end
        end

        return newBots
    end

    --- Adds a single bot
    --- (Note: This may reuse a bot from the pool if they are available)
    --- @param name string? The name of the bot
    function botState.addBot( name )
        local bot = MakeTestBot( name )
        table.insert( botState.bots, bot )

        local cb = config.createdCallback
        if cb then cb( bot ) end

        return bot
    end

    --- Kicks the given bot
    --- @param bot Player The bot to kick
    function botState.kickBot( bot )
        table.RemoveByValue( botState.bots, bot )
        if not IsValid( bot ) then
            return
        end

        bot:Kick()
    end

    --- Kicks the given bots
    --- @param bots Player[] The bots to kick
    function botState.kickBots( bots )
        for _, bot in ipairs( bots ) do
            botState.kickBot( bot )
        end
    end

    --- Kicks all bots on the server
    function botState.kickAllBots()
        for _, bot in ipairs( player.GetBots() ) do
            if IsValid( bot ) then
                botState.kickBot( bot )
            end
        end

        table.Empty( botPool )
        table.Empty( botState.bots )
    end

    return botState
end

--- @class TestBotConfig
--- @field createdCallback fun(ply: Player)? A callback to run after the bot is created

--- @class GmodTests_TestCaseWithBotTools: GLuaTest_TestCase
--- @field func fun(state: GmodTests_BotState): nil The test function
--- @field cleanup? fun(state: GmodTests_BotState): nil? A function to run after the test, regardless of the test outcome

--- @class GmodTests_TestGroupWithBotTools: GLuaTest_TestGroup
--- @field cases GmodTests_TestCaseWithBotTools[] The test cases in this group
--- @field beforeAll? fun(state: GmodTests_BotState): nil A function to run before all tests in the group
--- @field beforeEach? fun(state: GmodTests_BotState): nil A function to run before each test in the group
--- @field afterAll? fun(state: GmodTests_BotState): nil A function to run after all tests in the group
--- @field afterEach? fun(state: GmodTests_BotState): nil A function to run after each test in the group

--- Sets up a testGroup to make a test bot for each test, and remove it after each test
--- Note: Does not automatically create bots. Use `state:addBot()` or `state:addBots()` to create bots
--- @param testGroup GmodTests_TestGroupWithBotTools The test group to modify
--- @param config TestBotConfig? The configuration for the test bot
--- @return GmodTests_TestGroupWithBotTools The modified test group
WithBotTestTools = function( testGroup, config )
    config = config or {}

    local _beforeEach = testGroup.beforeEach
    testGroup.beforeEach = function( state )
        table.Merge( state, getNewBotState() )

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
