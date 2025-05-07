return {
    groupName = "Global:isbool",
    cases = {
        {
            name = "Exists on the Global table",
            func = function()
                expect( isbool ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right bool",
            func = function()
                expect( isbool( false ) ).to.beTrue()
                expect( isbool( IsValid( "string" ) and "string" ) ) -- Truthy/falsy

                expect( isbool( Vector( 1, 2, 3 ) ) ).to.beFalse()
                expect( isbool( Angle( 1, 2, 3 ) ) ).to.beFalse()
                expect( isbool( { x = 1, y = 2, z = 3 } ) ).to.beFalse()
                expect( isbool( 1 ) ).to.beFalse()
                expect( isbool( "string" ) ).to.beFalse()
                expect( isbool( nil ) ).to.beFalse()
                expect( isbool( NULL ) ).to.beFalse()
                expect( isbool( 0 / 0 ) ).to.beFalse() -- NaN
                expect( isbool( math.huge ) ).to.beFalse()
                expect( isbool( Entity( 0 ) ) ).to.beFalse()
                expect( isbool( isbool ) ).to.beFalse()
                expect( isbool( pairs ) ).to.beFalse()
                expect( isbool( Matrix() ) ).to.beFalse()
                expect( isbool( color_white ) ).to.beFalse()
            end
        }
    }
}