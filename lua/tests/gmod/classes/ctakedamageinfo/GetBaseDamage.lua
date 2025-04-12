return {
    groupName = "CTakeDamageInfo:GetBaseDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetBaseDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function( state )
                local baseDamage = state.dmgInfo:GetBaseDamage()
                expect( baseDamage ).to.beA( "number" )
            end
        },

        {
            name = "Returns 0 by default",
            func = function( state )
                local baseDamage = state.dmgInfo:GetBaseDamage()
                expect( baseDamage ).to.equal( 0 )
            end
        },

        {
            name = "Returns the value set by SetBaseDamage",
            func = function( state )
                local expectedDamage = 50
                state.dmgInfo:SetBaseDamage( expectedDamage )

                local actualDamage = state.dmgInfo:GetBaseDamage()
                expect( actualDamage ).to.equal( expectedDamage )
            end
        },

        {
            name = "Returns the set value regardless of skill level (Easy, Normal, Hard)",
            func = function( state )
                state.originalSkill = game.GetSkillLevel()

                local expectedDamage = 90
                state.dmgInfo:SetBaseDamage( expectedDamage )

                game.SetSkillLevel( 1 )
                local actualDamageEasy = state.dmgInfo:GetBaseDamage()
                expect( actualDamageEasy ).to.equal( expectedDamage )
                expect( game.GetSkillLevel() ).to.equal( 1 )

                game.SetSkillLevel( 2 )
                local actualDamageNormal = state.dmgInfo:GetBaseDamage()
                expect( actualDamageNormal ).to.equal( expectedDamage )
                expect( game.GetSkillLevel() ).to.equal( 2 )

                game.SetSkillLevel( 3 )
                local actualDamageHard = state.dmgInfo:GetBaseDamage()
                expect( actualDamageHard ).to.equal( expectedDamage )
                expect( game.GetSkillLevel() ).to.equal( 3 )
            end,

            cleanup = function( state )
                game.SetSkillLevel( state.originalSkill )
            end
        }
    }
}

