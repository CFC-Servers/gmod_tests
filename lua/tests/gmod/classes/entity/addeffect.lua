return WithTestEntity( {
    groupName = "Entity:AddEffects",

    cases = {
        {
            name = "Exists on the Entity metatable",

            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.AddEffects ).to.beA( "function" )
            end
        },

        {
            name = "Sets the given Effect on the entity",

            func = function( state )
                local ent = state.ent
                ent:AddEffects( EF_BONEMERGE )

                expect( ent:IsEffectActive( EF_BONEMERGE ) ).to.beTrue()
            end
        },

        {
            name = "Errors when given nil",

            func = function( state )
                local ent = state.ent

                local function test()
                    ent:AddEffects( nil )
                end

                expect( test ).to.errWith( [[bad argument #1 to 'AddEffects' (number expected, got nil)]] )
            end
        },

        {
            name = "Converts given numeric string to number",

            func = function( state )
                local ent = state.ent
                ent:AddEffects( "1" )

                expect( ent:IsEffectActive( 1 ) ).to.beTrue()
            end
        },

        {
            name = "Accepts values that are not predefined EF flags",

            func = function( state )
                local ent = state.ent
                ent:AddEffects( 42 )

                expect( ent:IsEffectActive( 42 ) ).to.beTrue()
            end
        },

        {
            name = "Atomically sets the same flag multiple times",
            func = function( state )
                local ent = state.ent

                -- Ensure there are no effects set already
                expect( ent:GetEffects() ).to.equal( 0 )

                ent:AddEffects( EF_BONEMERGE )
                ent:AddEffects( EF_BONEMERGE )

                expect( ent:IsEffectActive( EF_BONEMERGE ) ).to.beTrue()
                expect( ent:GetEffects() ).to.equal( EF_BONEMERGE )
            end
        },
    }
} )
