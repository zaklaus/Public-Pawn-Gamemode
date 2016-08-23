#include <YSI_Coding\y_hooks>

#define USER_DB_FILE "_core/system/users.ini"
#define USER_ACCOUNT_FILE "_core/user_accounts/%i.ini"

new USER_ID[ MAX_PLAYERS ];

hook OnGameModeInit()
{
	if( !fexist( USER_DB_FILE ) )
	{
	    DOF2_CreateFile( USER_DB_FILE );
	    DOF2_SetInt( USER_DB_FILE , "USER_ID", 0 , "SYSTEM" );
	    DOF2_SaveFile();
	}
	return 1;
}

hook OnPlayerConnect( playerid )
{
	if( DOF2_IsSet( USER_DB_FILE , GetName( playerid ) , "Users" ) )
	{
	    USER_ID[ playerid ] = getUserID( playerid );
	    print("EXISTING USER");
	}else{
	    USER_ID[ playerid ] = addUser( playerid );
	    print("NEW USER");
	}
	
	if( !fexist( getUserPath( playerid ) ) )
	{
	
	}else{
	
	}
	return 1;
}

hook OnPlayerDisconnect( playerid , reason )
{


	return 1;
}



stock getUserPath( playerid )
{
	new path[32];
	format( path , 32 , USER_ACCOUNT_FILE , USER_ID[ playerid ] );
	return path;
}
stock addUser( playerid )
{
	new id = updateUserID();
	DOF2_SetInt( USER_DB_FILE , GetName( playerid ) , id , "Users" );
	DOF2_SaveFile();
	return id;
}

stock updateUserID()
{
	new actualid = DOF2_GetInt( USER_DB_FILE , "USER_ID") + 1;
    DOF2_SetInt( USER_DB_FILE , "USER_ID" , actualid , "SYSTEM" );
    DOF2_SaveFile();
    return actualid;
}

stock getUserID( playerid )
{
    return DOF2_GetInt( USER_DB_FILE ,  GetName( playerid ) , "Users" );
}
