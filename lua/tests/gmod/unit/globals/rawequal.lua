--- @type GLuaTest_TestGroup
return {
    groupName = "Global:rawequal",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( rawequal ).to.beA( "function" )
            end
        },

        {
            name = "Returns true when given the same table twice",
            func = function()
                local tbl = {}
                local result = rawequal( tbl, tbl )

                expect( result ).to.beTrue()
            end
        },

        {
            name = "Returns false for distinct tables with equal contents",
            func = function()
                local result = rawequal( { 1 }, { 1 } )
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns true for equal primitive values",
            func = function()
                expect( rawequal( 1, 1 ) ).to.beTrue()
                expect( rawequal( "a", "a" ) ).to.beTrue()
                expect( rawequal( true, true ) ).to.beTrue()
                expect( rawequal( nil, nil ) ).to.beTrue()
            end
        },

        {
            name = "Returns false for values of different types",
            func = function()
                expect( rawequal( 1, "1" ) ).to.beFalse()
                expect( rawequal( false, nil ) ).to.beFalse()
            end
        },

        {
            name = "Ignores the __eq metamethod",
            func = function()
                local meta = {
                    __eq = function() return true end
                }

                local a = setmetatable( {}, meta )
                local b = setmetatable( {}, meta )

                expect( a == b ).to.beTrue()

                local rawResult = rawequal( a, b )
                expect( rawResult ).to.beFalse()
            end
        }
    }
}
