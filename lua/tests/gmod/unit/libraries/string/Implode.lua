--- @type GLuaTest_TestGroup
return {
    groupName = "string.Implode",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.Implode ).to.beA( "function" )
            end
        },

        {
            name = "Joins table values with the separator",
            func = function()
                local joined = string.Implode( ",", { "a", "b" } )
                expect( joined ).to.equal( "a,b" )
            end
        },

        {
            name = "Reverses string.Explode",
            func = function()
                local parts = string.Explode( ",", "a,b,c" )
                local rejoined = string.Implode( ",", parts )
                expect( rejoined ).to.equal( "a,b,c" )
            end
        },

        {
            name = "Matches table.concat output",
            func = function()
                local pieces = { "x", "y", "z" }

                local viaImplode = string.Implode( "-", pieces )
                local viaConcat = table.concat( pieces, "-" )
                expect( viaImplode ).to.equal( viaConcat )
            end
        }
    }
}
