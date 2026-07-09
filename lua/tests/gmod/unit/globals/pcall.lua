--- @type GLuaTest_TestGroup
return {
    groupName = "Global:pcall",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( pcall ).to.beA( "function" )
            end
        },

        {
            name = "Returns true and the return values when the function succeeds",
            func = function()
                local func = function()
                    return 1, "two"
                end

                local ok, first, second = pcall( func )

                expect( ok ).to.beTrue()
                expect( first ).to.equal( 1 )
                expect( second ).to.equal( "two" )
            end
        },

        {
            name = "Passes arguments through to the called function",
            func = function()
                local func = function( a, b )
                    return a + b
                end

                local ok, sum = pcall( func, 3, 4 )

                expect( ok ).to.beTrue()
                expect( sum ).to.equal( 7 )
            end
        },

        {
            name = "Returns false and the error message when the function errors",
            func = function()
                local func = function()
                    error( "pcall test error", 0 )
                end

                local ok, err = pcall( func )

                expect( ok ).to.beFalse()
                expect( err ).to.equal( "pcall test error" )
            end
        },

        {
            name = "Prefixes thrown string errors with the file and line",
            func = function()
                local func = function()
                    error( "prefixed error" )
                end

                local ok, err = pcall( func )
                expect( ok ).to.beFalse()

                local hasPrefix = string.find( err, "%.lua:%d+: prefixed error$" ) ~= nil
                expect( hasPrefix ).to.beTrue()
            end
        },

        {
            name = "Preserves non-string error values",
            func = function()
                local errValue = { code = 42 }
                local func = function()
                    error( errValue )
                end

                local ok, err = pcall( func )

                expect( ok ).to.beFalse()
                expect( err ).to.equal( errValue )
            end
        },

        {
            name = "Returns false when given a non-function",
            func = function()
                local ok, err = pcall( "not a function" )

                expect( ok ).to.beFalse()
                expect( err ).to.equal( "attempt to call a string value" )
            end
        },

        {
            name = "Catches runtime errors from invalid operations",
            func = function()
                local func = function()
                    return nil + 1
                end

                local ok, err = pcall( func )

                expect( ok ).to.beFalse()
                expect( err ).to.beA( "string" )
            end
        }
    }
}
