AddCSLuaFile()

local function create()
    local waitIdent = 0
    local function getWaitIdentifier()
        waitIdent = waitIdent + 1
        return "GLuaTest_Waiter_" .. os.time() .. "_" .. waitIdent
    end

    local WaitTools = {}

    --- Halts a tests's execution until player.GetCount() returns 0
    --- (Must be run in a coroutine=true test case)
    WaitTools.WaitForEmptyServer = function()
        local co = coroutine.running()
        local identifier = getWaitIdentifier()

        hook.Add( "Think", identifier, function()
            local count = player.GetCount()
            if count > 0 then return end

            hook.Remove( "Think", identifier )
            coroutine.resume( co )
        end )

        return coroutine.yield()
    end

    --- Halts a test's execution for the given number of ticks
    --- (Must be run in a coroutine=true test case)
    WaitTools.WaitForTicks = function( ticks )
        local co = coroutine.running()

        local counter = 0
        local identifier = getWaitIdentifier()
        hook.Add( "Think", identifier, function()
            counter = counter + 1

            if counter >= ticks then
                hook.Remove( "Think", identifier )
                coroutine.resume( co )
            end
        end )

        return coroutine.yield()
    end

    return WaitTools
end

-- We add a fresh copy of WaitTools to every async env, and apply the async meta to its
-- (That way, any hooks it creates will be automatically cleaned up, because it'll use the wrapped hook library)
hook.Add( "GLuaTest_AsyncEnvCreated", "GLuaTest_WaitTools", function( env, meta )
    local waitTools = create()

    local newEnv = setmetatable( {}, meta )
    for name, func in pairs( waitTools ) do
        setfenv( func, newEnv )
        env[name] = func
    end
end )
