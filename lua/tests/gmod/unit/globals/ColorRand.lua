return {
    groupName = "Global:ColorRand",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( ColorRand ).to.beA( "function" )
            end
        },

        {
            name = "Returns a Color",
            func = function()
                local output = ColorRand()
                expect( output ).to.beA( "table" )
                expect( debug.getmetatable( output ) ).to.equal( FindMetaTable( "Color" ) )
            end
        },

        {
            name = "Does not randomize the Alpha if the argument is false",
            func = function()
                local output = ColorRand( false )
                expect( output.a ).to.equal( 255 )
            end
        },
    }
}
