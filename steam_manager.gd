extends Node

func _ready() -> void:
	var init = Steam.steamInitEx()
	if init["status"] != Steam.STEAM_API_INIT_RESULT_OK:
		push_warning("Steam failed to initialize: ", init["verbal"])

func _process(_delta: float) -> void:
	Steam.run_callbacks()

func unlock_achievement(achievement_id: String) -> void:
	if not Steam.isSteamRunning():
		return
	Steam.setAchievement(achievement_id)
	Steam.storeStats()
