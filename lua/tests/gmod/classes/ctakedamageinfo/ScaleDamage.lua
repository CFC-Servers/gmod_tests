return {
    groupName = "CTakeDamageInfo:ScaleDamage",

    beforeEach = function( state )
        state.initialDamage = 100

        state.dmgInfo = DamageInfo()
        state.dmgInfo:SetDamage( state.initialDamage )
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.ScaleDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function( state )
                local result = state.dmgInfo:ScaleDamage( 2 )
                expect( result ).to.beNil()
            end
        },

        {
            name = "Scales damage up",
            func = function( state )
                local scale = 1.5

                state.dmgInfo:ScaleDamage( scale )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage * scale )
            end
        },

        {
            name = "Scales damage down",
            func = function( state )
                local scale = 0.75

                state.dmgInfo:ScaleDamage( scale )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage * scale )
            end
        },

        {
            name = "Damage remains unchanged",
            func = function( state )
                local scale = 1

                state.dmgInfo:ScaleDamage( scale )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage * scale )
            end
        },

        {
            name = "Scales damage to zero",
            func = function( state )
                local scale = 0

                state.dmgInfo:ScaleDamage( scale )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage * scale )
            end
        },

        {
            name = "Scales negatively",
            func = function( state )
                local scale = -2

                state.dmgInfo:ScaleDamage( scale )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage * scale )
            end
        },

        {
            name = "Succeeds when given a numeric string",
            func = function( state )
                local scale = 2

                state.dmgInfo:ScaleDamage( tostring( scale ) )
                expect( state.dmgInfo:GetDamage() ).to.equal( state.initialDamage * scale )
            end
        },


        {
            name = "Errors when given a non-numeric string",
            func = function( state )
                local testFunc = function() state.dmgInfo:ScaleDamage( "invalid" ) end
                expect( testFunc ).to.errWith( "bad argument #1 to 'ScaleDamage' (number expected, got string)" )
            end
        },

        {
            name = "Errors when given no argument",
            func = function( state )
                local testFunc = function() state.dmgInfo:ScaleDamage() end
                expect( testFunc ).to.errWith( "bad argument #1 to 'ScaleDamage' (number expected, got no value)" )
            end
        }
    }
}

