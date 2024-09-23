return WithTestEntity( {
    groupName = "Entity:AddEFlags",

    cases = {
        {
            name = "Exists on the Entity Metatable",
            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.AddEFlags ).to.beA( "function" )
            end
        },

        {
            name = "Sets the given flag on the Entity",
            func = function( state )
                local ent = state.ent

                ent:AddEFlags( EFL_DORMANT )
                expect( ent:IsEFlagSet( EFL_DORMANT ) ).to.beTrue()
            end
        },

        {
            name = "Errors when given nil",
            func = function( state )
                local ent = state.ent

                local function test()
                    ent:AddEFlags( nil )
                end

                expect( test ).to.errWith( [[bad argument #1 to 'AddEFlags' (number expected, got nil)]] )
            end
        },

        {
            name = "Converts numeric strings to numbers",
            func = function( state )
                local ent = state.ent

                ent:AddEFlags( "2" )
                expect( ent:IsEFlagSet( 2 ) ).to.beTrue()
            end
        },

        {
            name = "Accepts numbers that aren't predefined EFL flags",
            func = function( state )
                local ent = state.ent

                ent:AddEFlags( 42 )
                expect( ent:IsEFlagSet( 42 ) ).to.beTrue()
            end
        },

        {
            name = "Atomically sets the same flag multiple times",
            func = function( state )
                local ent = state.ent

                -- Ensure that no flag is set
                expect( ent:IsEFlagSet( EFL_DORMANT ) ).to.beFalse()

                ent:AddEFlags( EFL_DORMANT )
                local flags = ent:GetEFlags()

                -- Make sure setting it again doesn't change the flag
                ent:AddEFlags( EFL_DORMANT )
                expect( ent:GetEFlags() ).to.equal( flags )
            end
        }
    }
} )
