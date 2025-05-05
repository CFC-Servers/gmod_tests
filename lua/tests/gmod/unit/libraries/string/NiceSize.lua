return {
    groupName = "string.NiceSize",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.NiceSize ).to.beA( "function" )
            end
        },

        {
            name = "Formats strings correctly",
            func = function()
                expect( string.NiceSize( 0 ) ).to.equal( "0" )
                expect( string.NiceSize( 64 ) ).to.equal( "64 Bytes" )
                expect( string.NiceSize( 64512 ) ).to.equal( "64.51 KB" )
                expect( string.NiceSize( 64512000 ) ).to.equal( "64.51 MB" )
                expect( string.NiceSize( 64512000000 ) ).to.equal( "64.51 GB" )
                expect( string.NiceSize( -64512000000 ) ).to.equal( "0" )
            end
        },

        {
            name = "Fails to format invalid inputs",
            func = function()
                expect( string.NiceName( nil ) ).to.err()
                expect( string.NiceName( NULL ) ).to.err()
                expect( string.NiceName( "string" ) ).to.err()
            end
        }
    }
}