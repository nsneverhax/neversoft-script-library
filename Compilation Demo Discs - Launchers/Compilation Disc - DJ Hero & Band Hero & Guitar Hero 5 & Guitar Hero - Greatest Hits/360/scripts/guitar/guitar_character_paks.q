Highway_Pakman_Links = {
}
frontend_anim_path = 'frontend/'
guit_loop_anim_path = 'ingame/Loops/GUIT/'
sing_loop_anim_path = 'ingame/Loops/SING/'
drum_loop_anim_path = 'ingame/Loops/DRUM/'
intro_anim_path = 'ingame/Intros/'
win_anim_path = 'ingame/Wins/'
lose_anim_path = 'ingame/Lose/'
point_win_anim_path = 'ingame/PointWin/'
point_lose_anim_path = 'ingame/PointLose/'
starpower_anim_path = 'ingame/StarPower/'
Anim_Perm_Pakman_Links = {
	perm_anims_in_game = {
		name = 'perm_anims_in_game'
		path = 'perm_anims/'
	}
	frontend_perm_anims = {
		name = 'frontend_perm_anims'
		path = $frontend_anim_path
	}
}
Anim_Loop_GUIT_SINGER_Pakman_Links = {
}
Anim_Loop_DRUM_Pakman_Links = {
}
Anim_Intro_Win_Pakman_Links = {
}
Anim_Lose_Pakman_Links = {
}
Anim_StarPower_Pakman_Links = {
}

script guitar_create_character_maps 
endscript
guitar_character_loops_state = unknown

script guitar_character_loops_set_state 
	RequireParams \{[
			state
		]
		all}
	if ($guitar_character_loops_state = <state>)
		return
	endif
	switch ($guitar_character_loops_state)
		case unknown
		printf \{qs("\Lguitar_character_loops_set_state - unloading nothing due to first initialization")}
		case loop_paks_enabled
		mpm_free_map \{heap = heap_cas_topdown
			links = Anim_Loop_GUIT_SINGER_Pakman_Links
			index = 0}
		mpm_free_map \{heap = heap_cas_topdown
			links = Anim_Loop_GUIT_SINGER_Pakman_Links
			index = 1}
		mpm_free_map \{heap = heap_cas_topdown
			links = Anim_Loop_GUIT_SINGER_Pakman_Links
			index = 2}
		mpm_free_map \{heap = heap_cas_topdown
			links = Anim_Loop_DRUM_Pakman_Links}
		case loop_paks_disabled
		printf \{qs("\Lguitar_character_loops_set_state - unloading nothing due to currently being disabled")}
		default
		ScriptAssert \{qs("\Lguitar_character_loops_set_state - unknown unload state")}
	endswitch
	change guitar_character_loops_state = <state>
	switch (<state>)
		case loop_paks_enabled
		mpm_new_map \{heap = heap_cas_topdown
			links = Anim_Loop_GUIT_SINGER_Pakman_Links
			folder = 'pak/anims/'
			index = 0
			no_vram}
		mpm_new_map \{heap = heap_cas_topdown
			links = Anim_Loop_GUIT_SINGER_Pakman_Links
			folder = 'pak/anims/'
			index = 1
			no_vram}
		mpm_new_map \{heap = heap_cas_topdown
			links = Anim_Loop_GUIT_SINGER_Pakman_Links
			folder = 'pak/anims/'
			index = 2
			no_vram}
		mpm_new_map \{heap = heap_cas_topdown
			links = Anim_Loop_DRUM_Pakman_Links
			folder = 'pak/anims/'
			no_vram}
		case loop_paks_disabled
		printf \{qs("\Lguitar_character_loops_set_state - heap now ready for large song pak")}
		default
		ScriptAssert \{qs("\Lguitar_character_loops_set_state - unknown load state")}
	endswitch
endscript

script guitar_force_unload_anim_paks 
	if NOT GotParam \{not_wli}
	endif
endscript

script guitar_destroy_character_maps 
	mpm_free_all_maps
endscript
