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
        }
    }
}
