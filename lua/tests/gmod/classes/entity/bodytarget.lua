return WithTestEntity( {
    groupName = "Entity:BodyTarget",

    -- NOTE:
    -- Using the noise parameter appears to adjust the output by approximately:
    -- x: -3.5698315059562e-07 - 3.571777824618e-07 (hardly any adjustment)
    -- y: 0 - 0 (no adjustment)
    -- z: -8.4222898483276 - 8.4268808364868

    cases = {
        {
            name = "Exists on the Entity metatable",
            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.BodyTarget ).to.beA( "function" )
            end
        },

        {
            name = "Returns the expected vector",

            func = function( state )
                local ent = state.ent
                local origin = Vector( 100, 200, 300 )

                local output = ent:BodyTarget( origin, false )
                local x, y, z = output:Unpack()

                expect( x ).to.aboutEqual( 0 )
                expect( y ).to.equal( 0 )
                expect( z ).to.aboutEqual( 8.4375 )
            end
        },

        {
            name = "Returns a noisy vector when noise is enabled",
            func = function( state )
                local ent = state.ent
                local origin = Vector( 100, 200, 300 )

                local noisyOutput = ent:BodyTarget( origin, true )
                local cleanOutput = ent:BodyTarget( origin, false )

                local difference = noisyOutput - cleanOutput
                local x, y, z = difference:Unpack()

                expect( x ).notTo.equal( 0 )
                expect( y ).to.equal( 0 ) -- Noise is not applied to the Y value
                expect( z ).notTo.equal( 0 )
            end
        },

        {
            name = "Defaults noisy parameter to false",
            func = function( state )
                local ent = state.ent
                local origin = Vector( 100, 200, 300 )

                local implied = ent:BodyTarget( origin )
                local implicit = ent:BodyTarget( origin, false )

                expect( implied ).to.equal( implicit )
            end
        }
    }
} )
