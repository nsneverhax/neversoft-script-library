
script ui_leaderboard_load_spin 
	obj_getid
	if <objid> :desc_resolvealias name = alias_instrument_spinner param = spinner_id
		<spinner_id> :se_setprops alpha = 1.0
		<spinner_id> :obj_spawnscriptnow savegame_ui_icon_anim
	endif
endscript

script ui_leaderboard_load_spin_kill 
	obj_getid
	if <objid> :desc_resolvealias name = alias_instrument_spinner param = spinner_id
		<spinner_id> :obj_killspawnedscript name = savegame_ui_icon_anim
		<spinner_id> :se_setprops alpha = 0.0 time = 0.5
	endif
endscript
