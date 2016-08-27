#include <YSI_Coding\y_hooks>

#define USER_DB_FILE "_core/system/users.ini"
#define USER_ACCOUNT_FILE "_core/user_accounts/%i.ini"
#define uP[%0] getUserPath(%0)

new USER_ID[ MAX_PLAYERS ];

loadtext mode_lang[form],mode_lang[auth];

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
	/* USER_ID Part */
	if( DOF2_IsSet( USER_DB_FILE , GetName( playerid ) , "Users" ) )
	{
	    USER_ID[ playerid ] = getUserID( playerid );
	}else{
	    USER_ID[ playerid ] = addUserID( playerid );
	}
	/* USER_LOCALE Part */
	if( !IsNameHasLocale( playerid ) )
	{
	    inline LocaleResponse(pid, dialogid, response, listitem, string:text0[])
	    {
	        #pragma unused pid,dialogid,text0
	        if( response )
	        {
				switch( listitem )
				{
				    case 0:setUserLocale( playerid ,Czech);
				    case 1:setUserLocale( playerid ,English);
				}
	        }else{
	            Text_ListBox( playerid , using inline LocaleResponse , "Choose localization/Výber lokalizace","Cesky - Czech\nAnglicky - English", "OK" , ":(" );
	        }
	    }
	    Text_ListBox( playerid , using inline LocaleResponse , "Choose localization/Výber lokalizace","Cesky - Czech\nAnglicky - English", "OK" , ":(" );
	}else{
	    getUserLocale( playerid );
	}
	/* User Account Part */
	if( !fexist( getUserPath( playerid ) ) )
	{
	    inline RegisterResponse(pid, dialogid, response, listitem, string:text0[])
	    {
			#pragma unused pid,dialogid,listitem
			if(response)
			{
			    if( IS_IN_RANGE(strlen(text0),4,16) ) 
			    {
			        DOF2_CreateFile( getUserPath(playerid),text0);
			        DOF2_SetString( uP[playerid] , "IP", GetIP(playerid), "Main" );
			        DOF2_SetInt( uP[playerid] , "Autologin", 1, "Config" );
			        DOF2_SaveFile();
			        Text_Send( playerid , $WELCOME_MESSAGE );
			    }else{
			        Text_Send( playerid , $PASSWORD_LENGHT , 4,16);
			        Text_PasswordBox( playerid ,  using inline RegisterResponse , $HEADER_REGISTER , $REGISTER_BODY , $BUTTON_NEXT , $BUTTON_CLOSE );
			    }
			}else{
			
			}
	    }
	    Text_PasswordBox( playerid ,  using inline RegisterResponse , $HEADER_REGISTER , $REGISTER_BODY , $BUTTON_NEXT , $BUTTON_CLOSE );
	}else{
		inline LoginResponse(pid, dialogid, response, listitem, string:text0[])
	    {
  			#pragma unused pid,dialogid,listitem
			if(response)
			{
			    if( IS_IN_RANGE(strlen(text0),4,16) )
			    {
					if( DOF2_CheckLogin( uP[playerid],text0) )
					{
					    proceedToLogin( playerid );
					}else{
					    Text_Send( playerid , $INCORRECT_PASS , 4,16);
			        	Text_PasswordBox( playerid ,  using inline LoginResponse , $HEADER_LOGIN , $LOGIN_BODY , $BUTTON_NEXT , $BUTTON_CLOSE );
					}
			    }else{
			        Text_Send( playerid , $PASSWORD_LENGHT , 4,16);
			        Text_PasswordBox( playerid ,  using inline LoginResponse , $HEADER_LOGIN , $LOGIN_BODY , $BUTTON_NEXT , $BUTTON_CLOSE );
			    }
			}
	    }
	    Text_PasswordBox( playerid ,  using inline LoginResponse , $HEADER_LOGIN , $LOGIN_BODY , $BUTTON_NEXT , $BUTTON_CLOSE );
	}
	return 1;
}

hook OnPlayerDisconnect( playerid , reason )
{
	return 1;
}



stock ShowRegisterForm( playerid )
{

}

stock getUserPath( playerid )
{
	new path[32];
	format( path , 32 , USER_ACCOUNT_FILE , USER_ID[ playerid ] );
	return path;
}

stock addUserID( playerid )
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


stock proceedToLogin( playerid )
{

}


stock LoadKey( key[] )
{


}
