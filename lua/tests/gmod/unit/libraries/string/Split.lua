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
            name = "Splits the string at every separator",
            func = function()
                local parts = string.Split( "a,b,c", "," )
                expect( parts ).to.deepEqual( { "a", "b", "c" } )
            end
        },

        {
            name = "Takes its arguments in the opposite order of string.Explode",
            func = function()
                local viaSplit = string.Split( "a|b", "|" )
                local viaExplode = string.Explode( "|", "a|b" )
                expect( viaSplit ).to.deepEqual( viaExplode )
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
