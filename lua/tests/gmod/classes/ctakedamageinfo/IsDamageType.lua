return {
    groupName = "CTakeDamageInfo:IsDamageType",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.IsDamageType ).to.beA( "function" )
            end
        },

        {
            name = "Returns a boolean",
            func = function( state )
                local result = state.dmgInfo:IsDamageType( DMG_GENERIC )
                expect( result ).to.beA( "boolean" )
            end
        },

        {
            name = "Returns false by default when checking for a specific non-zero flag",
            func = function( state )
                local result = state.dmgInfo:IsDamageType( DMG_BULLET )
                expect( result ).to.beFalse()
            end
        },

        -- TODO: Is this expeced behavior?
        {
            name = "Returns FALSE by default when checking for DMG_GENERIC (0)",
            func = function( state )
                local result = state.dmgInfo:IsDamageType( DMG_GENERIC )
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns false when checking for an unset flag",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BLAST )

                local result = state.dmgInfo:IsDamageType( DMG_BULLET )
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns true when checking for a single set flag",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local result = state.dmgInfo:IsDamageType( DMG_BULLET )
                expect( result ).to.beTrue()
            end
        },

        {
            name = "Returns true when checking for a flag included in multiple set flags",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET + DMG_SLASH )
                local resultBullet = state.dmgInfo:IsDamageType( DMG_BULLET )
                expect( resultBullet ).to.beTrue()

                local resultSlash = state.dmgInfo:IsDamageType( DMG_SLASH )
                expect( resultSlash ).to.beTrue()
            end
        },

        {
            name = "Returns true when checking for multiple flags if at least one matches",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local result = state.dmgInfo:IsDamageType( DMG_BULLET + DMG_BLAST )
                expect( result ).to.beTrue()
            end
        },

        {
            name = "Returns false when checking for multiple flags if none match",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local result = state.dmgInfo:IsDamageType( DMG_BLAST + DMG_CLUB )
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Returns false when checking for DMG_GENERIC (0) if type is non-zero",
            func = function( state )
                state.dmgInfo:SetDamageType( DMG_BULLET )

                local result = state.dmgInfo:IsDamageType( DMG_GENERIC )
                expect( result ).to.beFalse()
            end
        },

        {
            name = "Errors when given a non-numeric argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:IsDamageType( "invalid" ) end
                expect( testFunc ).to.errWith( "bad argument #1 to 'IsDamageType' (number expected, got string)" )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:IsDamageType() end
                expect( testFunc ).to.errWith( "bad argument #1 to 'IsDamageType' (number expected, got no value)" )
            end
        }
    }
}

