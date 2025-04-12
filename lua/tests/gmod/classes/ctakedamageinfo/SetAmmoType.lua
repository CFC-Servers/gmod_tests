return {
    groupName = "CTakeDamageInfo:SetAmmoType",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.SetAmmoType ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing (nil)",
            func = function( state )
                local result = state.dmgInfo:SetAmmoType( 1 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Sets ammo type ID correctly (positive)",
            func = function( state )
                local expectedType = 5

                state.dmgInfo:SetAmmoType( expectedType )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( expectedType )
            end
        },

        {
            name = "Sets ammo type ID correctly (zero)",
            func = function( state )
                local expectedType = 0

                state.dmgInfo:SetAmmoType( expectedType )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( expectedType )
            end
        },

        {
            name = "Sets ammo type ID correctly (negative)",
            func = function( state )
                local expectedType = -1

                state.dmgInfo:SetAmmoType( expectedType )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( expectedType )
            end
        },

        {
            name = "Floors input when given decimals",
            func = function( state )
                state.dmgInfo:SetAmmoType( 3.1 )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( 3 )

                state.dmgInfo:SetAmmoType( 3.9 )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( 3 )
            end
        },


        {
            name = "Overwrites previously set ammo type ID",
            func = function( state )
                state.dmgInfo:SetAmmoType( 10 )

                local expectedType = 20
                state.dmgInfo:SetAmmoType( expectedType )

                expect( state.dmgInfo:GetAmmoType() ).to.equal( expectedType )
            end
        },

        {
            name = "Succeeds when given a numeric string",
            func = function( state )
                local expectedType = 42

                state.dmgInfo:SetAmmoType( tostring( expectedType ) )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( expectedType )
            end
        },

        {
            name = "Underflows when given math.huge",
            func = function( state )
                state.dmgInfo:SetAmmoType( math.huge )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( -2147483648 )
            end
        },

        {
            name = "Underflows when given -math.huge",
            func = function( state )
                state.dmgInfo:SetAmmoType( -math.huge )
                expect( state.dmgInfo:GetAmmoType() ).to.equal( -2147483648 )
            end
        },

        {
            name = "Errors when given a non-numeric string",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetAmmoType( "invalid" ) end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetAmmoType' (number expected, got string)]] )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:SetAmmoType() end
                expect( testFunc ).to.errWith( [[bad argument #1 to 'SetAmmoType' (number expected, got no value)]] )
            end
        }
    }
}

