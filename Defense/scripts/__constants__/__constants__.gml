#region ENUMs
enum types
{
	MOUSE_LEFT,
	MOUSE_MIDDLE,
	MOUSE_RIGHT,
	
	ATTACK_BULLET = 0,
	
	TARGET_NEAREST = 0,
	TARGET_FARTHEST = 1,
	TARGET_HEALTH_LOW = 2,
	TARGET_HEALTH_HIGH = 3,
	TARGET_DEFENSE_LOW = 4,
	TARGET_DEFENSE_HIGH = 5,
	TARGET_RANDOMS = 6,
}
#endregion

#region MACROs
	#macro Frame 60
	#region Layer
		#macro Layer_System "SYSTEM"
		#macro Layer_Keyboard "KEYBOARD"
		#macro Layer_Menu "MENU"
		#macro Layer_Text_Interface "TEXT_INTERFACE"
		#macro Layer_User_Interface "USER_INTERFACE"
		#macro Layer_Effect_Fore "EFFECT_FOREGROUND"
		#macro Layer_Game_Interface_Fore "GAME_INTERFACE_FOREGROUND"
		#macro Layer_Game_Effect_Fore "GAME_EFFECT_FOREGROUND"
		#macro Layer_Game_Interface "GAME_INTERFACE"
		#macro Layer_Game_Effect_Back "GAME_EFFECT_BACKGROUND"
		#macro Layer_Game_Interface_Back "GAME_INTERFACE_BACKGROUND"
		#macro Layer_Effect_Back "EFFECT_BACKGROUND"
		#macro Layer_Background "BACKGROUND"
	#endregion
#endregion