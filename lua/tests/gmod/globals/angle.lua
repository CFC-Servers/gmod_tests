return {
    groupName = "Global:Angle",
    cases = {
        --[[ Function Signature ]]--
        --#region
        {
            name = "Function exists globally",
            func = function()
                expect( Angle ).to.beA( "function" )
            end
        },{
            name = "Returns an Angle object",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle ).to.beA( "Angle" )
            end
        },
        --#endregion

        --[[ Pitch/Yaw/Roll Variable Equivalents ]]--
        --#region
        {
            name = "Pitch equivalents match input",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle[1] ).to.equal( 1 )
                expect( angle.x ).to.equal( 1 )
                expect( angle.p ).to.equal( 1 )
                expect( angle.pitch ).to.equal( 1 )
            end
        },{
            name = "Yaw equivalents match input",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle[2] ).to.equal( 2 )
                expect( angle.y ).to.equal( 2 )
                expect( angle.yaw ).to.equal( 2 )
            end
        },{
            name = "Roll equivalents match input",
            func = function()
                local angle = Angle( 1, 2, 3 )
                expect( angle[3] ).to.equal( 3 )
                expect( angle.z ).to.equal( 3 )
                expect( angle.r ).to.equal( 3 )
                expect( angle.roll ).to.equal( 3 )
            end
        },
        --#endregion

        --[[ Pitch/Yaw/Roll Constructor ]]--
        --#region
        {
            name = "Accepts decimals",
            func = function()
                local angle = Angle( 0.001, 80, 100.000 )
                expect( angle.pitch ).to.beBetween( 0.0009, 0.0011 )
                expect( angle.yaw   ).to.equal( 80 )
                expect( angle.roll  ).to.equal( 100 )
            end
        },{
            name = "Accepts negative values",
            func = function()
                local angle = Angle( -99, -0, 50 )
                expect( angle.pitch ).to.equal( -99 )
                expect( angle.yaw   ).to.equal( -0 )
                expect( angle.roll  ).to.equal( 50 )
            end
        },{
            name = "Accepts numerical strings",
            func = function()
                local angle = Angle( "5", "10", "15" )
                expect( angle.pitch ).to.equal( 5 )
                expect( angle.yaw   ).to.equal( 10 )
                expect( angle.roll  ).to.equal( 15 )
            end
        },{
            -- https://github.com/Facepunch/garrysmod-issues/issues/5922#issuecomment-2194156039
            name = "Nil pitch falls back to 0",
            func = function()
                local angle = Angle( nil, 10, 22 )
                expect( angle.pitch ).to.equal( 0 )
                expect( angle.yaw   ).to.equal( 10 )
                expect( angle.roll  ).to.equal( 22 )
            end
        },{
            -- https://github.com/Facepunch/garrysmod-issues/issues/5922#issuecomment-2194156039
            name = "Table pitch falls back to 0",
            func = function()
                local angle = Angle( { "test" }, 10, 22 )
                expect( angle.pitch ).to.equal( 0 )
                expect( angle.yaw   ).to.equal( 10 )
                expect( angle.roll  ).to.equal( 22 )
            end
        },{
            name = "Yaw falls back to 0",
            func = function()
                local nilYawAngle = Angle( 100, nil, 22 )
                expect( nilYawAngle.pitch ).to.equal( 100 )
                expect( nilYawAngle.yaw   ).to.equal( 0 )
                expect( nilYawAngle.roll  ).to.equal( 22 )

                local tableYawAngle = Angle( 100, {}, 22 )
                expect( tableYawAngle.pitch ).to.equal( 100 )
                expect( tableYawAngle.yaw   ).to.equal( 0 )
                expect( tableYawAngle.roll  ).to.equal( 22 )

                local nonNumberStringYawAngle = Angle( 100, "test", 22 )
                expect( nonNumberStringYawAngle.pitch ).to.equal( 100 )
                expect( nonNumberStringYawAngle.yaw   ).to.equal( 0 )
                expect( nonNumberStringYawAngle.roll  ).to.equal( 22 )
            end
        },{
            name = "Roll falls back to 0",
            func = function()
                local nilRollAngle = Angle( 100, 714, nil )
                expect( nilRollAngle.pitch ).to.equal( 100 )
                expect( nilRollAngle.yaw   ).to.equal( 714 )
                expect( nilRollAngle.roll  ).to.equal( 0 )

                local tableRollAngle = Angle( 100, 714, {} )
                expect( tableRollAngle.pitch ).to.equal( 100 )
                expect( tableRollAngle.yaw   ).to.equal( 714 )
                expect( tableRollAngle.roll  ).to.equal( 0 )

                local nonNumberStringRollAngle = Angle( 100, 714, "test" )
                expect( nonNumberStringRollAngle.pitch ).to.equal( 100 )
                expect( nonNumberStringRollAngle.yaw   ).to.equal( 714 )
                expect( nonNumberStringRollAngle.roll  ).to.equal( 0 )
            end
        },
        --#endregion

         --[[ Angle Copying Constructor ]]--
         --#region
         {
            name = "Copies other Angles",
            func = function()
                local angleToCopy = Angle( 0, 80, -100 )
                local angle = Angle( angleToCopy )
                expect( angle.pitch ).to.equal( 0 )
                expect( angle.yaw   ).to.equal( 80 )
                expect( angle.roll  ).to.equal( -100 )
            end
        },
        --#endregion

         --[[ Parse String Constructor ]]--
         --#region
         {
            name = "Parses String Angles",
            func = function()
                local positiveIntegerStringAngle = Angle( "5 10 22" )
                expect( positiveIntegerStringAngle.pitch ).to.equal( 5 )
                expect( positiveIntegerStringAngle.yaw   ).to.equal( 10 )
                expect( positiveIntegerStringAngle.roll  ).to.equal( 22 )

                local negativeIntegerStringAngle = Angle( "-5 -10 -22" )
                expect( negativeIntegerStringAngle.pitch ).to.equal( -5 )
                expect( negativeIntegerStringAngle.yaw   ).to.equal( -10 )
                expect( negativeIntegerStringAngle.roll  ).to.equal( -22 )
                
                local floatStringAngle = Angle( "0.2 9999.2 -1000" )
                expect( floatStringAngle.pitch ).to.beBetween( 0.19, 0.21 )
                expect( floatStringAngle.yaw   ).to.beBetween( 9999.19, 9999.21 )
                expect( floatStringAngle.roll  ).to.equal( -1000 )
            end
        },
        --#endregion

        --[[ Large and Small Number Handling ]]--
        --#region
        {
            name = "Accepts Very Large Positive Numbers",
            func = function()
                local largeAngle = Angle( math.huge, math.huge, math.huge )
                expect( largeAngle.pitch ).to.equal( math.huge )
                expect( largeAngle.yaw   ).to.equal( math.huge )
                expect( largeAngle.roll  ).to.equal( math.huge )
            end
        },{
            name = "Accepts Very Large Negative Numbers",
            func = function()
                local largeAngle = Angle( -math.huge, -math.huge, -math.huge )
                expect( largeAngle.pitch ).to.equal( -math.huge )
                expect( largeAngle.yaw   ).to.equal( -math.huge )
                expect( largeAngle.roll  ).to.equal( -math.huge )
            end
        },{
            name = "Accepts Very Small Positive Numbers",
            func = function()
                local smallAngle = Angle( 0.001, 0.0001, 0.00001 )
                expect( smallAngle.pitch ).to.beBetween( 0.0009, 0.0011 )
                expect( smallAngle.yaw   ).to.beBetween( 0.00009, 0.00011 )
                expect( smallAngle.roll  ).to.beBetween( 0.000009, 0.000011 )
            end
        },{
            name = "Accepts Very Small Negative Numbers",
            func = function()
                local smallAngle = Angle( -0.001, -0.0001, -0.00001 )
                expect( smallAngle.pitch ).to.beBetween( -0.0011, -0.0009 )
                expect( smallAngle.yaw   ).to.beBetween( -0.00011, -0.00009 )
                expect( smallAngle.roll  ).to.beBetween( -0.000011, -0.000009 )
            end
        },{
            name = "Combining Large, Positive Angles",
            func = function()
                local firstAngle = Angle( 99999999999999999999999999999999999999, 99999999999999999999999999999999999999, 99999999999999999999999999999999999999 )
                local secondAngle = Angle( 99999999999999999999999999999999999999, 99999999999999999999999999999999999999, 99999999999999999999999999999999999999 )
                local resultAngle = firstAngle + secondAngle

                expect( resultAngle.pitch ).to.beBetween( 1.9999999360570e+38, 1.9999999360572e+38 )
                expect( resultAngle.yaw   ).to.beBetween( 1.9999999360570e+38, 1.9999999360572e+38 )
                expect( resultAngle.roll  ).to.beBetween( 1.9999999360570e+38, 1.9999999360572e+38 )
            end
        },{
            name = "Combining Large, Negative Angles",
            func = function()

                local firstAngle = Angle( -99999999999999999999999999999999999999, -99999999999999999999999999999999999999, -99999999999999999999999999999999999999 )
                local secondAngle = Angle( -99999999999999999999999999999999999999, -99999999999999999999999999999999999999, -99999999999999999999999999999999999999 )
                local resultAngle = firstAngle + secondAngle

                expect( resultAngle.pitch ).to.beBetween( -1.9999999360572e+38, -1.9999999360570e+38 )
                expect( resultAngle.yaw   ).to.beBetween( -1.9999999360572e+38, -1.9999999360570e+38 )
                expect( resultAngle.roll  ).to.beBetween( -1.9999999360572e+38, -1.9999999360570e+38 )
            end
        },
        --#endregion
    }
}
