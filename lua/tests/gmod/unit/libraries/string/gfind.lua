--- @type GLuaTest_TestGroup
return {
    groupName = "string.gfind",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.gfind ).to.beA( "function" )
            end
        },

        {
            name = "Iterates matches like string.gmatch",
            func = function()
                local iter = string.gfind( "one two", "%a+" )

                local first = iter()
                expect( first ).to.equal( "one" )

                local second = iter()
                expect( second ).to.equal( "two" )

                local finished = iter()
                expect( finished ).to.beNil()
            end
        }
    }
}
