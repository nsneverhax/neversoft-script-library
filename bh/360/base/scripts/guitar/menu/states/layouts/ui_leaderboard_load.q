
script ui_leaderboard_load_spin 
	Obj_GetID
	if <objID> :Desc_ResolveAlias name = alias_instrument_spinner param = spinner_id
		<spinner_id> :SE_SetProps alpha = 1.0
		<spinner_id> :Obj_SpawnScriptNow savegame_ui_icon_anim
	endif
endscript

script ui_leaderboard_load_spin_kill 
	Obj_GetID
	if <objID> :Desc_ResolveAlias name = alias_instrument_spinner param = spinner_id
		<spinner_id> :Obj_KillSpawnedScript name = savegame_ui_icon_anim
		<spinner_id> :SE_SetProps alpha = 0.0 time = 0.5
	endif
endscript
