--- @type GLuaTest_TestGroup
return {
    groupName = "string.Split",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Split ).to.beA( "function" )
            end
        },

        {
            name = "Takes its arguments in the opposite order of string.Explode",
            func = function()
                local parts = string.Split( "a,b,c", "," )
                expect( parts ).to.deepEqual( { "a", "b", "c" } )

                local viaExplode = string.Explode( ",", "a,b,c" )
                expect( parts ).to.deepEqual( viaExplode )
            end
        },

        {
            name = "Does not treat the separator as a pattern",
            func = function()
                local parts = string.Split( "a.b.c", "." )
                expect( parts ).to.deepEqual( { "a", "b", "c" } )
            end
        }
    }
}
