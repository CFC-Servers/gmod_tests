--- @type GLuaTest_TestGroup
return {
    groupName = "Global:tobool",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( tobool ).to.beA( "function" )
            end
        },
        {
            name = "Returns the right bool",
            func = function()
                -- anything other than false, "0", 0, nil or "false" should return true
                expect( tobool( true ) ).to.beTrue()
                expect( tobool( 1 ) ).to.beTrue()
                expect( tobool( "1" ) ).to.beTrue()
                expect( tobool( {} ) ).to.beTrue()
                expect( tobool( "true" ) ).to.beTrue()

                expect( tobool( false ) ).to.beFalse()
                expect( tobool( "false" ) ).to.beFalse()
                expect( tobool( "0" ) ).to.beFalse()
                expect( tobool( 0 ) ).to.beFalse()
                expect( tobool( nil ) ).to.beFalse()
            end
        }
    }
}
