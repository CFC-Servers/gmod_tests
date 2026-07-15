--- @type GLuaTest_TestGroup
return {
    groupName = "string.ToColor",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.ToColor ).to.beA( "function" )
            end
        },

        {
            name = "Parses four space-separated numbers into a Color",
            func = function()
                local color = string.ToColor( "255 0 0 255" )

                expect( color.r ).to.equal( 255 )
                expect( color.g ).to.equal( 0 )
                expect( color.b ).to.equal( 0 )
                expect( color.a ).to.equal( 255 )
            end
        },

        {
            name = "Returns opaque white when the string cannot be parsed",
            func = function()
                local garbage = string.ToColor( "not a color" )

                expect( garbage.r ).to.equal( 255 )
                expect( garbage.g ).to.equal( 255 )
                expect( garbage.b ).to.equal( 255 )
                expect( garbage.a ).to.equal( 255 )

                local empty = string.ToColor( "" )
                expect( empty.r ).to.equal( 255 )

                local tooFew = string.ToColor( "255 0" )
                expect( tooFew.g ).to.equal( 255 )
            end
        },

        {
            name = "Does not support comma separators",
            func = function()
                local color = string.ToColor( "255,0,0,255" )

                expect( color.r ).to.equal( 255 )
                expect( color.g ).to.equal( 255 )
                expect( color.b ).to.equal( 255 )
                expect( color.a ).to.equal( 255 )
            end
        },

        {
            name = "Matches digit runs even inside malformed input",
            func = function()
                local fromNegative = string.ToColor( "300 -5 0 255" )

                expect( fromNegative.r ).to.equal( 5 )
                expect( fromNegative.g ).to.equal( 0 )
                expect( fromNegative.b ).to.equal( 255 )
                expect( fromNegative.a ).to.equal( 255 )

                local fromDecimal = string.ToColor( "25.5 0 0 255" )

                expect( fromDecimal.r ).to.equal( 5 )
                expect( fromDecimal.g ).to.equal( 0 )
                expect( fromDecimal.b ).to.equal( 0 )
                expect( fromDecimal.a ).to.equal( 255 )
            end
        },

        {
            name = "Round-trips the output of string.FromColor",
            func = function()
                local serialized = string.FromColor( Color( 1, 2, 3, 4 ) )
                local color = string.ToColor( serialized )

                expect( color.r ).to.equal( 1 )
                expect( color.g ).to.equal( 2 )
                expect( color.b ).to.equal( 3 )
                expect( color.a ).to.equal( 4 )
            end
        }
    }
}
