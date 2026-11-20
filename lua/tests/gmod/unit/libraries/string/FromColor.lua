--- @type GLuaTest_TestGroup
return {
    groupName = "string.FromColor",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.FromColor ).to.beA( "function" )
            end
        },

        {
            name = "Serializes a Color as four space-separated numbers",
            func = function()
                local serialized = string.FromColor( Color( 255, 0, 128, 64 ) )
                expect( serialized ).to.equal( "255 0 128 64" )
            end
        },

        {
            name = "Includes the default alpha",
            func = function()
                local serialized = string.FromColor( Color( 1, 2, 3 ) )
                expect( serialized ).to.equal( "1 2 3 255" )
            end
        },

        {
            name = "Truncates fractional components (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local serialized = string.FromColor( Color( 1.9, 2.5, 3.1, 4.7 ) )
                expect( serialized ).to.equal( "1 2 3 4" )
            end
        },

        {
            name = "Rounds fractional components to the nearest integer (base)",
            when = not IS_64BIT_BRANCH,
            func = function()
                local serialized = string.FromColor( Color( 1.9, 2.2, 3.1, 4.7 ) )
                expect( serialized ).to.equal( "2 2 3 5" )
            end
        }
    }
}
