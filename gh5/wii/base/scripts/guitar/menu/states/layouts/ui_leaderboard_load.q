
script ui_leaderboard_load_spin 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_instrument_spinner param = spinner_id
		<spinner_id> :se_setprops alpha = 1.0
		<spinner_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
	endif
endscript

script ui_leaderboard_load_spin_kill 
	Obj_GetID
	if <objID> :desc_resolvealias Name = alias_instrument_spinner param = spinner_id
		<spinner_id> :Obj_KillSpawnedScript Name = savegame_ui_icon_anim
		<spinner_id> :se_setprops alpha = 0.0 time = 0.5
	endif
endscript
