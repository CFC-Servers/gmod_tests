return {
    groupName = "Global:setfenv",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( setfenv ).to.beA( "function" )
            end
        },

        {
            name = "Sets the environment properly",
            func = function()
                local envTbl = {}

                local function testFunction()
                    Example = "Hello World"
                end

                setfenv( testFunction, envTbl )
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

                setfenv( testFunction, envTbl )
                testFunction()()

                expect( envTbl.Example ).to.equal( "Hello World" )
            end
        },
    }
}
