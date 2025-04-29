return {
    groupName = "CTakeDamageInfo:SetDamageType",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetDamageType ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function( state )
                local result = state.dmgInfo:SetDamageType( DMG_BULLET )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets damage type correctly (single flag number)",
            func = function( state )
                local expectedType = DMG_BULLET

                state.dmgInfo:SetDamageType( expectedType )
                expect( state.dmgInfo:GetDamageType() ).to.equal( expectedType )
            end
        },

        {
            name = "Sets damage type correctly (multiple flags number)",
            func = function( state )
                local expectedType = DMG_BLAST + DMG_CLUB

                state.dmgInfo:SetDamageType( expectedType )
                expect( state.dmgInfo:GetDamageType() ).to.equal( expectedType )
            end
        },

        {
            name = "Sets damage type correctly (zero number)",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local expectedType = 0
                state.dmgInfo:SetDamageType( expectedType )

                expect( state.dmgInfo:GetDamageType() ).to.equal( expectedType )
            end
        },

        {
            name = "Sets damage type correctly (single flag numeric string)",
            func = function( state )
                local expectedType = DMG_SHOCK

                state.dmgInfo:SetDamageType( tostring( expectedType ) )
                expect( state.dmgInfo:GetDamageType() ).to.equal( expectedType )
            end
        },

        {
            name = "Sets damage type correctly (multiple flags numeric string)",
            func = function( state )
                local expectedType = DMG_BURN + DMG_DROWN

                state.dmgInfo:SetDamageType( tostring( expectedType ) )
                expect( state.dmgInfo:GetDamageType() ).to.equal( expectedType )
            end
        },

        {
            name = "Sets damage type correctly (zero numeric string)",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local expectedType = 0
                state.dmgInfo:SetDamageType( tostring( expectedType ) )

                expect( state.dmgInfo:GetDamageType() ).to.equal( expectedType )
            end
        },

        {
            name = "Overwrites previously set damage type",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local expectedType = DMG_BLAST
                state.dmgInfo:SetDamageType( expectedType )

                expect( state.dmgInfo:GetDamageType() ).to.equal( expectedType )
            end
        },

        {
            name = "Errors when given a non-numeric string argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageType( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageType' (number expected, got string)]] )
            end
        },
        {
            name = "Errors when given a table argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageType( {} ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageType' (number expected, got table)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetDamageType() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetDamageType' (number expected, got no value)]] )
            end
        }
    }
}

