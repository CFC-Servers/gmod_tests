return {
    groupName = "Angle:Mul",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.Mul ).to.beA( "function" )
            end
        },

        {
            name = "Returns nothing",
            func = function()
                local a = Angle( 2, 2, 2 )

                local out = a:Mul( 2 )
                expect( out ).to.beNil()
            end
        },

        {
            name = "Modifies the base Angle",
            func = function()
                local a = Angle( 2, 2, 2 )

                a:Mul( 2 )

                local p1, y1, r1 = a[1], a[2], a[3]
                expect( p1 ).to.equal( 4 )
                expect( y1 ).to.equal( 4 )
                expect( r1 ).to.equal( 4 )
            end
        },

        {
            name = "Modifies the base Angle with a string scalar",
            func = function()
                local a = Angle( 2, 2, 2 )

                a:Mul( "2" )

                local p1, y1, r1 = a[1], a[2], a[3]
                expect( p1 ).to.equal( 4 )
                expect( y1 ).to.equal( 4 )
                expect( r1 ).to.equal( 4 )
            end
        },

        -- non numeric string
        {
            name = "Does not modify the Angle with a non numeric string",
            func = function()
                local a = Angle( 2, 2, 2 )

                local function test()
                    a:Mul( "a" )
                end

                expect( test ).to.errWith( [[bad argument #1 to 'Mul' (number expected, got string)]] )
            end
        }
    }
}
