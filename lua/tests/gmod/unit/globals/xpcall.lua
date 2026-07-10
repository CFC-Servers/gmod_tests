--- @type GLuaTest_TestGroup
return {
    groupName = "Global:xpcall",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( xpcall ).to.beA( "function" )
            end
        },

        {
            name = "Returns true and the return values when the function succeeds",
            func = function()
                local ok, value = xpcall( function() return "result" end, function() end )

                expect( ok ).to.beTrue()
                expect( value ).to.equal( "result" )
            end
        },

        {
            name = "Does not call the handler when the function succeeds",
            func = function()
                local handlerCalled = false
                local ok = xpcall( function() return true end, function() handlerCalled = true end )

                expect( ok ).to.beTrue()
                expect( handlerCalled ).to.beFalse()
            end
        },

        {
            name = "Calls the handler with the error message when the function errors",
            func = function()
                local receivedError

                local ok = xpcall( function()
                    error( "xpcall test error", 0 )
                end, function( err )
                    receivedError = err
                end )

                expect( ok ).to.beFalse()
                expect( receivedError ).to.equal( "xpcall test error" )
            end
        },

        {
            name = "Returns the handler's return value after an error",
            func = function()
                local ok, handled = xpcall( function()
                    error( "boom", 0 )
                end, function()
                    return "handled"
                end )

                expect( ok ).to.beFalse()
                expect( handled ).to.equal( "handled" )
            end
        },

        {
            name = "Passes extra arguments through to the called function",
            func = function()
                local ok, sum = xpcall( function( a, b ) return a + b end, function() end, 5, 6 )

                expect( ok ).to.beTrue()
                expect( sum ).to.equal( 11 )
            end
        },

        {
            name = "Returns false when given a non-function",
            func = function()
                local receivedError
                local ok = xpcall( "not a function", function( err ) receivedError = err end )

                expect( ok ).to.beFalse()
                expect( receivedError ).to.equal( "attempt to call a string value" )
            end
        },

        {
            name = "Errors when the handler is not a function",
            func = function()
                expect( function() xpcall( function() end, "not a function" ) end ).to.errWith( [[bad argument #2 to 'xpcall' (function expected, got string)]] )
            end
        }
    }
}
