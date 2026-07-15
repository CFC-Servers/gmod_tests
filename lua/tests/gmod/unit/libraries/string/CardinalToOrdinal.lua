--- @type GLuaTest_TestGroup
return {
    groupName = "string.CardinalToOrdinal",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.CardinalToOrdinal ).to.beA( "function" )
            end
        },

        {
            name = "Appends the matching suffix for one, two, three, and four",
            func = function()
                local first = string.CardinalToOrdinal( 1 )
                expect( first ).to.equal( "1st" )

                local second = string.CardinalToOrdinal( 2 )
                expect( second ).to.equal( "2nd" )

                local third = string.CardinalToOrdinal( 3 )
                expect( third ).to.equal( "3rd" )

                local fourth = string.CardinalToOrdinal( 4 )
                expect( fourth ).to.equal( "4th" )
            end
        },

        {
            name = "Uses th for the eleven through thirteen exceptions",
            func = function()
                local eleventh = string.CardinalToOrdinal( 11 )
                expect( eleventh ).to.equal( "11th" )

                local twelfth = string.CardinalToOrdinal( 12 )
                expect( twelfth ).to.equal( "12th" )

                local thirteenth = string.CardinalToOrdinal( 13 )
                expect( thirteenth ).to.equal( "13th" )

                local oneEleven = string.CardinalToOrdinal( 111 )
                expect( oneEleven ).to.equal( "111th" )
            end
        },

        {
            name = "Applies the last-digit rule above twenty",
            func = function()
                local twentyFirst = string.CardinalToOrdinal( 21 )
                expect( twentyFirst ).to.equal( "21st" )

                local oneHundredSecond = string.CardinalToOrdinal( 102 )
                expect( oneHundredSecond ).to.equal( "102nd" )
            end
        },

        {
            name = "Suffixes zero with th",
            func = function()
                local zeroth = string.CardinalToOrdinal( 0 )
                expect( zeroth ).to.equal( "0th" )
            end
        },

        {
            name = "Suffixes negative and fractional numbers naively",
            func = function()
                local negative = string.CardinalToOrdinal( -1 )
                expect( negative ).to.equal( "-1th" )

                local fractional = string.CardinalToOrdinal( 1.5 )
                expect( fractional ).to.equal( "1.5th" )
            end
        }
    }
}
