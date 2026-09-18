--- @type GLuaTest_TestGroup
return {
    groupName = "string.gsub",

    cases = {
        {
            name = "Exists on the string table",
            func = function()
                expect( string.gsub ).to.beA( "function" )
            end
        },

        {
            name = "Replaces every match and returns the replacement count",
            func = function()
                local replaced, count = string.gsub( "hello world", "o", "0" )
                expect( replaced ).to.equal( "hell0 w0rld" )
                expect( count ).to.equal( 2 )
            end
        },

        {
            name = "Returns the original string with a zero count when nothing matches",
            func = function()
                local replaced, count = string.gsub( "hello", "z", "!" )
                expect( replaced ).to.equal( "hello" )
                expect( count ).to.equal( 0 )
            end
        },

        {
            name = "Stops after maxReplaces replacements",
            func = function()
                local replaced, count = string.gsub( "hello world", "o", "0", 1 )
                expect( replaced ).to.equal( "hell0 world" )
                expect( count ).to.equal( 1 )
            end
        },

        {
            name = "Substitutes captures for percent references in the replacement",
            func = function()
                local swapped = string.gsub( "key=value", "(%a+)=(%a+)", "%2=%1" )
                expect( swapped ).to.equal( "value=key" )

                local wrapped = string.gsub( "hello", "(l+)", "[%1]" )
                expect( wrapped ).to.equal( "he[ll]o" )
            end
        },

        {
            name = "Substitutes the whole match for percent zero",
            func = function()
                local wrapped = string.gsub( "abc", "b", "[%0]" )
                expect( wrapped ).to.equal( "a[b]c" )
            end
        },

        {
            name = "Produces a literal percent from a doubled percent",
            func = function()
                local withPercent = string.gsub( "50", "50", "100%%" )
                expect( withPercent ).to.equal( "100%" )
            end
        },

        {
            name = "Substitutes from a table replacement and keeps matches missing from it",
            func = function()
                local translated = string.gsub( "hello world", "%a+", { hello = "hola" } )
                expect( translated ).to.equal( "hola world" )
            end
        },

        {
            name = "Passes the match or its captures to a function replacement",
            func = function()
                local uppercased = string.gsub( "hello world", "%a+", string.upper )
                expect( uppercased ).to.equal( "HELLO WORLD" )

                local swapped = string.gsub( "a=1", "(%a)=(%d)", function( key, value )
                    return value .. "=" .. key
                end )
                expect( swapped ).to.equal( "1=a" )
            end
        },

        {
            name = "Replaces only the leading match for anchored patterns",
            func = function()
                local replaced, count = string.gsub( "aaa", "^a", "b" )
                expect( replaced ).to.equal( "baa" )
                expect( count ).to.equal( 1 )
            end
        },

        {
            name = "Keeps the original match when the replacement function returns nil or false",
            func = function()
                local viaNil = string.gsub( "abc", "%a", function() return nil end )
                expect( viaNil ).to.equal( "abc" )

                local viaFalse = string.gsub( "abc", "%a", function() return false end )
                expect( viaFalse ).to.equal( "abc" )
            end
        },

        {
            name = "Replaces empty matches at every position",
            func = function()
                local dashed, count = string.gsub( "abc", "x*", "-" )
                expect( dashed ).to.equal( "-a-b-c-" )
                expect( count ).to.equal( 4 )
            end
        },

        {
            name = "Coerces number arguments to strings",
            func = function()
                local replaced = string.gsub( 123, "2", "9" )
                expect( replaced ).to.equal( "193" )
            end
        },

        {
            name = "Errors on malformed patterns and invalid capture indices",
            func = function()
                expect( string.gsub, "abc", "%", "x" ).to.errWith( "malformed pattern (ends with '%')" )
                expect( string.gsub, "abc", "(a)", "%2" ).to.errWith( "invalid capture index" )
            end
        }
    }
}
