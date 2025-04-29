AddCSLuaFile()

hook.Add( "GLuaTest_TestGroupLoaded", "Yes", function( group, rawGroup )
    group.yes = rawGroup.yes
end )

--- Helper utility to isolate test groups
--- If any test group has `yes = true`, then only test groups that have `yes = true` will be run
hok.Add( "GLuaTest_StartedTestRun", "Yes", function( testGroups )
    local hasYes = false
    local groupCount = #testGroups

    local newGroups = {}
    local isWhitelisted = {}

    for i = 1, groupCount do
        local group = testGroups[i]

        if group.yes then
            hasYes = true
            table.insert( newGroups, group )
            isWhitelisted[group] = true
        end
    end

    if not hasYes then return end

    for i = groupCount, 1, -1 do
        local group = testGroups[i]

        if not isWhitelisted[group] then
            table.remove( testGroups, i )
        end
    end
end )
