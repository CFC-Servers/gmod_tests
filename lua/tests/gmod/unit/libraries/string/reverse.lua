--- @type GLuaTest_TestGroup
return {
    groupName = "string.reverse",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.reverse ).to.beA( "function" )
            end
        },

        {
            name = "Reverses ASCII strings",
            func = function()
                local reversed = string.reverse( "abcdef" )
                expect( reversed ).to.equal( "fedcba" )

                local single = string.reverse( "a" )
                expect( single ).to.equal( "a" )

                local empty = string.reverse( "" )
                expect( empty ).to.equal( "" )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digits = string.reverse( 1234 )
                expect( digits ).to.equal( "4321" )

                local notANumber = string.reverse( 0 / 0 )
                expect( notANumber ).to.equal( "nan" )
            end
        },

        {
            name = "Reverses bytes rather than UTF-8 codepoints",
            func = function()
                local swappedBytes = string.reverse( "é" )
                expect( swappedBytes ).to.equal( "\169\195" )
            end
        },

        {
            name = "Errors when given nil or an entity",
            func = function()
                local fromNil = function()
                    string.reverse( nil )
                end

                expect( fromNil ).to.errWith( "bad argument #1 to 'reverse' (string expected, got nil)" )

                local fromEntity = function()
                    string.reverse( NULL )
                end

                expect( fromEntity ).to.errWith( "bad argument #1 to 'reverse' (string expected, got userdata)" )
            end
        }
    }
}
