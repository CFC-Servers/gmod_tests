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
            name = "Is the same function as string.StartsWith",
            func = function()
                expect( string.StartWith ).to.equal( string.StartsWith )

                local matches = string.StartWith( "Hello World", "Hello" )
                expect( matches ).to.beTrue()
            end
        }
    }
}
