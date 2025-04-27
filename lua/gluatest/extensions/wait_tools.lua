AddCSLuaFile()

local waitIdent = 0
local function getWaitIdentifier()
    waitIdent = waitIdent + 1
    return "GLuaTest_Waiter_" .. waitIdent
end

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
