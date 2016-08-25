#include <YSI_Coding\y_hooks>

/* Domyslet co jsi stim vlastnì chtìl dìlat
stock addBankType(
*/

#define MAX_MAIN_BANKS ( 3 )
#define MAX_ATM ( 45 )

#define ATM_OBJECT (19526)
#define MONEY_ICON (1274)

new BankSkins[] = {147,148,150,187};

enum BANK_INFO
{
	Float:bX,Float:bY,Float:bZ
	bType
}

enum ATM_INFO
{
	Float:aX,Float:aY,Float:aZ
	aType
}

new Bank[ MAX_MAIN_BANKS ][ BANK_INFO ];
new BankActor[ MAX_MAIN_BANKS ];
new ATM[ MAX_ATM ][ ATM_INFO ];
new bCount,aCount;

new Banks[][36] = {
	{"International Bank of Las Venturas"},
	{"Banco de la Los Santos"},
	{"Central bank of San Fiero"}
}

stock addBank( Float:X, Float:Y, Float:Z , Float:Rotation , type )
{
	if( bCount <= MAX_MAIN_BANKS )
	{
	    Bank[ bCount ][ bX ] = X;
	    Bank[ bCount ][ bY ] = Y;
	    Bank[ bCount ][ bZ ] = Z;
	    Bank[ bCount ][ bType ] = type;
	    bCount++;
	}
	
	new text[128];
	format(text, 128, "%s\nStiskni {FF00FF}\"{0000FF}L.ALT{FF00FF}\"\n{FFFFFF}Press {FF00FF}\"{0000FF}L.ALT{FF00FF}",Banks[type]);
	Create3DTextLabel("[bank]", 0xFFFFFF00, X, Y, Z, 30.0, -1, 1);
	BankActor[bCount] = CreateActor( random(sizeof(BankSkins-1) ), X,Y,Z,Rotation);
	
}

stock addATM( Float:X, Float:Y, Float:Z , Float:Rx,Float:Ry,Float:Rz , type )
{
	if( aCount <= MAX_ATM )
	{
	    ATM[ aCount ][ aX ] = X;
	    ATM[ aCount ][ aY ] = Y;
	    ATM[ aCount ][ aZ ] = Z;
	    ATM[ aCount ][ aType ] = type;
	    aCount++;
	}
	CreateObject( ATM_OBJECT , X, Y, Z, Rx,Ry,Rz);
	new text[128];
	format(text, 128, "%s\nStiskni {FF00FF}\"{0000FF}L.ALT{FF00FF}\"\n{FFFFFF}Press {FF00FF}\"{0000FF}L.ALT{FF00FF}",Banks[type]);
	Create3DTextLabel("[bank]", 0xFFFFFF00, X, Y, Z, 30.0, -1, 1);
}

stock getBankID( playerid )
{
	for(new i;i <= bCount;i++)
	{
	    if( IsPlayerInRangeOfPoint( playerid , 1.5 , Bank[ i ][ bX ] , Bank[ i ][ bX ] , Bank[ i ][ bX ] ) ) return i;
	}
	return -1;
}

stock getAtmID( playerid )
{
	for(new i;i <= aCount;i++)
	{
	    if( IsPlayerInRangeOfPoint( playerid , 1.5 , ATM[ i ][ aX ] , ATM[ i ][ aX ] , ATM[ i ][ aX ] ) ) return i;
	}
	return -1;
}

hook OnPlayerKeyStateChange( playerid , newkeys ,oldkeys )
{
	if( newkeys == KEY_WALK )
	{
	    if( getBankID( playerid ) != -1 )
	    {
	        new bid = getBankID( playerid );
	        Dialog_ShowCallback(playerid, using inline WeAreInTheFuckingBankBro, DIALOG_STYLE_LIST, "Title", "Message", "Button 1");
	    }
	    
	    if( getAtmID( playerid ) != -1 )
	    {
            new aid = getAtmID( playerid );
	    }
	
	}

	return 1;
}


