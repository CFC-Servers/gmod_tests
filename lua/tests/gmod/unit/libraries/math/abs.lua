return {
    groupName = "math.abs",

    cases = {
        {
            name = "Returns the same value if it is positive",
            func = function()
                expect( math.abs( 5 ) ).to.equal( 5 )
            end
        },

        {
            name = "Returns the positive value if it is negative",
            func = function()
                expect( math.abs( -5 ) ).to.equal( 5 )
            end
        },

        {
            name = "Works on string-numbers",
            func = function()
                expect( math.abs( "-5" ) ).to.equal( 5 )
            end
        },

        {
            name = "Fails if given a non-number string",
            func = function()
                expect( math.abs, "blah" ).to.errWith( [[bad argument #1 to '?' (number expected, got string)]] )
            end
        },

        {
            name = "Fails if given nil",
            func = function()
                expect( math.abs, nil ).to.errWith( [[bad argument #1 to '?' (number expected, got no value)]] )
            end
        },
    }
}
