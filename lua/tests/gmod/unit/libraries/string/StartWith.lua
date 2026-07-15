--- @type GLuaTest_TestGroup
return {
    groupName = "string.StartWith",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.StartWith ).to.beA( "function" )
            end
        },

        {
            name = "Behaves identically to string.StartsWith",
            func = function()
                local matches = string.StartWith( "Hello World", "Hello" )
                expect( matches ).to.beTrue()

                local mismatch = string.StartWith( "Hello World", "World" )
                expect( mismatch ).to.beFalse()
            end
        }
    }
}
