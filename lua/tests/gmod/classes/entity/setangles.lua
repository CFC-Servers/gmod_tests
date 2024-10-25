return WithTestEntity( {
    groupName = "Entity:SetAngles",

    cases = {
        {
            name = "Exists on the Entity metatable",
            func = function()
                local meta = FindMetaTable( "Entity" )
                expect( meta.SetAngles ).to.beA( "function" )
            end
        },

        {
            name = "Sets the angles of the Entity",
            func = function( state )
                local ent = state.ent

                local currentAngle = ent:GetAngles()
                local newAngle = Angle( 0, 90, 0 )
                expect( currentAngle:IsEqualTol( newAngle, 0 ) ).to.beFalse()

                ent:SetAngles( newAngle )
                expect( ent:GetAngles() ).to.equal( newAngle )
            end
        },

        {
            name = "Ignores massively large angles",
            func = function( state )
                local ent = state.ent

                local currentAngle = ent:GetAngles()
                local newAngle = Angle( 99999996802856924650656260769173209088, 99999996802856924650656260769173209088, 99999996802856924650656260769173209088 )

                ent:SetAngles( newAngle )
                expect( ent:GetAngles() ).to.equal( currentAngle )
            end
        },

        {
            name = "Ignores massively small angles",
            func = function( state )
                local ent = state.ent

                local currentAngle = ent:GetAngles()
                local newAngle = Angle( -99999996802856924650656260769173209088, -99999996802856924650656260769173209088, -99999996802856924650656260769173209088 )

                ent:SetAngles( newAngle )
                expect( ent:GetAngles() ).to.equal( currentAngle )
            end
        },
    }
} )

