return {
    groupName = "CTakeDamageInfo:GetDamage",

    beforeEach = function( state )
        state.dmgInfo = DamageInfo()
    end,

    cases = {
        {
            name = "Exists on the CTakeDamageInfo metatable",
            func = function( state )
                local meta = debug.getmetatable( state.dmgInfo )
                expect( meta.GetDamage ).to.beA( "function" )
            end
        },

        {
            name = "Returns a number",
            func = function( state )
                local damage = state.dmgInfo:GetDamage()
                expect( damage ).to.beA( "number" )
            end
        },

        {
            name = "Returns 0 by default",
            func = function( state )
                local damage = state.dmgInfo:GetDamage()
                expect( damage ).to.equal( 0 )
            end
        },

        {
            name = "Returns the value set directly by SetDamage",
            func = function( state )
                local expectedDamage = 60
                state.dmgInfo:SetDamage( expectedDamage )
                local actualDamage = state.dmgInfo:GetDamage()
                expect( actualDamage ).to.equal( expectedDamage )
            end
        },

        {
            name = "Reflects modifications from AddDamage",
            func = function( state )
                state.dmgInfo:SetDamage( 20 )
                state.dmgInfo:AddDamage( 10 )
                local actualDamage = state.dmgInfo:GetDamage()
                expect( actualDamage ).to.equal( 30 )
            end
        },

        {
            name = "Reflects modifications from SubtractDamage",
            func = function( state )
                state.dmgInfo:SetDamage( 20 )
                state.dmgInfo:SubtractDamage( 5 )
                local actualDamage = state.dmgInfo:GetDamage()
                expect( actualDamage ).to.equal( 15 )
            end
        },

        {
            name = "Reflects modifications from ScaleDamage",
            func = function( state )
                state.dmgInfo:SetDamage( 20 )
                state.dmgInfo:ScaleDamage( 1.5 )
                local actualDamage = state.dmgInfo:GetDamage()
                expect( actualDamage ).to.equal( 30 )
            end
        },

        {
            name = "Value set directly by SetDamage is NOT affected by skill level",
            func = function( state )
                state.originalSkill = game.GetSkillLevel()
                local expectedDamage = 55

                game.SetSkillLevel( 1 )
                state.dmgInfo:SetDamage( expectedDamage )
                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
                expect( game.GetSkillLevel() ).to.equal( 1 )

                game.SetSkillLevel( 2 )
                state.dmgInfo:SetDamage( expectedDamage )
                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
                expect( game.GetSkillLevel() ).to.equal( 2 )

                game.SetSkillLevel( 3 )
                state.dmgInfo:SetDamage( expectedDamage )
                expect( state.dmgInfo:GetDamage() ).to.equal( expectedDamage )
                expect( game.GetSkillLevel() ).to.equal( 3 )
            end,
            cleanup = function( state )
                if state.originalSkill then
                    game.SetSkillLevel( state.originalSkill )
                end
            end
        }
    }
}

