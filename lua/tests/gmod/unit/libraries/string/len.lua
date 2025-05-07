return {
    groupName = "string.len",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.len ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right number",
            func = function()
                expect( string.len( "hi" ) ).to.equal( 2 )
                expect( string.len( "drakehawke" ) ).to.equal( 10 )
                expect( string.len( "" ) ).to.equal( 0 )
                expect( string.len( "test" ) == #"test" ).to.beTrue()
            end
        }
    }
}