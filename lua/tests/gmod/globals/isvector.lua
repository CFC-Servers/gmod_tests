return {
    groupName = "Global:isvector",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( isvector ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right bool",
            func = function()
                expect( isvector( Vector( 1, 2, 3 ) ) ).to.beTrue()

                expect( isvector( Angle( 1, 2, 3 ) ) ).to.beFalse()
                expect( isvector( { x = 1, y = 2, z = 3 } ) ).to.beFalse()
                expect( isvector( 1 ) ).to.beFalse()
                expect( isvector( "string" ) ).to.beFalse()
                expect( isvector( true ) ).to.beFalse()
                expect( isvector( nil ) ).to.beFalse()
                expect( isvector( math.huge ) ).to.beFalse()
                expect( isvector( Vector ) ).to.beFalse()
            end
        },

        {
            name = "It isn't fooled by a table with the Vector metatable",
            func = function()
                local vecMeta = FindMetaTable( "Vector" )
                local newVec = setmetatable( { 1, 2, 3 }, vecMeta )
                expect( isvector( newVec ) ).to.beFalse()
            end
        }
    }
}
