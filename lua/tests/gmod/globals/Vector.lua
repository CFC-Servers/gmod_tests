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
                ---@diagnostic disable-next-line: param-type-mismatch
                local vector = Vector( "1", "100.000", "0.1" )

                expect( vector["x"] ).to.equal( 1 )
                expect( vector["y"] ).to.equal( 100 )
                expect( vector["z"] ).to.beBetween( 0.09, 0.11 )
            end
        },

        {
            name = "Accepts string parameters",
            func = function()
                ---@diagnostic disable-next-line: param-type-mismatch
                local vector = Vector( "1 100.000 0.1" )

                expect( vector["x"] ).to.equal( 1 )
                expect( vector["y"] ).to.equal( 100 )
                expect( vector["z"] ).to.beBetween( 0.09, 0.11 )
            end
        },

        {
            name = "Rolls back the invalid value to 0",
            func = function()
                --X
                local vector = Vector( 128, nil, -128 )
                expect( vector["x"] ).to.equal( 128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( -128 )

                ---@diagnostic disable-next-line: param-type-mismatch
                vector = Vector( 128, {}, -128 )
                expect( vector["x"] ).to.equal( 128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( -128 )

                ---@diagnostic disable-next-line: param-type-mismatch
                vector = Vector( 128, "bad_string", -128 )
                expect( vector["x"] ).to.equal( 128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( -128 )

                --Y
                vector = Vector( nil, 0, -128 )
                expect( vector["x"] ).to.equal( 0 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( -128 )

                ---@diagnostic disable-next-line: param-type-mismatch
                vector = Vector( {}, 0, -128 )
                expect( vector["x"] ).to.equal( 0 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( -128 )

                ---@diagnostic disable-next-line: param-type-mismatch
                vector = Vector( "bad_string", 0, -128 )
                expect( vector["x"] ).to.equal( 0 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( -128 )

                --Z
                vector = Vector( 128, 0, nil )
                expect( vector["x"] ).to.equal( 128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( 0 )

                ---@diagnostic disable-next-line: param-type-mismatch
                vector = Vector( 128, 0, {} )
                expect( vector["x"] ).to.equal( 128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( 0 )

                ---@diagnostic disable-next-line: param-type-mismatch
                vector = Vector( 128, 0, "bad_string" )
                expect( vector["x"] ).to.equal( 128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( 0 )
            end
        },

        {
            name = "Returns Vector( 0, 0, 0 ) if the string is invalid",
            func = function()
                ---@diagnostic disable-next-line: param-type-mismatch
                local vector = Vector( "bad_string" )

                expect( vector["x"] ).to.equal( 0 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( 0 )
            end
        },

        {
            name = "Accepts negative numbers",
            func = function()
                local vector = Vector( -128, 0, 128 )

                expect( vector["x"] ).to.equal( -128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( 128 )
            end
        },

        {
            name = "Accepts crazy and very small values",
            func = function()
                local huge = math.huge --[[@as number]]
                local vector = Vector( huge, huge, huge )

                expect( vector["x"] ).to.equal( huge )
                expect( vector["y"] ).to.equal( huge )
                expect( vector["z"] ).to.equal( huge )

                vector = Vector( -huge, -huge, -huge )
                expect( vector["x"] ).to.equal( -huge )
                expect( vector["y"] ).to.equal( -huge )
                expect( vector["z"] ).to.equal( -huge )

                vector = Vector( 0 / 0, 0 / 0, 0 / 0 )
                expect( vector["x"] ).to.beNaN()
                expect( vector["y"] ).to.beNaN()
                expect( vector["z"] ).to.beNaN()

                vector = Vector( 0.001, 0.0001, 0.00001 )
                expect( vector["x"] ).to.beBetween( 0.0009, 0.0011 )
                expect( vector["y"] ).to.beBetween( 0.00009, 0.00011 )
                expect( vector["z"] ).to.beBetween( 0.000009, 0.000011 )

                vector = Vector( -0.001, -0.0001, -0.00001 )
                expect( vector["x"] ).to.beBetween( -0.0011, -0.0009 )
                expect( vector["y"] ).to.beBetween( -0.00011, -0.00009 )
                expect( vector["z"] ).to.beBetween( -0.000011, -0.000009 )
            end
        },

        {
            name = "Copies vector",
            func = function()
                ---@diagnostic disable-next-line: param-type-mismatch
                local vector = Vector( Vector( -128, 0, 128 ) )

                expect( vector["x"] ).to.equal( -128 )
                expect( vector["y"] ).to.equal( 0 )
                expect( vector["z"] ).to.equal( 128 )
            end
        },
    }
}
