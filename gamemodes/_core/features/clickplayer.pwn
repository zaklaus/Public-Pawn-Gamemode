#file "Clicked"
#include <YSI_Coding\y_hooks>

loadtext mode_lang[form],mode_lang[clicked];

new DIALOG_BY_LEVEL[][] = {
    "Poslat SMS",
	"Poslat SMS\nGet\nGoto\nKick",
	"Poslat SMS\nGet\nGoto\nKick\nBan\nTBan",
	"Poslat SMS\nGet\nGoto\nKick\nBan\nTBan",
	"Poslat SMS\nGet\nGoto\nKick\nBan\nTBan\nUpravit"
};


hook OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if( source == 0)//just for sure
	{
	    SetPVarInt( playerid , "WORKING_CLICKEDID" , clickedplayerid );

	    inline PlayerClickPlayer(pid, dialogid, response, listitem, string:text0[])
	    {
			#pragma unused pid,dialogid,text0
			if( response )
			{
			    switch( listitem )
			    {
			        case 0://SMS
			        {
			        
			        }
			    
			    }
			}

		}
		Dialog_ShowCallback( playerid , using inline PlayerClickPlayer , DIALOG_STYLE_LIST , "Choose option/Vyber mo�nost"  ,DIALOG_BY_LEVEL[getAdmin(playerid )], "Ok" , ":(" );
	}
	return 1;
}

