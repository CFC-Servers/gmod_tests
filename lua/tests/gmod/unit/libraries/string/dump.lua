local function addOne( x )
    return x + 1
end

--- @type GLuaTest_TestGroup
return {
    groupName = "string.dump",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.dump ).to.beA( "function" )
            end
        },

        {
            name = "Returns the bytecode of a Lua function as a string",
            func = function()
                local bytecode = string.dump( addOne )

                expect( bytecode ).to.beA( "string" )
                expect( #bytecode ).to.beGreaterThan( 0 )
            end
        },

        {
            name = "Produces bytecode carrying the LuaJIT header",
            func = function()
                local bytecode = string.dump( addOne )

                local header = string.sub( bytecode, 1, 3 )
                expect( header ).to.equal( "\27LJ" )
            end
        },

        {
            name = "Produces smaller bytecode when stripping debug info",
            func = function()
                local full = string.dump( addOne )
                local stripped = string.dump( addOne, true )

                expect( #stripped ).to.beLessThan( #full )
            end
        },

        {
            name = "Errors on functions implemented in C",
            func = function()
                expect( string.dump, print ).to.errWith( "unable to dump given function" )
            end
        }
    }
}
