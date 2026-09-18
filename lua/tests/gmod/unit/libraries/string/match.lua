--- @type GLuaTest_TestGroup
return {
    groupName = "string.match",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.match ).to.beA( "function" )
            end
        },

        {
            name = "Returns the whole match when the pattern has no captures",
            func = function()
                local digits = string.match( "abc123def", "%d+" )
                expect( digits ).to.equal( "123" )
            end
        },

        {
            name = "Returns nil when there is no match",
            func = function()
                local missing = string.match( "abc", "%d" )
                expect( missing ).to.beNil()
            end
        },

        {
            name = "Matches the letter, digit, and space classes",
            func = function()
                local letters = string.match( "  abc123", "%a+" )
                expect( letters ).to.equal( "abc" )

                local digits = string.match( "abc123", "%d+" )
                expect( digits ).to.equal( "123" )

                local spaces = string.match( "ab \t\ncd", "%s+" )
                expect( spaces ).to.equal( " \t\n" )
            end
        },

        {
            name = "Matches the alphanumeric, punctuation, and control classes",
            func = function()
                local alnum = string.match( "!!a1b2??", "%w+" )
                expect( alnum ).to.equal( "a1b2" )

                local punct = string.match( "ab!?.cd", "%p+" )
                expect( punct ).to.equal( "!?." )

                local control = string.match( "ab\1\2cd", "%c+" )
                expect( control ).to.equal( "\1\2" )
            end
        },

        {
            name = "Matches the case and hexadecimal classes",
            func = function()
                local upper = string.match( "abCDef", "%u+" )
                expect( upper ).to.equal( "CD" )

                local lower = string.match( "ABcdEF", "%l+" )
                expect( lower ).to.equal( "cd" )

                local hex = string.match( "xyz19afXYZ", "%x+" )
                expect( hex ).to.equal( "19af" )
            end
        },

        {
            name = "Matches complement classes as everything outside the class",
            func = function()
                local notLetters = string.match( "abc123 def", "%A+" )
                expect( notLetters ).to.equal( "123 " )

                local notDigits = string.match( "12ab cd34", "%D+" )
                expect( notDigits ).to.equal( "ab cd" )

                local notSpaces = string.match( "  abc12  ", "%S+" )
                expect( notSpaces ).to.equal( "abc12" )
            end
        },

        {
            name = "Repeats greedily with star and plus",
            func = function()
                local greedy = string.match( "aaa", "a*" )
                expect( greedy ).to.equal( "aaa" )

                local plus = string.match( "baaa", "a+" )
                expect( plus ).to.equal( "aaa" )

                local starOnEmpty = string.match( "bbb", "a*" )
                expect( starOnEmpty ).to.equal( "" )
            end
        },

        {
            name = "Repeats lazily with minus",
            func = function()
                local lazy = string.match( "<a><b>", "<(.-)>" )
                expect( lazy ).to.equal( "a" )

                local greedyContrast = string.match( "<a><b>", "<(.*)>" )
                expect( greedyContrast ).to.equal( "a><b" )
            end
        },

        {
            name = "Matches at most one occurrence with the question mark",
            func = function()
                local present = string.match( "color", "colou?r" )
                expect( present ).to.equal( "color" )

                local absent = string.match( "colour", "colou?r" )
                expect( absent ).to.equal( "colour" )
            end
        },

        {
            name = "Matches characters listed in a set",
            func = function()
                local fromSet = string.match( "xyzabc", "[abc]+" )
                expect( fromSet ).to.equal( "abc" )

                local fromRange = string.match( "XYZmno123", "[a-z]+" )
                expect( fromRange ).to.equal( "mno" )

                local mixed = string.match( "hello_world99", "[%a_]+" )
                expect( mixed ).to.equal( "hello_world" )
            end
        },

        {
            name = "Excludes characters with a negated set",
            func = function()
                local untilComma = string.match( "abc,def", "[^,]+" )
                expect( untilComma ).to.equal( "abc" )
            end
        },

        {
            name = "Anchors matches with caret and dollar",
            func = function()
                local anchoredStart = string.match( "abc", "^ab" )
                expect( anchoredStart ).to.equal( "ab" )

                local failedStart = string.match( "zabc", "^ab" )
                expect( failedStart ).to.beNil()

                local anchoredEnd = string.match( "abc", "bc$" )
                expect( anchoredEnd ).to.equal( "bc" )

                local failedEnd = string.match( "abcz", "bc$" )
                expect( failedEnd ).to.beNil()

                local exact = string.match( "abc", "^abc$" )
                expect( exact ).to.equal( "abc" )
            end
        },

        {
            name = "Returns each capture in order",
            func = function()
                local key, value = string.match( "name=Garry", "(%a+)=(%a+)" )
                expect( key ).to.equal( "name" )
                expect( value ).to.equal( "Garry" )
            end
        },

        {
            name = "Orders nested captures by their opening parenthesis",
            func = function()
                local outer, inner = string.match( "abc", "((a)bc)" )
                expect( outer ).to.equal( "abc" )
                expect( inner ).to.equal( "a" )
            end
        },

        {
            name = "Returns a number for position captures",
            func = function()
                local position = string.match( "abcdef", "cd()" )
                expect( position ).to.equal( 5 )
            end
        },

        {
            name = "Matches NUL bytes with the z class",
            func = function()
                local nul = string.match( "a\0b", "%z" )
                expect( nul ).to.equal( "\0" )
            end
        },

        {
            name = "Matches back-references to earlier captures",
            func = function()
                local repeated = string.match( "hello hello", "(%a+) %1" )
                expect( repeated ).to.equal( "hello" )

                local noRepeat = string.match( "hello world", "(%a+) %1" )
                expect( noRepeat ).to.beNil()
            end
        },

        {
            name = "Matches balanced pairs with percent b",
            func = function()
                local balanced = string.match( "x(a(b)c)y", "%b()" )
                expect( balanced ).to.equal( "(a(b)c)" )

                local unbalanced = string.match( "x(abc", "%b()" )
                expect( unbalanced ).to.beNil()
            end
        },

        {
            name = "Matches transitions with the frontier pattern",
            func = function()
                local word = string.match( "THE (quick) fox", "%f[%a]%a+%f[%A]" )
                expect( word ).to.equal( "THE" )
            end
        },

        {
            name = "Treats escaped magic characters as literals",
            func = function()
                local dot = string.match( "a.c", "%." )
                expect( dot ).to.equal( "." )

                local percent = string.match( "100%", "%%" )
                expect( percent ).to.equal( "%" )

                local bracket = string.match( "a[b]c", "%[b%]" )
                expect( bracket ).to.equal( "[b]" )
            end
        },

        {
            name = "Starts matching from the startPosition argument",
            func = function()
                local second = string.match( "abcabc", "abc", 2 )
                expect( second ).to.equal( "abc" )

                local fromNegative = string.match( "abcdef", "%a+", -2 )
                expect( fromNegative ).to.equal( "ef" )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local digits = string.match( 12345, "%d+" )
                expect( digits ).to.equal( "12345" )
            end
        },

        {
            name = "Errors on malformed patterns",
            func = function()
                expect( string.match, "abc", "%" ).to.errWith( "malformed pattern (ends with '%')" )
            end
        }
    }
}
