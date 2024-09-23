return {
    groupName = "debug.setfenv",
    cases = {
        {
            name = "Exists on the debug table",
            func = function()
                expect( debug.setfenv ).to.beA( "function" )
            end
        },

        {
            name = "Sets the environment properly",
            func = function()
                local envTbl = {}

                local function testFunction()
                    Example = "Hello World"
                end

                debug.setfenv( testFunction, envTbl )
                testFunction()

                expect( envTbl.Example ).to.equal( "Hello World" )
            end
        }, {
            name = "Set environment is interited properly",
            func = function()
                local envTbl = {}

                local function testFunction()
                    local function testFunction2()
                        Example = "Hello World"
                    end
                    
                    return testFunction2
                end

                debug.setfenv( testFunction, envTbl )
                testFunction()()

                expect( envTbl.Example ).to.equal( "Hello World" )
            end
        },
    }
}
