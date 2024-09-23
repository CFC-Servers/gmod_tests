return WithTestEntity( {
    groupName = "Entity:AddSolidFlags",

    cases = {
        {
            name = "Exists on the Entity Metatable",
            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.AddSolidFlags ).to.beA( "function" )
            end
        },

        {
            name = "Sets the given flag on the Entity",
            func = function( state )
                local ent = state.ent
                local flag = FSOLID_NOT_SOLID

                expect( bit.band( ent:GetSolidFlags(), flag ) ).to.equal( 0 )

                ent:AddSolidFlags( flag )
                expect( bit.band( ent:GetSolidFlags(), flag ) ).to.equal( flag )
            end
        },

        {
            name = "Errors when given nil",
            func = function( state )
                local ent = state.ent

                local function test()
                    ent:AddSolidFlags( nil )
                end

                expect( test ).to.errWith( [[bad argument #1 to 'AddSolidFlags' (number expected, got nil)]] )
            end
        },

        {
            name = "Converts numeric strings to numbers",
            func = function( state )
                local ent = state.ent

                ent:AddSolidFlags( "2" )
                expect( bit.band( ent:GetSolidFlags(), 2 ) ).to.equal( 2 )
            end
        },

        {
            name = "Accepts numbers that aren't predefined FL flags",
            func = function( state )
                local ent = state.ent
                local flag = 42

                ent:AddSolidFlags( flag )
                expect( bit.band( ent:GetSolidFlags(), flag ) ).to.equal( flag )
            end
        },

        {
            name = "Atomically sets the same flag multiple times",
            func = function( state )
                local ent = state.ent
                local flag = FSOLID_NOT_SOLID

                -- Ensure that no flag is set
                expect( bit.band( ent:GetSolidFlags(), flag ) ).to.equal( 0 )

                ent:AddSolidFlags( flag )
                local flags = ent:GetSolidFlags()

                -- Make sure setting it again doesn't change the flag
                ent:AddSolidFlags( flag )
                expect( ent:GetSolidFlags() ).to.equal( flags )
            end
        }
    }
} )
