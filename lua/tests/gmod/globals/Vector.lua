return {
    groupName = "Global:Vector",
    cases = {
        {
            name = "Exists in the global table",
            func = function()
                expect( Vector ).to.beA( "function" )
            end
        },

        {
            name = "Returns an Vector object",
            func = function()
                local vector = Vector( 1, 2, 3 )
                expect( vector ).to.beA( "Vector" )
            end
        },

        {
            name = "Accepts string-number parameters",
            func = function()
                local vector = Vector( "1", "2", "3" )

                expect( vector.x ).to.equal( 1 )
                expect( vector.y ).to.equal( 2 )
                expect( vector.z ).to.equal( 3 )
            end
        },

        {
            name = "Accepts string parameters",
            func = function()
                local vector = Vector( "1 2 3" )

                expect( vector.x ).to.equal( 1 )
                expect( vector.y ).to.equal( 2 )
                expect( vector.z ).to.equal( 3 )
            end
        },

        {
            name = "Rolls back the invalid value to 0",
            func = function()
                local vector = Vector( 128, nil, -128 )
                expect( vector.x ).to.equal( 128 )
                expect( vector.y ).to.equal( 0 )
                expect( vector.z ).to.equal( -128 )

                vector = Vector( 128, {}, -128 )
                expect( vector.x ).to.equal( 128 )
                expect( vector.y ).to.equal( 0 )
                expect( vector.z ).to.equal( -128 )

                vector = Vector( 128, "bad_string", -128 )
                expect( vector.x ).to.equal( 128 )
                expect( vector.y ).to.equal( 0 )
                expect( vector.z ).to.equal( -128 )
            end
        },

        {
            name = "Returns Vector( 0, 0, 0 ) if the string is invalid",
            func = function()
                local vector = Vector( "bad_string" )

                expect( vector.x ).to.equal( 0 )
                expect( vector.y ).to.equal( 0 )
                expect( vector.z ).to.equal( 0 )
            end
        },

        {
            name = "Accepts negative numbers",
            func = function()
                local vector = Vector( -128, 0, 128 )

                expect( vector.x ).to.equal( -128 )
                expect( vector.y ).to.equal( 0 )
                expect( vector.z ).to.equal( 128 )
            end
        },

        {
            name = "Copies vector",
            func = function()
                local vector = Vector( Vector( -128, 0, 128 ) )

                expect( vector.x ).to.equal( -128 )
                expect( vector.y ).to.equal( 0 )
                expect( vector.z ).to.equal( 128 )
            end
        },
    }
}
