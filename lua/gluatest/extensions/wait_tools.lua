AddCSLuaFile()

local waitIdent = 0
local function getWaitIdentifier()
    waitIdent = waitIdent + 1
    return "GLuaTest_Waiter_" .. waitIdent
end

--- Halts a tests's execution until player.GetCount() returns 0
--- (Must be run in a coroutine=true test case)
WaitForEmptyServer = function()
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
WaitForTicks = function( ticks )
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
