return {
    groupName = "Angle:IsEqualTol",

    cases = {
        {
            name = "Exists on the Angle meta table",
            func = function()
                local meta = FindMetaTable( "Angle" )
                expect( meta.IsEqualTol ).to.beA( "function" )
            end
        },

        {
            name = "Returns a boolean",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 0, 0, 0 )

                local out = a:IsEqualTol( b, 0 )
                expect( out ).to.beA( "boolean" )
            end
        },

        {
            name = "Returns true when the Angles are equal",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 0, 0, 0 )

                local out = a:IsEqualTol( b, 0 )
                expect( out ).to.beTrue()
            end
        },

        {
            name = "Returns false when the Angles are not equal",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 1, 1, 1 )

                local out = a:IsEqualTol( b, 0 )
                expect( out ).to.beFalse()
            end
        },

        {
            name = "Returns true when the Angles are within the tolerance",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 0.1, 0.1, 0.1 )

                local out = a:IsEqualTol( b, 0.1 )
                expect( out ).to.beTrue()
            end
        },

        {
            name = "Returns false when the Angles are not within the tolerance",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 0.1, 0.1, 0.1 )

                local out = a:IsEqualTol( b, 0 )
                expect( out ).to.beFalse()
            end
        },

        {
            name = "Does not modify the Angles",
            func = function()
                local a = Angle( 1, 1, 1 )
                local b = Angle( 1, 1, 1 )

                a:IsEqualTol( b, 0 )

                local p1, y1, r1 = a[1], a[2], a[3]
                expect( p1 ).to.equal( 1 )
                expect( y1 ).to.equal( 1 )
                expect( r1 ).to.equal( 1 )

                local p2, y2, r2 = b[1], b[2], b[3]
                expect( p2 ).to.equal( 1 )
                expect( y2 ).to.equal( 1 )
                expect( r2 ).to.equal( 1 )
            end
        },

        {
            name = "Works when given a numeric string for the tolerance",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 0.1, 0.1, 0.1 )

                local out = a:IsEqualTol( b, "0.1" )
                expect( out ).to.beTrue()
            end
        },

        {
            name = "Errors when given a non-numeric string for the tolerance",
            func = function()
                local a = Angle( 0, 0, 0 )
                local b = Angle( 0.1, 0.1, 0.1 )

                local test = function()
                    a:IsEqualTol( b, "a" )
                end

                expect( test ).to.errWith( [[bad argument #2 to 'IsEqualTol' (number expected, got string)]] )
            end
        }
    }
}
