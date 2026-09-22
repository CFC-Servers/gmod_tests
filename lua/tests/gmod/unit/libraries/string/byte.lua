--- @type GLuaTest_TestGroup
return {
    groupName = "string.byte",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.byte ).to.beA( "function" )
            end
        },

        {
            name = "Returns the ASCII value of the first character by default",
            func = function()
                local upperA = string.byte( "A" )
                expect( upperA ).to.equal( 65 )

                local firstOfMany = string.byte( "abc" )
                expect( firstOfMany ).to.equal( 97 )
            end
        },

        {
            name = "Returns the ASCII value at the given start position",
            func = function()
                local second = string.byte( "abc", 2 )
                expect( second ).to.equal( 98 )
            end
        },

        {
            name = "Counts from the end of the string for negative positions",
            func = function()
                local last = string.byte( "abc", -1 )
                expect( last ).to.equal( 99 )
            end
        },

        {
            name = "Returns one value per character in the requested slice",
            func = function()
                local a, b, c = string.byte( "abc", 1, 3 )
                expect( a ).to.equal( 97 )
                expect( b ).to.equal( 98 )
                expect( c ).to.equal( 99 )
            end
        },

        {
            name = "Returns nothing for out-of-range or empty slices",
            func = function()
                local pastEnd = string.byte( "abc", 10 )
                expect( pastEnd ).to.beNil()

                local inverted = string.byte( "abc", 3, 2 )
                expect( inverted ).to.beNil()

                local fromEmpty = string.byte( "" )
                expect( fromEmpty ).to.beNil()
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digit = string.byte( 9 )
                expect( digit ).to.equal( 57 )
            end
        },

        {
            name = "Allows slices up to 8000 characters",
            func = function()
                local longString = string.rep( "a", 9000 )

                local count = select( "#", string.byte( longString, 1, 8000 ) )
                expect( count ).to.equal( 8000 )
            end
        },

        {
            name = "Errors when the slice is longer than 8000 characters",
            func = function()
                local longString = string.rep( "a", 9000 )

                expect( string.byte, longString, 1, 8001 ).to.errWith( "string slice too long" )
            end
        }
    }
}
