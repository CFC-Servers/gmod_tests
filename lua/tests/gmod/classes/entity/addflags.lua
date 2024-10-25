return WithTestEntity( {
    groupName = "Entity:AddFlags",

    cases = {
        {
            name = "Exists on the Entity Metatable",
            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.AddFlags ).to.beA( "function" )
            end
        },

        {
            name = "Sets the given flag on the Entity",
            func = function( state )
                local ent = state.ent
                local flag = FL_NOTARGET

                expect( ent:IsFlagSet( flag ) ).to.beFalse()

                ent:AddFlags( flag )
                expect( ent:IsFlagSet( flag ) ).to.beTrue()
            end
        },

        {
            name = "Errors when given nil",
            func = function( state )
                local ent = state.ent

                local function test()
                    ent:AddFlags( nil )
                end

                expect( test ).to.errWith( [[bad argument #1 to 'AddFlags' (number expected, got nil)]] )
            end
        },

        {
            name = "Converts numeric strings to numbers",
            func = function( state )
                local ent = state.ent

                ent:AddFlags( "2" )
                expect( ent:IsFlagSet( 2 ) ).to.beTrue()
            end
        },

        {
            name = "Accepts numbers that aren't predefined FL flags",
            func = function( state )
                local ent = state.ent
                local flag = 42

                ent:AddFlags( flag )
                expect( ent:IsFlagSet( flag ) ).to.beTrue()
            end
        },

        {
            name = "Atomically sets the same flag multiple times",
            func = function( state )
                local ent = state.ent
                local flag = FL_NOTARGET

                -- Ensure that no flag is set
                expect( ent:IsFlagSet( flag ) ).to.beFalse()

                ent:AddFlags( flag )
                local flags = ent:GetFlags()

                -- Make sure setting it again doesn't change the flag
                ent:AddFlags( flag )
                expect( ent:GetFlags() ).to.equal( flags )
            end
        }
    }
} )
