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

                expect( a:IsFlagSet( FCVAR_GAMEDLL ) ).to.beTrue()
                expect( a:IsFlagSet( FCVAR_LUA_SERVER ) ).to.beTrue()
                expect( a:IsFlagSet( FCVAR_DEMO ) ).to.beTrue()

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

        {
            name = "FCVAR_AVAILABLE2 is present (x86-64)",
            when = IS_64BIT_BRANCH,
            func = function()
                local a = GetTestConVar()
                expect( a:IsFlagSet( FCVAR_AVAILABLE2 ) ).to.beTrue()
            end
        },

        {
            name = "FCVAR_AVAILABLE2 is not present (base)",
            when = IS_BASE_BRANCH,
            func = function()
                local a = GetTestConVar()
                expect( a:IsFlagSet( FCVAR_AVAILABLE2 ) ).to.beFalse()
            end
        },
    }
}
