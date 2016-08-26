#include <a_samp>

#file "main"

#undef MAX_PLAYERS
#define MAX_PLAYERS (50)

#include <YSI_Coding\y_hooks>
#include <YSI_Coding\y_timers>
#include <YSI_Coding\y_va>
#include <YSI_Coding\y_inline>
#include <YSI_Data\y_iterate>
#include <YSI_Players\y_text>
#include <YSI_Players\y_languages>
#include <YSI_Server\y_colours>
#include <YSI_Storage\y_ini>
#include <YSI_Visual\y_commands>

#include <Double-O-Files-2>

#include "_core/main/colors.pawn"
#include "_core/main/defs.pawn"
#include "_core/main/vars.pawn"
#include "_core/main/freefunc.pawn"
#include "_core/main/language_setup.pawn"

#include "_core/system/anticheat.pawned"

#include "_core/features/action_event.pwn"
#include "_core/features/register.pwn"
#include "_core/features/bank.pwn"


main()
{

	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
    printf("Number of publics == %d", (AMX_HEADER_NATIVES - AMX_HEADER_PUBLICS) / 8);
}


public OnGameModeInit()
{
	SetGameModeText("Blank Script");
	AddPlayerClass(0, 1958.3783, 1343.1572, 15.3746, 269.1425, 0, 0, 0, 0, 0, 0);
	return 1;
}

public OnGameModeExit()
{
	DOF2_Exit();
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetPlayerPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraPos(playerid, 1958.3783, 1343.1572, 15.3746);
	SetPlayerCameraLookAt(playerid, 1958.3783, 1343.1572, 15.3746);
	return 1;
}
