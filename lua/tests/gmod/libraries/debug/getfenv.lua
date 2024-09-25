return {
    groupName = "debug.getfenv",
    cases = {
        {
            name = "Exists on the debug table",
            func = function()
                expect( debug.getfenv ).to.beA( "function" )
            end
        },

        {
            name = "Returns the inherited enviromnent when called on a normal function",
            func = function()
                local envTbl = {}
                local function testFunction()
                    local function testFunction2()
                    end

                    return testFunction2
                end

                debug.setfenv( testFunction, envTbl )
                local interitedEnvTbl = debug.getfenv( testFunction() )

                expect( interitedEnvTbl ).to.equal( envTbl )
            end
        }, {
            name = "Returns the set environment properly",
            func = function()
                local newEnvTbl = {}

                local function testFunction()
                    Example = "Hello World"
                end

                debug.setfenv( testFunction, newEnvTbl )
                local envTbl = debug.getfenv( testFunction )

                expect( envTbl ).to.equal( newEnvTbl )
            end
        },
    }
}
