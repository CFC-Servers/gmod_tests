--- @type GLuaTest_TestGroup
return {
    groupName = "Global:type",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( type ).to.beA( "function" )
            end
        },

        {
            name = "Returns the correct name for primitive types",
            func = function()
                expect( type( 1 ) ).to.equal( "number" )
                expect( type( "a" ) ).to.equal( "string" )
                expect( type( true ) ).to.equal( "boolean" )
                expect( type( nil ) ).to.equal( "nil" )
                expect( type( {} ) ).to.equal( "table" )
                expect( type( print ) ).to.equal( "function" )
            end
        },

        {
            name = "Returns thread for coroutines",
            func = function()
                local co = coroutine.create( function() end )
                local typeName = type( co )

                expect( typeName ).to.equal( "thread" )
            end
        },

        {
            name = "Returns GMod type names for GMod objects",
            func = function()
                expect( type( Vector() ) ).to.equal( "Vector" )
                expect( type( Angle() ) ).to.equal( "Angle" )
            end
        },

        {
            name = "Does not error when called with no arguments",
            func = function()
                expect( function() return type() end ).notTo.err()
            end
        }
    }
}
