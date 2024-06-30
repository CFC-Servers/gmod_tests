return {
    groupName = "ConVar:IsFlagSet",

    cases = {
        {
            name = "Exists on the ConVar meta table",
            func = function()
                local meta = FindMetaTable( "ConVar" )
                expect( meta.IsFlagSet ).to.beA( "function" )
            end
        },

        {
            name = "Returns the right value",
            func = function()
                local a = GetTestConVar()

                -- NOTE: The names could be wrong. I took them from here: https://github.com/RaphaelIT7/obsolete-source-engine/blob/gmod/public/tier1/iconvar.h#L41
                local FCVAR_DEVELOPMENTONLY = bit.lshift(1, 1)
                local FCVAR_HIDDEN = bit.lshift(1, 4)
                local FCVAR_INTERNAL_USE = bit.lshift(1, 15)
                local FCVAR_RELOAD_MATERIALS = bit.lshift(1, 20)
                local FCVAR_RELOAD_TEXTURES = bit.lshift(1, 21)
                local FCVAR_MATERIAL_SYSTEM_THREAD = bit.lshift(1, 23)
                local FCVAR_ACCESSIBLE_FROM_THREADS = bit.lshift(1, 25)
                local FCVAR_AVAILABLE1 = bit.lshift(1, 26)
                local FCVAR_AVAILABLE2 = bit.lshift(1, 27)

                expect( a:IsFlagSet( FCVAR_GAMEDLL ) ).to.beTrue()
                expect( a:IsFlagSet( FCVAR_LUA_SERVER ) ).to.beTrue()
                expect( a:IsFlagSet( FCVAR_DEMO ) ).to.beTrue()

                if IS_64BIT_BRANCH then
                	expect( a:IsFlagSet( FCVAR_AVAILABLE2 ) ).to.beTrue()
                else
                	expect( a:IsFlagSet( FCVAR_AVAILABLE2 ) ).to.beFalse()
                end

                expect( a:IsFlagSet( FCVAR_UNREGISTERED ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_DEVELOPMENTONLY ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_CLIENTDLL ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_HIDDEN ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_PROTECTED ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_SPONLY ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_ARCHIVE ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_NOTIFY ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_USERINFO ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_PRINTABLEONLY ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_UNLOGGED ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_NEVER_AS_STRING ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_REPLICATED ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_CHEAT ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_INTERNAL_USE ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_DONTRECORD ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_LUA_CLIENT ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_UNREGISTERED ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_RELOAD_MATERIALS ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_RELOAD_TEXTURES ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_NOT_CONNECTED ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_MATERIAL_SYSTEM_THREAD ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_ARCHIVE_XBOX ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_ACCESSIBLE_FROM_THREADS ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_AVAILABLE1 ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_SERVER_CAN_EXECUTE ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_SERVER_CANNOT_QUERY ) ).to.beFalse()
                expect( a:IsFlagSet( FCVAR_CLIENTCMD_CAN_EXECUTE ) ).to.beFalse()
            end
        },
    }
}