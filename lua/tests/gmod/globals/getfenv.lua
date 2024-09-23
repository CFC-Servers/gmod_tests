return {
    groupName = "Global:getfenv",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( getfenv ).to.beA( "function" )
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

                setfenv( testFunction, envTbl )
                local interitedEnvTbl = getfenv( testFunction() )

                expect( interitedEnvTbl ).to.equal( envTbl )
            end
        }, {
            name = "Returns the set environment properly",
            func = function()
                local newEnvTbl = {}

                local function testFunction()
                    Example = "Hello World"
                end

                setfenv( testFunction, newEnvTbl )
                local envTbl = getfenv( testFunction )

                expect( envTbl ).to.equal( newEnvTbl )
            end
        },
    }
}
